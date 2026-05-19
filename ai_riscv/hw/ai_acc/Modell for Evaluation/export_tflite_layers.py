#!/usr/bin/env python3
"""export_tflite_layers.py

Exports per-layer weights + quantization parameters from a quantized TFLite model
into C headers suitable for bare-metal inference.

What it exports (for supported ops):
- Weights (int8)
- Bias (int32) if present
- input_offset = -input_zero_point, output_offset = output_zero_point
- Per-output-channel requantization: output_multiplier (Q31) + output_shift (signed exponent)
- Stride/dilation/padding computed from tensor shapes (TFLite-style)

Supported ops (weight-bearing):
- CONV_2D (also covers pointwise conv when kernel is 1x1)
- DEPTHWISE_CONV_2D
- FULLY_CONNECTED

For CONV_2D (including pointwise), it emits two weight layouts:
- Native (TFLite memory order, flattened)
- Interleaved over output-channels (k-major across filters) for vectorization over OC

Optionally dumps expected per-op outputs after running inference.

Examples:
  # Export headers (one directory per layer)
  python3 training/tools/export_tflite_layers.py \
    --model training/models/1-MobileNetV1-128_int8.tflite \
    --out-dir training/exports/mnv1_128

  # Also dump outputs using an image input (same preprocessing as predictTFLiteModelWithOutputPrint.py)
  python3 training/tools/export_tflite_layers.py \
    --model training/models/1-MobileNetV1-128_int8.tflite \
    --out-dir training/exports/mnv1_128 \
    --dump-outputs \
    --image training/data/Test/some.jpg \
    --image-size 128

  # Or provide an already-quantized input tensor
  python3 training/tools/export_tflite_layers.py \
    --model training/models/1-MobileNetV1-128_int8.tflite \
    --out-dir training/exports/mnv1_128 \
    --dump-outputs \
    --input-npy /tmp/input_tensor.npy

    python3 training/tools/export_tflite_layers.py \
      --model training/models/1-MobileNetV1-128_int8.tflite \
      --out-dir /tmp/mnv1_128_export_with_txt \
      --dump-outputs \
      --image /home/kharrat/Desktop/repos/mlonl110_v/training/testdata/image.png \
      --image-size 128
"""

from __future__ import annotations

import argparse
import json
import math
import os
import re
import sys
from dataclasses import dataclass
from typing import Any, Dict, List, Optional, Sequence, Tuple

import numpy as np


def _try_import_tf():
    try:
        import tensorflow as tf  # type: ignore

        return tf
    except Exception:
        return None


def get_interpreter(model_path: str, preserve_all_tensors: bool):
    tf = _try_import_tf()
    if tf is not None:
        return tf.lite.Interpreter(
            model_path=model_path,
            experimental_preserve_all_tensors=preserve_all_tensors,
        )

    try:
        from tflite_runtime.interpreter import Interpreter  # type: ignore

        # tflite-runtime typically does not support experimental_preserve_all_tensors.
        return Interpreter(model_path=model_path)
    except Exception as e:
        raise RuntimeError(
            "Neither tensorflow nor tflite-runtime is available. "
            "Install tensorflow (preferred) or tflite-runtime."
        ) from e


def _sanitize(s: str) -> str:
    s = s.strip()
    if not s:
        return "unnamed"
    s = s.replace("/", "_").replace(":", "_")
    s = re.sub(r"[^0-9A-Za-z_]+", "_", s)
    s = re.sub(r"_+", "_", s)
    return s.strip("_") or "unnamed"


def _to_list(x) -> List[int]:
    if x is None:
        return []
    return [int(v) for v in list(x)]


def _op_iolist(op: Dict[str, Any], key: str) -> List[int]:
    """Return op["inputs"] / op["outputs"] as list[int] without NumPy truthiness."""

    raw = op.get(key, None)
    if raw is None:
        return []
    # In TF Lite interpreter ops_details, these are often numpy arrays.
    if isinstance(raw, np.ndarray):
        raw_list = raw.reshape(-1).tolist()
    else:
        raw_list = list(raw)
    out: List[int] = []
    for v in raw_list:
        try:
            iv = int(v)
        except Exception:
            continue
        if iv >= 0:
            out.append(iv)
    return out


def _quantize_multiplier(real_multiplier: float) -> Tuple[int, int]:
    """TFLite-style quantized multiplier.

    Returns (quantized_multiplier_q31, shift_exponent).
    - shift_exponent can be negative (right shift) or positive (left shift)
    - quantized_multiplier is a signed int32 in Q31.
    """

    if real_multiplier == 0.0:
        return 0, 0

    significand, exponent = math.frexp(real_multiplier)
    q = int(round(significand * (1 << 31)))
    if q == (1 << 31):
        q //= 2
        exponent += 1

    # Clamp to int32
    if q > 0x7FFFFFFF:
        q = 0x7FFFFFFF
    if q < -0x80000000:
        q = -0x80000000

    return q, exponent


def _fmt_c_array(values: np.ndarray, c_type: str, name: str) -> str:
    flat = values.reshape(-1)
    body = ", ".join(str(int(v)) for v in flat.tolist())
    return f"static const {c_type} {name}[{flat.size}] = {{{body}}};\n"


def _compute_padding(
    in_h: int,
    in_w: int,
    out_h: int,
    out_w: int,
    filter_h: int,
    filter_w: int,
    stride_h: int,
    stride_w: int,
    dilation_h: int,
    dilation_w: int,
) -> Tuple[int, int]:
    # TFLite-style explicit padding for top/left.
    eff_kh = (filter_h - 1) * dilation_h + 1
    eff_kw = (filter_w - 1) * dilation_w + 1
    pad_needed_h = max(0, (out_h - 1) * stride_h + eff_kh - in_h)
    pad_needed_w = max(0, (out_w - 1) * stride_w + eff_kw - in_w)
    pad_h = int(pad_needed_h // 2)
    pad_w = int(pad_needed_w // 2)
    return pad_h, pad_w


@dataclass
class TensorInfo:
    index: int
    name: str
    shape: List[int]
    dtype: str
    scales: Optional[np.ndarray]
    zero_points: Optional[np.ndarray]


def _tensor_info_by_index(interpreter) -> Dict[int, TensorInfo]:
    details = interpreter.get_tensor_details()
    out: Dict[int, TensorInfo] = {}
    for td in details:
        idx = int(td["index"])
        name = str(td.get("name") or "")
        shape = _to_list(td.get("shape"))
        dtype = str(np.dtype(td.get("dtype")))
        qp = td.get("quantization_parameters", {}) or {}
        scales = qp.get("scales")
        zero_points = qp.get("zero_points")
        scales = scales if isinstance(scales, np.ndarray) else None
        zero_points = zero_points if isinstance(zero_points, np.ndarray) else None
        out[idx] = TensorInfo(idx, name, shape, dtype, scales, zero_points)
    return out


def _get_scalar_scale_zero(t: TensorInfo) -> Tuple[Optional[float], int]:
    scale = None
    zp = 0
    if isinstance(t.scales, np.ndarray) and t.scales.size >= 1:
        scale = float(t.scales.reshape(-1)[0])
    if isinstance(t.zero_points, np.ndarray) and t.zero_points.size >= 1:
        zp = int(t.zero_points.reshape(-1)[0])
    return scale, zp


def _write_header(path: str, content: str) -> None:
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)


def _export_conv2d(
    interpreter,
    op_index: int,
    op: Dict[str, Any],
    tensors: Dict[int, TensorInfo],
    layer_dir: str,
) -> None:
    inputs = _op_iolist(op, "inputs")
    outputs = _op_iolist(op, "outputs")
    if len(inputs) < 2 or len(outputs) < 1:
        return

    in_idx, w_idx = inputs[0], inputs[1]
    b_idx = inputs[2] if len(inputs) >= 3 else None
    out_idx = outputs[0]

    tin = tensors[in_idx]
    tw = tensors[w_idx]
    tout = tensors[out_idx]

    w = interpreter.get_tensor(w_idx)
    if w.ndim != 4:
        return

    # TFLite CONV_2D filter layout: [O, H, W, I]
    out_ch, k_h, k_w, in_ch = [int(x) for x in w.shape]

    b = None
    if b_idx is not None and b_idx in tensors:
        try:
            b = interpreter.get_tensor(b_idx)
        except Exception:
            b = None

    in_scale, in_zp = _get_scalar_scale_zero(tin)
    out_scale, out_zp = _get_scalar_scale_zero(tout)

    w_scales = tw.scales.astype(float) if isinstance(tw.scales, np.ndarray) else None
    if w_scales is not None and w_scales.size == 1 and out_ch > 1:
        # some models store scalar scale; expand
        w_scales = np.full((out_ch,), float(w_scales.reshape(-1)[0]), dtype=float)

    output_multiplier = None
    output_shift = None
    if in_scale is not None and out_scale is not None and w_scales is not None and int(w_scales.size) == out_ch:
        real_mult = (in_scale * w_scales) / out_scale
        ms: List[int] = []
        sh: List[int] = []
        for rm in real_mult.tolist():
            qm, ex = _quantize_multiplier(float(rm))
            ms.append(qm)
            sh.append(ex)
        output_multiplier = np.array(ms, dtype=np.int32)
        output_shift = np.array(sh, dtype=np.int32)

    # Stride/dilation from builtin options if available; else default 1
    opts = op.get("builtin_options") if isinstance(op.get("builtin_options"), dict) else {}
    stride_h = int(opts.get("stride_h", 1))
    stride_w = int(opts.get("stride_w", 1))
    dilation_h = int(opts.get("dilation_h_factor", 1))
    dilation_w = int(opts.get("dilation_w_factor", 1))

    # Padding computed from shapes (robust even if enum missing)
    in_h, in_w2 = int(tin.shape[1]), int(tin.shape[2])
    out_h, out_w2 = int(tout.shape[1]), int(tout.shape[2])
    pad_h, pad_w = _compute_padding(in_h, in_w2, out_h, out_w2, k_h, k_w, stride_h, stride_w, dilation_h, dilation_w)

    # Weight formats
    w_native = w.reshape(-1).astype(np.int8)
    # Interleave over output channels (k-major across filters)
    k_total = k_h * k_w * in_ch
    w_interleave = w.reshape(out_ch, k_total).transpose(1, 0).reshape(-1).astype(np.int8)

    layer_name = _sanitize(op.get("op_name") or "CONV_2D")
    guard = f"LAYER_{op_index:03d}_{layer_name}_H_"

    header = []
    header.append(f"#ifndef {guard}\n#define {guard}\n\n")
    header.append("#include <stdint.h>\n\n")
    header.append(f"// op_index={op_index} op=CONV_2D\n")
    header.append(f"// input:  idx={in_idx} name={tin.name} shape={tin.shape} dtype={tin.dtype}\n")
    header.append(f"// weights: idx={w_idx} name={tw.name} shape={_to_list(w.shape)} dtype={tw.dtype}\n")
    header.append(f"// output: idx={out_idx} name={tout.name} shape={tout.shape} dtype={tout.dtype}\n\n")

    header.append(f"#define L{op_index:03d}_CONV_OUT_CH ({out_ch})\n")
    header.append(f"#define L{op_index:03d}_CONV_IN_CH  ({in_ch})\n")
    header.append(f"#define L{op_index:03d}_CONV_KH     ({k_h})\n")
    header.append(f"#define L{op_index:03d}_CONV_KW     ({k_w})\n")
    header.append(f"#define L{op_index:03d}_CONV_STRIDE_H ({stride_h})\n")
    header.append(f"#define L{op_index:03d}_CONV_STRIDE_W ({stride_w})\n")
    header.append(f"#define L{op_index:03d}_CONV_DILATION_H ({dilation_h})\n")
    header.append(f"#define L{op_index:03d}_CONV_DILATION_W ({dilation_w})\n")
    header.append(f"#define L{op_index:03d}_CONV_PAD_H ({pad_h})\n")
    header.append(f"#define L{op_index:03d}_CONV_PAD_W ({pad_w})\n\n")

    header.append(f"static const int32_t L{op_index:03d}_conv_input_offset = {int(-in_zp)};\n")
    header.append(f"static const int32_t L{op_index:03d}_conv_output_offset = {int(out_zp)};\n\n")

    header.append("// Weights: native TFLite order (flattened)\n")
    header.append(_fmt_c_array(w_native, "int8_t", f"L{op_index:03d}_conv_weights"))
    header.append("\n// Weights: interleaved over output-channels (k-major across filters)\n")
    header.append(_fmt_c_array(w_interleave, "int8_t", f"L{op_index:03d}_conv_weights_interleaved_oc"))
    header.append("\n")

    if b is not None:
        header.append(_fmt_c_array(b.reshape(-1).astype(np.int32), "int32_t", f"L{op_index:03d}_conv_bias"))
        header.append("\n")

    if output_multiplier is not None and output_shift is not None:
        header.append(_fmt_c_array(output_multiplier, "int32_t", f"L{op_index:03d}_conv_output_multiplier"))
        header.append(_fmt_c_array(output_shift, "int32_t", f"L{op_index:03d}_conv_output_shift"))
    else:
        header.append("// Warning: output_multiplier/output_shift not emitted (missing scales).\n")

    header.append(f"\n#endif  // {guard}\n")

    _write_header(os.path.join(layer_dir, "params.h"), "".join(header))


def _export_depthwise(
    interpreter,
    op_index: int,
    op: Dict[str, Any],
    tensors: Dict[int, TensorInfo],
    layer_dir: str,
) -> None:
    inputs = _op_iolist(op, "inputs")
    outputs = _op_iolist(op, "outputs")
    if len(inputs) < 2 or len(outputs) < 1:
        return

    in_idx, w_idx = inputs[0], inputs[1]
    b_idx = inputs[2] if len(inputs) >= 3 else None
    out_idx = outputs[0]

    tin = tensors[in_idx]
    tw = tensors[w_idx]
    tout = tensors[out_idx]

    w = interpreter.get_tensor(w_idx)
    if w.ndim != 4:
        return

    # Common TFLite depthwise filter layout: [1, KH, KW, OC]
    _, k_h, k_w, out_ch = [int(x) for x in w.shape]

    b = None
    if b_idx is not None and b_idx in tensors:
        try:
            b = interpreter.get_tensor(b_idx)
        except Exception:
            b = None

    in_scale, in_zp = _get_scalar_scale_zero(tin)
    out_scale, out_zp = _get_scalar_scale_zero(tout)

    w_scales = tw.scales.astype(float) if isinstance(tw.scales, np.ndarray) else None
    if w_scales is not None and w_scales.size == 1 and out_ch > 1:
        w_scales = np.full((out_ch,), float(w_scales.reshape(-1)[0]), dtype=float)

    output_multiplier = None
    output_shift = None
    if in_scale is not None and out_scale is not None and w_scales is not None and int(w_scales.size) == out_ch:
        real_mult = (in_scale * w_scales) / out_scale
        ms: List[int] = []
        sh: List[int] = []
        for rm in real_mult.tolist():
            qm, ex = _quantize_multiplier(float(rm))
            ms.append(qm)
            sh.append(ex)
        output_multiplier = np.array(ms, dtype=np.int32)
        output_shift = np.array(sh, dtype=np.int32)

    opts = op.get("builtin_options") if isinstance(op.get("builtin_options"), dict) else {}
    stride_h = int(opts.get("stride_h", 1))
    stride_w = int(opts.get("stride_w", 1))
    dilation_h = int(opts.get("dilation_h_factor", 1))
    dilation_w = int(opts.get("dilation_w_factor", 1))
    depth_multiplier = int(opts.get("depth_multiplier", 1))

    in_h, in_w2 = int(tin.shape[1]), int(tin.shape[2])
    out_h, out_w2 = int(tout.shape[1]), int(tout.shape[2])
    pad_h, pad_w = _compute_padding(in_h, in_w2, out_h, out_w2, k_h, k_w, stride_h, stride_w, dilation_h, dilation_w)

    w_flat = w.reshape(-1).astype(np.int8)

    layer_name = _sanitize(op.get("op_name") or "DEPTHWISE_CONV_2D")
    guard = f"LAYER_{op_index:03d}_{layer_name}_H_"

    header = []
    header.append(f"#ifndef {guard}\n#define {guard}\n\n")
    header.append("#include <stdint.h>\n\n")
    header.append(f"// op_index={op_index} op=DEPTHWISE_CONV_2D\n")
    header.append(f"// input:  idx={in_idx} name={tin.name} shape={tin.shape} dtype={tin.dtype}\n")
    header.append(f"// weights: idx={w_idx} name={tw.name} shape={_to_list(w.shape)} dtype={tw.dtype}\n")
    header.append(f"// output: idx={out_idx} name={tout.name} shape={tout.shape} dtype={tout.dtype}\n\n")

    header.append(f"#define L{op_index:03d}_DW_OUT_CH ({out_ch})\n")
    header.append(f"#define L{op_index:03d}_DW_KH     ({k_h})\n")
    header.append(f"#define L{op_index:03d}_DW_KW     ({k_w})\n")
    header.append(f"#define L{op_index:03d}_DW_STRIDE_H ({stride_h})\n")
    header.append(f"#define L{op_index:03d}_DW_STRIDE_W ({stride_w})\n")
    header.append(f"#define L{op_index:03d}_DW_DILATION_H ({dilation_h})\n")
    header.append(f"#define L{op_index:03d}_DW_DILATION_W ({dilation_w})\n")
    header.append(f"#define L{op_index:03d}_DW_DEPTH_MULTIPLIER ({depth_multiplier})\n")
    header.append(f"#define L{op_index:03d}_DW_PAD_H ({pad_h})\n")
    header.append(f"#define L{op_index:03d}_DW_PAD_W ({pad_w})\n\n")

    header.append(f"static const int32_t L{op_index:03d}_dw_input_offset = {int(-in_zp)};\n")
    header.append(f"static const int32_t L{op_index:03d}_dw_output_offset = {int(out_zp)};\n\n")

    header.append(_fmt_c_array(w_flat, "int8_t", f"L{op_index:03d}_dw_weights"))
    header.append("\n")
    if b is not None:
        header.append(_fmt_c_array(b.reshape(-1).astype(np.int32), "int32_t", f"L{op_index:03d}_dw_bias"))
        header.append("\n")

    if output_multiplier is not None and output_shift is not None:
        header.append(_fmt_c_array(output_multiplier, "int32_t", f"L{op_index:03d}_dw_output_multiplier"))
        header.append(_fmt_c_array(output_shift, "int32_t", f"L{op_index:03d}_dw_output_shift"))
    else:
        header.append("// Warning: output_multiplier/output_shift not emitted (missing scales).\n")

    header.append(f"\n#endif  // {guard}\n")

    _write_header(os.path.join(layer_dir, "params.h"), "".join(header))


def _export_fully_connected(
    interpreter,
    op_index: int,
    op: Dict[str, Any],
    tensors: Dict[int, TensorInfo],
    layer_dir: str,
) -> None:
    inputs = _op_iolist(op, "inputs")
    outputs = _op_iolist(op, "outputs")
    if len(inputs) < 2 or len(outputs) < 1:
        return

    in_idx, w_idx = inputs[0], inputs[1]
    b_idx = inputs[2] if len(inputs) >= 3 else None
    out_idx = outputs[0]

    tin = tensors[in_idx]
    tw = tensors[w_idx]
    tout = tensors[out_idx]

    w = interpreter.get_tensor(w_idx)
    if w.ndim != 2:
        return

    out_ch, in_ch = [int(x) for x in w.shape]

    b = None
    if b_idx is not None and b_idx in tensors:
        try:
            b = interpreter.get_tensor(b_idx)
        except Exception:
            b = None

    in_scale, in_zp = _get_scalar_scale_zero(tin)
    out_scale, out_zp = _get_scalar_scale_zero(tout)

    w_scales = tw.scales.astype(float) if isinstance(tw.scales, np.ndarray) else None
    if w_scales is not None and w_scales.size == 1 and out_ch > 1:
        w_scales = np.full((out_ch,), float(w_scales.reshape(-1)[0]), dtype=float)

    output_multiplier = None
    output_shift = None
    if in_scale is not None and out_scale is not None and w_scales is not None and int(w_scales.size) == out_ch:
        real_mult = (in_scale * w_scales) / out_scale
        ms: List[int] = []
        sh: List[int] = []
        for rm in real_mult.tolist():
            qm, ex = _quantize_multiplier(float(rm))
            ms.append(qm)
            sh.append(ex)
        output_multiplier = np.array(ms, dtype=np.int32)
        output_shift = np.array(sh, dtype=np.int32)

    w_flat = w.reshape(-1).astype(np.int8)

    layer_name = _sanitize(op.get("op_name") or "FULLY_CONNECTED")
    guard = f"LAYER_{op_index:03d}_{layer_name}_H_"

    header = []
    header.append(f"#ifndef {guard}\n#define {guard}\n\n")
    header.append("#include <stdint.h>\n\n")
    header.append(f"// op_index={op_index} op=FULLY_CONNECTED\n")
    header.append(f"// input:  idx={in_idx} name={tin.name} shape={tin.shape} dtype={tin.dtype}\n")
    header.append(f"// weights: idx={w_idx} name={tw.name} shape={_to_list(w.shape)} dtype={tw.dtype}\n")
    header.append(f"// output: idx={out_idx} name={tout.name} shape={tout.shape} dtype={tout.dtype}\n\n")

    header.append(f"#define L{op_index:03d}_FC_OUT_CH ({out_ch})\n")
    header.append(f"#define L{op_index:03d}_FC_IN_CH  ({in_ch})\n\n")

    header.append(f"static const int32_t L{op_index:03d}_fc_input_offset = {int(-in_zp)};\n")
    header.append(f"static const int32_t L{op_index:03d}_fc_output_offset = {int(out_zp)};\n\n")

    header.append(_fmt_c_array(w_flat, "int8_t", f"L{op_index:03d}_fc_weights"))
    header.append("\n")
    if b is not None:
        header.append(_fmt_c_array(b.reshape(-1).astype(np.int32), "int32_t", f"L{op_index:03d}_fc_bias"))
        header.append("\n")

    if output_multiplier is not None and output_shift is not None:
        header.append(_fmt_c_array(output_multiplier, "int32_t", f"L{op_index:03d}_fc_output_multiplier"))
        header.append(_fmt_c_array(output_shift, "int32_t", f"L{op_index:03d}_fc_output_shift"))
    else:
        header.append("// Warning: output_multiplier/output_shift not emitted (missing scales).\n")

    header.append(f"\n#endif  // {guard}\n")

    _write_header(os.path.join(layer_dir, "params.h"), "".join(header))


def _prepare_input_from_image(interpreter, image_path: str, image_size: int) -> np.ndarray:
    tf = _try_import_tf()
    if tf is None:
        raise RuntimeError("Image input requires tensorflow (tf.keras.utils).");

    img = tf.keras.utils.load_img(image_path, target_size=(image_size, image_size))
    arr = tf.keras.utils.img_to_array(img)
    arr = np.expand_dims(arr, axis=0).astype(np.float32)
    arr = arr / 255.0

    input_details = interpreter.get_input_details()
    inp = input_details[0]
    dtype = inp.get("dtype")
    scale, zp = inp.get("quantization", (0.0, 0))

    if dtype == np.uint8:
        return np.round(arr / scale + zp).astype(np.uint8)
    if dtype == np.int8:
        return np.round(arr / scale + zp).astype(np.int8)
    return arr.astype(dtype if dtype is not None else np.float32)


def _tensor_to_text(arr: np.ndarray, max_elements: int = 2_000_000) -> str:
    """Convert a tensor to a human-readable string.

    Formatting policy:
    - Scalar: single value
    - 1D: one value per line
    - 2D: rows of space-separated values
    - 3D (HWC): prints per-channel HxW matrices
    - 4D (NHWC) with N==1: prints per-channel HxW matrices
    - Other: prints flattened with indices

    max_elements prevents accidental multi-GB text dumps.
    """

    a = np.asarray(arr)
    header = [
        f"shape={list(a.shape)} dtype={a.dtype}",
        "",
    ]

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
        # Prefer integer formatting for quantized tensors.
        if np.issubdtype(a.dtype, np.integer):
            return str(int(v))
        # Keep floats readable.
        return f"{float(v):.7g}"

    lines: List[str] = []

    if a.ndim == 0:
        lines.append(fmt_val(a.item()))
    elif a.ndim == 1:
        for i in range(int(a.shape[0])):
            lines.append(fmt_val(a[i]))
    elif a.ndim == 2:
        h, w = int(a.shape[0]), int(a.shape[1])
        for y in range(h):
            row = " ".join(fmt_val(a[y, x]) for x in range(w))
            lines.append(row)
    elif a.ndim == 3:
        h, w, c = int(a.shape[0]), int(a.shape[1]), int(a.shape[2])
        for ch in range(c):
            lines.append(f"CH {ch}:")
            for y in range(h):
                row = " ".join(fmt_val(a[y, x, ch]) for x in range(w))
                lines.append(row)
            lines.append("")
    elif a.ndim == 4 and int(a.shape[0]) == 1:
        # Assume NHWC
        h, w, c = int(a.shape[1]), int(a.shape[2]), int(a.shape[3])
        for ch in range(c):
            lines.append(f"CH {ch}:")
            for y in range(h):
                row = " ".join(fmt_val(a[0, y, x, ch]) for x in range(w))
                lines.append(row)
            lines.append("")
    else:
        flat = a.reshape(-1)
        for i in range(int(flat.size)):
            lines.append(f"[{i}] {fmt_val(flat[i])}")

    return "\n".join(header + lines + [""])


def _dump_outputs(interpreter, ops: Sequence[Dict[str, Any]], tensors: Dict[int, TensorInfo], out_dir: str) -> None:
    os.makedirs(out_dir, exist_ok=True)
    meta = []
    for op_index, op in enumerate(ops):
        op_name = (op.get("op_name") or "").upper()
        outputs = _op_iolist(op, "outputs")
        if not outputs:
            continue
        t_idx = outputs[0]
        if t_idx not in tensors:
            continue
        tinfo = tensors[t_idx]
        try:
            arr = interpreter.get_tensor(t_idx)
        except Exception:
            continue
        layer_dir = os.path.join(out_dir, f"layer_{op_index:03d}_{_sanitize(op_name)}")
        os.makedirs(layer_dir, exist_ok=True)
        np.save(os.path.join(layer_dir, "output.npy"), arr)

        # Also dump a human-readable text version.
        try:
            txt = _tensor_to_text(arr)
            with open(os.path.join(layer_dir, "output.txt"), "w", encoding="utf-8") as f:
                f.write(txt)
        except Exception:
            # Keep exporter robust; binary output is still available.
            pass

        meta.append(
            {
                "op_index": op_index,
                "op_name": op_name,
                "tensor_index": t_idx,
                "tensor_name": tinfo.name,
                "shape": tinfo.shape,
                "dtype": tinfo.dtype,
            }
        )
    with open(os.path.join(out_dir, "outputs_index.json"), "w", encoding="utf-8") as f:
        json.dump(meta, f, indent=2)


def main() -> int:
    ap = argparse.ArgumentParser(description="Export all layer weights/params from a TFLite model into C headers")
    ap.add_argument("--model", required=True, help="Path to .tflite model")
    ap.add_argument("--out-dir", required=True, help="Output directory (will contain one subdir per layer)")
    ap.add_argument("--dump-outputs", action="store_true", help="Run inference and dump per-op expected outputs (.npy)")
    ap.add_argument("--input-npy", default="", help="Optional .npy containing already-prepared input tensor")
    ap.add_argument("--image", default="", help="Optional image path used as input (will be resized + quantized)")
    ap.add_argument("--image-size", type=int, default=128, help="Resize size for --image (e.g. 128)")

    args = ap.parse_args()

    preserve_all = bool(args.dump_outputs)
    interpreter = get_interpreter(args.model, preserve_all_tensors=preserve_all)
    interpreter.allocate_tensors()

    tensors = _tensor_info_by_index(interpreter)

    ops = None
    if hasattr(interpreter, "_get_ops_details"):
        try:
            ops = interpreter._get_ops_details()
        except Exception:
            ops = None

    if ops is None or len(ops) == 0:
        raise RuntimeError("Interpreter does not expose op details; cannot export per-layer parameters")

    os.makedirs(args.out_dir, exist_ok=True)

    # Export per-layer headers
    for op_index, op in enumerate(ops):
        op_name = (op.get("op_name") or "").upper()
        layer_dir = os.path.join(args.out_dir, f"layer_{op_index:03d}_{_sanitize(op_name)}")
        os.makedirs(layer_dir, exist_ok=True)

        if op_name == "CONV_2D":
            _export_conv2d(interpreter, op_index, op, tensors, layer_dir)
        elif op_name == "DEPTHWISE_CONV_2D":
            _export_depthwise(interpreter, op_index, op, tensors, layer_dir)
        elif op_name == "FULLY_CONNECTED":
            _export_fully_connected(interpreter, op_index, op, tensors, layer_dir)

    # Optionally dump expected outputs for comparison
    if args.dump_outputs:
        input_details = interpreter.get_input_details()
        if not input_details:
            raise RuntimeError("Model has no inputs")
        input_index = int(input_details[0]["index"])

        if args.input_npy:
            inp = np.load(args.input_npy)
        elif args.image:
            inp = _prepare_input_from_image(interpreter, args.image, args.image_size)
        else:
            raise ValueError("--dump-outputs requires --input-npy or --image")

        interpreter.set_tensor(input_index, inp)
        interpreter.invoke()

        _dump_outputs(interpreter, ops, tensors, os.path.join(args.out_dir, "expected_outputs"))

    # Write a short index of exported layers
    index = []
    for op_index, op in enumerate(ops):
        op_name = (op.get("op_name") or "").upper()
        inputs = _op_iolist(op, "inputs")
        outputs = _op_iolist(op, "outputs")
        index.append({"op_index": op_index, "op_name": op_name, "inputs": inputs, "outputs": outputs})

    with open(os.path.join(args.out_dir, "layers_index.json"), "w", encoding="utf-8") as f:
        json.dump(index, f, indent=2)

    print(f"Exported {len(ops)} ops into: {args.out_dir}")
    if args.dump_outputs:
        print(f"Wrote expected outputs under: {os.path.join(args.out_dir, 'expected_outputs')}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
