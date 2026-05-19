"""
EuroSAT-Datenpipeline für MobileNetV1 (Keras).
- Lädt EuroSAT (RGB) via TensorFlow Datasets.
- Preprocessing: tf.keras.applications.mobilenet.preprocess_input ([-1,1]).
- Schreibt label.json / map_labels.json.
- Standard-Data-Cache: /home/abedM/ai_riscv/training/Daten
"""


from __future__ import annotations


import os
import json
import argparse
from dataclasses import dataclass
from typing import Iterable, List, Tuple, Optional

import tensorflow as tf
import tensorflow_datasets as tfds


@dataclass
class DataConfig:
    img_size: int = 224
    batch_size: int = 64
    seed: int = 42  # anderer Seed -> andere Reihenfolgen
    data_dir: Optional[str] = "/home/abedM/ai_riscv/training/Daten"
    train_split: str = "train[:80%]"
    val_split: str = "train[80%:]"
    cache: bool = True
    write_label_files: bool = True


def write_label_maps(
    class_names: List[str],
    label_path: str = "label.json",
    map_path: str = "map_labels.json",
) -> None:
    with open(label_path, "w") as f:
        json.dump({name: i for i, name in enumerate(class_names)}, f)
    with open(map_path, "w") as f:
        json.dump({str(i): name for i, name in enumerate(class_names)}, f)

    # Beispiel :
    # class_names = ["AnnualCrop","Forest","HerbaceousVegetation","Highway","Industrial",
    #             "Pasture","PermanentCrop","Residential","River","SeaLake"]
    # label.json (Name → Index):
    # {
    # "AnnualCrop": 0,
    # "Forest": 1,
    # "HerbaceousVegetation": 2,
    # "Highway": 3,
    # "Industrial": 4,
    # "Pasture": 5,
    # "PermanentCrop": 6,
    # "Residential": 7,
    # "River": 8,
    # "SeaLake": 9
    # }
    # map_labels.json (Index → Name):
    # {
    # "0": "AnnualCrop",
    # "1": "Forest",
    # "2": "HerbaceousVegetation",
    # "3": "Highway",
    # "4": "Industrial",
    # "5": "Pasture",
    # "6": "PermanentCrop",
    # "7": "Residential",
    # "8": "River",
    # "9": "SeaLake"
    # }


def make_datasets(
    img_size: int = 224,
    batch_size: int = 64,
    seed: int = 42,
    data_dir: Optional[str] = "/home/abedM/ai_riscv/training/Daten",
    train_split: str = "train[:80%]",
    val_split: str = "train[80%:]",
    cache: bool = True,
    write_label_files: bool = True,
) -> Tuple[tf.data.Dataset, tf.data.Dataset, List[str]]:
    if data_dir is not None:
        os.makedirs(data_dir, exist_ok=True)

    (ds_tr, ds_val), info = tfds.load(
        "eurosat/rgb",
        split=[train_split, val_split],
        as_supervised=True,
        with_info=True,
        data_dir=data_dir,
    )

    # Erklärung :
    # Es liest dataset_info.json / features.json ein → weiß dann:
    #
    # Es gibt einen Split: train mit 27000 Beispielen (steht in splits).
    #
    # Feature-Schema:
    # image: uint8[64,64,3], label: ClassLabel(10).
    #
    # Slicing: TFDS erstellt aus dem einen train-Split zwei virtuelle Splits:
    #
    # train[:80%] ≈ 21 600 Beispiele → ds_tr
    # train[80%:] ≈ 5 400 Beispiele → ds_val
    #
    # as_supervised=True verwendet die im Datensatz hinterlegte supervised_keys (("image","label"))
    # → jedes Element ist ein Tupel (image, label) und nicht ein Dict.
    #
    # with_info=True gibt dir das info-Objekt zurück – ein Python-Wrapper um dataset_info.json

    class_names = info.features["label"].names
    num_classes = len(class_names)

    # Skaliert Pixelwerte auf [-1, 1] (Rohpixel 255 → +1.0)
    preprocess_input = tf.keras.applications.mobilenet.preprocess_input

    def _map_fn(img: tf.Tensor, label: tf.Tensor):
        # Eingabe (aus TFRecord, per TFDS):
        # img: uint8[64,64,3] in [0..255], label: int (z.B. 3)
        img = tf.image.resize(img, (img_size, img_size))  # → 224×224
        img = tf.cast(img, tf.float32)
        img = preprocess_input(img)             # auf [-1,1]
        label = tf.one_hot(label, num_classes)  # für categorical_crossentropy  # → z.B. [0,0,0,1,0,0,0,0,0,0]
        return img, label

    # Vorher:
    #   img: dtype uint8, Shape [64,64,3], Werte 0..255
    #   label: z. B. 3 (Highway)
    # Nachher:
    #   img: dtype float32, Shape [224,224,3], Werte [-1,1]
    #   label: One-Hot [10], hier: [0,0,0,1,0,0,0,0,0,0]

    opts = tf.data.Options()

    # 2) Erzwinge reproduzierbare Ausgabe-Reihenfolge trotz Parallelverarbeitung
    #    (gleicher Seed -> gleiche Batch-Abfolge, wichtig für faire Vergleiche)
    opts.experimental_deterministic = True

    # 3) Trainings-Datensatz: Optionen anwenden und Preprocessing (_map_fn) parallel ausführen.
    #    AUTOTUNE wählt die optimale Anzahl paralleler Worker automatisch (max. Durchsatz).
    #    _map_fn: resize -> float32 -> MobileNetV1-preprocess ([-1,1]) -> one-hot(label)
    ds_tr = ds_tr.with_options(opts)
    if cache:
        ds_tr = ds_tr.cache()   # Train-Set cachen — WICHTIG: Cache vor Map (kleine 64×64 uint8)
    ds_tr = ds_tr.map(_map_fn, num_parallel_calls=tf.data.AUTOTUNE)

    # 4) Validierungs-Datensatz genauso behandeln (keine Shuffle später, aber stabile Reihenfolge + schnelle Map)
    ds_val = ds_val.with_options(opts)
    if cache:
        ds_val = ds_val.cache() # Val-Set cachen — WICHTIG: Cache vor Map (kleine 64×64 uint8)
    ds_val = ds_val.map(_map_fn, num_parallel_calls=tf.data.AUTOTUNE)

    #  Datensätze nach dem Preprocessing zwischen­puffern
    # - Vorteil: Ab Epoche 2 muss nicht mehr von Platte gelesen/dekodiert werden → schneller.
    # - Standard: RAM-Cache (wenn Speicher knapp: cache(False) weglassen oder auf Disk cachen: .cache("/pfad/file"))
    # (Hinweis: Das Caching wurde nach oben vor das Map verschoben, um Speicher zu sparen.)
    # (Hier keine zusätzliche .cache()-Aufrufe mehr, damit wir nicht riesige float32-Tensors cachen.)

    # TRAINING: Reihenfolge mischen → zu Batches bündeln → nächste Batches vorladen
    ds_tr = (
        ds_tr.shuffle(
            buffer_size=2000,           # Größe des Shuffle-Puffers
            seed=seed,                  # fester Seed => reproduzierbar
            reshuffle_each_iteration=True,
        )
        .batch(batch_size)              # z. B. 64 -> (64,H,W,3)
        .prefetch(tf.data.AUTOTUNE)     # I/O & Compute überlappen
    )

    # VALIDIERUNG: keine Shuffle (stabile/vergleichbare Metriken), nur Batch + Prefetch für Durchsatz
    ds_val = ds_val.batch(batch_size).prefetch(tf.data.AUTOTUNE)

    # Optional: Label-Mapping-Dateien schreiben (für predict/evaluate)
    # - label.json:      {"AnnualCrop": 0, "Forest": 1, ...}
    # - map_labels.json: {"0": "AnnualCrop", "1": "Forest", ...}
    if write_label_files:
        write_label_maps(class_names)

    # Zurück an den Aufrufer: gebatchte tf.data-Pipelines + Klassenliste
    return ds_tr, ds_val, class_names


def representative_dataset(
    ds_batched: tf.data.Dataset,   # bereits GEBATCHTES Dataset: liefert (x, y) mit x=[B,H,W,C]
    num_batches: int = 100,        # wie viele Batches zur INT8-Kalibrierung verwenden
) -> Iterable[List]:
    """
    Generator für TFLite (Post-Training-Quantisierung, INT8).
    TFLite erwartet pro Aufruf eine LISTE der Model-Inputs als NumPy-Arrays.
    Bei einem Single-Input-Modell ist das: [x_numpy]
    """
    for i, (x, _) in enumerate(ds_batched.take(num_batches)):
        # x: Tensor der Form [B,H,W,C], dtype float32, bereits wie im Training vorverarbeitet
        # (bei MobileNetV1: Werte in [-1, 1] dank preprocess_input)
        #
        # WICHTIG: TFLite will NumPy, nicht TensorFlow-Tensor → daher .numpy()
        # WICHTIG: in einer LISTE zurückgeben )
        yield [x.numpy()]


# Einzelbild-Vorhersage
def preprocess_image_path(image_path: str, img_size: int = 224) -> tf.Tensor:
    # Keras-Vorverarbeitung für MobileNetV1:
    # skaliert Pixel von [0..255] auf [-1..1]
    preprocess_input = tf.keras.applications.mobilenet.preprocess_input

    # 1) Bilddatei laden -> Bytes (noch kein Tensor mit Pixeln)
    img_bytes = tf.io.read_file(image_path)

    # 2) Bytes als Bild decodieren (RGB erzwingen, 3 Kanäle)
    #    expand_animations=False: GIFs etc. nicht als viele Frames laden
    img = tf.image.decode_image(img_bytes, channels=3, expand_animations=False)

    # 3) Auf Zielauflösung (img_size x img_size) bringen, z. B. 224x224
    img = tf.image.resize(img, (img_size, img_size))

    # 4) In float32 wandeln (vor dem Normalisieren)
    img = tf.cast(img, tf.float32)

    # 5) MobileNetV1-Preprocessing: Wertebereich -> [-1, 1]
    #    (diese Skalierung MUSS genau zum Training passen)
    img = preprocess_input(img)

    # 6) Batch-Dimension hinzufügen: [H,W,3] -> [1,H,W,3]
    #    (Modelle erwarten Batch-Input auch bei Einzelbild-Inferenz)
    return tf.expand_dims(img, 0)  # [1,H,W,3]


def _cli():
    # ---------------- CLI-Argumente parsen ----------------
    # Zweck: Skript als kleines Test-Tool für die Datenpipeline nutzen.
    parser = argparse.ArgumentParser(description="EuroSAT Data Pipeline (MobileNetV1)")

    # Zielauflösung fürs Resize (z. B. 224 → (224,224,3))
    parser.add_argument("--img-size", type=int, default=224)

    # Batchgröße (z. B. 64 → jeder Batch hat 64 Bilder)
    parser.add_argument("--batch-size", type=int, default=64)

    # Speicherort von TFDS-Daten (wo EuroSAT abgelegt wird/liegt)
    parser.add_argument("--data-dir", type=str, default="/home/abedM/ai_riscv/training/Daten")

    # Flag: wenn gesetzt, NICHT cachen (cache=False). Ohne Flag: cachen (cache=True).
    parser.add_argument("--no-cache", action="store_true")

    # Die obigen CLI-Argumente einlesen
    args = parser.parse_args()

    # ---------------- Datasets bauen ----------------
    # make_datasets liefert:
    # - ds_tr: Trainings-dataset (bereits gemappt, gebatcht, ggf. geprefetched)
    # - ds_val: Validierungs-dataset
    # - class_names: Liste der 10 EuroSAT-Klassen
    ds_tr, ds_val, class_names = make_datasets(
        img_size=args.img_size,
        batch_size=args.batch_size,
        cache=not args.no_cache,  # --> --no-cache invertiert: True → cache=False
        data_dir=args.data_dir,
        write_label_files=False,  # beim Schnelltest nicht die label.json-Dateien überschreiben
    )

    # Einen Batch „ziehen“, um Formate schnell zu prüfen
    x, y = next(iter(ds_tr))  # x: [B,H,W,3] in float32 [-1,1], y: [B,10] one-hot

    # ---------------- Kurzreport ausgeben ----------------
    print(f"Datadir: {args.data_dir}")
    print(f"Train batch shapes: x={x.shape}, y={y.shape}")
    print(f"Klassen (10): {class_names}")


if __name__ == "__main__":
    _cli()
