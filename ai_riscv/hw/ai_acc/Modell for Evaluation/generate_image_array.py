#!/usr/bin/env python3
"""generate_image_array.py

Small CLI tool: convert an image into a model-ready input tensor array.

Typical use (recommended): infer dtype/quantization/shape from a .tflite model.
  python3 training/tools/generate_image_array.py \
    --image training/testdata/image.png \
    --model training/models/1-MobileNetV1-128_int8.tflite \
    --out-dir /tmp/input_dump \
    --name g_input

Outputs (configurable):
- input.npy  : numpy tensor (e.g. [1,H,W,3])
- input.txt  : human-readable dump
- input_data.h / input_data.c : C array for bare-metal use
"""

from __future__ import annotations

import argparse
import os
from typing import Optional, Tuple

import numpy as np


def _try_import_tf():
    try:
        import tensorflow as tf  # type: ignore

        return tf
    except Exception:
        return None


def _try_import_pil_image():
    try:
        from PIL import Image  # type: ignore

        return Image
    except Exception:
        return None


def _get_interpreter(model_path: str):
    tf = _try_import_tf()
    if tf is not None:
        return tf.lite.Interpreter(model_path=model_path)

    try:
        from tflite_runtime.interpreter import Interpreter  # type: ignore

        return Interpreter(model_path=model_path)
    except Exception as e:
        raise RuntimeError(
            "Neither tensorflow nor tflite-runtime is available. "
            "Install tensorflow (preferred) or tflite-runtime."
        ) from e


def _tensor_to_text(arr: np.ndarray, max_elements: int = 2_000_000) -> str:
    a = np.asarray(arr)
    header = [f"shape={list(a.shape)} dtype={a.dtype}", ""]

    total = int(a.size)
    if total == 0:
        return "\n".join(header + ["<empty>", ""])
    if total > max_elements:
        return "\n".join(
            header
            + [
                f"<too large to dump: elements={total} max_elements={max_elements}>",
                "",
            ]
        )

    def fmt_val(v) -> str:
        if np.issubdtype(a.dtype, np.integer):
            return str(int(v))
        return f"{float(v):.7g}"

    lines = []
    if a.ndim == 0:
        lines.append(fmt_val(a.item()))
    elif a.ndim == 1:
        for i in range(int(a.shape[0])):
            lines.append(fmt_val(a[i]))
    elif a.ndim == 2:
        h, w = int(a.shape[0]), int(a.shape[1])
        for y in range(h):
            lines.append(" ".join(fmt_val(a[y, x]) for x in range(w)))
    elif a.ndim == 3:
        h, w, c = int(a.shape[0]), int(a.shape[1]), int(a.shape[2])
        for ch in range(c):
            lines.append(f"CH {ch}:")
            for y in range(h):
                lines.append(" ".join(fmt_val(a[y, x, ch]) for x in range(w)))
            lines.append("")
    elif a.ndim == 4 and int(a.shape[0]) == 1:
        h, w, c = int(a.shape[1]), int(a.shape[2]), int(a.shape[3])
        for ch in range(c):
            lines.append(f"CH {ch}:")
            for y in range(h):
                lines.append(" ".join(fmt_val(a[0, y, x, ch]) for x in range(w)))
            lines.append("")
    else:
        flat = a.reshape(-1)
        for i in range(int(flat.size)):
            lines.append(f"[{i}] {fmt_val(flat[i])}")

    return "\n".join(header + lines + [""])


def _load_image_to_float01(image_path: str, target_hw: Tuple[int, int]) -> np.ndarray:
    """Returns float32 NHWC in [0,1], shape [1,H,W,3]."""

    h, w = int(target_hw[0]), int(target_hw[1])

    tf = _try_import_tf()
    if tf is not None:
        img = tf.keras.utils.load_img(image_path, target_size=(h, w))
        arr = tf.keras.utils.img_to_array(img)  # HWC float32
        arr = np.expand_dims(arr, axis=0).astype(np.float32)
        arr = arr / 255.0
        return arr

    Image = _try_import_pil_image()
    if Image is None:
        raise RuntimeError("Loading images requires tensorflow or pillow (PIL).")

    img = Image.open(image_path).convert("RGB").resize((w, h))
    arr = np.asarray(img, dtype=np.float32)
    arr = np.expand_dims(arr, axis=0)
    arr = arr / 255.0
    return arr


def _quantize_float01_to_dtype(x01: np.ndarray, dtype: np.dtype, scale: float, zero_point: int) -> np.ndarray:
    if scale == 0.0:
        raise ValueError("Quantization scale is 0.0; cannot quantize")
    q = np.round(x01 / float(scale) + int(zero_point))
    if np.dtype(dtype) == np.uint8:
        q = np.clip(q, 0, 255)
        return q.astype(np.uint8)
    if np.dtype(dtype) == np.int8:
        q = np.clip(q, -128, 127)
        return q.astype(np.int8)
    return q.astype(dtype)


def _emit_c_array(path_h: str, path_c: str, symbol: str, arr: np.ndarray) -> None:
    os.makedirs(os.path.dirname(path_h), exist_ok=True)
    os.makedirs(os.path.dirname(path_c), exist_ok=True)

    a = np.asarray(arr)
    flat = a.reshape(-1)

    if a.dtype == np.int8:
        c_type = "int8_t"
        include = "#include <stdint.h>\n"
    elif a.dtype == np.uint8:
        c_type = "uint8_t"
        include = "#include <stdint.h>\n"
    else:
        c_type = "float"
        include = ""

    guard = "INPUT_DATA_H_"
    with open(path_h, "w", encoding="utf-8") as f:
        f.write(f"#ifndef {guard}\n#define {guard}\n\n")
        if include:
            f.write(include)
            f.write("\n")
        f.write(f"extern const {c_type} {symbol}[{int(flat.size)}];\n")
        f.write(f"#define {symbol.upper()}_LEN ({int(flat.size)})\n")
        f.write(f"#endif  // {guard}\n")

    with open(path_c, "w", encoding="utf-8") as f:
        f.write(f"#include \"{os.path.basename(path_h)}\"\n\n")
        f.write(f"alignas(16) const {c_type} {symbol}[{int(flat.size)}] = {{")
        for i, v in enumerate(flat.tolist()):
            if i % 16 == 0:
                f.write("\n  ")
            if a.dtype == np.float32 or a.dtype == np.float64:
                f.write(f"{float(v):.9g}")
            else:
                f.write(str(int(v)))
            if i != int(flat.size) - 1:
                f.write(", ")
        f.write("\n};\n")


def main() -> int:
    ap = argparse.ArgumentParser(description="Convert an image to a model-ready input tensor array")
    ap.add_argument("--image", required=True, help="Input image path")
    ap.add_argument("--model", default="", help="Optional .tflite model to infer input shape/dtype/quantization")
    ap.add_argument("--image-size", type=int, default=0, help="Override resize (square). If 0, infer from model.")

    ap.add_argument(
        "--dtype",
        default="",
        choices=["", "float32", "int8", "uint8"],
        help="Output dtype if not using --model (or to override).",
    )
    ap.add_argument("--scale", type=float, default=0.0, help="Quantization scale (when dtype is int8/uint8 and no model)")
    ap.add_argument("--zero-point", type=int, default=0, help="Quantization zero-point (when dtype is int8/uint8 and no model)")

    ap.add_argument("--out-dir", default=".", help="Output directory")
    ap.add_argument("--name", default="g_input", help="C symbol name for emitted array")
    ap.add_argument(
        "--formats",
        default="npy,txt,c",
        help="Comma-separated outputs: npy,txt,c (default: npy,txt,c)",
    )

    args = ap.parse_args()

    out_dir = os.path.abspath(args.out_dir)
    os.makedirs(out_dir, exist_ok=True)

    inferred_h = inferred_w = None
    inferred_dtype = None
    inferred_scale = None
    inferred_zp = None

    if args.model:
        interpreter = _get_interpreter(args.model)
        interpreter.allocate_tensors()
        input_details = interpreter.get_input_details()
        if not input_details:
            raise RuntimeError("Model has no inputs")
        inp = input_details[0]
        raw_shape = inp.get("shape", None)
        if raw_shape is None:
            shape = []
        elif isinstance(raw_shape, np.ndarray):
            shape = [int(v) for v in raw_shape.reshape(-1).tolist()]
        else:
            shape = [int(v) for v in list(raw_shape)]
        if len(shape) >= 3:
            inferred_h = int(shape[1]) if int(shape[1]) > 0 else None
            inferred_w = int(shape[2]) if int(shape[2]) > 0 else None
        inferred_dtype = inp.get("dtype")
        q = inp.get("quantization", (0.0, 0))
        if isinstance(q, tuple) and len(q) == 2:
            inferred_scale, inferred_zp = float(q[0]), int(q[1])

    # Decide target size
    if args.image_size and args.image_size > 0:
        target_h = target_w = int(args.image_size)
    elif inferred_h is not None and inferred_w is not None:
        target_h, target_w = inferred_h, inferred_w
    else:
        raise ValueError("Cannot infer resize. Provide --image-size or a model with fixed input shape.")

    x01 = _load_image_to_float01(args.image, (target_h, target_w))

    # Decide output dtype + quantization
    out_dtype: np.dtype
    if args.dtype:
        out_dtype = np.dtype(args.dtype)
    elif inferred_dtype is not None:
        # For hardware kernels we usually want signed int8 activations.
        # If the model input is uint8, convert to int8 range by default.
        if np.dtype(inferred_dtype) == np.uint8:
            out_dtype = np.dtype(np.int8)
        else:
            out_dtype = np.dtype(inferred_dtype)
    else:
        out_dtype = np.dtype(np.float32)

    if out_dtype == np.int8 or out_dtype == np.uint8:
        # Prefer model quantization params when a model is provided.
        if args.model and inferred_scale is not None and inferred_zp is not None:
            scale, zp = float(inferred_scale), int(inferred_zp)
        else:
            scale, zp = float(args.scale), int(args.zero_point)

        # Special case: model input is uint8 but we want to emit int8.
        # We quantize to uint8 using (scale, zp_u8) and then shift into an
        # int8 representation with a target zero-point of -128.
        if out_dtype == np.int8 and inferred_dtype is not None and np.dtype(inferred_dtype) == np.uint8 and args.model:
            q_u8 = _quantize_float01_to_dtype(x01, np.dtype(np.uint8), scale=scale, zero_point=zp)
            target_zp_i8 = -128
            q_i16 = q_u8.astype(np.int16) + (target_zp_i8 - int(zp))
            q_i16 = np.clip(q_i16, -128, 127)
            out_tensor = q_i16.astype(np.int8)
        else:
            out_tensor = _quantize_float01_to_dtype(x01, out_dtype, scale=scale, zero_point=zp)
    else:
        out_tensor = x01.astype(np.float32)

    formats = {s.strip().lower() for s in str(args.formats).split(",") if s.strip()}

    if "npy" in formats:
        np.save(os.path.join(out_dir, "input.npy"), out_tensor)
    if "txt" in formats:
        with open(os.path.join(out_dir, "input.txt"), "w", encoding="utf-8") as f:
            f.write(_tensor_to_text(out_tensor))
    if "c" in formats:
        _emit_c_array(
            path_h=os.path.join(out_dir, "input_data.h"),
            path_c=os.path.join(out_dir, "input_data.c"),
            symbol=str(args.name),
            arr=out_tensor,
        )

    print(f"Wrote formats={sorted(formats)} to: {out_dir}")
    print(f"Tensor shape={list(out_tensor.shape)} dtype={out_tensor.dtype}")
    if out_tensor.dtype in (np.int8, np.uint8):
        # Helpful for debugging quantization range
        mn = int(out_tensor.min())
        mx = int(out_tensor.max())
        print(f"Quantized range: min={mn} max={mx}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
