"""
Training für EuroSAT mit MobileNetV1:
- Phase 1: Warm-up (Backbone frozen)
- Phase 2: Fine-Tuning (Backbone trainierbar)
- Bestes Modell wird via ModelCheckpoint gespeichert.
"""

from __future__ import annotations
import os, argparse, random, numpy as np, tensorflow as tf
from data import make_datasets
from model import build_mobilenet_v1


def set_global_seed(seed: int = 42, deterministic_ops: bool = True):
    """
    Setzt Seeds für Python/NumPy/TensorFlow, damit Shuffle/Initialisierung
    reproduzierbar sind. Optional werden deterministische TF-Operatoren aktiviert.
    """
    os.environ["PYTHONHASHSEED"] = str(seed)
    random.seed(seed)
    np.random.seed(seed)
    tf.random.set_seed(seed)
    if deterministic_ops:
        # Für moderne TF-Versionen:
        try:
            tf.config.experimental.enable_op_determinism(True)
        except Exception:
            # Fallback für ältere TFs:
            os.environ["TF_DETERMINISTIC_OPS"] = "1"


def parse_args():
    """
    CLI-Argumente: Datenpfade, Hyperparameter, Ausgabepfade.
    Beispiel:
      python train.py --img-size 224 --batch-size 64 --epochs 12 \
        --finetune-epochs 5 --data-dir /home/.../Daten \
        --model-out Model/MobileNetV1_EuroSAT.keras
    """
    p = argparse.ArgumentParser(description="Train MobileNetV1 on EuroSAT")

    # Daten
    p.add_argument("--data-dir", type=str, default="/home/abedM/ai_riscv/training/Daten")
    p.add_argument("--img-size", type=int, default=224)
    p.add_argument("--batch-size", type=int, default=64)
    p.add_argument("--seed", type=int, default=42)
    p.add_argument("--no-cache", action="store_true")  # --no-cache => cache=False

    # Modell
    p.add_argument("--alpha", type=float, default=1.0)    # 0.35..1.0 (schmaler = schneller)
    p.add_argument("--dropout", type=float, default=0.0)  # z.B. 0.2 gegen Overfitting

    # Training
    p.add_argument("--epochs", type=int, default=12)            # Warm-up Epochen (Backbone frozen)
    p.add_argument("--finetune-epochs", type=int, default=5)    # Fine-Tuning Epochen (Backbone trainierbar)
    p.add_argument("--lr", type=float, default=1e-3)            # LR Warm-up
    p.add_argument("--finetune-lr", type=float, default=1e-5)   # LR Fine-Tune (klein!)

    # Output
    p.add_argument("--model-out", type=str, default="Model/MobileNetV1_EuroSAT.keras")
    p.add_argument("--logdir", type=str, default="logs")  # TensorBoard-Logs
    return p.parse_args()


def main():
    args = parse_args()

    # Ausgabeverzeichnisse anlegen (Model/Logs)
    os.makedirs(os.path.dirname(args.model_out) or ".", exist_ok=True)
    os.makedirs(args.logdir, exist_ok=True)
    if args.data_dir:
        os.makedirs(args.data_dir, exist_ok=True)

    # Reproduzierbarkeit
    set_global_seed(args.seed)

    # -------- Datasets laden/bauen (EuroSAT RGB) --------
    ds_tr, ds_val, class_names = make_datasets(
        img_size=args.img_size,
        batch_size=args.batch_size,
        seed=args.seed,
        data_dir=args.data_dir,
        cache=not args.no_cache,
        write_label_files=True,   # schreibt label.json & map_labels.json
    )
    num_classes = len(class_names)
    print(f"[INFO] Klassen: {num_classes} -> {class_names}")

    # -------- Phase 1: Warm-up (Backbone eingefroren) --------
    model = build_mobilenet_v1(
        num_classes=num_classes,
        img_size=args.img_size,
        alpha=args.alpha,
        base_trainable=False,     #  erst nur Kopf trainieren
        dropout=args.dropout,
    )
    model.summary()  # zeigt Layer/Parameter (Trainable/Nicht-Trainable)

    # Callbacks: Bestes Modell speichern, TensorBoard-Logs, LR-Anpassung, EarlyStopping
    ckpt = tf.keras.callbacks.ModelCheckpoint(
        filepath=args.model_out,
        monitor="val_accuracy",
        save_best_only=True,      # nur bestes Val-Accuracy-Modell schreiben
        save_weights_only=False,
        verbose=1
    )
    # Schreibt Metriken/Logs für TensorBoard (im Terminal: tensorboard --logdir logs)
    tb = tf.keras.callbacks.TensorBoard(
        log_dir=args.logdir,    # Zielordner für Logs (z. B. "logs")
        write_graph=True,       # (optional) Rechen-Graph in TensorBoard anzeigen
        update_freq="epoch",    # Schreibe nach jeder Epoche (oder int = alle N Batches)
    )

    # Senkt die Lernrate automatisch, wenn die Validierungsgenauigkeit stagniert
    rlrop = tf.keras.callbacks.ReduceLROnPlateau(
        monitor="val_accuracy", # Beobachtete Metrik; bei Accuracy gilt: größer ist besser
        mode="max",             # explizit: wir maximieren die Metrik
        factor=0.5,             # neue LR = alte LR * 0.5 (halbieren)
        patience=3,             # warte 3 Epochen ohne Verbesserung, dann LR senken
        min_lr=1e-5,            # unter diese Lernrate nicht weiter absenken
        verbose=1               # Log-Meldung ausgeben, wenn LR reduziert wird
    )

    # Bricht das Training früh ab, wenn sich die Validierungsgenauigkeit nicht verbessert
    es = tf.keras.callbacks.EarlyStopping(
        monitor="val_accuracy",     # beobachtete Metrik
        mode="max",                 # wir wollen maximieren
        patience=5,                 # nach 5 Epochen ohne neuen Bestwert stoppen
        restore_best_weights=True,  # beste Gewichte (beste Epoche) in den RAM zurückladen
        verbose=1                   # Log-Meldung beim Stoppen
    )
    # Kompilieren: Optimizer/Loss/Metriken
    model.compile(
        optimizer=tf.keras.optimizers.Adam(learning_rate=args.lr),
        loss="categorical_crossentropy",      # y ist one-hot (data.py)
        metrics=["accuracy"]
    )
    print(f"[INFO] Warm-up: lr={args.lr}, epochs={args.epochs}, backbone.trainable=False")# Backbone ist eingefroren (nur Kopf lernt).

    # Trainieren (nur Kopf lernt, Backbone bleibt fix)
    model.fit(
        ds_tr,                    # Trainingsdaten (tf.data): (x,y) Batches
        validation_data=ds_val,   # Validierungsdaten (tf.data): (x,y) Batches
        epochs=args.epochs,       # Warm-up: so viele Epochen trainieren
        callbacks=[ckpt, tb, rlrop, es],  # Checkpoint, TensorBoard, LR-Reduktion, EarlyStopping
        verbose=1                 # Fortschrittsbalken + Metriken anzeigen
    )

    # -------- Phase 2: Fine-Tuning (Backbone freigeben) --------
    # Backbone-Parameter jetzt trainierbar setzen
    for layer in model.layers:
        layer.trainable = True

    #  Nach Änderung von trainable-Flags NEU kompilieren (neuer Optimizer/LR)!
    model.compile(
        optimizer=tf.keras.optimizers.Adam(learning_rate=args.finetune_lr),
        loss="categorical_crossentropy",
        metrics=["accuracy"]
    )
    print(f"[INFO] Fine-Tuning: lr={args.finetune_lr}, epochs={args.finetune_epochs}, backbone.trainable=True")

    # Weitere Epochen trainieren (feine Anpassung der vortrainierten Features)
    model.fit(
        ds_tr,
        validation_data=ds_val,
        epochs=args.finetune_epochs,
        callbacks=[ckpt, tb],
        verbose=1
    )

    # Bestes Modell liegt auf args.model_out (durch ModelCheckpoint)
    print(f"[OK] Bestes Modell gespeichert unter: {args.model_out}")

    # Finale Validierung (mit aktuell geladenen Gewichten)
    loss, acc = model.evaluate(ds_val, verbose=1)
    print(f"[VAL] loss={loss:.4f}  acc={acc*100:.2f}%")


if __name__ == "__main__":
    main()
