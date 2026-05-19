# evaluate.py
"""
Evaluiert ein trainiertes Keras-MobileNetV1 auf dem EuroSAT-Validierungssplit.
"""

from __future__ import annotations
import argparse, tensorflow as tf
from data import make_datasets

def parse_args():
    p = argparse.ArgumentParser(description="Evaluate Keras MobileNetV1 on EuroSAT")
    p.add_argument("--model-path", type=str, default="Model/MobileNetV1_EuroSAT.keras")
    p.add_argument("--img-size", type=int, default=224)
    p.add_argument("--batch-size", type=int, default=64)
    p.add_argument("--data-dir", type=str, default="/home/abedM/ai_riscv/training/Daten")
    p.add_argument("--with-top5", action="store_true")
    return p.parse_args()

def main():
    args = parse_args()
    _, ds_val, class_names = make_datasets(
        img_size=args.img_size,
        batch_size=args.batch_size,
        data_dir=args.data_dir,
        write_label_files=False,
        cache=True,
    )
    num_classes = len(class_names)
    print(f"[INFO] Klassen: {num_classes} -> {class_names}")

    model = tf.keras.models.load_model(args.model_path)
    print(f"[INFO] Modell geladen: {args.model_path}")

    metrics = ["accuracy"]
    if args.with_top5 and num_classes >= 5:
        metrics.append(tf.keras.metrics.TopKCategoricalAccuracy(k=5, name="top5"))
    model.compile(loss="categorical_crossentropy", metrics=metrics)

    results = model.evaluate(ds_val, verbose=1, return_dict=True)
    print("[VAL] " + "  ".join([f"{k}={v:.4f}" if k=="loss" else f"{k}={v*100:.2f}%"
                                for k,v in results.items()]))

if __name__ == "__main__":
    main()
