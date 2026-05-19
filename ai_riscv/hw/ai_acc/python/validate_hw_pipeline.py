from __future__ import annotations

import argparse
from pathlib import Path

import numpy as np

OUTPUT_OFFSET = -128
ACC_W = 33


def wrap_acc33_vec(v: np.ndarray) -> np.ndarray:
    mod = 1 << ACC_W
    return ((v + (1 << (ACC_W - 1))) % mod) - (1 << (ACC_W - 1))


def sat32_from_acc33_vec(v: np.ndarray) -> np.ndarray:
    v = v.astype(np.int64)
    sign32 = (v >> 32) & 1
    sign31 = (v >> 31) & 1
    overflow = sign32 != sign31
    out32 = (v & 0xFFFFFFFF).astype(np.uint32).view(np.int32)
    out32 = out32.astype(np.int64)
    out32[overflow & (sign32 == 0)] = 0x7FFFFFFF
    out32[overflow & (sign32 == 1)] = -0x80000000
    return out32.astype(np.int32)


def wrap_s32_vec(v: np.ndarray) -> np.ndarray:
    return ((v.astype(np.int64) + (1 << 31)) % (1 << 32)) - (1 << 31)


def wrap_s32_scalar(v: int) -> int:
    return int(((int(v) + (1 << 31)) % (1 << 32)) - (1 << 31))


def sat32_from_acc33_scalar(v: int) -> int:
    sign32 = (v >> 32) & 1
    sign31 = (v >> 31) & 1
    if sign32 ^ sign31:
        return 0x7FFFFFFF if sign32 == 0 else -0x80000000
    out = v & 0xFFFFFFFF
    if out & 0x80000000:
        out -= 0x100000000
    return int(out)


def requant_like_pe(acc32: int, shift: int, mult: int) -> int:
    shift_amt = int(shift)
    left_shift = shift_amt if shift_amt > 0 else 0
    if left_shift > 31:
        left_shift = 31

    a_s = wrap_s32_scalar(acc32)
    if left_shift != 0:
        a_s = wrap_s32_scalar(a_s << left_shift)

    b_s = wrap_s32_scalar(mult)

    mult_prod = int(np.int64(a_s) * np.int64(b_s))

    if (acc32 == -0x80000000) and (mult == -0x80000000):
        srdhm = 0x7FFFFFFF
    else:
        if mult_prod >= 0:
            srdhm = int((mult_prod + (1 << 30)) >> 31)
        else:
            srdhm = int((mult_prod - (1 << 30)) >> 31)
    srdhm = wrap_s32_scalar(srdhm)

    right_shift = -shift_amt if shift_amt < 0 else 0
    if right_shift > 31:
        right_shift = 31

    if right_shift == 0:
        rdp = srdhm
    else:
        if srdhm >= 0:
            rdp = int((srdhm + (1 << (right_shift - 1))) >> right_shift)
        else:
            rdp = int((srdhm + ((1 << (right_shift - 1)) - 1)) >> right_shift)
        rdp = wrap_s32_scalar(rdp)

    acc_with_offset = wrap_s32_scalar(rdp + OUTPUT_OFFSET)

    if acc_with_offset > 127:
        return 127
    if acc_with_offset < -128:
        return -128
    return int(acc_with_offset)


def load_int8_slice(path: Path, offset: int, count: int) -> np.ndarray:
    return np.fromfile(path, dtype=np.int8, count=count, offset=offset)


def load_i32_slice(path: Path, offset_bytes: int, count_bytes: int) -> np.ndarray:
    raw = np.fromfile(path, dtype=np.uint8, count=count_bytes, offset=offset_bytes)
    return raw.view("<i4")


def pad_input(x: np.ndarray, pad_l: int, pad_r: int, pad_t: int, pad_b: int) -> np.ndarray:
    if pad_l == pad_r == pad_t == pad_b == 0:
        return x
    h, w, c = x.shape
    out = np.zeros((h + pad_t + pad_b, w + pad_l + pad_r, c), dtype=np.int8)
    out[pad_t : pad_t + h, pad_l : pad_l + w, :] = x
    return out


def avg_pool_2x2_stride2(x: np.ndarray) -> np.ndarray:
    h, w, c = x.shape
    out_h = h // 2
    out_w = w // 2
    out = np.zeros((out_h, out_w, c), dtype=np.int8)
    for y in range(out_h):
        for x0 in range(out_w):
            block = x[y * 2 : y * 2 + 2, x0 * 2 : x0 * 2 + 2, :].astype(np.int32)
            sums = block.sum(axis=(0, 1))
            out[y, x0, :] = (sums >> 2).astype(np.int8)
    return out


def compare_arrays(hw: np.ndarray, sw: np.ndarray) -> dict[str, float]:
    diff = hw.astype(np.int16) - sw.astype(np.int16)
    total = int(diff.size)
    mismatches = int(np.count_nonzero(diff))
    max_abs = int(np.max(np.abs(diff))) if total else 0
    mean_abs = float(np.mean(np.abs(diff))) if total else 0.0
    accuracy = 100.0 * (total - mismatches) / total if total else 0.0
    return {
        "total": total,
        "mismatches": mismatches,
        "max_abs": max_abs,
        "mean_abs": mean_abs,
        "accuracy": accuracy,
    }


def parse_layer_selection(layer_arg: str | None, start_layer: int | None, end_layer: int | None) -> set[int] | None:
    if layer_arg is not None and (start_layer is not None or end_layer is not None):
        raise ValueError("Use either --layers or --start-layer/--end-layer, not both")

    if layer_arg is not None:
        selected = set()
        for token in layer_arg.split(","):
            token = token.strip()
            if not token:
                continue
            layer_num = int(token)
            if layer_num < 1:
                raise ValueError("Layer numbers start at 1")
            selected.add(layer_num - 1)
        if not selected:
            raise ValueError("--layers did not contain any valid layer numbers")
        return selected

    if start_layer is None and end_layer is None:
        return None

    start_idx = 0 if start_layer is None else start_layer - 1
    end_idx = (10 ** 9) if end_layer is None else end_layer - 1
    if start_idx < 0 or end_idx < 0:
        raise ValueError("Layer numbers start at 1")
    if start_idx > end_idx:
        raise ValueError("--start-layer must be <= --end-layer")
    return set(range(start_idx, end_idx + 1))


def run_layer(
    x: np.ndarray,
    layer: dict,
    rom_w: Path,
    rom_b: Path,
    rom_s: Path,
    rom_m: Path,
) -> np.ndarray:
    in_h = layer["in_h"]
    in_w = layer["in_w"]
    cin = layer["cin"]
    cout = layer["cout"]
    kh = layer["kh"]
    kw = layer["kw"]
    sh = layer["sh"]
    sw = layer["sw"]
    pad_l = layer["pad_l"]
    pad_r = layer["pad_r"]
    pad_t = layer["pad_t"]
    pad_b = layer["pad_b"]
    dw_en = layer["dw"]
    pw_en = layer["pw"]

    w_off = layer["w_off"]
    w_bytes = layer["w_bytes"]
    b_off = layer["b_off"]
    b_bytes = layer["b_bytes"]
    s_off = layer["s_off"]
    s_bytes = layer["s_bytes"]
    m_off = layer["m_off"]
    m_bytes = layer["m_bytes"]

    w_flat = load_int8_slice(rom_w, w_off, w_bytes)
    bias = load_i32_slice(rom_b, b_off, b_bytes)
    shift = load_i32_slice(rom_s, s_off, s_bytes)
    mult = load_i32_slice(rom_m, m_off, m_bytes)

    out_h = ((in_h + pad_t + pad_b - kh) // sh) + 1
    out_w = ((in_w + pad_l + pad_r - kw) // sw) + 1

    if dw_en:
        x_pad = pad_input(x, pad_l, pad_r, pad_t, pad_b)
        w_dw = w_flat.reshape(kh, kw, cin)
        y = np.zeros((out_h, out_w, cout), dtype=np.int8)
        for oy in range(out_h):
            for ox in range(out_w):
                patch = x_pad[oy * sh : oy * sh + kh, ox * sw : ox * sw + kw, :]
                for c in range(cout):
                    acc = int(bias[c])
                    for ky in range(kh):
                        for kx in range(kw):
                            acc = acc + int(patch[ky, kx, c]) * int(w_dw[ky, kx, c])
                            acc = int(wrap_acc33_vec(np.array([acc], dtype=np.int64))[0])
                    acc32 = sat32_from_acc33_scalar(acc)
                    y[oy, ox, c] = np.int8(requant_like_pe(acc32, int(shift[c]), int(mult[c])))
        return y

    if pw_en:
        if kh != 1 or kw != 1 or pad_l or pad_r or pad_t or pad_b:
            raise ValueError("Pointwise expects 1x1 and no padding")
        w_pw = w_flat.reshape(cin, cout)
        if sh != 1 or sw != 1:
            y = np.zeros((out_h, out_w, cout), dtype=np.int8)
            for oy in range(out_h):
                for ox in range(out_w):
                    vec = x[oy * sh, ox * sw, :]
                    for k in range(cout):
                        acc = int(bias[k])
                        for c in range(cin):
                            acc = acc + int(vec[c]) * int(w_pw[c, k])
                            acc = int(wrap_acc33_vec(np.array([acc], dtype=np.int64))[0])
                        acc32 = sat32_from_acc33_scalar(acc)
                        y[oy, ox, k] = np.int8(requant_like_pe(acc32, int(shift[k]), int(mult[k])))
            return y

        y = np.zeros((out_h, out_w, cout), dtype=np.int8)
        for oy in range(out_h):
            for ox in range(out_w):
                vec = x[oy, ox, :]
                for k in range(cout):
                    acc = int(bias[k])
                    for c in range(cin):
                        acc = acc + int(vec[c]) * int(w_pw[c, k])
                        acc = int(wrap_acc33_vec(np.array([acc], dtype=np.int64))[0])
                    acc32 = sat32_from_acc33_scalar(acc)
                    y[oy, ox, k] = np.int8(requant_like_pe(acc32, int(shift[k]), int(mult[k])))
        return y

    x_pad = pad_input(x, pad_l, pad_r, pad_t, pad_b)
    w_conv = w_flat.reshape(cin, kh, kw, cout)
    y = np.zeros((out_h, out_w, cout), dtype=np.int8)
    for oy in range(out_h):
        for ox in range(out_w):
            patch = x_pad[oy * sh : oy * sh + kh, ox * sw : ox * sw + kw, :]
            for k in range(cout):
                acc = int(bias[k])
                for c in range(cin):
                    for ky in range(kh):
                        for kx in range(kw):
                            acc = acc + int(patch[ky, kx, c]) * int(w_conv[c, ky, kx, k])
                            acc = int(wrap_acc33_vec(np.array([acc], dtype=np.int64))[0])
                acc32 = sat32_from_acc33_scalar(acc)
                y[oy, ox, k] = np.int8(requant_like_pe(acc32, int(shift[k]), int(mult[k])))
    return y


def main() -> None:
    parser = argparse.ArgumentParser(description="Reference pipeline for HW validation (int8 PE math).")
    parser.add_argument(
        "--img-file",
        default=(
            "C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv/hw/ai_acc/"
            "inferenz from wissem/output_2/input_modell wissem/input_hwc_i8.bin"
        ),
    )
    parser.add_argument("--rom-weights", default="rom/rom_weights_all.bin")
    parser.add_argument("--rom-bias", default="rom/rom_bias_all.bin")
    parser.add_argument("--rom-shift", default="rom/rom_shift_all.bin")
    parser.add_argument("--rom-mult", default="rom/rom_mult_all.bin")
    parser.add_argument("--report-dir", default="hw/ai_acc/evaluation/bericht")
    parser.add_argument("--out-dir", default="hw/ai_acc/evaluation/bericht_sw")
    parser.add_argument("--summary-out", default="hw/ai_acc/evaluation/bericht/validation_sw_summary.txt")
    parser.add_argument("--layers", help="Comma-separated 1-based layer list, e.g. 1,2,5")
    parser.add_argument("--start-layer", type=int, help="1-based first layer to validate")
    parser.add_argument("--end-layer", type=int, help="1-based last layer to validate")
    args = parser.parse_args()

    img_path = Path(args.img_file)
    rom_w = Path(args.rom_weights)
    rom_b = Path(args.rom_bias)
    rom_s = Path(args.rom_shift)
    rom_m = Path(args.rom_mult)
    report_dir = Path(args.report_dir)
    out_dir = Path(args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    selected_layers = parse_layer_selection(args.layers, args.start_layer, args.end_layer)

    x_flat = np.fromfile(img_path, dtype=np.int8)
    expected_in = 128 * 128 * 3
    if x_flat.size != expected_in:
        raise ValueError(f"Input size {x_flat.size} != expected {expected_in}")
    x = x_flat.reshape(128, 128, 3)

    layers = [
        # idx, in_w, in_h, cin, cout, kh, kw, sh, sw, pad_l, pad_r, pad_t, pad_b, dw, pw
        (0, 128, 128, 3, 32, 3, 3, 2, 2, 0, 1, 0, 1, 0, 0),
        (1, 64, 64, 32, 32, 3, 3, 1, 1, 1, 1, 1, 1, 1, 0),
        (2, 64, 64, 32, 64, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),
        (3, 64, 64, 64, 64, 3, 3, 2, 2, 0, 1, 0, 1, 1, 0),
        (4, 32, 32, 64, 128, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),
        (5, 32, 32, 128, 128, 3, 3, 1, 1, 1, 1, 1, 1, 1, 0),
        (6, 32, 32, 128, 128, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),
        (7, 32, 32, 128, 128, 3, 3, 2, 2, 0, 1, 0, 1, 1, 0),
        (8, 16, 16, 128, 256, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),
        (9, 16, 16, 256, 256, 3, 3, 1, 1, 1, 1, 1, 1, 1, 0),
        (10, 16, 16, 256, 256, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),
        (11, 16, 16, 256, 256, 3, 3, 2, 2, 0, 1, 0, 1, 1, 0),
        (12, 8, 8, 256, 512, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),
        (13, 8, 8, 512, 512, 3, 3, 1, 1, 1, 1, 1, 1, 1, 0),
        (14, 8, 8, 512, 512, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),
        (15, 8, 8, 512, 512, 3, 3, 1, 1, 1, 1, 1, 1, 1, 0),
        (16, 8, 8, 512, 512, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),
        (17, 8, 8, 512, 512, 3, 3, 1, 1, 1, 1, 1, 1, 1, 0),
        (18, 8, 8, 512, 512, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),
        (19, 8, 8, 512, 512, 3, 3, 1, 1, 1, 1, 1, 1, 1, 0),
        (20, 8, 8, 512, 512, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),
        (21, 8, 8, 512, 512, 3, 3, 1, 1, 1, 1, 1, 1, 1, 0),
        (22, 8, 8, 512, 512, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),
        (23, 8, 8, 512, 512, 3, 3, 2, 2, 0, 1, 0, 1, 1, 0),
        (24, 4, 4, 512, 1024, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),
        (25, 4, 4, 1024, 1024, 3, 3, 2, 2, 0, 1, 0, 1, 1, 0),
        (26, 2, 2, 1024, 1024, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),
    ]

    rom_meta = [
        (0, 0, 0, 0, 864, 128, 128, 128),
        (864, 128, 128, 128, 288, 128, 128, 128),
        (1152, 256, 256, 256, 2048, 256, 256, 256),
        (3200, 512, 512, 512, 576, 256, 256, 256),
        (3776, 768, 768, 768, 8192, 512, 512, 512),
        (11968, 1280, 1280, 1280, 1152, 512, 512, 512),
        (13120, 1792, 1792, 1792, 16384, 512, 512, 512),
        (29504, 2304, 2304, 2304, 1152, 512, 512, 512),
        (30656, 2816, 2816, 2816, 32768, 1024, 1024, 1024),
        (63424, 3840, 3840, 3840, 2304, 1024, 1024, 1024),
        (65728, 4864, 4864, 4864, 65536, 1024, 1024, 1024),
        (131264, 5888, 5888, 5888, 2304, 1024, 1024, 1024),
        (133568, 6912, 6912, 6912, 131072, 2048, 2048, 2048),
        (264640, 8960, 8960, 8960, 4608, 2048, 2048, 2048),
        (269248, 11008, 11008, 11008, 262144, 2048, 2048, 2048),
        (531392, 13056, 13056, 13056, 4608, 2048, 2048, 2048),
        (536000, 15104, 15104, 15104, 262144, 2048, 2048, 2048),
        (798144, 17152, 17152, 17152, 4608, 2048, 2048, 2048),
        (802752, 19200, 19200, 19200, 262144, 2048, 2048, 2048),
        (1064896, 21248, 21248, 21248, 4608, 2048, 2048, 2048),
        (1069504, 23296, 23296, 23296, 262144, 2048, 2048, 2048),
        (1331648, 25344, 25344, 25344, 4608, 2048, 2048, 2048),
        (1336256, 27392, 27392, 27392, 262144, 2048, 2048, 2048),
        (1598400, 29440, 29440, 29440, 4608, 2048, 2048, 2048),
        (1603008, 31488, 31488, 31488, 524288, 4096, 4096, 4096),
        (2127296, 35584, 35584, 35584, 9216, 4096, 4096, 4096),
        (2136512, 39680, 39680, 39680, 1048576, 4096, 4096, 4096),
    ]

    summary_lines = ["layer\tshape\ttotal\tmismatches\tmax_abs\tmean_abs\taccuracy_pct"]
    processed_layers: list[int] = []

    for entry, meta in zip(layers, rom_meta):
        (idx, in_w, in_h, cin, cout, kh, kw, sh, sw, pad_l, pad_r, pad_t, pad_b, dw, pw) = entry
        (w_off, b_off, s_off, m_off, w_bytes, b_bytes, s_bytes, m_bytes) = meta
        layer = {
            "in_w": in_w,
            "in_h": in_h,
            "cin": cin,
            "cout": cout,
            "kh": kh,
            "kw": kw,
            "sh": sh,
            "sw": sw,
            "pad_l": pad_l,
            "pad_r": pad_r,
            "pad_t": pad_t,
            "pad_b": pad_b,
            "dw": bool(dw),
            "pw": bool(pw),
            "w_off": w_off,
            "b_off": b_off,
            "s_off": s_off,
            "m_off": m_off,
            "w_bytes": w_bytes,
            "b_bytes": b_bytes,
            "s_bytes": s_bytes,
            "m_bytes": m_bytes,
        }

        y = run_layer(x, layer, rom_w, rom_b, rom_s, rom_m)
        processed_layers.append(idx)

        out_w = ((in_w + pad_l + pad_r - kw) // sw) + 1
        out_h = ((in_h + pad_t + pad_b - kh) // sh) + 1

        if selected_layers is None or idx in selected_layers:
            sw_name = f"layer_{idx + 1}_ofmap_{out_w}x{out_h}x{cout}_hwc_sw.bin"
            sw_path = out_dir / sw_name
            y.tofile(sw_path)

            hw_name = f"layer_{idx + 1}_ofmap_{out_w}x{out_h}x{cout}_hwc.bin"
            hw_path = report_dir / hw_name

            if hw_path.exists():
                hw = np.fromfile(hw_path, dtype=np.int8).reshape(out_h, out_w, cout)
                stats = compare_arrays(hw, y)
                summary_lines.append(
                    f"{idx + 1}\t{out_w}x{out_h}x{cout}\t{stats['total']}\t{stats['mismatches']}\t"
                    f"{stats['max_abs']}\t{stats['mean_abs']:.6f}\t{stats['accuracy']:.2f}"
                )
            else:
                summary_lines.append(f"{idx + 1}\t{out_w}x{out_h}x{cout}\tMISSING")

        x = y

        if selected_layers is not None and idx >= max(selected_layers):
            break

    if processed_layers and processed_layers[-1] == 26:
        prepool_name = "layer27_pw_ofmap_2x2x1024_hwc_PREPOOL.bin"
        prepool_sw = out_dir / "layer27_pw_ofmap_2x2x1024_hwc_PREPOOL_sw.bin"
        x.tofile(prepool_sw)
        prepool_hw = report_dir / prepool_name
        if prepool_hw.exists():
            hw = np.fromfile(prepool_hw, dtype=np.int8).reshape(2, 2, 1024)
            stats = compare_arrays(hw, x)
            summary_lines.append(
                f"L27_PREPOOL\t2x2x1024\t{stats['total']}\t{stats['mismatches']}\t"
                f"{stats['max_abs']}\t{stats['mean_abs']:.6f}\t{stats['accuracy']:.2f}"
            )

        post = avg_pool_2x2_stride2(x)
        post_sw = out_dir / "layer27_pw_ofmap_1x1x1024_hwc_POSTPOOL_sw.bin"
        post.tofile(post_sw)
        post_hw = report_dir / "layer27_pw_ofmap_1x1x1024_hwc_POSTPOOL.bin"
        if post_hw.exists():
            hw = np.fromfile(post_hw, dtype=np.int8).reshape(1, 1, 1024)
            stats = compare_arrays(hw, post)
            summary_lines.append(
                f"L27_POSTPOOL\t1x1x1024\t{stats['total']}\t{stats['mismatches']}\t"
                f"{stats['max_abs']}\t{stats['mean_abs']:.6f}\t{stats['accuracy']:.2f}"
            )

    Path(args.summary_out).write_text("\n".join(summary_lines) + "\n", encoding="utf-8")
    print(f"Wrote summary: {args.summary_out}")
    print(f"SW outputs: {out_dir}")


if __name__ == "__main__":
    main()
