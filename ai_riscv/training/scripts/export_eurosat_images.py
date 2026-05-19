import argparse
import os
import tensorflow as tf
import tensorflow_datasets as tfds


def export_images(data_dir: str, out_root: str, split: str = "train") -> None:
    # Nutzen vorhandenen TFDS-Cache (kein erneuter Download, falls schon vorhanden)
    builder = tfds.builder("eurosat/rgb", data_dir=data_dir)
    builder.download_and_prepare()

    ds = builder.as_dataset(split=split, as_supervised=True, shuffle_files=False)
    class_names = builder.info.features["label"].names

    for cls in class_names:
        os.makedirs(os.path.join(out_root, cls), exist_ok=True)

    for i, (img, label) in enumerate(tfds.as_numpy(ds)):
        cls = class_names[int(label)]
        dst = os.path.join(out_root, cls, f"{i:05d}.png")
        tf.io.write_file(dst, tf.io.encode_png(img))
        if i % 1000 == 0:
            print(f"{i} images written…")

    print(f"Fertig: {i + 1} Bilder in {out_root}")


def _cli():
    parser = argparse.ArgumentParser(description="Export EuroSAT TFDS zu PNGs")
    parser.add_argument("--data-dir", default="training/Daten", help="TFDS-Datenverzeichnis")
    parser.add_argument("--out-dir", default="training/Daten/eurosat_images", help="Zielordner für PNGs")
    parser.add_argument("--split", default="train", help="TFDS-Split (z.B. train, train[:80%])")
    args = parser.parse_args()
    export_images(args.data_dir, args.out_dir, args.split)


if __name__ == "__main__":
    _cli()
