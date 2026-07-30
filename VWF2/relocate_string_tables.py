"""
relocate_string_tables.py - Expand and relocate FFV fixed-size string tables

Expands 6 string tables by +4 bytes per entry to eliminate ligatures,
relocates them to freespace after the VWF code at $E05800.

Tables expanded:
  - Monsters (monsterName): 384 entries, 10 -> 14 bytes
  - Items (itemNames): 256 entries, 9 -> 13 bytes
  - Commands (battleCommandName): 96 entries, 7 -> 11 bytes
  - Skills/Menu (abilityName): 105 entries, 16 -> 20 bytes
  - Skills/Battle (attackName): 168 entries, 12 -> 16 bytes
  - Mon. Attacks (monsterSpecialAttackName): 64 entries, 16 -> 20 bytes

Usage:
    python relocate_string_tables.py [input.sfc] [output.sfc]

Default: reads ff5c.sfc, writes ff5c_expanded_strings.sfc
"""

import sys
from pathlib import Path

# Table definitions: (name, old_addr, old_size, count, new_size, new_addr)
TABLES = [
    ("monsterName",              0xE00050, 10, 384, 14, 0xE05800),
    ("itemNames",                0xD11380,  9, 256, 13, 0xE06D00),
    ("battleCommandName",        0xE01150,  7,  96, 11, 0xE07A00),
    ("abilityName",              0xE70900, 16, 105, 20, 0xE07E20),
    ("attackName",               0xE70F90, 12, 168, 16, 0xE08660),
    ("monsterSpecialAttackName", 0xE73700, 16,  64, 20, 0xE090E0),
]

# Pointer references to update: (table_name, file_offset, description)
# These are the 3-byte pointer locations found earlier
POINTERS = [
    # monsterName ($E00050) -> new $E05800
    ("monsterName", 0x013032, "C1:3032 battle monster name"),
    ("monsterName", 0x03EBFD, "C3:EBFD menu"),
    ("monsterName", 0x03EC8D, "C3:EC8D menu"),
    ("monsterName", 0x03ECA5, "C3:ECA5 menu"),
    ("monsterName", 0x03ED7D, "C3:ED7D menu"),

    # itemNames ($D11380) -> new $E06D00
    ("itemNames", 0x012FF8, "C1:2FF8 item name display"),
    ("itemNames", 0x015E92, "C1:5E92 item name alt"),

    # battleCommandName ($E01150) -> new $E07A00
    ("battleCommandName", 0x012A3B, "C1:2A3B command lookup"),
    ("battleCommandName", 0x012C09, "C1:2C09 command display"),
    ("battleCommandName", 0x013269, "C1:3269 command secondary"),
    ("battleCommandName", 0x01433D, "C1:433D command tertiary"),

    # abilityName ($E70900) -> new $E07E20
    ("abilityName", 0x012BAA, "C1:2BAA ability name"),

    # attackName ($E70F90) -> new $E08660
    ("attackName", 0x012FBD, "C1:2FBD attack name"),
    ("attackName", 0x0142AE, "C1:42AE attack secondary"),
    ("attackName", 0x01586F, "C1:586F attack tertiary"),

    # monsterSpecialAttackName ($E73700) -> new $E090E0
    ("monsterSpecialAttackName", 0x012BC3, "C1:2BC3 special attack"),
    ("monsterSpecialAttackName", 0x0DF154, "CD:F154 compressed data?"),
]


def snes_to_file(addr):
    """Convert SNES HiROM address to file offset."""
    if addr >= 0xC00000:
        return addr - 0xC00000
    return addr


def file_to_snes(offset):
    """Convert file offset to SNES HiROM address."""
    return offset + 0xC00000


def addr_to_bytes(addr):
    """Convert 24-bit address to 3 little-endian bytes."""
    return bytes([addr & 0xFF, (addr >> 8) & 0xFF, (addr >> 16) & 0xFF])


def main():
    # Parse arguments
    input_path = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("../ff5c.sfc")
    output_path = Path(sys.argv[2]) if len(sys.argv) > 2 else Path("ff5c_expanded_strings.sfc")

    print(f"Input:  {input_path}")
    print(f"Output: {output_path}")

    # Read ROM
    rom = bytearray(input_path.read_bytes())
    print(f"ROM size: {len(rom):,} bytes")

    # Build table name -> new address mapping
    new_addrs = {t[0]: t[5] for t in TABLES}

    # Process each table
    print("\n=== Relocating String Tables ===\n")

    for name, old_addr, old_size, count, new_size, new_addr in TABLES:
        old_file = snes_to_file(old_addr)
        new_file = snes_to_file(new_addr)

        old_total = old_size * count
        new_total = new_size * count
        pad_bytes = new_size - old_size

        print(f"{name}:")
        print(f"  Old: ${old_addr:06X} (file ${old_file:06X}), {count} x {old_size} = {old_total} bytes")
        print(f"  New: ${new_addr:06X} (file ${new_file:06X}), {count} x {new_size} = {new_total} bytes")
        print(f"  Padding: +{pad_bytes} bytes per entry")

        # Read old entries and write expanded to new location
        for i in range(count):
            old_offset = old_file + (i * old_size)
            new_offset = new_file + (i * new_size)

            # Read old entry
            entry = rom[old_offset:old_offset + old_size]

            # Pad with $FF (unused string bytes)
            padded = entry + bytes([0xFF] * pad_bytes)

            # Write to new location
            rom[new_offset:new_offset + new_size] = padded

        print(f"  Copied {count} entries")

    # Update pointer references
    print("\n=== Updating Pointer References ===\n")

    for table_name, file_offset, desc in POINTERS:
        new_addr = new_addrs[table_name]
        old_bytes = rom[file_offset:file_offset + 3]
        old_addr = old_bytes[0] | (old_bytes[1] << 8) | (old_bytes[2] << 16)

        new_bytes = addr_to_bytes(new_addr)
        rom[file_offset:file_offset + 3] = new_bytes

        print(f"  ${file_offset:06X} ({desc}):")
        print(f"    ${old_addr:06X} -> ${new_addr:06X}")

    # Write output
    output_path.write_bytes(rom)
    print(f"\n=== Done! ===")
    print(f"Wrote {len(rom):,} bytes to {output_path}")

    # Summary
    print("\n=== New Table Locations ===")
    for name, old_addr, old_size, count, new_size, new_addr in TABLES:
        end_addr = new_addr + (new_size * count)
        print(f"  {name}: ${new_addr:06X}-${end_addr:06X}")

    last_table = TABLES[-1]
    final_end = last_table[5] + (last_table[4] * last_table[3])
    print(f"\nFreespace used: ${0xE05800:06X}-${final_end:06X} ({final_end - 0xE05800:,} bytes)")
    print(f"Remaining in bank $E0: ${final_end:06X}-$E10000 ({0xE10000 - final_end:,} bytes)")


if __name__ == "__main__":
    main()
