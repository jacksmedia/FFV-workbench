#!/usr/bin/env python3
"""
orphan_audit.py -- Which changed bytes in ffvclean-wip.sfc does NO patch
explain? (i.e. the hand edits: font tweaks, list edits, sprite touch-ups)

Triangulation
-------------
1. Diff the wip ROM against the clean RPGe baseline, byte by byte.
   (Beyond the baseline's 0x280000 bytes, "clean" is assumed 0x00 fill;
   that expanded area is reported separately as special-case territory.)
2. For every differing byte, ask the whole patch collection (reusing the
   ips_audit.py pipeline: same parsing, alignment, dedupe):
     ACCOUNTED   some patch writes exactly the observed value there
     TOUCHED     >=1 patch writes there, but none matches the observed
                 value -- a hand edit layered OVER patched territory,
                 or an unknown tool's output
     ORPHAN      no patch in the collection touches this offset at all --
                 pure hand edits
3. Unaccounted bytes (TOUCHED + ORPHAN) are grouped into regions and
   annotated with named ROM ranges from ff5u-sfc.json (HiROM: file
   offset = SNES address - 0xC00000).

Outputs (in ./audit/):
    ORPHAN_BYTES.md       summary + annotated region tables
    orphan_regions.csv    every unaccounted region, machine-readable
"""

import csv
import json
import sys
from bisect import bisect_right
from collections import Counter, defaultdict
from pathlib import Path

from ips_audit import (
    ROOT, TARGET_ROM, BASELINE_ROM, OUT_DIR, EXPANDED_FILL, load_patches,
)

ROM_MAP_JSON = ROOT.parent / "ff5u-sfc.json"
HIROM_BASE = 0xC00000
GAP_MERGE = 32            # unaccounted bytes closer than this join one region
GAP_MERGE_EXPANDED = 4096  # coarser grouping out in the expansion
MD_MAX_ROWS = 250          # per-table cap in the markdown (CSV is complete)
SAMPLE_LEN = 8

# byte states
SAME, ORPHAN, TOUCHED, ACCOUNTED = 0, 1, 2, 3
STATE_NAMES = {ORPHAN: "orphan", TOUCHED: "touched", ACCOUNTED: "accounted"}


def load_rom_map():
    """Named (start, end, name) file-offset intervals from ff5u-sfc.json."""
    intervals = []
    try:
        data = json.loads(ROM_MAP_JSON.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        print(f"  [warn] no ROM map annotations ({exc})", file=sys.stderr)
        return []

    def add(range_str, name):
        try:
            lo, hi = (int(x, 16) for x in range_str.split("-"))
        except ValueError:
            return
        intervals.append((lo - HIROM_BASE, hi - HIROM_BASE, name))

    for entry in data.get("assembly", {}).values():
        if isinstance(entry, dict) and isinstance(entry.get("range"), str):
            add(entry["range"], entry.get("name", "?"))
    for range_str in data.get("freeSpace", []):
        add(range_str, "(free space)")
    intervals.sort()
    return intervals


def annotate(intervals, starts, offset):
    """Name of the mapped range containing offset, or ''. """
    i = bisect_right(starts, offset) - 1
    while i >= 0:
        lo, hi, name = intervals[i]
        if lo <= offset < hi:
            return name
        # ranges can nest/overlap slightly; peek one earlier
        if offset >= hi and offset - hi > 0x10000:
            break
        i -= 1
    return ""


def build_regions(status, lo, hi, gap):
    """Contiguous runs of unaccounted (ORPHAN/TOUCHED) bytes in [lo, hi),
    merging runs separated by fewer than `gap` other bytes.
    Returns list of dicts with start/end/orphan/touched counts."""
    regions = []
    cur = None
    for t in range(lo, hi):
        s = status[t]
        if s not in (ORPHAN, TOUCHED):
            continue
        if cur is not None and t - cur["end"] < gap:
            cur["end"] = t + 1
        else:
            cur = {"start": t, "end": t + 1, ORPHAN: 0, TOUCHED: 0}
            regions.append(cur)
        cur[s] += 1
    return regions


def main():
    target = TARGET_ROM.read_bytes()
    baseline = BASELINE_ROM.read_bytes()
    base_len = len(baseline)
    print(f"target   : {TARGET_ROM.name} ({len(target):,} bytes)")
    print(f"baseline : {BASELINE_ROM.name} ({base_len:,} bytes)")

    patches, _errors, _ = load_patches(target, baseline)

    # ---- pass 1: raw diff vs clean ----
    status = bytearray(len(target))
    n_diff_rom = n_diff_exp = 0
    for t in range(len(target)):
        clean = baseline[t] if t < base_len else EXPANDED_FILL
        if target[t] != clean:
            status[t] = ORPHAN
            if t < base_len:
                n_diff_rom += 1
            else:
                n_diff_exp += 1
    print(f"diff     : {n_diff_rom:,} bytes differ in the original ROM area,"
          f" {n_diff_exp:,} in the expansion")

    # ---- pass 2: let every patch claim the bytes it explains ----
    claims = Counter()   # patch path -> number of diff bytes it accounts for
    for r in patches:
        delta, name = r["delta"], r["path"]
        for off, val in r["byte_map"].items():
            t = off + delta
            if 0 <= t < len(target) and status[t] != SAME:
                if val == target[t]:
                    status[t] = ACCOUNTED
                    claims[name] += 1
                elif status[t] == ORPHAN:
                    status[t] = TOUCHED

    tally = Counter()
    for t in range(len(target)):
        if status[t] != SAME:
            tally[(STATE_NAMES[status[t]], t >= base_len)] += 1

    # ---- pass 3: group unaccounted bytes into regions, annotate ----
    rom_regions = build_regions(status, 0, base_len, GAP_MERGE)
    exp_regions = build_regions(status, base_len, len(target),
                                GAP_MERGE_EXPANDED)
    intervals = load_rom_map()
    starts = [iv[0] for iv in intervals]

    # ---- pass 4: for TOUCHED bytes, name the patches that wrote there ----
    rom_starts = [reg["start"] for reg in rom_regions]
    exp_starts = [reg["start"] for reg in exp_regions]
    touchers = defaultdict(Counter)   # keyed by ("rom"|"exp", region index)
    for r in patches:
        delta = r["delta"]
        short = Path(r["path"]).name
        for off in r["byte_map"]:
            t = off + delta
            if not (0 <= t < len(target)) or status[t] != TOUCHED:
                continue
            area, starts_, regs = (
                ("rom", rom_starts, rom_regions) if t < base_len
                else ("exp", exp_starts, exp_regions))
            i = bisect_right(starts_, t) - 1
            if i >= 0 and t < regs[i]["end"]:
                touchers[(area, i)][short] += 1

    # ---- outputs ----
    OUT_DIR.mkdir(exist_ok=True)
    write_reports(target, base_len, tally, claims,
                  rom_regions, exp_regions, touchers, intervals, starts)

    unacc_rom = sum(reg[ORPHAN] + reg[TOUCHED] for reg in rom_regions)
    unacc_exp = sum(reg[ORPHAN] + reg[TOUCHED] for reg in exp_regions)
    print(f"verdict  : ROM area: {unacc_rom:,} unaccounted bytes in"
          f" {len(rom_regions)} regions; expansion: {unacc_exp:,} in"
          f" {len(exp_regions)} regions")
    print(f"reports  : {OUT_DIR / 'ORPHAN_BYTES.md'}")


def region_row(reg, target, intervals, starts, toucher_counter=None):
    start, end = reg["start"], reg["end"]
    sample = target[start:start + SAMPLE_LEN].hex(" ")
    names = ""
    if toucher_counter:
        names = ", ".join(n for n, _ in toucher_counter.most_common(3))
    return {
        "start": f"0x{start:06X}", "end": f"0x{end:06X}",
        "span": end - start, "orphan": reg[ORPHAN], "touched": reg[TOUCHED],
        "annotation": annotate(intervals, starts, start),
        "touching_patches": names, "first_bytes": sample,
    }


def write_reports(target, base_len, tally, claims, rom_regions, exp_regions,
                  touchers, intervals, starts):
    rows_rom = [region_row(reg, target, intervals, starts,
                           touchers.get(("rom", i)))
                for i, reg in enumerate(rom_regions)]
    rows_exp = [region_row(reg, target, intervals, starts,
                           touchers.get(("exp", i)))
                for i, reg in enumerate(exp_regions)]

    cols = ["start", "end", "span", "orphan", "touched", "annotation",
            "touching_patches", "first_bytes"]
    with open(OUT_DIR / "orphan_regions.csv", "w", newline="",
              encoding="utf-8-sig") as fh:
        w = csv.DictWriter(fh, fieldnames=["area"] + cols)
        w.writeheader()
        for row in rows_rom:
            w.writerow({"area": "rom", **row})
        for row in rows_exp:
            w.writerow({"area": "expansion", **row})

    def md_table(rows):
        out = ["| " + " | ".join(cols) + " |",
               "|" + "---|" * len(cols)]
        shown = sorted(rows, key=lambda r: -(r["orphan"] + r["touched"]))
        for row in shown[:MD_MAX_ROWS]:
            out.append("| " + " | ".join(
                f"`{row[c]}`" if c in ("start", "end", "first_bytes")
                else str(row[c]) for c in cols) + " |")
        if len(rows) > MD_MAX_ROWS:
            out.append(f"| ... {len(rows) - MD_MAX_ROWS} smaller regions"
                       f" in orphan_regions.csv |" + " |" * (len(cols) - 1))
        return out

    def t(state, expanded):
        return tally.get((state, expanded), 0)

    lines = [
        "# Unaccounted bytes: hand edits in ffvclean-wip.sfc", "",
        f"Every byte where `{TARGET_ROM.name}` differs from clean"
        f" `{BASELINE_ROM.name}`, classified by whether any .ips in the"
        " collection explains it.", "",
        "| | original ROM (< 0x280000) | expansion (>= 0x280000) |",
        "|---|---|---|",
        f"| accounted (patch explains it) | {t('accounted', False):,}"
        f" | {t('accounted', True):,} |",
        f"| touched-mismatch (patched area, edited further) |"
        f" {t('touched', False):,} | {t('touched', True):,} |",
        f"| orphan (no patch involved = hand edit) |"
        f" {t('orphan', False):,} | {t('orphan', True):,} |",
        "",
        "## Top accounting patches (cross-check of the recipe)", "",
        "| patch | diff bytes it explains |", "|---|---|",
    ]
    for name, n in claims.most_common(25):
        lines.append(f"| `{name}` | {n:,} |")
    lines += [
        "",
        f"## Unaccounted regions, original ROM area —"
        f" {len(rom_regions)} regions",
        "",
        "Sorted by unaccounted byte count; annotation = named range from"
        " ff5u-sfc.json containing the region start.", "",
    ]
    lines += md_table(rows_rom)
    lines += [
        "",
        f"## Unaccounted regions, expansion territory —"
        f" {len(exp_regions)} regions",
        "",
        "Special-case area past the RPGe ROM end (0x280000): clean value"
        f" assumed 0x{EXPANDED_FILL:02X}. Expect DressCode-adjacent space"
        " and hand-imported sprite art here.", "",
    ]
    lines += md_table(rows_exp)
    (OUT_DIR / "ORPHAN_BYTES.md").write_text("\n".join(lines) + "\n",
                                             encoding="utf-8-sig")


if __name__ == "__main__":
    main()
