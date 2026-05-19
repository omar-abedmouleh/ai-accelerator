#!/usr/bin/env python3
from __future__ import annotations
import os, argparse, numpy as np, tensorflow as tf
from data import make_datasets, representative_dataset

# ---------- Utils ----------
def to_bytes(m: int) -> str:
    for u in ["B","KB","MB","GB","TB"]:
        if m < 1024: return f"{m:.1f} {u}"
        m /= 1024
    return f"{m:.1f} PB"

def print_io(interpreter: tf.lite.Interpreter, tag: str):
    in_det  = interpreter.get_input_details()[0]
    out_det = interpreter.get_output_details()[0]
    print(f"[I/O:{tag}] in={in_det['dtype']}, q={in_det['quantization']}  ->  "
          f"out={out_det['dtype']}, q={out_det['quantization']}")

def keras_eval(model_path: str, ds_val) -> float:
    model = tf.keras.models.load_model(model_path)
    model.compile(loss="categorical_crossentropy", metrics=["accuracy"])
    res = model.evaluate(ds_val, verbose=0, return_dict=True)
    return float(res["accuracy"])

# ---------- TFLite-Konvertierung ----------
def convert_tflite(keras_model, mode: str, rep_ds=None) -> bytes:
    converter = tf.lite.TFLiteConverter.from_keras_model(keras_model)

    if mode == "fp32":
        return converter.convert()

    if mode == "dynamic_int8":  # nur Gewichte int8; I/O bleibt float32
        converter.optimizations = [tf.lite.Optimize.DEFAULT]
        return converter.convert()

    if mode == "full_int8":     # alles int8 inkl. I/O
        converter.optimizations = [tf.lite.Optimize.DEFAULT]
        assert rep_ds is not None, "Representative dataset required for full INT8"
        converter.representative_dataset = rep_ds
        converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS_INT8]
        converter.inference_input_type  = tf.int8
        converter.inference_output_type = tf.int8
        return converter.convert()

    if mode == "int16x8":       # Aktivierungen int16, Gewichte int8 (I/O bleibt float32!)
        converter.optimizations = [tf.lite.Optimize.DEFAULT]
        assert rep_ds is not None, "Representative dataset required for INT16x8"
        converter.representative_dataset = rep_ds

        # Fallback je nach TF-Version:
        try:
            int16_enum = tf.lite.OpsSet.TFLITE_BUILTINS_INT16
        except AttributeError:
            int16_enum = tf.lite.OpsSet.EXPERIMENTAL_TFLITE_BUILTINS_ACTIVATIONS_INT16_WEIGHTS_INT8

        converter.target_spec.supported_ops = [int16_enum]
        # KEIN inference_input_type/output_type auf int16 setzen!
        return converter.convert()

    if mode == "float16":       # Gewichte fp16; I/O float32
        converter.optimizations = [tf.lite.Optimize.DEFAULT]
        converter.target_spec.supported_types = [tf.float16]
        return converter.convert()

    raise ValueError(f"Unknown mode: {mode}")

# ---------- TFLite-Eval ----------
def eval_tflite(tflite_model: bytes, ds_val) -> float:
    interpreter = tf.lite.Interpreter(model_content=tflite_model)
    interpreter.allocate_tensors()
    in_det  = interpreter.get_input_details()[0]
    out_det = interpreter.get_output_details()[0]
    in_idx, out_idx = in_det["index"], out_det["index"]

    correct = total = 0
    for x, y in ds_val:
        x_np = x.numpy()                       # float32 in [-1,1], Shape [B,H,W,3]
        y_np = y.numpy().argmax(axis=1)

        # ggf. Input-Shape anpassen
        if list(interpreter.get_tensor_details()[in_idx]["shape"]) != list(x_np.shape):
            interpreter.resize_tensor_input(in_idx, x_np.shape, strict=False)
            interpreter.allocate_tensors()
            in_det  = interpreter.get_input_details()[0]
            out_det = interpreter.get_output_details()[0]
            in_idx, out_idx = in_det["index"], out_det["index"]

        # Eingabe setzen (quantisieren, falls nötig)
        if in_det["dtype"] in (np.int8, np.int16, np.uint8):
            s, z = in_det["quantization"]
            if s == 0:
                interpreter.set_tensor(in_idx, x_np.astype(np.float32))
            else:
                x_q = np.round(x_np / s + z).astype(in_det["dtype"])
                interpreter.set_tensor(in_idx, x_q)
        else:
            interpreter.set_tensor(in_idx, x_np.astype(np.float32))

        interpreter.invoke()
        out = interpreter.get_tensor(out_idx)

        # Ausgabe ggf. dequantisieren
        if out_det["dtype"] in (np.int8, np.int16, np.uint8):
            s, z = out_det["quantization"]
            out = s * (out.astype(np.float32) - z)

        pred = out.argmax(axis=1)
        correct += (pred == y_np).sum()
        total   += y_np.size

    return 100.0 * correct / total

# ---------- Main ----------
def main():
    ap = argparse.ArgumentParser(description="Quantization accuracy sweep (EuroSAT / MobileNetV1)")
    ap.add_argument("--model-path", type=str, default="Model/MobileNetV1_EuroSAT.keras")
    ap.add_argument("--data-dir", type=str, default="/home/abedM/ai_riscv/training/Daten")
    ap.add_argument("--img-size", type=int, default=224)
    ap.add_argument("--batch-size", type=int, default=64)
    ap.add_argument("--calib-batches", type=int, default=100)
    ap.add_argument("--outdir", type=str, default="Model/tflite")
    ap.add_argument("--modes", type=str, nargs="+",
                    choices=["fp32","dynamic_int8","full_int8","int16x8","float16"],
                    default=["fp32","dynamic_int8","full_int8","int16x8","float16"])
    args = ap.parse_args()

    os.makedirs(args.outdir, exist_ok=True)

    # Val-Set (gleiches Preprocessing)
    _, ds_val, _ = make_datasets(
        img_size=args.img_size,
        batch_size=args.batch_size,
        data_dir=args.data_dir,
        cache=True,
        write_label_files=False,
    )

    # Baseline (Keras)
    acc_fp32 = keras_eval(args.model_path, ds_val)
    print(f"[Baseline Keras FP32] acc = {acc_fp32:.2f}%")

    keras_model = tf.keras.models.load_model(args.model_path)
    rep_ds = lambda: representative_dataset(ds_val, num_batches=args.calib_batches)

    results = []

    if "fp32" in args.modes:
        tfl = convert_tflite(keras_model, "fp32")
        path = os.path.join(args.outdir, "eurosat_fp32.tflite")
        with open(path, "wb") as f: f.write(tfl)
        interp = tf.lite.Interpreter(model_content=tfl); interp.allocate_tensors()
        print_io(interp, "fp32")
        acc = eval_tflite(tfl, ds_val)
        results.append(("TFLite FP32", acc, len(tfl)))

    if "dynamic_int8" in args.modes:
        tfl = convert_tflite(keras_model, "dynamic_int8")
        path = os.path.join(args.outdir, "eurosat_dynamic_int8.tflite")
        with open(path, "wb") as f: f.write(tfl)
        interp = tf.lite.Interpreter(model_content=tfl); interp.allocate_tensors()
        print_io(interp, "dynamic_int8")
        acc = eval_tflite(tfl, ds_val)
        results.append(("Dynamic INT8 (weights-only)", acc, len(tfl)))

    if "full_int8" in args.modes:
        tfl = convert_tflite(keras_model, "full_int8", rep_ds=rep_ds)
        path = os.path.join(args.outdir, "eurosat_full_int8.tflite")
        with open(path, "wb") as f: f.write(tfl)
        interp = tf.lite.Interpreter(model_content=tfl); interp.allocate_tensors()
        print_io(interp, "full_int8")
        acc = eval_tflite(tfl, ds_val)
        results.append(("Full INT8", acc, len(tfl)))

    if "int16x8" in args.modes:
        tfl = convert_tflite(keras_model, "int16x8", rep_ds=rep_ds)
        path = os.path.join(args.outdir, "eurosat_int16x8.tflite")
        with open(path, "wb") as f: f.write(tfl)
        interp = tf.lite.Interpreter(model_content=tfl); interp.allocate_tensors()
        print_io(interp, "int16x8")
        acc = eval_tflite(tfl, ds_val)
        results.append(("INT16x8 (act16/weights8)", acc, len(tfl)))

    if "float16" in args.modes:
        tfl = convert_tflite(keras_model, "float16")
        path = os.path.join(args.outdir, "eurosat_float16.tflite")
        with open(path, "wb") as f: f.write(tfl)
        interp = tf.lite.Interpreter(model_content=tfl); interp.allocate_tensors()
        print_io(interp, "float16")
        acc = eval_tflite(tfl, ds_val)
        results.append(("Float16 (weights)", acc, len(tfl)))

    # Bericht
    print("\n=== Ergebnis (Val-Split) ===")
    print(f"Baseline (Keras FP32): {acc_fp32:.2f}%")
    for name, acc, size in results:
        drop = acc_fp32 - acc
        print(f"{name:28s} acc={acc:6.2f}%   Δ={drop:5.2f} pp   size={to_bytes(size)}")

if __name__ == "__main__":
    main()
