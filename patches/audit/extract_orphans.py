#!/usr/bin/env python3
"""
Extract orphan byte regions from ffvclean-wip.sfc as .ips patches.

These are hand edits that exist in the ROM but aren't explained by any
.ips patch in the collection. Capturing them as .ips files preserves
the custom work for the v2.1 modular rebuild.

Output: patches/audit/orphan_snapshots/*.ips
"""

import csv
import os
from pathlib import Path

# IPS format constants
IPS_HEADER = b'PATCH'
IPS_EOF = b'EOF'

def write_ips(records: list[tuple[int, bytes]], out_path: Path) -> int:
    """
    Write an IPS patch from a list of (offset, data) records.
    Returns total bytes written.
    """
    with open(out_path, 'wb') as f:
        f.write(IPS_HEADER)
        total = 0
        for offset, data in records:
            if len(data) == 0:
                continue
            # IPS uses 3-byte offset, 2-byte length
            f.write(offset.to_bytes(3, 'big'))
            f.write(len(data).to_bytes(2, 'big'))
            f.write(data)
            total += len(data)
        f.write(IPS_EOF)
    return total


def main():
    base_dir = Path(__file__).parent.parent.parent  # crawler/
    rom_path = base_dir / 'patches' / 'ffvclean-wip.sfc'
    csv_path = base_dir / 'patches' / 'audit' / 'orphan_regions.csv'
    out_dir = base_dir / 'patches' / 'audit' / 'orphan_snapshots'
    out_dir.mkdir(exist_ok=True)

    # Load the ROM
    with open(rom_path, 'rb') as f:
        rom = f.read()
    print(f"Loaded ROM: {len(rom):,} bytes")

    # Parse CSV for orphan regions (orphan > 0)
    orphan_regions = []
    with open(csv_path, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            orphan_count = int(row['orphan'])
            if orphan_count > 0:
                start = int(row['start'], 16)
                end = int(row['end'], 16)
                annotation = row.get('annotation', '').strip()
                orphan_regions.append({
                    'start': start,
                    'end': end,
                    'span': end - start,
                    'orphan': orphan_count,
                    'annotation': annotation,
                    'area': row.get('area', 'rom'),
                })

    print(f"Found {len(orphan_regions)} regions with orphan bytes")
    print(f"Total orphan bytes: {sum(r['orphan'] for r in orphan_regions):,}")

    # Categorize regions for named .ips files
    categories = {
        'map_sprites': [],      # Map Sprite Graphics
        'battle_palette': [],   # Battle Character Palette + unnamed palette area
        'npc_properties': [],   # NPC Properties
        'monster_props': [],    # Monster Properties
        'custom_asm': [],       # Code regions (bank $00-$05)
        'misc': [],             # Everything else
    }

    for r in orphan_regions:
        start = r['start']
        ann = r['annotation'].lower()

        if 'map sprite' in ann:
            categories['map_sprites'].append(r)
        elif 'battle character palette' in ann or (0x14A000 <= start < 0x150000):
            categories['battle_palette'].append(r)
        elif 'npc properties' in ann:
            categories['npc_properties'].append(r)
        elif 'monster properties' in ann:
            categories['monster_props'].append(r)
        elif start < 0x060000:  # Banks $00-$05 are code
            categories['custom_asm'].append(r)
        else:
            categories['misc'].append(r)

    # Generate .ips files
    summary = []

    for cat_name, regions in categories.items():
        if not regions:
            continue

        records = []
        for r in regions:
            start = r['start']
            end = r['end']
            data = rom[start:end]
            records.append((start, data))

        # Sort by offset for clean IPS structure
        records.sort(key=lambda x: x[0])

        out_path = out_dir / f'orphan_{cat_name}.ips'
        total_bytes = write_ips(records, out_path)

        orphan_sum = sum(r['orphan'] for r in regions)
        summary.append({
            'name': cat_name,
            'regions': len(regions),
            'orphan_bytes': orphan_sum,
            'total_span': sum(r['span'] for r in regions),
            'path': out_path.name,
        })
        print(f"  {cat_name}: {len(regions)} regions, {orphan_sum} orphan bytes -> {out_path.name}")

    # Write summary manifest
    manifest_path = out_dir / 'MANIFEST.md'
    with open(manifest_path, 'w', encoding='utf-8') as f:
        f.write("# Orphan Byte Snapshots\n\n")
        f.write("Extracted from `ffvclean-wip.sfc` — hand edits not explained by any .ips patch.\n\n")
        f.write("These are the ancestral 'bricks' for FFV Clean v2.1 modular rebuild.\n\n")
        f.write("| Patch | Regions | Orphan Bytes | Description |\n")
        f.write("|-------|---------|--------------|-------------|\n")

        descriptions = {
            'map_sprites': 'Custom field/map sprite graphics',
            'battle_palette': 'Battle character palette edits',
            'npc_properties': 'NPC property table tweaks',
            'monster_props': 'Monster property table edits',
            'custom_asm': 'Custom ASM code (banks $00-$05)',
            'misc': 'Miscellaneous regions',
        }

        for s in summary:
            desc = descriptions.get(s['name'], '')
            f.write(f"| `{s['path']}` | {s['regions']} | {s['orphan_bytes']:,} | {desc} |\n")

        f.write(f"\n**Total:** {sum(s['orphan_bytes'] for s in summary):,} orphan bytes in {sum(s['regions'] for s in summary)} regions\n")
        f.write("\n## Usage\n\n")
        f.write("Apply these to a clean RPGe ROM to restore the hand-edited regions:\n\n")
        f.write("```bash\n")
        f.write("# Using flips or similar IPS tool\n")
        f.write("flips --apply orphan_map_sprites.ips base.sfc output.sfc\n")
        f.write("```\n")
        f.write("\n## Region Details\n\n")

        for cat_name, regions in categories.items():
            if not regions:
                continue
            f.write(f"### {cat_name}\n\n")
            for r in sorted(regions, key=lambda x: -x['orphan']):
                ann = r['annotation'] or '(unnamed)'
                f.write(f"- `0x{r['start']:06X}` - `0x{r['end']:06X}`: {r['orphan']} orphan bytes — {ann}\n")
            f.write("\n")

    print(f"\nManifest written to: {manifest_path}")
    print(f"Done! {len(summary)} .ips files created in {out_dir}")


if __name__ == '__main__':
    main()
