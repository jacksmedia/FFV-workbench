"""
build_expanded_rom.py - Build ROM with expanded string tables

Steps:
1. Copy ff5c.sfc to output
2. Relocate and expand string tables
3. Update pointer references
4. Assemble and apply stride fix
"""
from pathlib import Path
import subprocess
import shutil

INPUT_ROM = Path("../ff5c.sfc")
OUTPUT_ROM = Path("ff5c_expanded_v2.sfc")
ASM_DIR = Path("../ffv-decomp/asm")

# Table definitions: (name, old_addr, old_size, count, new_size, new_addr)
TABLES = [
    ("monsterName",              0xE00050, 10, 384, 14, 0xE05800),
    ("itemNames",                0xD11380,  9, 256, 13, 0xE06D00),
    ("battleCommandName",        0xE01150,  7,  96, 11, 0xE07A00),
    ("abilityName",              0xE70900, 16, 105, 20, 0xE07E20),
    ("attackName",               0xE70F90, 12, 168, 16, 0xE08660),
    ("monsterSpecialAttackName", 0xE73700, 16,  64, 20, 0xE090E0),
]

# Pointer references to update
# Format: (table_name, file_offset, expected_old_addr, description)
# The file_offset is where the 3-byte address operand STARTS
POINTERS = [
    # monsterName $E00050 -> $E05800
    # NOTE: C1:3031 ($13032) and C1:3024 ($13025) are handled by ASM hooks
    ("monsterName", 0x03EBFD, 0xE00050, "C3:EBFD menu data pointer"),
    ("monsterName", 0x03EC8D, 0xE00050, "C3:EC8D menu data pointer"),
    ("monsterName", 0x03ECA5, 0xE00050, "C3:ECA5 menu data pointer"),
    ("monsterName", 0x03ED7D, 0xE00050, "C3:ED7D menu data pointer"),
    ("monsterName", 0x03EE0F, 0xE00050, "C3:EE0F menu data pointer"),

    # itemNames $D11380 -> $E06D00
    ("itemNames", 0x012FF8, 0xD11380, "C1:2FF7+1 item name BF operand"),
    ("itemNames", 0x015E92, 0xD11380, "C1:5E91+1 item name BF operand"),

    # battleCommandName $E01150 -> $E07A00
    ("battleCommandName", 0x012A3B, 0xE01150, "C1:2A3A+1 command BF operand"),
    ("battleCommandName", 0x012C09, 0xE01150, "C1:2C08+1 command BF operand"),
    ("battleCommandName", 0x013269, 0xE01150, "C1:3268+1 command BF operand"),
    ("battleCommandName", 0x01433D, 0xE01150, "C1:433C+1 command BF operand"),

    # abilityName $E70900 -> $E07E20
    ("abilityName", 0x012BAA, 0xE70900, "C1:2BA9+1 ability BF operand"),

    # attackName $E70F90 -> $E08660
    ("attackName", 0x012FBD, 0xE70F90, "C1:2FBC+1 attack BF operand"),
    ("attackName", 0x0142AE, 0xE70F90, "C1:42AD+1 attack BF operand"),
    ("attackName", 0x01586F, 0xE70F90, "C1:586E+1 attack BF operand"),

    # monsterSpecialAttackName $E73700 -> $E090E0
    ("monsterSpecialAttackName", 0x012BC3, 0xE73700, "C1:2BC2+1 special BF operand"),
    ("monsterSpecialAttackName", 0x0DF154, 0xE73700, "CD:F154 special data pointer"),
]


def snes_to_file(addr):
    if addr >= 0xC00000:
        return addr - 0xC00000
    return addr


def addr_to_bytes(addr):
    return bytes([addr & 0xFF, (addr >> 8) & 0xFF, (addr >> 16) & 0xFF])


def main():
    print(f"Input:  {INPUT_ROM}")
    print(f"Output: {OUTPUT_ROM}")

    # Copy input to output
    shutil.copy(INPUT_ROM, OUTPUT_ROM)
    rom = bytearray(OUTPUT_ROM.read_bytes())
    print(f"ROM size: {len(rom):,} bytes")

    # Build table name -> new address mapping
    new_addrs = {t[0]: t[5] for t in TABLES}

    # Relocate and expand tables
    print("\n=== Relocating String Tables ===\n")

    for name, old_addr, old_size, count, new_size, new_addr in TABLES:
        old_file = snes_to_file(old_addr)
        new_file = snes_to_file(new_addr)
        pad_bytes = new_size - old_size

        print(f"{name}: {count} entries, {old_size} -> {new_size} bytes")

        for i in range(count):
            old_offset = old_file + (i * old_size)
            new_offset = new_file + (i * new_size)
            entry = rom[old_offset:old_offset + old_size]
            padded = entry + bytes([0xFF] * pad_bytes)
            rom[new_offset:new_offset + new_size] = padded

    # Update pointer references
    print("\n=== Updating Pointer References ===\n")

    errors = []
    for table_name, file_offset, expected_old, desc in POINTERS:
        new_addr = new_addrs[table_name]
        old_bytes = rom[file_offset:file_offset + 3]
        old_addr = old_bytes[0] | (old_bytes[1] << 8) | (old_bytes[2] << 16)

        if old_addr != expected_old:
            errors.append(f"  ${file_offset:05X}: expected ${expected_old:06X}, found ${old_addr:06X}")
            continue

        new_bytes = addr_to_bytes(new_addr)
        rom[file_offset:file_offset + 3] = new_bytes
        print(f"  ${file_offset:05X}: ${old_addr:06X} -> ${new_addr:06X}  ({desc})")

    if errors:
        print("\n!!! POINTER VERIFICATION ERRORS !!!")
        for e in errors:
            print(e)

    # Write ROM before assembly
    OUTPUT_ROM.write_bytes(rom)
    print(f"\nWrote {len(rom):,} bytes to {OUTPUT_ROM}")

    # Assemble stride fix
    print("\n=== Assembling Stride Fix ===\n")
    asm_file = ASM_DIR / "fix_monster_stride.asm"

    if not asm_file.exists():
        print(f"ERROR: {asm_file} not found!")
        return

    # Find asar
    asar_candidates = [
        ASM_DIR / "asar.exe",
        Path("../ffv-decomp/asm/asar.exe"),
        Path("asar.exe"),
    ]
    asar = None
    for candidate in asar_candidates:
        if candidate.exists():
            asar = candidate
            break

    if asar is None:
        print("WARNING: asar.exe not found, skipping assembly step")
        print(f"Run manually: asar fix_monster_stride.asm {OUTPUT_ROM}")
        return

    print(f"Using asar at: {asar}")

    # Run asar (need to give it relative paths it can handle)
    result = subprocess.run(
        [str(asar.absolute()), str(asm_file.absolute()), str(OUTPUT_ROM.absolute())],
        capture_output=True,
        text=True,
        cwd=ASM_DIR
    )

    print(result.stdout)
    if result.stderr:
        print("STDERR:", result.stderr)

    if result.returncode != 0:
        print(f"asar returned exit code {result.returncode}")
        return

    print("\n=== Build Complete ===")
    print(f"Load {OUTPUT_ROM} in Mesen to test")


if __name__ == "__main__":
    main()
