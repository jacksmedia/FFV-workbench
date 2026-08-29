"""
build_expanded_v5.py - String table expansion v5 (2026-08-05)

Everything from v4 (verified working in battle playtest 2026-08-01) PLUS
three more tables at 12-byte entries:

  spellName         $D11C80 87x6  -> $E09940 87x12   (Magic list)
  jobName           $D15600 22x8  -> $E09D60 22x12
  abilityNameInnate $D16200 33x8  -> $E09E70 33x12   (data only - menu
                    readers unmapped until the Mesen poke test; old copy
                    stays identical so nothing diverges)

New code details:
  - Three spellName sites share ONE `LDA #$06` between char counter ($70)
    and stride ($80): $12ABD, $12C41, $12FCB. Each 6-byte pair
    `A9 06 85 70 85 80` becomes `JSL $E0A000 / NOP NOP`; the shim sets
    counter=6, stride=12. (Same trick the prior hackers used at $E02FC9.)
  - Standalone stride immediates patched directly: spell $142BF, $1582C
    (6->12); job $12A72, $1311C (8->12).
  - Width-engine spellName entries repointed: $E02F40 (name) and $E02F47
    (name+1, skips icon byte - offset preserved).
  - JSR $FEBA is the hardware multiplier ($4202/03 -> $4216) and clobbers
    A (TDC) - shim has no register hazards.
"""
from pathlib import Path
import shutil

INPUT_ROM = Path("../ff5c.sfc")
OUTPUT_ROM = Path("ff5c_expanded_v5.sfc")

TABLES = [
    ("monsterName",              0xE00050, 10, 384, 16, 0xE05800),  # ends $E07000
    ("itemNames",                0xD11380,  9, 256, 13, 0xE07000),  # ends $E07D00
    ("battleCommandName",        0xE01150,  7,  96, 11, 0xE07D00),  # ends $E08120
    ("abilityName",              0xE70900, 16, 105, 20, 0xE08120),  # ends $E08954
    ("attackName",               0xE70F90, 12, 168, 16, 0xE089A0),  # ends $E09420
    ("monsterSpecialAttackName", 0xE73700, 16,  64, 20, 0xE09420),  # ends $E09920
    # ($E09920-$E0993C: ability stride x20 routine)
    ("spellName",                0xD11C80,  6,  87, 12, 0xE09940),  # ends $E09D54
    ("jobName",                  0xD15600,  8,  22, 12, 0xE09D60),  # ends $E09E68
    ("abilityNameInnate",        0xD16200,  8,  33, 12, 0xE09E70),  # ends $E09FFC
    # ($E0A000: spellName counter/stride split shim)
]

POINTERS = [
    ("monsterName", 0x03EBFD, 0xE00050, "C3:EBFD menu data"),
    ("monsterName", 0x03EC8D, 0xE00050, "C3:EC8D menu data"),
    ("monsterName", 0x03ECA5, 0xE00050, "C3:ECA5 menu data"),
    ("monsterName", 0x03ED7D, 0xE00050, "C3:ED7D menu data"),
    ("monsterName", 0x03EE0F, 0xE00050, "C3:EE0F menu data"),
    ("itemNames", 0x012FF8, 0xD11380, "C1:2FF7+1 BF operand"),
    ("itemNames", 0x015E92, 0xD11380, "C1:5E91+1 BF operand"),
    ("battleCommandName", 0x012A3B, 0xE01150, "C1:2A3A+1 BF operand"),
    ("battleCommandName", 0x012C09, 0xE01150, "C1:2C08+1 BF operand"),
    ("battleCommandName", 0x013269, 0xE01150, "C1:3268+1 BF operand"),
    ("battleCommandName", 0x01433D, 0xE01150, "C1:433C+1 BF operand"),
    ("abilityName", 0x012BAA, 0xE70900, "C1:2BA9+1 BF operand"),
    ("attackName", 0x012FBD, 0xE70F90, "C1:2FBC+1 BF operand"),
    ("attackName", 0x0142AE, 0xE70F90, "C1:42AD+1 BF operand"),
    ("attackName", 0x01586F, 0xE70F90, "C1:586E+1 BF operand"),
    ("monsterSpecialAttackName", 0x012BC3, 0xE73700, "C1:2BC2+1 BF operand"),
    ("monsterSpecialAttackName", 0x0DF154, 0xE73700, "CD:F154 data pointer"),
    # --- new in v5 ---
    ("spellName", 0x012AC9, 0xD11C80, "C1:2AC8+1 BF operand (shim site 1)"),
    ("spellName", 0x012C4D, 0xD11C80, "C1:2C4C+1 BF operand (shim site 2)"),
    ("spellName", 0x012FD7, 0xD11C80, "C1:2FD6+1 BF operand (shim site 3)"),
    ("spellName", 0x0142CC, 0xD11C80, "C1:42CB+1 BF operand"),
    ("spellName", 0x01583A, 0xD11C80, "C1:5839+1 BF operand"),
    ("jobName", 0x012A80, 0xD15600, "C1:2A7F+1 BF operand"),
    ("jobName", 0x01312C, 0xD15600, "C1:312B+1 BF operand"),
]

SHARED_IMM = bytes.fromhex("A906857085 80".replace(" ", ""))  # LDA #6/STA $70/STA $80
SHIM_CALL = bytes.fromhex("2200A0E0EAEA")                     # JSL $E0A000, NOP, NOP

BYTE_PATCHES = [
    # ==================== carried over from v4 ====================
    (0x200030,
     bytes.fromhex("5A9BB9384048 0A993840 0A0A18793840 AA68993840 7A6B".replace(" ", "")),
     bytes.fromhex("5A9BB93840 0A0A0A0A AA7A6B".replace(" ", "")),
     "$E00030 monster stride multiply x10 -> x16"),
    (0x13031, bytes.fromhex("BF5000E0"), bytes.fromhex("BF0058E0"),
     "C1:3031 monster read 0-255 -> $E05800,X"),
    (0x13024, bytes.fromhex("BF500AE0"), bytes.fromhex("BF0068E0"),
     "C1:3024 monster read 256-383 -> $E06800,X"),
    (0x12FEB, b"\x09", b"\x0D", "item stride (FEBA path)"),
    (0x15E84, b"\x09", b"\x0D", "item stride (FE4B path)"),
    (0x12BD2, b"\x07", b"\x0B", "command stride ($2BCF helper)"),
    (0x1431B, b"\x07", b"\x0B", "command stride (inline)"),
    (0x142A1, b"\x0C", b"\x10", "attack stride (inline 1)"),
    (0x15861, b"\x0C", b"\x10", "attack stride (inline 2)"),
    (0x202FCE, b"\x0C", b"\x10", "attack stride (inside $E02FC9 shim)"),
    (0x12B94, b"\x10", b"\x14", "monSpec stride ($2B91 helper)"),
    (0x209920, bytes(28),
     bytes.fromhex("A7B8 8003 ADF7DB C220 29FF00 0A0A 48 0A0A 18 6301 AA 68 A90000 E220 6B".replace(" ", "")),
     "$E09920 ability stride x20 routine (dual entry)"),
    (0x12BA1, bytes.fromhex("B22FE0"), bytes.fromhex("2099E0"),
     "JSL retarget: battle ability name"),
    (0x13C23, bytes.fromhex("B62FE0"), bytes.fromhex("2499E0"),
     "JSL retarget: ability width calc"),
    (0x202F51, bytes.fromhex("5011"), bytes.fromhex("007D"),
     "width-engine LDY: battleCommandName"),
    (0x202F56, b"\xE7", b"\xE0", "width-engine bank: abilityName"),
    (0x202F58, bytes.fromhex("0009"), bytes.fromhex("2081"),
     "width-engine LDY: abilityName"),
    (0x202F5D, b"\xE7", b"\xE0", "width-engine bank: monSpec"),
    (0x202F5F, bytes.fromhex("0037"), bytes.fromhex("2094"),
     "width-engine LDY: monSpec"),
    # ==================== new in v5 ====================
    # Shim: LDA #$06 / STA $70 / LDA #$0C / STA $80 / RTL
    (0x20A000, bytes(9), bytes.fromhex("A9068570A90C85806B"),
     "$E0A000 spellName counter/stride split shim"),
    (0x12ABD, SHARED_IMM, SHIM_CALL, "spell shared-imm site 1 -> JSL shim"),
    (0x12C41, SHARED_IMM, SHIM_CALL, "spell shared-imm site 2 -> JSL shim"),
    (0x12FCB, SHARED_IMM, SHIM_CALL, "spell shared-imm site 3 -> JSL shim"),
    (0x142BF, b"\x06", b"\x0C", "spell stride (inline, counter separate at $142C8)"),
    (0x1582C, b"\x06", b"\x0C", "spell stride (FE4B path, counter separate at $15836)"),
    (0x12A73, b"\x08", b"\x0C", "job stride (counter separate at $12A7C)"),
    (0x1311C, b"\x08", b"\x0C", "job stride (counter separate at $13125)"),
    # width engine: spellName at $E02F40 (name) and $E02F47 (name+1 icon skip)
    (0x202F41, b"\xD1", b"\xE0", "width-engine bank: spellName"),
    (0x202F43, bytes.fromhex("801C"), bytes.fromhex("4099"),
     "width-engine LDY: spellName"),
    (0x202F48, b"\xD1", b"\xE0", "width-engine bank: spellName+1"),
    (0x202F4A, bytes.fromhex("811C"), bytes.fromhex("4199"),
     "width-engine LDY: spellName+1 (icon skip preserved)"),
]

# Phase 2 reference (NOT applied): char-count operand offsets.
COUNTERS = {
    "monsterName":       [0x13019],
    "battleCommandName": [0x12A37, 0x12C05, 0x13263, 0x14339, 0x13C09],
    "itemNames":         [0x12FF4, 0x15E8D],
    "abilityName":       [0x12BA6, 0x13C29],
    "attackName":        [0x142AA, 0x1586B, 0x202FCA],
    "monsterSpecialAttackName": [0x12BBF, 0x13C49],
    "spellName":         [0x20A001, 0x142C8, 0x15836],  # first = inside shim
    "jobName":           [0x12A7C, 0x13125],
}

# Freespace slots that must be clean $FF before writing (len checked)
FREESPACE_WRITES = {0x209920, 0x20A000}


def snes_to_file(addr):
    return addr - 0xC00000 if addr >= 0xC00000 else addr


def main():
    print("=== FFV String Table Expansion v5 ===\n")
    shutil.copy(INPUT_ROM, OUTPUT_ROM)
    rom = bytearray(OUTPUT_ROM.read_bytes())
    print(f"Base: {INPUT_ROM} ({len(rom):,} bytes)\n")

    errors = []

    print("--- Relocating tables ---")
    for name, old_addr, old_size, count, new_size, new_addr in TABLES:
        old_file, new_file = snes_to_file(old_addr), snes_to_file(new_addr)
        if any(b != 0xFF for b in rom[new_file:new_file + count * new_size]):
            errors.append(f"{name}: target ${new_addr:06X} not clean freespace!")
        for i in range(count):
            entry = rom[old_file + i*old_size : old_file + i*old_size + old_size]
            rom[new_file + i*new_size : new_file + (i+1)*new_size] = \
                entry + bytes([0xFF] * (new_size - old_size))
        print(f"  {name}: {count} x {old_size}->{new_size}B at ${new_addr:06X}")

    print("\n--- Pointer operands ---")
    new_addrs = {t[0]: t[5] for t in TABLES}
    for table, off, expected, desc in POINTERS:
        found = rom[off] | (rom[off+1] << 8) | (rom[off+2] << 16)
        if found != expected:
            errors.append(f"{desc}: expected ${expected:06X}, found ${found:06X}")
            continue
        na = new_addrs[table]
        rom[off:off+3] = bytes([na & 0xFF, (na >> 8) & 0xFF, (na >> 16) & 0xFF])
        print(f"  ${off:06X}: ${expected:06X} -> ${na:06X}  {desc}")

    print("\n--- Byte patches ---")
    for off, old, new, desc in BYTE_PATCHES:
        if off in FREESPACE_WRITES:
            if any(b != 0xFF for b in rom[off:off+len(new)]):
                errors.append(f"{desc}: target not $FF freespace!")
                continue
        elif bytes(rom[off:off+len(old)]) != old:
            errors.append(f"{desc}: bytes at ${off:06X} = "
                          f"{rom[off:off+len(old)].hex()} != expected {old.hex()}")
            continue
        rom[off:off+len(new)] = new
        print(f"  ${off:06X}: {desc}")

    if errors:
        print("\n!!! BUILD ABORTED !!!")
        for e in errors:
            print("  " + e)
        return 1

    OUTPUT_ROM.write_bytes(rom)
    print(f"\nWrote {OUTPUT_ROM} ({len(rom):,} bytes)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
