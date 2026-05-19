#!/usr/bin/env python3
"""Summarize Synopsys DC report_area -hierarchy output.

Parses the "Hierarchical area distribution" section and emits:
- TSV tables for level-1 and level-2 hierarchy
- A Markdown report with sorted tables

Usage:
  python3 summarize_area.py --in <area_hier.rpt> --outdir <reports_dir>

Notes:
- "Level" is derived from the instance path depth (count of '/').
  top_module -> level 0
  u_processing -> level 1
  u_processing/u_accel -> level 2
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, List, Optional


@dataclass(frozen=True)
class AreaRow:
    inst: str
    total: float
    percent: float
    comb: float
    noncomb: float
    black: float
    design: str


def hierarchy_level(inst: str, root_inst: str) -> int:
    """Compute hierarchy depth as DC prints it.

    DC's report_area -hierarchy prints the root (top design instance) and then
    top-level instances without a leading "top_module/" prefix.

    Examples:
      root: top_module                  -> level 0
      top child: u_processing            -> level 1
      grandchild: u_processing/u_fetcher -> level 2
    """

    if inst == root_inst:
        return 0
    if "/" in inst:
        return 1 + inst.count("/")
    return 1


def is_clock_gate_row(row: AreaRow) -> bool:
    # Heuristic: clock-gating cells are reported as pseudo-designs.
    if row.design.startswith("SNPS_CLOCK_GATE"):
        return True
    if "/clk_gate" in row.inst:
        return True
    return False


def _is_float(token: str) -> bool:
    try:
        float(token)
        return True
    except ValueError:
        return False


def parse_area_hierarchy(lines: Iterable[str]) -> List[AreaRow]:
    in_section = False
    rows: List[AreaRow] = []

    for raw in lines:
        line = raw.rstrip("\n")

        if not in_section:
            if line.strip() == "Hierarchical area distribution":
                in_section = True
            continue

        # Skip header/separators until we hit the table data.
        if not line.strip():
            continue
        if line.startswith("-") or line.strip().startswith("Global cell area") or line.strip().startswith("Hierarchical cell"):
            continue

        # Data lines look like:
        # u_processing 5961.3391 89.1 558.1807 1413.8809 0.0000 processing_module_...
        parts = line.split()
        if len(parts) < 7:
            continue

        # Defensive check: numeric columns must be present.
        if not (_is_float(parts[1]) and _is_float(parts[2]) and _is_float(parts[3]) and _is_float(parts[4]) and _is_float(parts[5])):
            continue

        inst = parts[0]
        total = float(parts[1])
        percent = float(parts[2])
        comb = float(parts[3])
        noncomb = float(parts[4])
        black = float(parts[5])
        design = " ".join(parts[6:])

        rows.append(
            AreaRow(
                inst=inst,
                total=total,
                percent=percent,
                comb=comb,
                noncomb=noncomb,
                black=black,
                design=design,
            )
        )

    if not rows:
        raise RuntimeError("No hierarchical area rows parsed. Is this a report_area -hierarchy report?")

    return rows


def write_tsv(path: Path, rows: List[AreaRow]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as f:
        f.write("inst\ttotal\tpercent\tcomb\tnoncomb\tblack\tdesign\n")
        for r in rows:
            f.write(
                f"{r.inst}\t{r.total:.4f}\t{r.percent:.2f}\t{r.comb:.4f}\t{r.noncomb:.4f}\t{r.black:.4f}\t{r.design}\n"
            )


def write_pretty_rpt(path: Path, title: str, rows: List[AreaRow]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    # Fixed-width columns for readability in plain text.
    with path.open("w", encoding="utf-8") as f:
        f.write(title + "\n")
        f.write("=" * len(title) + "\n\n")
        f.write(f"{'Instance':45} {'Total':>12} {'%':>7} {'Comb':>12} {'Noncomb':>12}  Design\n")
        f.write(f"{'-'*45} {'-'*12} {'-'*7} {'-'*12} {'-'*12}  {'-'*20}\n")
        for r in rows:
            f.write(
                f"{r.inst[:45]:45} {r.total:12.2f} {r.percent:7.2f} {r.comb:12.2f} {r.noncomb:12.2f}  {r.design}\n"
            )


def _md_table(rows: List[AreaRow], limit: Optional[int] = None) -> str:
    if limit is not None:
        rows = rows[:limit]

    lines = [
        "| Instanz | Total cell area | % | Comb | Noncomb | Design |",
        "|---|---:|---:|---:|---:|---|",
    ]

    for r in rows:
        lines.append(
            "| "
            + " | ".join(
                [
                    r.inst,
                    f"{r.total:.2f}",
                    f"{r.percent:.2f}",
                    f"{r.comb:.2f}",
                    f"{r.noncomb:.2f}",
                    r.design,
                ]
            )
            + " |"
        )

    return "\n".join(lines)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--in", dest="in_path", required=True, help="Input area_hier.rpt")
    ap.add_argument("--outdir", required=True, help="Output directory (reports)")
    ap.add_argument("--top", type=int, default=30, help="How many entries to show for level-2 top list")
    args = ap.parse_args()

    in_path = Path(args.in_path)
    outdir = Path(args.outdir)

    rows = parse_area_hierarchy(in_path.read_text(encoding="utf-8", errors="replace").splitlines(True))

    root_inst = rows[0].inst

    def lvl(r: AreaRow) -> int:
        return hierarchy_level(r.inst, root_inst)

    lvl0 = [r for r in rows if lvl(r) == 0]
    lvl1_all = [r for r in rows if lvl(r) == 1]
    lvl2_all = [r for r in rows if lvl(r) == 2]

    # Filter out clock-gate leaf entries for "module cost" tables.
    lvl1 = sorted([r for r in lvl1_all if not is_clock_gate_row(r)], key=lambda r: r.total, reverse=True)
    lvl2 = sorted([r for r in lvl2_all if not is_clock_gate_row(r)], key=lambda r: r.total, reverse=True)

    # TSV exports
    write_tsv(outdir / "area_level1.tsv", lvl1)
    write_tsv(outdir / "area_level2.tsv", lvl2)

    # User-friendly plain-text reports (so they can open like the other .rpt files)
    write_pretty_rpt(
        outdir / "area_hier_lvl1.rpt",
        "Area by module (level 1) - sorted by area",
        lvl1,
    )
    write_pretty_rpt(
        outdir / "area_hier_lvl2.rpt",
        "Area by module (level 2) - sorted by area",
        lvl2,
    )

    # Markdown summary
    top = lvl0[0] if lvl0 else None
    md_lines: List[str] = []
    md_lines.append("# Area Summary (DC report_area -hierarchy)\n")
    md_lines.append(f"Source: {in_path.name}\n")
    if top is not None:
        md_lines.append(f"Top design: **{top.inst}**  | Total cell area: **{top.total:.2f}**\n")

    md_lines.append("## Level 1 (Top-Module Children)\n")
    md_lines.append(_md_table(lvl1, limit=None))

    md_lines.append("\n## Level 2 (Top {0} by Area)\n".format(args.top))
    md_lines.append(_md_table(lvl2, limit=args.top))

    out_md = outdir / "area_summary.md"
    out_md.write_text("\n".join(md_lines) + "\n", encoding="utf-8")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
