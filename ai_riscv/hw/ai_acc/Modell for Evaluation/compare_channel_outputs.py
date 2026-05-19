#!/usr/bin/env python3
"""Compare per-channel int8 outputs from an Ibex sim log or raw HWC bin against exporter output.txt.

Supports these common formats:
- Sim log: "Channel <n>" followed by H lines of integers.
- Exporter: "CH <n>:" followed by H lines of integers.

Example:
    python3 training/tools/compare_channel_outputs.py \
        --sim-log hw/ibex/ibex_simple_system.log \
        --ref-txt training/exports/mnv1_128_2/expected_outputs/layer_026_DEPTHWISE_CONV_2D/output.txt

    python3 training/tools/compare_channel_outputs.py \
        --sim-bin hw/ai_acc/evaluation/bericht/layer_1_ofmap_64x64x32_hwc.bin \
        --ref-txt training/exports/mnv1_128_2/expected_outputs/layer_001_CONV_2D/output.txt

Scalar/vector selection is unrelated; this compares produced outputs.
"""

from __future__ import annotations

import argparse
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Sequence, Tuple


_INT_RE = re.compile(r"-?\d+")


@dataclass(frozen=True)
class TensorShape:
    n: int
    h: int
    w: int
    c: int


def _parse_shape_line(text: str) -> Optional[TensorShape]:
    # Example: shape=[1, 4, 4, 1024] dtype=int8
    m = re.search(r"shape=\[([^\]]+)\]", text)
    if not m:
        return None
    dims = [int(x.strip()) for x in m.group(1).split(",") if x.strip()]
    if len(dims) != 4:
        return None
    return TensorShape(n=dims[0], h=dims[1], w=dims[2], c=dims[3])


def _extract_ints(line: str) -> List[int]:
    return [int(x) for x in _INT_RE.findall(line)]


def parse_export_output_txt(path: str) -> Tuple[Optional[TensorShape], Dict[int, List[List[int]]]]:
    with open(path, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()

    shape: Optional[TensorShape] = None
    for ln in lines[:10]:
        shape = _parse_shape_line(ln)
        if shape:
            break

    out: Dict[int, List[List[int]]] = {}
    i = 0
    while i < len(lines):
        line = lines[i].strip()
        m = re.match(r"^CH\s+(\d+)\s*:\s*$", line)
        if not m:
            i += 1
            continue
        ch = int(m.group(1))
        i += 1

        rows: List[List[int]] = []
        while i < len(lines):
            ints = _extract_ints(lines[i])
            if not ints:
                break
            rows.append(ints)
            i += 1
        if rows:
            out[ch] = rows
        # skip blank separator lines
        while i < len(lines) and not lines[i].strip():
            i += 1

    return shape, out


def parse_sim_log(path: str) -> Dict[int, List[List[int]]]:
    with open(path, "r", encoding="utf-8", errors="replace") as f:
        lines = f.read().splitlines()

    out: Dict[int, List[List[int]]] = {}

    i = 0
    while i < len(lines):
        line = lines[i].strip()

        # Matches: "Channel 0" or "Output: channel 0" or "Output: channel 0 (..x..)"
        m = re.match(r"^(?:Channel\s+(\d+)|Output:\s*channel\s+(\d+).*)$", line)
        if not m:
            i += 1
            continue
        ch_str = m.group(1) if m.group(1) is not None else m.group(2)
        ch = int(ch_str)
        i += 1

        rows: List[List[int]] = []
        while i < len(lines):
            ints = _extract_ints(lines[i])
            if not ints:
                break
            rows.append(ints)
            i += 1

        if rows:
            out[ch] = rows

        while i < len(lines) and not lines[i].strip():
            i += 1

    return out


def parse_sim_bin(path: str, shape: TensorShape) -> Dict[int, List[List[int]]]:
    size = shape.h * shape.w * shape.c
    data = Path(path).read_bytes()
    if len(data) != size:
        raise ValueError(f"sim bin size {len(data)} != expected {size} (HWC={shape.h}x{shape.w}x{shape.c})")

    vals = [int(v) if v < 128 else int(v) - 256 for v in data]
    out: Dict[int, List[List[int]]] = {}
    idx = 0
    for y in range(shape.h):
        for x in range(shape.w):
            for c in range(shape.c):
                out.setdefault(c, [[] for _ in range(shape.h)])
                out[c][y].append(vals[idx])
                idx += 1
    return out


@dataclass
class ChannelStats:
    channel: int
    total: int
    matches: int
    mismatches: int
    accuracy: float
    max_abs_diff: int
    mean_abs_diff: float


def _flatten(rows: Sequence[Sequence[int]]) -> List[int]:
    return [v for row in rows for v in row]


def compare_channels(
    sim: Dict[int, List[List[int]]],
    ref: Dict[int, List[List[int]]],
    channels: Optional[Sequence[int]] = None,
    max_mismatch_examples: int = 10,
) -> Tuple[List[ChannelStats], Dict[str, float]]:
    if channels is None:
        common = sorted(set(sim.keys()) & set(ref.keys()))
    else:
        common = [c for c in channels if c in sim and c in ref]

    per_ch: List[ChannelStats] = []

    total = 0
    matches = 0
    absdiff_sum = 0
    absdiff_count = 0
    max_abs = 0

    mismatch_examples_printed = 0

    for ch in common:
        sim_rows = sim[ch]
        ref_rows = ref[ch]

        sim_flat = _flatten(sim_rows)
        ref_flat = _flatten(ref_rows)

        n = min(len(sim_flat), len(ref_flat))
        if len(sim_flat) != len(ref_flat):
            print(
                f"WARN: channel {ch}: element count differs (sim={len(sim_flat)} ref={len(ref_flat)}). "
                f"Comparing first {n}."
            )

        ch_matches = 0
        ch_abs_sum = 0
        ch_max_abs = 0

        # Try to compute coordinates if both are consistent grids.
        h = min(len(sim_rows), len(ref_rows))
        w = None
        if h > 0:
            w_sim = len(sim_rows[0])
            w_ref = len(ref_rows[0])
            if w_sim == w_ref:
                w = w_sim

        for idx in range(n):
            a = sim_flat[idx]
            b = ref_flat[idx]
            if a == b:
                ch_matches += 1
            else:
                if mismatch_examples_printed < max_mismatch_examples:
                    if w is not None:
                        y = idx // w
                        x = idx % w
                        print(f"mismatch ch={ch} (y={y}, x={x}): sim={a} ref={b} diff={a-b}")
                    else:
                        print(f"mismatch ch={ch} idx={idx}: sim={a} ref={b} diff={a-b}")
                    mismatch_examples_printed += 1

            d = abs(a - b)
            ch_abs_sum += d
            if d > ch_max_abs:
                ch_max_abs = d

        ch_total = n
        ch_mismatches = ch_total - ch_matches
        ch_acc = (100.0 * ch_matches / ch_total) if ch_total else 0.0
        ch_mean_abs = (ch_abs_sum / ch_total) if ch_total else 0.0

        per_ch.append(
            ChannelStats(
                channel=ch,
                total=ch_total,
                matches=ch_matches,
                mismatches=ch_mismatches,
                accuracy=ch_acc,
                max_abs_diff=ch_max_abs,
                mean_abs_diff=ch_mean_abs,
            )
        )

        total += ch_total
        matches += ch_matches
        absdiff_sum += ch_abs_sum
        absdiff_count += ch_total
        if ch_max_abs > max_abs:
            max_abs = ch_max_abs

    overall = {
        "total": float(total),
        "matches": float(matches),
        "mismatches": float(total - matches),
        "accuracy_percent": (100.0 * matches / total) if total else 0.0,
        "mean_abs_diff": (absdiff_sum / absdiff_count) if absdiff_count else 0.0,
        "max_abs_diff": float(max_abs),
    }

    return per_ch, overall


def _parse_channels_arg(text: str) -> List[int]:
    # "0,1,2" or "0-31" or mixed "0-31,100,200-210"
    result: List[int] = []
    for part in text.split(","):
        part = part.strip()
        if not part:
            continue
        if "-" in part:
            a, b = part.split("-", 1)
            start = int(a.strip())
            end = int(b.strip())
            if end < start:
                start, end = end, start
            result.extend(range(start, end + 1))
        else:
            result.append(int(part))
    return result


def main() -> int:
    ap = argparse.ArgumentParser(description="Compare per-channel outputs between sim log/bin and exporter output.txt")
    sim_group = ap.add_mutually_exclusive_group(required=True)
    sim_group.add_argument("--sim-log", help="Path to simulator log (contains 'Channel N' blocks)")
    sim_group.add_argument("--sim-bin", help="Path to raw int8 HWC bin (H*W*C bytes)")
    ap.add_argument("--ref-txt", required=True, help="Path to exporter output.txt (contains 'CH N:' blocks)")
    ap.add_argument(
        "--channels",
        default=None,
        help="Optional channel list/ranges, e.g. '0-31' or '0,1,7,128-140'. Default: all common channels.",
    )
    ap.add_argument(
        "--top",
        type=int,
        default=20,
        help="Show the worst N channels by mismatches (default: 20).",
    )
    ap.add_argument(
        "--examples",
        type=int,
        default=10,
        help="Print up to N mismatch examples (default: 10).",
    )
    args = ap.parse_args()

    ref_shape, ref = parse_export_output_txt(args.ref_txt)
    if args.sim_log:
        sim = parse_sim_log(args.sim_log)
    else:
        if ref_shape is None:
            raise RuntimeError("ref output.txt does not include shape; cannot infer HWC for sim bin")
        sim = parse_sim_bin(args.sim_bin, ref_shape)

    if ref_shape:
        print(f"ref shape: [N,H,W,C]=[{ref_shape.n},{ref_shape.h},{ref_shape.w},{ref_shape.c}]")
    print(f"parsed sim channels: {len(sim)}")
    print(f"parsed ref channels: {len(ref)}")

    channels = _parse_channels_arg(args.channels) if args.channels else None
    per_ch, overall = compare_channels(sim, ref, channels=channels, max_mismatch_examples=args.examples)

    if not per_ch:
        print("No common channels found to compare.")
        sim_only = sorted(set(sim.keys()) - set(ref.keys()))
        ref_only = sorted(set(ref.keys()) - set(sim.keys()))
        if sim_only:
            print(f"sim-only channels (first 20): {sim_only[:20]}")
        if ref_only:
            print(f"ref-only channels (first 20): {ref_only[:20]}")
        return 2

    print("\nOverall:")
    print(f"  compared elements: {int(overall['total'])}")
    print(f"  exact matches:     {int(overall['matches'])} ({overall['accuracy_percent']:.3f}%)")
    print(f"  mismatches:        {int(overall['mismatches'])}")
    print(f"  mean |diff|:       {overall['mean_abs_diff']:.3f}")
    print(f"  max  |diff|:       {int(overall['max_abs_diff'])}")

    per_ch_sorted = sorted(per_ch, key=lambda s: (s.mismatches, s.max_abs_diff, -s.accuracy), reverse=True)
    print(f"\nWorst {min(args.top, len(per_ch_sorted))} channels (by mismatches):")
    for s in per_ch_sorted[: args.top]:
        print(
            f"  ch {s.channel:4d}: mismatches={s.mismatches:3d}/{s.total:3d} "
            f"acc={s.accuracy:6.2f}% max|d|={s.max_abs_diff:3d} mean|d|={s.mean_abs_diff:.2f}"
        )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
