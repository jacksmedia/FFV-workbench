"""
build_expanded_v3.py - Build ROM with 16-byte monster name entries

Changes from v2:
- Monster names now use 16-byte entries (was 14) for easier math
- Monster 256+ base is now $E06800 (256 × 16 = $1000 offset)
- Uses fix_monster_stride_v2.asm with iterative division (exact)
"""
from pathlib import Path
import subprocess
import shutil

INPUT_ROM = Path("../ff5c.sfc")
OUTPUT_ROM = Path("ff5c_expanded_v3.sfc")
ASM_DIR = Path("../ffv-decomp/asm")
ASM_FILE = "fix_monster_stride_v2.asm"

# Table definitions: (name, old_addr, old_size, count, new_size, new_addr)
# Monster names now use 16-byte entries!
TABLES = [
    ("monsterName",              0xE00050, 10, 384, 16, 0xE05800),  # 384×16=6144, ends $E07000
    ("itemNames",                0xD11380,  9, 256, 13, 0xE07000),  # 256×13=3328, ends $E07D00
    ("battleCommandName",        0xE01150,  7,  96, 11, 0xE07D00),  # 96×11=1056, ends $E08120
    ("abilityName",              0xE70900, 16, 105, 20, 0xE08120),  # 105×20=2100, ends $E08994
    ("attackName",               0xE70F90, 12, 168, 16, 0xE089A0),  # 168×16=2688, ends $E09420
    ("monsterSpecialAttackName", 0xE73700, 16,  64, 20, 0xE09420),  # 64×20=1280, ends $E09920
]

# Pointer references to update
# NOTE: C1:3031 ($13032) and C1:3024 ($13025) are handled by ASM hooks
POINTERS = [
    # monsterName $E00050 -> $E05800 (menu data pointers only)
    ("monsterName", 0x03EBFD, 0xE00050, "C3:EBFD menu data"),
    ("monsterName", 0x03EC8D, 0xE00050, "C3:EC8D menu data"),
    ("monsterName", 0x03ECA5, 0xE00050, "C3:ECA5 menu data"),
    ("monsterName", 0x03ED7D, 0xE00050, "C3:ED7D menu data"),
    ("monsterName", 0x03EE0F, 0xE00050, "C3:EE0F menu data"),

    # itemNames $D11380 -> $E07000
    ("itemNames", 0x012FF8, 0xD11380, "C1:2FF7+1 BF operand"),
    ("itemNames", 0x015E92, 0xD11380, "C1:5E91+1 BF operand"),

    # battleCommandName $E01150 -> $E07D00
    ("battleCommandName", 0x012A3B, 0xE01150, "C1:2A3A+1 BF operand"),
    ("battleCommandName", 0x012C09, 0xE01150, "C1:2C08+1 BF operand"),
    ("battleCommandName", 0x013269, 0xE01150, "C1:3268+1 BF operand"),
    ("battleCommandName", 0x01433D, 0xE01150, "C1:433C+1 BF operand"),

    # abilityName $E70900 -> $E08120
    ("abilityName", 0x012BAA, 0xE70900, "C1:2BA9+1 BF operand"),

    # attackName $E70F90 -> $E089A0
    ("attackName", 0x012FBD, 0xE70F90, "C1:2FBC+1 BF operand"),
    ("attackName", 0x0142AE, 0xE70F90, "C1:42AD+1 BF operand"),
    ("attackName", 0x01586F, 0xE70F90, "C1:586E+1 BF operand"),

    # monsterSpecialAttackName $E73700 -> $E09420
    ("monsterSpecialAttackName", 0x012BC3, 0xE73700, "C1:2BC2+1 BF operand"),
    ("monsterSpecialAttackName", 0x0DF154, 0xE73700, "CD:F154 data pointer"),
]


def snes_to_file(addr):
    if addr >= 0xC00000:
        return addr - 0xC00000
    return addr


def addr_to_bytes(addr):
    return bytes([addr & 0xFF, (addr >> 8) & 0xFF, (addr >> 16) & 0xFF])


def main():
    print(f"=== FFV String Table Expansion v3 ===")
    print(f"Monster names: 16-byte entries (power of 2)")
    print(f"Input:  {INPUT_ROM}")
    print(f"Output: {OUTPUT_ROM}\n")

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
        end_addr = new_addr + (count * new_size)

        print(f"{name}:")
        print(f"  {count} entries × {new_size} bytes = {count * new_size} bytes")
        print(f"  ${new_addr:06X} - ${end_addr:06X}")

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
        print(f"  ${file_offset:05X}: ${old_addr:06X} -> ${new_addr:06X}")

    if errors:
        print("\n!!! POINTER VERIFICATION ERRORS !!!")
        for e in errors:
            print(e)
        print("Continuing anyway...\n")

    # Write ROM before assembly
    OUTPUT_ROM.write_bytes(rom)
    print(f"\nWrote {len(rom):,} bytes")

    # Assemble stride fix
    print("\n=== Assembling Stride Fix v2 ===\n")
    asm_file = ASM_DIR / ASM_FILE

    if not asm_file.exists():
        print(f"ERROR: {asm_file} not found!")
        return

    # Find asar
    asar = ASM_DIR / "asar.exe"
    if not asar.exists():
        print(f"WARNING: asar.exe not found at {asar}")
        print(f"Run manually: asar {ASM_FILE} {OUTPUT_ROM}")
        return

    print(f"Assembling {ASM_FILE}...")

    result = subprocess.run(
        [str(asar.absolute()), str(asm_file.absolute()), str(OUTPUT_ROM.absolute())],
        capture_output=True,
        text=True,
        cwd=ASM_DIR
    )

    if result.stdout.strip():
        print(result.stdout)
    if result.stderr.strip():
        print("STDERR:", result.stderr)

    if result.returncode != 0:
        print(f"asar FAILED (exit code {result.returncode})")
        return

    # Verify hooks applied
    rom = bytearray(OUTPUT_ROM.read_bytes())
    hook1 = rom[0x13031:0x13035]
    hook2 = rom[0x13024:0x13028]

    print(f"\nVerifying hooks:")
    print(f"  C1:3031: {hook1.hex()} {'(JSL ✓)' if hook1[0] == 0x22 else '(NOT HOOKED!)'}")
    print(f"  C1:3024: {hook2.hex()} {'(JSL ✓)' if hook2[0] == 0x22 else '(NOT HOOKED!)'}")

    print("\n=== Build Complete ===")
    print(f"\nTest ROM: {OUTPUT_ROM}")
    print("\nMonster name table layout:")
    print("  Monsters 0-255:   $E05800 + (id × 16)")
    print("  Monsters 256-383: $E06800 + ((id-256) × 16)")


if __name__ == "__main__":
    main()
