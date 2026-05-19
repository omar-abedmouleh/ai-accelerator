from pathlib import Path
import re
import numpy as np

BASE = Path(r"C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv")
OUTPUT2 = BASE / "hw/ai_acc/Modell for Evaluation/Layer Daten"
ROM_DIR = BASE / "rom"
ROM_DIR.mkdir(parents=True, exist_ok=True)

ARR_RE = re.compile(
    r"static\s+const\s+int(?:8|32)_t\s+([A-Za-z0-9_]+)\s*\[(\d+)\]\s*=\s*\{(.*?)\};",
    re.S,
)
SHAPE_RE = re.compile(r"weights:\s*.*?shape=\[([^\]]+)\]", re.S)


def parse_ints(blob: str) -> list[int]:
    return [int(x) for x in re.findall(r"-?\d+", blob)]


def layer_sort_key(path: Path) -> int:
    m = re.search(r"layer_(\d+)_", path.parent.name)
    if not m:
        return 10**9
    return int(m.group(1))


def pick_name(candidates: list[str], suffixes: tuple[str, ...]) -> str:
    for sfx in suffixes:
        hit = [n for n in candidates if n.endswith(sfx)]
        if hit:
            return hit[0]
    raise ValueError(f"No array found for suffixes={suffixes}")


def parse_weight_shape(text: str) -> tuple[int, int, int, int]:
    m = SHAPE_RE.search(text)
    if not m:
        raise ValueError("No weight shape found")
    dims = [int(x.strip()) for x in m.group(1).split(",") if x.strip()]
    if len(dims) != 4:
        raise ValueError(f"Unexpected weight shape: {dims}")
    return dims[0], dims[1], dims[2], dims[3]


def load_layer_arrays(
    params_path: Path,
    is_depthwise: bool,
) -> tuple[np.ndarray, np.ndarray, np.ndarray, np.ndarray, dict]:
    text = params_path.read_text(encoding="utf-8")
    arrays = {m.group(1): (int(m.group(2)), parse_ints(m.group(3))) for m in ARR_RE.finditer(text)}

    names = list(arrays.keys())
    if is_depthwise:
        # Depthwise ROM must use native weights, never interleaved.
        w_name = pick_name(names, ("_weights",))
    else:
        # Conv/pointwise ROM must use native weights (not interleaved).
        w_name = pick_name(names, ("_weights",))

    b_name = pick_name(names, ("_bias_total",))
    s_name = pick_name(names, ("_output_shift",))
    m_name = pick_name(names, ("_output_multiplier",))

    w_decl, w_vals = arrays[w_name]
    b_decl, b_vals = arrays[b_name]
    s_decl, s_vals = arrays[s_name]
    m_decl, m_vals = arrays[m_name]

    if not (w_decl == len(w_vals) and b_decl == len(b_vals) and s_decl == len(s_vals) and m_decl == len(m_vals)):
        raise ValueError(f"Declared length mismatch in {params_path}")

    w = np.array(w_vals, dtype=np.int8)
    b = np.array(b_vals, dtype=np.int32)
    s = np.array(s_vals, dtype=np.int32)
    mul = np.array(m_vals, dtype=np.int32)

    if w.size == 0 or b.size == 0 or s.size == 0 or mul.size == 0:
        raise ValueError(f"Empty arrays in {params_path}")
    if not (b.size == s.size == mul.size):
        raise ValueError(
            f"Channel mismatch in {params_path.name}: bias={b.size}, shift={s.size}, mult={mul.size}"
        )

    k, h, w_k, c = parse_weight_shape(text)
    if w.size != k * h * w_k * c:
        raise ValueError(
            f"Weight size mismatch in {params_path.name}: w={w.size}, shape={k}x{h}x{w_k}x{c}"
        )

    w = w.reshape((k, h, w_k, c))
    if is_depthwise:
        # Depthwise: fold k into channel and layout as [y][x][c] (c fastest)
        w = w.transpose(1, 2, 3, 0).reshape(h, w_k, c * k).reshape(-1)
    else:
        # Conv/pointwise: reorder to [cin][kh][kw][cout] (cout fastest)
        w = w.transpose(3, 1, 2, 0).reshape(-1)

    info = {
        "weights": w_name,
        "bias": b_name,
        "shift": s_name,
        "mult": m_name,
        "cout": b.size,
        "weights_count": w.size,
        "shape": (k, h, w_k, c),
        "depthwise": is_depthwise,
    }
    return w, b, s, mul, info


def main() -> None:
    params_files = sorted(OUTPUT2.rglob("params.h"), key=layer_sort_key)
    params_files = [p for p in params_files if "FULLY_CONNECTED" not in p.parent.name]

    if not params_files:
        raise RuntimeError(f"No params.h files found under {OUTPUT2}")

    layer_chunks = []
    for p in params_files:
        is_depthwise = "DEPTHWISE" in p.parent.name.upper()
        w, b, s, m, info = load_layer_arrays(p, is_depthwise)
        layer_chunks.append((p, w, b, s, m, info))

    rom_weights = ROM_DIR / "rom_weights_all.bin"
    rom_bias = ROM_DIR / "rom_bias_all.bin"
    rom_shift = ROM_DIR / "rom_shift_all.bin"
    rom_mult = ROM_DIR / "rom_mult_all.bin"

    backup = ROM_DIR / "rom_weights_all.bin.bak_full_cxyk"
    if rom_weights.exists() and not backup.exists():
        backup.write_bytes(rom_weights.read_bytes())

    w_off = b_off = s_off = m_off = 0
    rows = []

    with rom_weights.open("wb") as fw, rom_bias.open("wb") as fb, rom_shift.open("wb") as fs, rom_mult.open("wb") as fm:
        for p, w, b, s, m, info in layer_chunks:
            w.tofile(fw)
            b.tofile(fb)
            s.tofile(fs)
            m.tofile(fm)

            rows.append(
                {
                    "layer": p.parent.name,
                    "w_off": w_off,
                    "b_off": b_off,
                    "s_off": s_off,
                    "m_off": m_off,
                    "w_bytes": int(w.nbytes),
                    "b_bytes": int(b.nbytes),
                    "s_bytes": int(s.nbytes),
                    "m_bytes": int(m.nbytes),
                    "cout": int(info["cout"]),
                    "weights_name": info["weights"],
                    "shape": "x".join(str(x) for x in info["shape"]),
                }
            )

            w_off += int(w.nbytes)
            b_off += int(b.nbytes)
            s_off += int(s.nbytes)
            m_off += int(m.nbytes)

    report = BASE / "hw/ai_acc/evaluation/rom_build_full_model_report_cxyk.txt"
    report.parent.mkdir(parents=True, exist_ok=True)
    with report.open("w", encoding="utf-8") as f:
        f.write("ROM full-model build report (cin_kh_kw_cout layout)\n")
        f.write("depthwise layout: y_x_c (k folded into c)\n")
        f.write(f"layers: {len(rows)}\n")
        f.write(f"weights_rom_bytes: {w_off}\n")
        f.write(f"bias_rom_bytes:    {b_off}\n")
        f.write(f"shift_rom_bytes:   {s_off}\n")
        f.write(f"mult_rom_bytes:    {m_off}\n\n")
        f.write("layer,w_off,b_off,s_off,m_off,w_bytes,b_bytes,s_bytes,m_bytes,cout,weights_name,shape\n")
        for r in rows:
            f.write(
                f"{r['layer']},{r['w_off']},{r['b_off']},{r['s_off']},{r['m_off']},"
                f"{r['w_bytes']},{r['b_bytes']},{r['s_bytes']},{r['m_bytes']},"
                f"{r['cout']},{r['weights_name']},{r['shape']}\n"
            )

    print("Wrote:")
    print("  ", rom_weights, "bytes", w_off)
    print("  ", rom_bias, "bytes", b_off)
    print("  ", rom_shift, "bytes", s_off)
    print("  ", rom_mult, "bytes", m_off)
    print("Backup:")
    print("  ", backup)
    print("Report:")
    print("  ", report)


if __name__ == "__main__":
    main()
