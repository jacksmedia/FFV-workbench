#!/usr/bin/env python3
"""
Compare FFV Clean v2.1 patch against the orphan byte snapshots.
Shows which orphan regions are covered, missing, or partially present.
"""

import csv
from pathlib import Path


def parse_ips(path: Path) -> list[tuple[int, int, bytes]]:
    """Parse an IPS file into a list of (offset, length, data) records."""
    with open(path, 'rb') as f:
        data = f.read()

    if data[:5] != b'PATCH':
        raise ValueError(f"Not an IPS file: {path}")

    records = []
    pos = 5
    while pos < len(data) - 3:
        if data[pos:pos+3] == b'EOF':
            break
        offset = int.from_bytes(data[pos:pos+3], 'big')
        length = int.from_bytes(data[pos+3:pos+5], 'big')
        pos += 5
        if length == 0:
            # RLE record
            rle_len = int.from_bytes(data[pos:pos+2], 'big')
            rle_byte = data[pos+2:pos+3]
            records.append((offset, rle_len, rle_byte * rle_len))
            pos += 3
        else:
            records.append((offset, length, data[pos:pos+length]))
            pos += length

    return records


def ranges_overlap(a_start, a_end, b_start, b_end):
    """Check if two ranges overlap."""
    return a_start < b_end and b_start < a_end


def main():
    base_dir = Path(__file__).parent.parent.parent
    v21_path = base_dir / 'FFV Clean v21 + Serity\'s New Equip Icons.ips'
    csv_path = base_dir / 'patches' / 'audit' / 'orphan_regions.csv'

    # Parse v2.1 patch
    v21_records = parse_ips(v21_path)
    print(f"v2.1 patch: {len(v21_records)} records, {sum(r[1] for r in v21_records):,} total bytes")
    print()

    # Build coverage map from v2.1
    v21_coverage = set()
    for offset, length, _ in v21_records:
        for addr in range(offset, offset + length):
            v21_coverage.add(addr)

    # Load orphan regions
    orphan_regions = []
    with open(csv_path, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            orphan_count = int(row['orphan'])
            if orphan_count > 0:
                orphan_regions.append({
                    'start': int(row['start'], 16),
                    'end': int(row['end'], 16),
                    'orphan': orphan_count,
                    'annotation': row.get('annotation', '').strip() or '(code)',
                })

    # Categorize each orphan region
    covered = []
    partial = []
    missing = []

    for r in orphan_regions:
        region_addrs = set(range(r['start'], r['end']))
        overlap = region_addrs & v21_coverage
        coverage_pct = len(overlap) / len(region_addrs) * 100 if region_addrs else 0

        if coverage_pct >= 95:
            covered.append((r, coverage_pct))
        elif coverage_pct > 0:
            partial.append((r, coverage_pct))
        else:
            missing.append((r, 0))

    # Report
    print("=" * 70)
    print("ORPHAN REGIONS FULLY COVERED BY v2.1 (>= 95%)")
    print("=" * 70)
    if covered:
        for r, pct in sorted(covered, key=lambda x: -x[0]['orphan']):
            print(f"  0x{r['start']:06X}-0x{r['end']:06X}: {r['orphan']:3d} bytes — {r['annotation']}")
        print(f"\n  Total: {sum(r['orphan'] for r, _ in covered)} orphan bytes in {len(covered)} regions")
    else:
        print("  (none)")

    print()
    print("=" * 70)
    print("ORPHAN REGIONS PARTIALLY COVERED BY v2.1")
    print("=" * 70)
    if partial:
        for r, pct in sorted(partial, key=lambda x: -x[0]['orphan']):
            print(f"  0x{r['start']:06X}-0x{r['end']:06X}: {r['orphan']:3d} bytes ({pct:5.1f}% covered) — {r['annotation']}")
        print(f"\n  Total: {sum(r['orphan'] for r, _ in partial)} orphan bytes in {len(partial)} regions")
    else:
        print("  (none)")

    print()
    print("=" * 70)
    print("ORPHAN REGIONS MISSING FROM v2.1 (0% coverage)")
    print("=" * 70)
    if missing:
        # Group by category
        by_cat = {}
        for r, _ in missing:
            ann = r['annotation']
            if 'Map Sprite' in ann:
                cat = 'Map Sprites'
            elif 'NPC' in ann:
                cat = 'NPC Properties'
            elif 'Monster' in ann:
                cat = 'Monster Properties'
            elif 'Battle' in ann or 'Palette' in ann:
                cat = 'Battle/Palette'
            elif r['start'] < 0x060000:
                cat = 'Custom ASM'
            else:
                cat = 'Other'
            by_cat.setdefault(cat, []).append(r)

        for cat in ['Map Sprites', 'Battle/Palette', 'Custom ASM', 'NPC Properties', 'Monster Properties', 'Other']:
            if cat not in by_cat:
                continue
            regions = by_cat[cat]
            total = sum(r['orphan'] for r in regions)
            print(f"\n  [{cat}] — {total} orphan bytes in {len(regions)} regions")
            for r in sorted(regions, key=lambda x: -x['orphan'])[:5]:
                print(f"    0x{r['start']:06X}-0x{r['end']:06X}: {r['orphan']:3d} bytes")
            if len(regions) > 5:
                print(f"    ... and {len(regions) - 5} more regions")

        print(f"\n  Total missing: {sum(r['orphan'] for r, _ in missing)} orphan bytes in {len(missing)} regions")
    else:
        print("  (none — all orphan regions are covered!)")

    # Summary
    print()
    print("=" * 70)
    print("SUMMARY")
    print("=" * 70)
    total_orphan = sum(r['orphan'] for r in orphan_regions)
    covered_bytes = sum(r['orphan'] for r, _ in covered)
    partial_bytes = sum(r['orphan'] for r, _ in partial)
    missing_bytes = sum(r['orphan'] for r, _ in missing)

    print(f"  Total orphan bytes in v2.09x:     {total_orphan:,}")
    print(f"  Covered by v2.1:                  {covered_bytes:,} ({covered_bytes/total_orphan*100:.1f}%)")
    print(f"  Partially covered:                {partial_bytes:,} ({partial_bytes/total_orphan*100:.1f}%)")
    print(f"  Missing from v2.1:                {missing_bytes:,} ({missing_bytes/total_orphan*100:.1f}%)")

    if missing_bytes > 0:
        print()
        print("  To incorporate missing orphans into v2.1, apply the orphan_*.ips")
        print("  bricks from patches/audit/orphan_snapshots/ after applying v2.1.")


if __name__ == '__main__':
    main()
