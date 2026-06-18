#!/usr/bin/env python3
"""
rom_compare.py — Comprehensive 3-ROM top-down comparison for FFV romhacking notes.

Compares:
  J    = _Final Fantasy V J (CRC32 = C1BC267D).sfc   — 1992 original, 2MB, banks $C0-$DF
  RPGe = _FFV RPGe (CRC32 = 17444605).sfc            — 1998 fan translation, 2.5MB, banks $C0-$E7
  ff5c = ff5c.sfc                                     — FFV Clean hack project, 4MB, banks $C0-$FF

HiROM mapping: bank $C0 = file $000000, bank $C1 = file $010000, etc.
File offset = (SNES_bank - 0xC0) * 0x10000 + low_offset

Outputs: rom_comparison_notes.md
"""

import os
import sys
import binascii
from pathlib import Path
from collections import Counter

SCRIPT_DIR = Path(__file__).parent

ROMS = {
    'J':    SCRIPT_DIR / "_Final Fantasy V J (CRC32 = C1BC267D).sfc",
    'RPGe': SCRIPT_DIR / "_FFV RPGe (CRC32 = 17444605).sfc",
    'ff5c': SCRIPT_DIR / "ff5c.sfc",
}
ROM_LABELS = {
    'J':    "FFV-J 1992 (original Japanese, 2MB)",
    'RPGe': "FFV-RPGe 1998 (English fan translation, 2.5MB)",
    'ff5c': "ff5c — FFV Clean hack project (4MB)",
}
BANK = 0x10000

# Known bank-level annotations (file_offset -> description)
# File offset = (SNES_bank - 0xC0) * 0x10000
BANK_NOTES = {
    0x000000: "main init, reset vectors, battle engine core, OAM/sprite routines",
    0x010000: "battle/menu routines, palette loader ($C1/7CB5 KO palette fix site)",
    0x020000: "battle AI, opcodes (c2battle disasm)",
    0x030000: "code (Lenophis disasm)",
    0x040000: "code (Lenophis disasm)",
    0x050000: "code",
    0x060000: "code",
    0x070000: "code / data",
    0x080000: "event scripts — start at $C849DC (file $0849DC)",
    0x090000: "event scripts tail — freespace at $C9FF9C (file $09FF9C, v0.9 patch site)",
    0x0A0000: "data",
    0x0B0000: "data",
    0x0C0000: "data",
    0x0D0000: "data",
    0x0E0000: "data",
    0x0F0000: "data",
    0x100000: "battle data — formations $D03000, random groups $D06800, event groups $D07800, map groups $D08000",
    0x110000: "data — font tiles at file $11F000 (2bpp, 256 tiles), font palette at $F827",
    0x120000: "data",
    0x130000: "data",
    0x140000: "data",
    0x150000: "data",
    0x160000: "data",
    0x170000: "data",
    0x180000: "data",
    0x190000: "data",
    0x1A0000: "data",
    0x1B0000: "data",
    0x1C0000: "data",
    0x1D0000: "data",
    0x1E0000: "data",
    0x1F0000: "data",
    0x200000: "monster/enemy data — monster names at $E00050 (384×10 bytes, DTE encoded)",
    0x210000: "data (Lenophis E0 disasm area)",
    0x220000: "data",
    0x230000: "data",
    0x240000: "data",
    0x250000: "data",
    0x260000: "data",
    0x270000: "data",
    # Expansion banks
    0x280000: "[RPGe expansion] — $E8 bank, added to accommodate English text/code",
    0x290000: "[RPGe expansion] — $E9",
    0x2A0000: "[RPGe expansion] — $EA",
    0x2B0000: "[RPGe expansion] — $EB",
    0x2C0000: "[RPGe expansion] — $EC",
    0x2D0000: "[RPGe expansion] — $ED",
    0x2E0000: "[RPGe expansion] — $EE",
    0x2F0000: "[RPGe expansion] — $EF",
    0x300000: "[ff5c expansion] — $F0, Dress Code / QoL patches extended region",
    0x310000: "[ff5c expansion] — $F1",
    0x320000: "[ff5c expansion] — $F2",
    0x330000: "[ff5c expansion] — $F3",
    0x340000: "[ff5c expansion] — $F4",
    0x350000: "[ff5c expansion] — $F5",
    0x360000: "[ff5c expansion] — $F6",
    0x370000: "[ff5c expansion] — $F7",
    0x380000: "[ff5c expansion] — $F8",
    0x390000: "[ff5c expansion] — $F9",
    0x3A0000: "[ff5c expansion] — $FA",
    0x3B0000: "[ff5c expansion] — $FB",
    0x3C0000: "[ff5c expansion] — $FC",
    0x3D0000: "[ff5c expansion] — $FD",
    0x3E0000: "[ff5c expansion] — $FE",
    0x3F0000: "[ff5c expansion] — $FF",
}

# Specific sub-regions of particular interest (file_offset, size, label)
POINTS_OF_INTEREST = [
    (0x000000, 0x010,  "SNES header area start"),
    (0x00FFB0, 0x050,  "SNES internal header ($C0:FFB0)"),
    (0x017CB5, 0x040,  "Palette loader routine $C1/7CB5 (KO palette fix target)"),
    (0x017CD9, 0x005,  "v0.9 patch hook site (5 bytes: AND#$1C / LSR / STA$9A)"),
    (0x0849DC, 0x010,  "Event scripts start $C849DC"),
    (0x09FF9C, 0x02C,  "v0.9 patch freespace $C9FF9C (44 bytes)"),
    (0x103000, 0x010,  "Battle formations start $D03000"),
    (0x106800, 0x010,  "Random battle groups start $D06800"),
    (0x107800, 0x010,  "Event battle groups start $D07800"),
    (0x108000, 0x010,  "Map battle group assignments start $D08000"),
    (0x100050, 0x010,  "Battle data at $D00050 (for reference)"),
    (0x200050, 0x010,  "Monster names start $E00050"),
    (0x11F000, 0x010,  "Font tiles start (file $11F000, 2bpp)"),
    (0x00F827, 0x008,  "Font palette $F827 (4 × BGR555)"),
]


def load_rom(path):
    with open(path, 'rb') as f:
        return bytearray(f.read())


def crc32_hex(data):
    return f"{binascii.crc32(data) & 0xFFFFFFFF:08X}"


def parse_snes_header(rom, label):
    """Parse SNES internal header at file $FFB0 (HiROM location)."""
    if len(rom) < 0x10000:
        return {}
    hdr_base = 0xFFB0
    try:
        title_raw = rom[hdr_base + 0x10: hdr_base + 0x25]
        title = ''.join(chr(b) if 0x20 <= b < 0x7F else '.' for b in title_raw)
        map_mode  = rom[hdr_base + 0x25]
        cart_type = rom[hdr_base + 0x26]
        rom_size  = rom[hdr_base + 0x27]
        ram_size  = rom[hdr_base + 0x28]
        country   = rom[hdr_base + 0x29]
        dev_id    = rom[hdr_base + 0x2A]
        version   = rom[hdr_base + 0x2B]
        complement= (rom[hdr_base + 0x2C] | rom[hdr_base + 0x2D] << 8)
        checksum  = (rom[hdr_base + 0x2E] | rom[hdr_base + 0x2F] << 8)
        reset_vec = (rom[hdr_base + 0x4C] | rom[hdr_base + 0x4D] << 8)  # $FFFC
        return {
            'title': title.strip(),
            'map_mode': map_mode,
            'cart_type': cart_type,
            'rom_size': rom_size,
            'ram_size': ram_size,
            'country': country,
            'dev_id': dev_id,
            'version': version,
            'complement': complement,
            'checksum': checksum,
            'reset_vec': reset_vec,
        }
    except IndexError:
        return {}


def count_diffs(a, b, length):
    """Count differing bytes between a[0:length] and b[0:length]."""
    diffs = 0
    for i in range(min(len(a), len(b), length)):
        if a[i] != b[i]:
            diffs += 1
    return diffs


def find_changed_offsets(a, b, start, length, limit=8):
    """Return up to `limit` file offsets where a and b differ in [start, start+length)."""
    offsets = []
    end = min(len(a), len(b), start + length)
    for i in range(start, end):
        if a[i] != b[i]:
            offsets.append(i)
            if len(offsets) >= limit:
                break
    return offsets


def analyze_fill(data, start, length):
    """Return dominant byte and fill percentage for a region."""
    region = data[start:start+length]
    if not region:
        return None, 0.0
    c = Counter(region)
    dominant_byte, dominant_count = c.most_common(1)[0]
    fill_pct = dominant_count / len(region) * 100
    return dominant_byte, fill_pct


def format_hex_preview(data, offset, count=16):
    """Return hex preview string of `count` bytes at `offset`."""
    chunk = data[offset:offset+count]
    return ' '.join(f'{b:02X}' for b in chunk)


def map_mode_str(mm):
    modes = {0x20: "LoROM", 0x21: "HiROM", 0x22: "LoROM+SA1", 0x23: "LoROM+SA1",
             0x25: "ExHiROM", 0x30: "LoROM+FastROM", 0x31: "HiROM+FastROM",
             0x35: "ExHiROM+FastROM"}
    return modes.get(mm, f"unknown(${mm:02X})")


def country_str(c):
    countries = {0: "Japan", 1: "USA", 2: "Europe", 3: "Sweden/Scandinavia",
                 4: "Finland", 5: "Denmark", 6: "France", 7: "Netherlands",
                 8: "Spain", 9: "Germany", 10: "Italy", 11: "China/HK", 12: "Indonesia",
                 13: "Korea", 15: "Canada", 16: "Brazil", 17: "Australia"}
    return countries.get(c, f"${c:02X}")


def main():
    out_path = SCRIPT_DIR / "rom_comparison_notes.md"
    lines = []
    w = lines.append

    print("Loading ROMs...")
    roms = {}
    for key, path in ROMS.items():
        if not path.exists():
            print(f"  ERROR: {path} not found!")
            sys.exit(1)
        roms[key] = load_rom(path)
        print(f"  Loaded {key}: {len(roms[key]):,} bytes")

    J, RPGe, ff5c = roms['J'], roms['RPGe'], roms['ff5c']

    w("# FFV ROM Comparison Notes")
    w("")
    w("Auto-generated by `rom_compare.py`. Covers all three ROMs used in the FFV Clean romhack project.")
    w("")

    # ──────────────────────────────────────────────────────────────────────────
    w("## 1. ROM Summary")
    w("")
    w("| ROM | File | Size | Banks | CRC32 |")
    w("|-----|------|------|-------|-------|")
    for key, path in ROMS.items():
        data = roms[key]
        sz = len(data)
        banks = sz // BANK
        lo_bank = 0xC0
        hi_bank = lo_bank + banks - 1
        crc = crc32_hex(data)
        w(f"| **{key}** | `{path.name}` | {sz:,} B ({sz//1024//1024}.{(sz//1024)%1024*10//1024}MB) | {banks} ($C0–${hi_bank:02X}) | `{crc}` |")
    w("")
    w("**ROM size hierarchy:** J (2MB) ⊂ RPGe (2.5MB) ⊂ ff5c (4MB)")
    w("")
    w("| Expansion step | Banks added | Size added | Purpose |")
    w("|----------------|------------|------------|---------|")
    w("| J → RPGe       | $E0–$E7 (8 banks) | +512KB | English text relocation, code expansion |")
    w("| RPGe → ff5c    | $E8–$FF (24 banks) | +1.5MB | Dress Code sprites, QoL patches, further expansion |")
    w("")

    # ──────────────────────────────────────────────────────────────────────────
    w("## 2. SNES Internal Headers")
    w("")
    w("HiROM header location: file offset `$00FFB0` (SNES `$C0:FFB0`).")
    w("")
    for key in ('J', 'RPGe', 'ff5c'):
        data = roms[key]
        h = parse_snes_header(data, key)
        w(f"### {key} — {ROM_LABELS[key]}")
        w("")
        if h:
            w(f"| Field | Value |")
            w(f"|-------|-------|")
            w(f"| Title | `{h['title']}` |")
            w(f"| Map mode | ${h['map_mode']:02X} — {map_mode_str(h['map_mode'])} |")
            w(f"| Cartridge type | ${h['cart_type']:02X} |")
            w(f"| ROM size byte | ${h['rom_size']:02X} → {2**h['rom_size']}KB claimed |")
            w(f"| RAM size byte | ${h['ram_size']:02X} → {2**h['ram_size'] if h['ram_size'] else 0}KB |")
            w(f"| Country | ${h['country']:02X} — {country_str(h['country'])} |")
            w(f"| Version | ${h['version']:02X} |")
            w(f"| Checksum | ${h['checksum']:04X} |")
            w(f"| Complement | ${h['complement']:04X} |")
            w(f"| Checksum valid | {'YES' if (h['checksum'] ^ h['complement']) == 0xFFFF else 'NO (patched/modified)'} |")
            w(f"| Reset vector | ${h['reset_vec']:04X} |")
        else:
            w("_(header parse failed)_")
        w("")

    # ──────────────────────────────────────────────────────────────────────────
    w("## 3. Bank-by-Bank Diff Map")
    w("")
    w("For each 64KB bank present in J ($C0–$DF), shows how many bytes changed in each translation/patch step.")
    w("Banks $E0–$E7 exist only in RPGe and ff5c. Banks $E8–$FF exist only in ff5c.")
    w("")
    w("### 3a. Shared region: J baseline ($C0–$DF, all three ROMs)")
    w("")
    w("| Bank | SNES | File offset | J→RPGe changed | RPGe→ff5c changed | J→ff5c changed | Notes |")
    w("|------|------|-------------|----------------|-------------------|----------------|-------|")

    j_banks    = len(J)    // BANK  # 32
    rpge_banks = len(RPGe) // BANK  # 40
    ff5c_banks = len(ff5c) // BANK  # 64

    for bank_idx in range(j_banks):  # 0–31
        snes_bank = 0xC0 + bank_idx
        file_off  = bank_idx * BANK
        jb    = J[file_off:file_off + BANK]
        rb    = RPGe[file_off:file_off + BANK]
        fb    = ff5c[file_off:file_off + BANK]
        jr    = count_diffs(jb, rb, BANK)
        rf    = count_diffs(rb, fb, BANK)
        jf    = count_diffs(jb, fb, BANK)
        note  = BANK_NOTES.get(file_off, "")
        jr_pct = jr / BANK * 100
        rf_pct = rf / BANK * 100
        jf_pct = jf / BANK * 100

        # Flag hotspots
        flags = []
        if jr > 500:  flags.append("⚠J→R")
        if rf > 500:  flags.append("⚠R→f")

        flag_str = " ".join(flags)
        w(f"| ${snes_bank:02X} | `${snes_bank:02X}` | `${file_off:06X}` | {jr:,} ({jr_pct:.1f}%) | {rf:,} ({rf_pct:.1f}%) | {jf:,} ({jf_pct:.1f}%) | {flag_str} {note[:60]} |")

    w("")
    w("### 3b. RPGe expansion region ($E0–$E7, RPGe and ff5c only)")
    w("")
    w("| Bank | SNES | File offset | RPGe content | ff5c content | RPGe→ff5c changed | Notes |")
    w("|------|------|-------------|-------------|-------------|-------------------|-------|")

    for bank_idx in range(j_banks, rpge_banks):  # 32–39
        snes_bank = 0xC0 + bank_idx
        file_off  = bank_idx * BANK
        rb = RPGe[file_off:file_off + BANK]
        fb = ff5c[file_off:file_off + BANK]

        r_dom, r_pct = analyze_fill(RPGe, file_off, BANK)
        f_dom, f_pct = analyze_fill(ff5c, file_off, BANK)
        rf = count_diffs(rb, fb, BANK)
        rf_pct = rf / BANK * 100

        r_desc = f"dom=${r_dom:02X} ({r_pct:.0f}%)" if r_dom is not None else "—"
        f_desc = f"dom=${f_dom:02X} ({f_pct:.0f}%)" if f_dom is not None else "—"
        note = BANK_NOTES.get(file_off, "")

        w(f"| ${snes_bank:02X} | `${snes_bank:02X}` | `${file_off:06X}` | {r_desc} | {f_desc} | {rf:,} ({rf_pct:.1f}%) | {note[:60]} |")

    w("")
    w("### 3c. ff5c-only expansion ($E8–$FF, ff5c only)")
    w("")
    w("| Bank | SNES | File offset | ff5c content summary | Notes |")
    w("|------|------|-------------|----------------------|-------|")

    for bank_idx in range(rpge_banks, ff5c_banks):  # 40–63
        snes_bank = 0xC0 + bank_idx
        file_off  = bank_idx * BANK
        f_dom, f_pct = analyze_fill(ff5c, file_off, BANK)
        f_desc = f"dom=${f_dom:02X} ({f_pct:.0f}% fill)"
        note = BANK_NOTES.get(file_off, "")

        # Non-trivial content?
        fb = ff5c[file_off:file_off + BANK]
        nonzero = sum(1 for b in fb if b not in (0x00, 0xFF))
        w(f"| ${snes_bank:02X} | | `${file_off:06X}` | {f_desc}, {nonzero:,} non-trivial bytes | {note[:60]} |")

    w("")

    # ──────────────────────────────────────────────────────────────────────────
    w("## 4. Points of Interest — Hex Previews")
    w("")
    w("16-byte hex preview of key offsets in each ROM (or `--` if ROM doesn't reach that offset).")
    w("")
    w("| Location | File offset | J | RPGe | ff5c |")
    w("|----------|-------------|---|------|------|")

    for (off, size, label) in POINTS_OF_INTEREST:
        j_hex    = format_hex_preview(J,    off, 16) if off + 16 <= len(J)    else "-- (beyond J)"
        rpge_hex = format_hex_preview(RPGe, off, 16) if off + 16 <= len(RPGe) else "-- (beyond RPGe)"
        ff5c_hex = format_hex_preview(ff5c, off, 16) if off + 16 <= len(ff5c) else "-- (beyond ff5c)"
        w(f"| **{label}** | `${off:06X}` | `{j_hex}` | `{rpge_hex}` | `{ff5c_hex}` |")

    w("")

    # ──────────────────────────────────────────────────────────────────────────
    w("## 5. KO Palette Hack — Relevant Diff")
    w("")
    w("The v0.9 patch touches two locations in Bank $C1:")
    w("")
    w("### Hook site: file `$017CD9` (5 bytes replacing AND #$1C / LSR / STA $9A)")
    w("")

    hook_off = 0x017CD9
    hook_len = 5
    w(f"| ROM | Bytes at `${hook_off:06X}` | Interpretation |")
    w("|-----|------------------------|----------------|")
    for key, data in [('J', J), ('RPGe', RPGe), ('ff5c', ff5c)]:
        if hook_off + hook_len <= len(data):
            chunk = data[hook_off:hook_off + hook_len]
            hexstr = ' '.join(f'{b:02X}' for b in chunk)
            # Identify
            if chunk == bytearray([0x29, 0x1C, 0x4A, 0x85, 0x9A]):
                interp = "original: `AND #$1C / LSR / STA $9A`"
            elif chunk == bytearray([0x5C, 0x9C, 0xFF, 0xC9, 0xEA]):
                interp = "**v0.9 patch: JML $C9FF9C / NOP**"
            else:
                interp = "modified (unknown patch)"
            w(f"| {key} | `{hexstr}` | {interp} |")
        else:
            w(f"| {key} | -- | beyond ROM |")

    w("")
    w("### Freespace payload: file `$09FF9C` (44 bytes)")
    w("")

    free_off = 0x09FF9C
    free_len = 44
    EXPECTED_PAYLOAD = bytearray([
        0x29,0x1C,0x4A,0x85,0x9A,0xAD,0x0A,0xD1,0x29,0x60,0x4A,0x4A,0x4A,0x4A,0x4A,0xAA,
        0xA5,0x9A,0xD0,0x0A,0xBF,0x10,0x00,0x7F,0xF0,0x08,0x85,0x9A,0x80,0x04,0x9F,0x10,
        0x00,0x7F,0x5C,0xDE,0x7C,0xC1,0x00,0x00,0x00,0x00,0x00,0x00
    ])

    w(f"| ROM | Bytes at `${free_off:06X}` | Status |")
    w("|-----|------------------------|--------|")
    for key, data in [('J', J), ('RPGe', RPGe), ('ff5c', ff5c)]:
        if free_off + free_len <= len(data):
            chunk = data[free_off:free_off + free_len]
            hexstr = ' '.join(f'{b:02X}' for b in chunk[:22])  # first 22 bytes
            hexstr2= ' '.join(f'{b:02X}' for b in chunk[22:])  # rest
            if chunk == EXPECTED_PAYLOAD:
                status = "**v0.9 payload — CONFIRMED**"
            elif all(b == 0xFF for b in chunk):
                status = "all $FF — empty freespace"
            elif all(b == 0x00 for b in chunk):
                status = "all $00 — zeroed"
            else:
                status = "modified / different patch"
            w(f"| {key} | `{hexstr}` _(+22 more)_ | {status} |")
        else:
            w(f"| {key} | -- | beyond ROM |")

    w("")
    w("### Palette loader routine: file `$017CB5` (64 bytes)")
    w("")

    pal_off = 0x017CB5
    pal_len = 64
    w(f"Showing first 32 bytes at `${pal_off:06X}`:")
    w("")
    w(f"| ROM | Bytes `${pal_off:06X}`–`${pal_off+31:06X}` |")
    w("|-----|------|")
    for key, data in [('J', J), ('RPGe', RPGe), ('ff5c', ff5c)]:
        if pal_off + 32 <= len(data):
            chunk = data[pal_off:pal_off + 32]
            hexstr = ' '.join(f'{b:02X}' for b in chunk)
            w(f"| {key} | `{hexstr}` |")
        else:
            w(f"| {key} | -- |")

    w("")

    # ──────────────────────────────────────────────────────────────────────────
    w("## 6. Bank $C1 Deep Dive (KO Palette Hack Bank)")
    w("")
    w("Bank $C1 = file `$010000`–`$01FFFF`. This bank contains the palette loader (`$C1/7CB5`) and the v0.9 patch hook site.")
    w("")

    bank1_off = 0x010000
    jb  = J[bank1_off:bank1_off + BANK]
    rb  = RPGe[bank1_off:bank1_off + BANK]
    fb  = ff5c[bank1_off:bank1_off + BANK]

    jr_offs = find_changed_offsets(J, RPGe, bank1_off, BANK, limit=20)
    rf_offs = find_changed_offsets(RPGe, ff5c, bank1_off, BANK, limit=20)

    w(f"**J → RPGe differences** ({len(jr_offs)} shown, up to 20):")
    w("")
    if jr_offs:
        w("| File offset | SNES addr | J byte | RPGe byte |")
        w("|-------------|-----------|--------|-----------|")
        for off in jr_offs:
            snes = f"$C1:{off - bank1_off:04X}"
            w(f"| `${off:06X}` | `{snes}` | `${J[off]:02X}` | `${RPGe[off]:02X}` |")
    else:
        w("_(no differences)_")

    w("")
    w(f"**RPGe → ff5c differences** ({len(rf_offs)} shown, up to 20):")
    w("")
    if rf_offs:
        w("| File offset | SNES addr | RPGe byte | ff5c byte |")
        w("|-------------|-----------|-----------|-----------|")
        for off in rf_offs:
            snes = f"$C1:{off - bank1_off:04X}"
            w(f"| `${off:06X}` | `{snes}` | `${RPGe[off]:02X}` | `${ff5c[off]:02X}` |")
    else:
        w("_(no differences)_")

    w("")

    # ──────────────────────────────────────────────────────────────────────────
    w("## 7. Bank $C9 Deep Dive (Freespace / Event Scripts Tail)")
    w("")
    w("Bank $C9 = file `$090000`–`$09FFFF`. Contains event script tail and the v0.9 freespace payload at `$09FF9C`.")
    w("")

    bank9_off = 0x090000
    jr9_offs  = find_changed_offsets(J, RPGe, bank9_off, BANK, limit=20)
    rf9_offs  = find_changed_offsets(RPGe, ff5c, bank9_off, BANK, limit=20)

    w(f"**J → RPGe:** {count_diffs(J[bank9_off:bank9_off+BANK], RPGe[bank9_off:bank9_off+BANK], BANK):,} bytes changed")
    w("")
    w(f"**RPGe → ff5c:** {count_diffs(RPGe[bank9_off:bank9_off+BANK], ff5c[bank9_off:bank9_off+BANK], BANK):,} bytes changed")
    w("")
    w("First 20 RPGe→ff5c diff offsets in $C9:")
    w("")
    if rf9_offs:
        w("| File offset | SNES addr | RPGe byte | ff5c byte |")
        w("|-------------|-----------|-----------|-----------|")
        for off in rf9_offs:
            snes = f"$C9:{off - bank9_off:04X}"
            highlight = " ← **v0.9 patch**" if 0x09FF9C <= off < 0x09FF9C + 44 else ""
            w(f"| `${off:06X}` | `{snes}` | `${RPGe[off]:02X}` | `${ff5c[off]:02X}` |{highlight}")
    else:
        w("_(no differences)_")

    w("")

    # ──────────────────────────────────────────────────────────────────────────
    w("## 8. Font Tile Region (file $11F000)")
    w("")
    w("256 tiles × 16 bytes each = 4096 bytes at file `$11F000`–`$11FFFF` (SNES `$D1:F000`).")
    w("")

    font_off = 0x11F000
    font_len = 0x1000

    w(f"| ROM | J→? changed | Content note |")
    w("|-----|------------|--------------|")
    if font_off + font_len <= len(J):
        jr_font = count_diffs(J[font_off:font_off+font_len], RPGe[font_off:font_off+font_len], font_len)
        w(f"| J→RPGe | {jr_font:,} bytes ({jr_font/font_len*100:.1f}%) | {'Tiles modified by translation' if jr_font > 0 else 'Identical'} |")
    if font_off + font_len <= len(RPGe):
        rf_font = count_diffs(RPGe[font_off:font_off+font_len], ff5c[font_off:font_off+font_len], font_len)
        w(f"| RPGe→ff5c | {rf_font:,} bytes ({rf_font/font_len*100:.1f}%) | {'Font changes in ff5c (Dress Code icons?)' if rf_font > 0 else 'Identical'} |")

    w("")

    # ──────────────────────────────────────────────────────────────────────────
    w("## 9. Monster Name Region (file $200050)")
    w("")
    w("384 entries × 10 bytes = 3840 bytes at file `$200050` (SNES `$E0:0050`).")
    w("")

    mon_off = 0x200050
    mon_len = 384 * 10

    if mon_off + mon_len > len(J):
        w("_(beyond J's range — J ROM ends at $1FFFFF)_")
        w("")
        # J goes up to $1FFFFF, so monster data at $200050 is only in RPGe/ff5c
        # Wait - J is 2MB = $000000-$1FFFFF, so $200050 is just beyond J
        # Let's check if it's present in J anyway
        j_mon = "beyond J ROM"
    else:
        j_mon = "present in J"

    # Actually J is 2MB = 0x200000 bytes, so $200000 is the first byte past J
    # Monster names at $200050 are in bank $E0 = file $200000... which is the first byte PAST J
    # Wait: J is 32 banks = 32 * 64KB = 2MB = $200000 bytes. File range = $000000-$1FFFFF.
    # So bank $E0 = file $200000 = bank_idx 32. J has bank_idx 0-31, so $E0 is NOT in J.
    # But RPGe has banks 0-39 = $C0-$E7, so $E0 is at file $200000 = bank_idx 32. Yes!

    if mon_off + mon_len <= len(RPGe):
        rf_mon = count_diffs(RPGe[mon_off:mon_off+mon_len], ff5c[mon_off:mon_off+mon_len], mon_len)
        w(f"Monster names are in bank $E0 (file `$200000`), which is BEYOND the J ROM ($C0–$DF only).")
        w(f"")
        w(f"- **J**: _(not present — J only covers $C0–$DF)_")
        w(f"- **RPGe vs ff5c**: {rf_mon:,} bytes changed ({rf_mon/mon_len*100:.1f}%) — {'monster names differ' if rf_mon > 0 else 'identical monster names'}")
        w("")
        # Show first few RPGe monster bytes
        preview = format_hex_preview(RPGe, mon_off, 40)
        w(f"RPGe first 40 bytes at `$200050`: `{preview}`")
        w("")
        preview_ff5c = format_hex_preview(ff5c, mon_off, 40)
        w(f"ff5c first 40 bytes at `$200050`: `{preview_ff5c}`")

    w("")

    # ──────────────────────────────────────────────────────────────────────────
    w("## 10. Key Architectural Differences")
    w("")
    w("| Aspect | J | RPGe | ff5c |")
    w("|--------|---|------|------|")
    w("| Size | 2MB | 2.5MB | 4MB |")
    w("| Banks | $C0–$DF | $C0–$E7 | $C0–$FF |")
    w("| Map mode | HiROM | HiROM | ExHiROM (likely) |")
    w("| Event script start | $C849DC | $C849DC | $C849DC (same?) |")
    w("| Monster names | bank $E0 (NOT in J!) | bank $E0 $E00050 | bank $E0 $E00050 |")
    w("| Font tiles | $D1:F000 | $D1:F000 | $D1:F000 |")
    w("| Expansion purpose | — | English text, code relocation | Dress Code sprites, QoL patches |")
    w("| KO palette loader | $C1/7CB5 | $C1/7CB5 | $C1/7CB5 (+ v0.9 hook?) |")
    w("")
    w("### Notable RPGe changes vs J")
    w("")
    w("- Text tables rewritten for English (DTE encoding preserved but character set changed)")
    w("- ROM expanded from 2MB to 2.5MB; banks $E0–$E7 added for relocation")
    w("- Monster names, spell names, item names all translated (residing in bank $E0)")
    w("- Code adjustments for text rendering (variable-width font handling)")
    w("- Checksum updated (original SNES checksum algorithm applied)")
    w("")
    w("### Notable ff5c changes vs RPGe")
    w("")
    w("- ROM expanded from 2.5MB to 4MB (full ExHiROM range $C0–$FF)")
    w("- Cubear's Dress Code: extensive custom map sprites per hero per Job outfit")
    w("- Sprite data for Dress Code likely resides in $E8–$FF expansion banks")
    w("- Various QoL patches applied (weapon equip fix, equip icons, etc.)")
    w("- v0.9 KO palette hack: hook at `$017CD9`, payload at `$09FF9C` (if applied)")
    w("")

    # ──────────────────────────────────────────────────────────────────────────
    w("## 11. Freespace Survey")
    w("")
    w("Regions with ≥95% fill of $00 or $FF bytes (likely unused/freespace) within the shared J-range banks.")
    w("")
    w("| ROM | Bank | File offset | Fill byte | Fill % | Non-trivial bytes |")
    w("|-----|------|-------------|-----------|--------|------------------|")

    for rom_key, data in [('J', J), ('RPGe', RPGe), ('ff5c', ff5c)]:
        for bank_idx in range(min(len(data) // BANK, j_banks)):
            file_off = bank_idx * BANK
            region = data[file_off:file_off + BANK]
            c = Counter(region)
            for fill_byte in (0x00, 0xFF):
                cnt = c[fill_byte]
                pct = cnt / BANK * 100
                if pct >= 95.0:
                    snes_bank = 0xC0 + bank_idx
                    nontrivial = BANK - cnt
                    w(f"| {rom_key} | ${snes_bank:02X} | `${file_off:06X}` | `${fill_byte:02X}` | {pct:.1f}% | {nontrivial} |")

    w("")
    w("---")
    w("")
    w("_Generated by `rom_compare.py`. Re-run to refresh after ROM changes._")

    # Write output
    output = '\n'.join(lines) + '\n'
    out_path.write_text(output, encoding='utf-8')
    print(f"\nDone! Written to: {out_path}")
    print(f"  {len(lines)} lines, {len(output):,} bytes")


if __name__ == '__main__':
    main()
