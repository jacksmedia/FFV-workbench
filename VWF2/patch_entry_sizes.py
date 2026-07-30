"""
Patch entry size constants in the expanded strings ROM.
Run AFTER relocate_string_tables.py
"""
from pathlib import Path

rom_path = Path("ff5c_expanded_strings.sfc")
rom = bytearray(rom_path.read_bytes())

# Format: (file_offset, old_byte, new_byte, description)
PATCHES = [
    # monsterName: 10 -> 14
    (0x13018, 0x0A, 0x0E, "monsterName entry size"),

    # itemNames: 9 -> 13
    (0x12FEA, 0x09, 0x0D, "itemNames entry size (1)"),
    (0x12FF3, 0x09, 0x0D, "itemNames entry size (2)"),

    # battleCommandName: 7 -> 11
    (0x12A36, 0x07, 0x0B, "battleCommandName entry size"),

    # abilityName + monsterSpecialAttackName share 16 -> 20 (both are 16->20)
    (0x12B93, 0x10, 0x14, "ability/monSpecial entry size (1)"),
    (0x12BA5, 0x10, 0x14, "ability/monSpecial entry size (2)"),
    (0x12BBE, 0x10, 0x14, "monsterSpecialAttackName entry size"),

    # attackName: 12 -> 16
    (0x142A0, 0x0C, 0x10, "attackName entry size (1)"),
    (0x142A9, 0x0C, 0x10, "attackName entry size (2)"),
    (0x15860, 0x0C, 0x10, "attackName entry size (3)"),
]

print("=== Patching Entry Size Constants ===\n")

for offset, old, new, desc in PATCHES:
    # The byte at offset is A9 (LDA), we want offset+1
    actual = rom[offset + 1]

    if actual == old:
        rom[offset + 1] = new
        print(f"  ${offset:05X}+1: ${old:02X} -> ${new:02X}  ({desc}) OK")
    elif actual == new:
        print(f"  ${offset:05X}+1: already ${new:02X}  ({desc}) SKIP")
    else:
        print(f"  ${offset:05X}+1: expected ${old:02X}, found ${actual:02X}  ({desc}) ERROR")

# Write patched ROM
rom_path.write_bytes(rom)
print(f"\nWrote patched ROM to {rom_path}")
print(f"ROM size: {len(rom):,} bytes")
