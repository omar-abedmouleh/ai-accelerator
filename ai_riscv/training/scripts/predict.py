# predict.py
"""
Einzelbild-Prediction mit Keras-MobileNetV1 (EuroSAT).
- Nutzt data.preprocess_image_path (V1-Preprocessing).
- Liest map_labels.json für Index->Name.
"""

from __future__ import annotations
import argparse, json, tensorflow as tf, numpy as np
from data import preprocess_image_path

def parse_args():
    p = argparse.ArgumentParser(description="Predict single image with Keras MobileNetV1 (EuroSAT)")
    p.add_argument("--model-path", type=str, default="Model/MobileNetV1_EuroSAT.keras")
    p.add_argument("--image", type=str, required=True)
    p.add_argument("--img-size", type=int, default=224)
    p.add_argument("--topk", type=int, default=3)
    p.add_argument("--map-labels", type=str, default="map_labels.json")
    return p.parse_args()

def main():
    args = parse_args()

    with open(args.map_labels, "r") as f:
        idx2name = {int(k): v for k, v in json.load(f).items()}

    model = tf.keras.models.load_model(args.model_path)
    x = preprocess_image_path(args.image, img_size=args.img_size)  # V1-Preprocessing

    probs = model.predict(x, verbose=0)[0]
    # Modell hat bereits Softmax im Kopf; zur Sicherheit:
    probs = tf.nn.softmax(probs).numpy()

    k = min(args.topk, len(probs))
    topk_idx = np.argsort(probs)[-k:][::-1]
    print(f"[PRED] Datei: {args.image}")
    for i in topk_idx:
        name = idx2name.get(i, f"class_{i}")
        print(f"{name:>25}: {probs[i]*100:.2f}%")

if __name__ == "__main__":
    main()
