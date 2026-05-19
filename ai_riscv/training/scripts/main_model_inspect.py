#!/usr/bin/env python3
"""
inspect_keras_model.py
----------------------
Konsole-Tool zum Inspizieren eines gespeicherten Keras-Modells (.keras / .h5).

Funktionen:
- Modellstruktur ausgeben (summary).
- Pro Layer: Name, Typ, Eingangs-/Ausgangs-Shape, #Parameter.
- Gewichts- und Bias-Statistiken (min / max / mean / std) pro Gewichtstensor.
- (Optional) Aktivierungs-Statistiken (min / max / mean / std) über N Batches,
  entweder mit EuroSAT-Validierungsdaten (wenn `data.make_datasets` vorhanden ist)
  oder mit Fallback auf zufällige Eingaben im passenden Format/-1..1-Bereich.

Beispiele:
----------
# Nur Struktur + Gewichte (schnell)
python inspect_keras_model.py --model-path /home/abedM/ai_riscv/training/scripts/Model/MobileNetV1_EuroSAT.keras

# Zusätzlich Aktivierungen auf 2 Val-Batches (EuroSAT, falls "data.py" vorhanden)
python inspect_keras_model.py --model-path /home/abedM/ai_riscv/training/scripts/Model/MobileNetV1_EuroSAT.keras --with-activations --batches 2 --batch-size 64 --img-size 224 --data-dir /home/abedM/ai_riscv/training/Daten
"""

import argparse
import importlib
import sys
import numpy as np

def try_import_tf():
    try:
        import tensorflow as tf  # noqa
        return tf
    except Exception as e:
        print("[ERROR] TensorFlow konnte nicht importiert werden:", e, file=sys.stderr)
        print("Bitte in einer Umgebung mit TensorFlow ausführen.", file=sys.stderr)
        sys.exit(1)

def layer_io_shapes(layer):
    in_shape = getattr(layer, "input_shape", None)
    out_shape = getattr(layer, "output_shape", None)
    return in_shape, out_shape

def tensor_stats(arr: np.ndarray):
    arr = arr.astype(np.float64, copy=False)
    return float(np.min(arr)), float(np.max(arr)), float(np.mean(arr)), float(np.std(arr))

def print_rule(char="-", n=80):
    print(char * n)

def load_eurosat_batches(tf, img_size, batch_size, num_batches, data_dir):
    """
    Versucht, EuroSAT aus dem lokalen Projekt zu laden:
    from data import make_datasets
    Liefert eine Generatorfunktion, die NumPy-Batches (x) produziert.
    """
    try:
        data_mod = importlib.import_module("data")
        ds_tr, ds_val, _ = data_mod.make_datasets(
            img_size=img_size,
            batch_size=batch_size,
            data_dir=data_dir,
            write_label_files=False,
            cache=True,
        )
        count = 0
        for x, _ in ds_val:
            yield x.numpy()
            count += 1
            if count >= num_batches:
                break
        return
    except Exception as e:
        print(f"[WARN] EuroSAT-Val konnte nicht geladen werden ({e}). Fallback: Zufallsdaten.")

    # Fallback: Zufallsdaten im Bereich [-1,1] (wie MobileNetV1-Preprocessing)
    input_shape = (batch_size, img_size, img_size, 3)
    for _ in range(num_batches):
        # gleichverteilte Werte in [-1,1] (ähnlicher Bereich wie nach preprocess_input)
        x = np.random.uniform(-1.0, 1.0, size=input_shape).astype("float32")
        yield x

def main():
    tf = try_import_tf()

    ap = argparse.ArgumentParser(description="Keras-Modell inspizieren (Struktur, Gewichte, Aktivierungen)")
    ap.add_argument("--model-path", type=str, required=True, help="Pfad zur .keras / .h5 Datei")
    ap.add_argument("--with-activations", action="store_true", help="Aktivierungs-Stats berechnen")
    ap.add_argument("--img-size", type=int, default=224, help="Bildgröße für Aktivierungs-Run")
    ap.add_argument("--batch-size", type=int, default=64, help="Batchgröße für Aktivierungen")
    ap.add_argument("--batches", type=int, default=2, help="Anzahl Batches für Aktivierungs-Stats")
    ap.add_argument("--data-dir", type=str, default=None, help="Optional: TFDS/EuroSAT Datenpfad")
    args = ap.parse_args()

    print_rule("=")
    print("[INFO] Lade Modell:", args.model_path)
    model = tf.keras.models.load_model(args.model_path)
    print("[OK] Modell geladen:", getattr(model, "name", "unnamed"))

    print_rule("=")
    print("[SUMMARY]")
    # vollständige Textsummary in Konsole
    model.summary()

    print_rule("=")
    print("[LAYERS: Struktur + Parameter]")
    for i, layer in enumerate(model.layers):
        in_shape, out_shape = layer_io_shapes(layer)
        print(f"[{i:03d}] {layer.name:<35} | {layer.__class__.__name__:<25} "
              f"| in={in_shape} -> out={out_shape} | params={layer.count_params():,}")

    print_rule("=")
    print("[GEWICHTS-STATISTIKEN je Layer] (min / max / mean / std)")
    for i, layer in enumerate(model.layers):
        weights = layer.weights  # List[tf.Variable], z.B. kernel, bias, gamma, beta, ...
        if not weights:
            continue
        print(f"Layer [{i:03d}] {layer.name} ({layer.__class__.__name__})")
        for w in weights:
            try:
                w_np = w.numpy()
                wmin, wmax, wmean, wstd = tensor_stats(w_np)
                print(f"  - {w.name:<40} shape={w_np.shape!s:<18} "
                      f"min={wmin: .5f} max={wmax: .5f} mean={wmean: .5f} std={wstd: .5f}")
            except Exception as e:
                print(f"  - {w.name} (shape={getattr(w, 'shape', '?')}) -> FEHLER beim Lesen: {e}")

    if args.with_activations:
        print_rule("=")
        print("[AKTIVIERUNGS-STATISTIKEN] über", args.batches, "Batches")
        # Baue ein Multi-Output-Modell, das die Ausgabe ALLER Layer liefert (wo möglich)
        # Manche Layer haben mehrere Outputs oder KerasTensors -> best effort.
        outputs = []
        valid_layers = []
        for layer in model.layers:
            try:
                out = layer.output
                # Keras kann Tensor / Liste von Tensoren liefern; wir akzeptieren nur Tensors
                if isinstance(out, (list, tuple)):
                    # wenn mehrere Outputs, nimm den ersten für die Statistik
                    out = out[0]
                outputs.append(out)
                valid_layers.append(layer)
            except Exception:
                # Layer ohne greifbare .output (z.B. InputLayer) lassen wir aus
                outputs.append(None)

        # Input/Output-Collector
        submodel = tf.keras.Model(inputs=model.inputs, outputs=[l.output for l in valid_layers])

        # Streaming-Stats pro Layer: Welford
        stats = []
        for _ in valid_layers:
            stats.append({
                "n": 0,
                "mean": 0.0,
                "M2": 0.0,
                "min": float("inf"),
                "max": float("-inf"),
            })

        batch_gen = load_eurosat_batches(tf, img_size=args.img_size,
                                         batch_size=args.batch_size,
                                         num_batches=args.batches,
                                         data_dir=args.data_dir)

        for xb in batch_gen:
            # Vorwärtsdurchlauf -> Liste von Aktivierungen
            acts = submodel.predict(xb, verbose=0)
            if not isinstance(acts, list):
                acts = [acts]
            for idx, act in enumerate(acts):
                try:
                    a = act
                    if hasattr(a, "numpy"):
                        a = a.numpy()
                    a = np.asarray(a)
                    # Reduziere über Batch/Spatial/Channel -> ein großer Vektor
                    a_flat = a.reshape(-1).astype(np.float64, copy=False)
                    if a_flat.size == 0:
                        continue
                    # Online-Update
                    st = stats[idx]
                    st["min"] = min(st["min"], float(np.min(a_flat)))
                    st["max"] = max(st["max"], float(np.max(a_flat)))
                    for val in a_flat:
                        st["n"] += 1
                        delta = val - st["mean"]
                        st["mean"] += delta / st["n"]
                        st["M2"] += delta * (val - st["mean"])
                except Exception as e:
                    # Falls ein Layerausgang nicht numerisch o.ä.
                    pass

        print_rule("-")
        for i, layer in enumerate(valid_layers):
            st = stats[i]
            if st["n"] <= 1:
                print(f"[ACT] {layer.name:<35} | zu wenig Daten/kein Output")
                continue
            variance = st["M2"] / (st["n"] - 1)
            std = float(np.sqrt(max(variance, 0.0)))
            print(f"[ACT] {layer.name:<35} | min={st['min']: .6f}  max={st['max']: .6f}  "
                  f"mean={st['mean']: .6f}  std={std: .6f} (N={st['n']})")

    print_rule("=")
    print("[FERTIG]")

if __name__ == "__main__":
    main()
#python /home/abedM/ai_riscv/training/scripts/main_model_inspect.py \
# --model-path /home/abedM/ai_riscv/training/scripts/Model/MobileNetV1_EuroSAT.keras