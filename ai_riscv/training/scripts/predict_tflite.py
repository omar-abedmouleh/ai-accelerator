import argparse, json, numpy as np, tensorflow as tf
from tensorflow.keras.applications.mobilenet import preprocess_input


def load_labels(path: str):
    with open(path, "r") as f:
        return {int(k): v for k, v in json.load(f).items()}


def run(model_path: str, image_path: str, img_size: int, map_labels: str, topk: int = 5):
    idx2name = load_labels(map_labels)

    # preprocess image
    img_bytes = tf.io.read_file(image_path)
    img = tf.image.decode_image(img_bytes, channels=3, expand_animations=False)
    img = tf.image.resize(img, (img_size, img_size))
    img = tf.cast(img, tf.float32)
    img = preprocess_input(img)
    img = tf.expand_dims(img, 0)

    interpreter = tf.lite.Interpreter(model_path=model_path)
    interpreter.allocate_tensors()
    in_det = interpreter.get_input_details()[0]
    out_det = interpreter.get_output_details()[0]
    in_idx, out_idx = in_det["index"], out_det["index"]

    x = img.numpy()
    if in_det["dtype"] in (np.int8, np.uint8, np.int16):
        s, z = in_det["quantization"]
        x_q = np.round(x / s + z).astype(in_det["dtype"])
        interpreter.set_tensor(in_idx, x_q)
    else:
        interpreter.set_tensor(in_idx, x.astype(in_det["dtype"]))

    interpreter.invoke()
    out = interpreter.get_tensor(out_idx)
    if out_det["dtype"] in (np.int8, np.uint8, np.int16):
        s, z = out_det["quantization"]
        out = s * (out.astype(np.float32) - z)

    probs = tf.nn.softmax(out[0]).numpy()
    k = min(topk, probs.size)
    order = probs.argsort()[::-1][:k]
    print(f"[PRED] {image_path} (TFLite)")
    for i in order:
        print(f"{idx2name.get(int(i), i):>25}: {probs[i]*100:.2f}%")


def main():
    p = argparse.ArgumentParser(description="Single-image inference with TFLite model")
    p.add_argument("--model", required=True)
    p.add_argument("--image", required=True)
    p.add_argument("--img-size", type=int, default=128)
    p.add_argument("--map-labels", default="training/scripts/map_labels.json")
    p.add_argument("--topk", type=int, default=5)
    args = p.parse_args()
    run(args.model, args.image, args.img_size, args.map_labels, args.topk)


if __name__ == "__main__":
    main()
