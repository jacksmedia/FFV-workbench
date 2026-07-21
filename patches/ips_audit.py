#!/usr/bin/env python3
"""
ips_audit.py -- Which .ips patches are already baked into ffvclean-wip.sfc?

Scans every .ips file under this directory (including inside .zip/.7z
archives), parses it, and checks whether the bytes it would write are
already present in the target ROM.

Key concepts
------------
* IPS format: "PATCH" magic, then records of (3-byte offset, 2-byte size,
  payload). size==0 means an RLE record: (2-byte run length, 1 fill byte).
  Terminated by "EOF", optionally followed by a 3-byte truncate length.

* Copier-header alignment: many older patches were made against ROMs with
  a 512-byte copier header, so every offset is shifted +512 relative to a
  headerless ROM. Each patch is scored at delta 0 and delta -512 and the
  better-fitting alignment is kept.

* Vacuous bytes: IPS records frequently contain bytes identical to the
  clean ROM (context around the real change). Those match the target
  whether or not the patch was applied, so they are excluded from the
  verdict. A byte is "informative" only if the patch value differs from
  the clean baseline (RPGe) value at that offset.

* Verdicts (over informative bytes only):
    APPLIED   >= 97% informative bytes match the patched value
    PARTIAL   >= 5% match (some of it survives, some was overwritten)
    ABSENT    <  5% match
    NO-OP     zero informative bytes -- the patch writes only clean-ROM
              values. True for the anti_*/uninstall patches: for those,
              "applied-looking" actually means the target patch is NOT
              installed.

Outputs (in ./audit/):
    PATCH_AUDIT.md     human-readable summary, grouped by verdict
    patch_audit.csv    one row per patch, machine-readable
    discrepancies.log  per-byte detail for every non-matching byte of
                       APPLIED/PARTIAL patches, with cross-references to
                       other patches that explain the observed value
"""

import csv
import hashlib
import io
import os
import shutil
import subprocess
import sys
import tempfile
import zipfile
from collections import defaultdict
from pathlib import Path

# --------------------------------------------------------------------------
# Configuration
# --------------------------------------------------------------------------
ROOT = Path(__file__).resolve().parent                    # .../crawler/patches
TARGET_ROM = ROOT / "ffvclean-wip.sfc"
BASELINE_ROM = ROOT.parent / "ff5 RPGe [crc32=17444605].sfc"
OUT_DIR = ROOT / "audit"

APPLIED_THRESHOLD = 0.97
PARTIAL_THRESHOLD = 0.05
EXPANDED_FILL = 0x00          # assumed clean value beyond baseline length
HEADER_DELTAS = (0, -512)     # headerless, and headered-patch-on-headerless-ROM
MAX_DETAIL_BYTES = 64         # per-patch cap on per-byte log lines
SEVEN_ZIP_EXTS = {".7z"}
ZIP_EXTS = {".zip"}


class IPSError(Exception):
    pass


def parse_ips(data: bytes):
    """Return (byte_map, truncate) where byte_map is {rom_offset: value}.

    Records are applied in file order, so overlapping records within one
    patch resolve the same way a real patcher would (last write wins).
    """
    if data[:5] != b"PATCH":
        raise IPSError("missing PATCH magic")
    pos = 5
    byte_map = {}
    truncate = None
    while True:
        chunk = data[pos:pos + 3]
        if len(chunk) < 3:
            raise IPSError("truncated before EOF marker")
        if chunk == b"EOF":
            remaining = len(data) - (pos + 3)
            if remaining == 0:
                break
            if remaining == 3:
                truncate = int.from_bytes(data[pos + 3:pos + 6], "big")
                break
            # Otherwise 0x454F46 is a legitimate offset; fall through.
        offset = int.from_bytes(chunk, "big")
        pos += 3
        size = int.from_bytes(data[pos:pos + 2], "big")
        pos += 2
        if size == 0:  # RLE record
            run = int.from_bytes(data[pos:pos + 2], "big")
            pos += 2
            fill = data[pos]
            pos += 1
            for i in range(run):
                byte_map[offset + i] = fill
        else:
            payload = data[pos:pos + size]
            if len(payload) < size:
                raise IPSError("record payload runs past end of file")
            pos += size
            for i, value in enumerate(payload):
                byte_map[offset + i] = value
    if not byte_map:
        raise IPSError("no records")
    return byte_map, truncate


def classify(byte_map, delta, target, baseline):
    """Score one patch at one alignment. Returns a stats dict.

    Per byte: vacuous (patch value == clean value), matched (target has the
    patched value), still_clean (target still has the clean value),
    conflict (target has some third value), out_of_range.
    """
    stats = {
        "total": len(byte_map), "vacuous": 0, "matched": 0,
        "still_clean": 0, "conflict": 0, "out_of_range": 0,
        "expanded": 0, "mismatches": [],
    }
    for off, patch_val in byte_map.items():
        t_off = off + delta
        if t_off < 0 or t_off >= len(target):
            stats["out_of_range"] += 1
            continue
        if t_off < len(baseline):
            base_val = baseline[t_off]
        else:
            base_val = EXPANDED_FILL
            stats["expanded"] += 1
        if patch_val == base_val:
            stats["vacuous"] += 1
            continue
        observed = target[t_off]
        if observed == patch_val:
            stats["matched"] += 1
        elif observed == base_val:
            stats["still_clean"] += 1
            stats["mismatches"].append((t_off, patch_val, observed, "still-clean"))
        else:
            stats["conflict"] += 1
            stats["mismatches"].append((t_off, patch_val, observed, "conflict"))
    informative = stats["matched"] + stats["still_clean"] + stats["conflict"]
    stats["informative"] = informative
    stats["informative_pct"] = stats["matched"] / informative if informative else None
    in_range = stats["total"] - stats["out_of_range"]
    stats["raw_pct"] = (
        (stats["matched"] + stats["vacuous"]) / in_range if in_range else None
    )
    return stats


def verdict_for(stats):
    if stats["informative"] == 0:
        if stats["total"] == stats["out_of_range"]:
            return "OUT-OF-RANGE"
        return "NO-OP"
    pct = stats["informative_pct"]
    if pct >= APPLIED_THRESHOLD:
        return "APPLIED"
    if pct >= PARTIAL_THRESHOLD:
        return "PARTIAL"
    return "ABSENT"


# --------------------------------------------------------------------------
# Collection: loose files + archives (zip natively, 7z via 7z.exe)
# --------------------------------------------------------------------------

def collect_ips(root: Path):
    """Yield (display_path, ips_bytes) for every .ips found."""
    for path in sorted(root.rglob("*.ips")):
        if OUT_DIR in path.parents:
            continue
        yield str(path.relative_to(root)), path.read_bytes()

    for path in sorted(root.rglob("*")):
        if not path.is_file() or OUT_DIR in path.parents:
            continue
        ext = path.suffix.lower()
        rel = str(path.relative_to(root))
        if ext in ZIP_EXTS:
            yield from ips_from_zip_bytes(path.read_bytes(), rel)
        elif ext in SEVEN_ZIP_EXTS:
            yield from ips_from_7z(path, rel)


def ips_from_zip_bytes(blob: bytes, label: str, depth: int = 0):
    if depth > 2:
        return
    try:
        zf = zipfile.ZipFile(io.BytesIO(blob))
    except zipfile.BadZipFile:
        print(f"  [warn] unreadable zip: {label}", file=sys.stderr)
        return
    with zf:
        for info in zf.infolist():
            name = info.filename
            lower = name.lower()
            if lower.endswith(".ips"):
                yield f"{label}::{name}", zf.read(info)
            elif lower.endswith(".zip"):  # one level of nesting happens
                yield from ips_from_zip_bytes(
                    zf.read(info), f"{label}::{name}", depth + 1
                )


def ips_from_7z(path: Path, label: str):
    exe = shutil.which("7z")
    if exe is None:
        print(f"  [warn] 7z.exe not found; skipping {label}", file=sys.stderr)
        return
    with tempfile.TemporaryDirectory() as tmp:
        result = subprocess.run(
            [exe, "e", "-y", f"-o{tmp}", str(path), "*.ips", "-r"],
            capture_output=True, text=True,
        )
        if result.returncode not in (0, 1):  # 1 = warnings only
            print(f"  [warn] 7z failed on {label}: {result.stderr.strip()}",
                  file=sys.stderr)
            return
        for f in sorted(Path(tmp).rglob("*.ips")):
            yield f"{label}::{f.name}", f.read_bytes()


# --------------------------------------------------------------------------
# Reporting helpers
# --------------------------------------------------------------------------

def fmt_pct(x):
    return "-" if x is None else f"{x * 100:.1f}%"


def is_uninstall(display_path: str) -> bool:
    name = display_path.lower()
    return "uninstall" in name or os.path.basename(name).startswith("anti_")


def load_patches(target, baseline, verbose=True):
    """Parse every .ips under ROOT, pick the best alignment for each, and
    dedupe by content hash. Returns (results, errors, n_seen).

    Shared by ips_audit.py (verdict report) and orphan_audit.py
    (unaccounted-byte triangulation).
    """
    results = []            # list of dicts, one per unique patch
    seen_hashes = {}        # md5 -> index into results
    errors = []
    n_seen = 0
    for display, blob in collect_ips(ROOT):
        n_seen += 1
        digest = hashlib.md5(blob).hexdigest()
        if digest in seen_hashes:
            results[seen_hashes[digest]]["duplicates"].append(display)
            continue
        try:
            byte_map, truncate = parse_ips(blob)
        except IPSError as exc:
            errors.append((display, str(exc)))
            continue
        scored = {d: classify(byte_map, d, target, baseline)
                  for d in HEADER_DELTAS}
        # prefer the alignment with the better informative match rate;
        # break ties toward delta 0
        def rank(d):
            s = scored[d]
            return (s["informative_pct"] or 0.0, s["raw_pct"] or 0.0, d == 0)
        delta = max(HEADER_DELTAS, key=rank)
        stats = scored[delta]
        seen_hashes[digest] = len(results)
        results.append({
            "path": display, "md5": digest, "delta": delta,
            "truncate": truncate, "stats": stats,
            "verdict": verdict_for(stats),
            "uninstall": is_uninstall(display),
            "byte_map": byte_map, "duplicates": [],
        })
    if verbose:
        print(f"scanned  : {n_seen} .ips files "
              f"({len(results)} unique, {n_seen - len(results) - len(errors)}"
              f" duplicates, {len(errors)} unparseable)")
    return results, errors, n_seen


def main():
    for f, what in ((TARGET_ROM, "target"), (BASELINE_ROM, "baseline")):
        if not f.is_file():
            sys.exit(f"error: {what} ROM not found: {f}")
    target = TARGET_ROM.read_bytes()
    baseline = BASELINE_ROM.read_bytes()
    print(f"target   : {TARGET_ROM.name} ({len(target):,} bytes)")
    print(f"baseline : {BASELINE_ROM.name} ({len(baseline):,} bytes)")

    results, errors, _ = load_patches(target, baseline)

    # ---- pass 2: cross-reference mismatched bytes against other patches ----
    # index: target offset -> [(result_idx, value written there)]
    offset_index = defaultdict(list)
    for idx, r in enumerate(results):
        for off, val in r["byte_map"].items():
            t_off = off + r["delta"]
            if 0 <= t_off < len(target):
                offset_index[t_off].append((idx, val))

    def explainers(t_off, observed, self_idx):
        names = []
        for idx, val in offset_index.get(t_off, ()):
            if idx != self_idx and val == observed:
                names.append(os.path.basename(results[idx]["path"]))
                if len(names) == 3:
                    break
        return names

    # ---- write outputs ----
    OUT_DIR.mkdir(exist_ok=True)
    write_csv(results, errors)
    write_markdown(results, errors, target, baseline)
    write_discrepancy_log(results, explainers)

    counts = defaultdict(int)
    for r in results:
        counts[r["verdict"]] += 1
    print("verdicts :", dict(sorted(counts.items())))
    print(f"reports  : {OUT_DIR / 'PATCH_AUDIT.md'}")


def write_csv(results, errors):
    with open(OUT_DIR / "patch_audit.csv", "w", newline="",
              encoding="utf-8-sig") as fh:
        w = csv.writer(fh)
        w.writerow(["path", "verdict", "informative_pct", "raw_pct",
                    "informative_bytes", "matched", "still_clean", "conflict",
                    "vacuous", "total_bytes", "out_of_range", "expanded_area",
                    "alignment_delta", "uninstall_patch", "md5",
                    "duplicate_of_paths"])
        for r in results:
            s = r["stats"]
            w.writerow([
                r["path"], r["verdict"], fmt_pct(s["informative_pct"]),
                fmt_pct(s["raw_pct"]), s["informative"], s["matched"],
                s["still_clean"], s["conflict"], s["vacuous"], s["total"],
                s["out_of_range"], s["expanded"], r["delta"],
                "yes" if r["uninstall"] else "",
                r["md5"], "; ".join(r["duplicates"]),
            ])
        for path, err in errors:
            w.writerow([path, "ERROR", "", "", "", "", "", "", "", "", "",
                        "", "", "", "", err])


def write_markdown(results, errors, target, baseline):
    groups = defaultdict(list)
    for r in results:
        groups[r["verdict"]].append(r)

    lines = [
        "# Patch audit: what is baked into ffvclean-wip.sfc?", "",
        f"- Target: `{TARGET_ROM.name}` ({len(target):,} bytes)",
        f"- Clean baseline: `{BASELINE_ROM.name}` ({len(baseline):,} bytes;"
        f" offsets beyond it assume 0x{EXPANDED_FILL:02X} expansion fill)",
        f"- Verdicts use *informative* bytes only (patch value != clean"
        f" value); APPLIED needs >= {APPLIED_THRESHOLD:.0%} of them present.",
        "- `delta` = alignment: -512 means the patch was made for a ROM"
        " with a copier header.",
        "- Uninstall/anti patches restore clean bytes, so they score NO-OP"
        " against the clean baseline by construction.", "",
    ]

    def table(rows):
        out = ["| patch | informative match | raw match | inf. bytes |"
               " delta | notes |",
               "|---|---|---|---|---|---|"]
        for r in sorted(rows, key=lambda r: -(r["stats"]["informative_pct"] or 0)):
            s = r["stats"]
            notes = []
            if r["uninstall"]:
                notes.append("uninstall")
            if s["expanded"]:
                notes.append(f"{s['expanded']}B in expanded area")
            if s["out_of_range"]:
                notes.append(f"{s['out_of_range']}B out of range")
            if r["duplicates"]:
                notes.append(f"{len(r['duplicates'])} duplicate copy(ies)")
            if r["truncate"] is not None:
                notes.append(f"truncate->{r['truncate']:#x}")
            out.append(
                f"| `{r['path']}` | {fmt_pct(s['informative_pct'])} |"
                f" {fmt_pct(s['raw_pct'])} | {s['informative']} |"
                f" {r['delta']} | {', '.join(notes)} |")
        return out

    order = [
        ("APPLIED", "Recipe ingredients (>= 97% of meaningful bytes present)"),
        ("PARTIAL", "Partially present (applied then partly overwritten, or"
                    " overlapping patches)"),
        ("ABSENT", "Not applied"),
        ("NO-OP", "No-op vs clean baseline (mostly uninstall/anti patches)"),
        ("OUT-OF-RANGE", "All bytes outside the target ROM"),
    ]
    for verdict, title in order:
        rows = groups.get(verdict, [])
        lines += [f"## {title} — {len(rows)}", ""]
        if rows:
            lines += table(rows) + [""]
    if errors:
        lines += [f"## Unparseable files — {len(errors)}", ""]
        lines += [f"- `{p}`: {e}" for p, e in errors] + [""]

    (OUT_DIR / "PATCH_AUDIT.md").write_text("\n".join(lines),
                                            encoding="utf-8-sig")


def write_discrepancy_log(results, explainers):
    with open(OUT_DIR / "discrepancies.log", "w", encoding="utf-8") as fh:
        fh.write("Per-byte mismatches for APPLIED and PARTIAL patches.\n"
                 "kind: still-clean = ROM has the pre-patch value;"
                 " conflict = ROM has a third value.\n"
                 "'explains' lists other patches that write exactly the"
                 " observed byte at that offset.\n\n")
        for idx, r in enumerate(results):
            if r["verdict"] not in ("APPLIED", "PARTIAL"):
                continue
            mism = r["stats"]["mismatches"]
            if not mism:
                continue
            s = r["stats"]
            fh.write(f"=== {r['path']} [{r['verdict']}, "
                     f"{fmt_pct(s['informative_pct'])} of "
                     f"{s['informative']} informative bytes, "
                     f"delta {r['delta']}] ===\n")
            for t_off, want, got, kind in mism[:MAX_DETAIL_BYTES]:
                who = explainers(t_off, got, idx)
                extra = f"  explains: {', '.join(who)}" if who else ""
                fh.write(f"  0x{t_off:06X}: expected {want:02X},"
                         f" found {got:02X} ({kind}){extra}\n")
            if len(mism) > MAX_DETAIL_BYTES:
                fh.write(f"  ... {len(mism) - MAX_DETAIL_BYTES} more"
                         f" mismatched bytes omitted\n")
            fh.write("\n")


if __name__ == "__main__":
    main()
