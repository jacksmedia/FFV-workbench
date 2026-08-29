"""
build_expanded_v4.py - String table expansion, root-cause edition (2026-08-01)

Root fix discovered: the monster-name stride was never in bank C1 at all.
The multiply-by-10 lives in a pre-existing hack routine at $E00030
(PHY/TXY/LDA $4038,Y/ x10 via shift-add /TAX/PLY/RTL), called only from
C1:3011. We rewrite it to multiply by 16 and RESTORE the two hooked reads
to plain `LDA $E05800,X` / `LDA $E06800,X`. The game's own INX char loop
then indexes correctly (offset = id*16 + char).

Why v3 failed (for the record):
  - The div-10 hook discarded the remainder (the char index) AND returned
    with X clobbered, so successive chars resolved to different monsters.
  - The hook routines at $E05680 were written on top of the VWF v5 glyph
    width table ($E05640-$E056FF) - silent menu VWF corruption.

Also fixed here: strides for the other five tables, including three
references hidden inside bank-E0 VWF width routines (addresses stored
split as bank-imm + LDY-imm, invisible to 3-byte pointer scans), and the
ability stride routine $E02FB2/$E02FB6 which is relocated to $E09920
because x20 needs more bytes than x16's four ASLs.

Char-count loop counters are deliberately NOT changed in this pass:
correctness first, then extend visible name lengths (see COUNTERS below).
"""
from pathlib import Path
import shutil

INPUT_ROM = Path("../ff5c.sfc")
OUTPUT_ROM = Path("ff5c_expanded_v4.sfc")

# Table definitions: (name, old_addr, old_size, count, new_size, new_addr)
TABLES = [
    ("monsterName",              0xE00050, 10, 384, 16, 0xE05800),  # ends $E07000
    ("itemNames",                0xD11380,  9, 256, 13, 0xE07000),  # ends $E07D00
    ("battleCommandName",        0xE01150,  7,  96, 11, 0xE07D00),  # ends $E08120
    ("abilityName",              0xE70900, 16, 105, 20, 0xE08120),  # ends $E08954
    ("attackName",               0xE70F90, 12, 168, 16, 0xE089A0),  # ends $E09420
    ("monsterSpecialAttackName", 0xE73700, 16,  64, 20, 0xE09420),  # ends $E09920
]

# 3-byte little-endian pointer operands (same set as v3, full-ROM scan
# re-verified 2026-08-01: no other contiguous refs exist; D5/D7/D9 hits
# are graphics data coincidences).
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
]

# Byte patches: (file_offset, expected_old_bytes, new_bytes, description)
BYTE_PATCHES = [
    # --- monsterName root fix ---
    # $E00030: rewrite multiply x10 -> x16.  Old: PHY TXY LDA $4038,Y PHA ASL
    # STA $4038,Y ASL ASL CLC ADC $4038,Y TAX PLA STA $4038,Y PLY RTL
    # New: PHY TXY LDA $4038,Y ASL ASL ASL ASL TAX PLY RTL (tail unreachable)
    (0x200030,
     bytes.fromhex("5A9BB9384048 0A993840 0A0A18793840 AA68993840 7A6B".replace(" ", "")),
     bytes.fromhex("5A9BB93840 0A0A0A0A AA7A6B".replace(" ", "")),
     "$E00030 monster stride multiply x10 -> x16"),
    # Monster reads: plain long-indexed loads at the new bases.
    # (In a fresh ff5c.sfc these are BF 50 00 E0 / BF 50 0A E0.)
    (0x13031, bytes.fromhex("BF5000E0"), bytes.fromhex("BF0058E0"),
     "C1:3031 LDA $E00050,X -> LDA $E05800,X (monsters 0-255)"),
    (0x13024, bytes.fromhex("BF500AE0"), bytes.fromhex("BF0068E0"),
     "C1:3024 LDA $E00A50,X -> LDA $E06800,X (monsters 256-383)"),

    # --- itemNames stride x9 -> x13 ---
    (0x12FEB, b"\x09", b"\x0D", "C1:2FEA+1 item stride (JSR $FEBA path)"),
    (0x15E84, b"\x09", b"\x0D", "C1:5E83+1 item stride (JSR $FE4B path)"),

    # --- battleCommandName stride x7 -> x11 ---
    (0x12BD2, b"\x07", b"\x0B", "C1:2BD1+1 command stride ($2BCF helper; callers 12A33/12C01/1325F/13C05)"),
    (0x1431B, b"\x07", b"\x0B", "C1:431A+1 command stride (inline)"),

    # --- attackName stride x12 -> x16 ---
    (0x142A1, b"\x0C", b"\x10", "C1:42A0+1 attack stride (inline)"),
    (0x15861, b"\x0C", b"\x10", "C1:5860+1 attack stride (inline)"),
    (0x202FCE, b"\x0C", b"\x10", "$E02FCD+1 attack stride (inside $E02FC9 JML shim)"),

    # --- monsterSpecialAttackName stride x16 -> x20 ---
    (0x12B94, b"\x10", b"\x14", "C1:2B93+1 monSpec stride ($2B91 helper; callers 12BBB/13C45)"),

    # --- abilityName stride: relocate $E02FB2/$E02FB6 with x20 math ---
    # New dual-entry routine at $E09920 (freespace, verified $FF):
    #   +0  LDA [$B8]    (battle entry, was $E02FB2)
    #   +2  BRA +3
    #   +4  LDA $DBF7    (width-calc entry, was $E02FB6)
    #   +7  REP #$20 / AND #$00FF / ASL ASL / PHA / ASL ASL / CLC /
    #       ADC $01,S / TAX / PLA / LDA #$0000 / SEP #$20 / RTL
    (0x209920,
     bytes(28),  # placeholder, checked as freespace below instead
     bytes.fromhex("A7B8 8003 ADF7DB C220 29FF00 0A0A 48 0A0A 18 6301 AA 68 A90000 E220 6B".replace(" ", "")),
     "$E09920 ability stride x20 routine (dual entry)"),
    (0x12BA1, bytes.fromhex("B22FE0"), bytes.fromhex("2099E0"),
     "C1:2BA0+1 JSL $E02FB2 -> $E09920 (battle ability name)"),
    (0x13C23, bytes.fromhex("B62FE0"), bytes.fromhex("2499E0"),
     "C1:3C22+1 JSL $E02FB6 -> $E09924 (ability width calc)"),

    # --- VWF width engine embedded table addresses (split bank+LDY form) ---
    # battleCommandName $E01150 -> $E07D00 (bank E0 unchanged)
    (0x202F51, bytes.fromhex("5011"), bytes.fromhex("007D"),
     "$E02F50+1 width-engine LDY: battleCommandName addr"),
    # abilityName $E70900 -> $E08120
    (0x202F56, b"\xE7", b"\xE0", "$E02F55+1 width-engine bank: abilityName"),
    (0x202F58, bytes.fromhex("0009"), bytes.fromhex("2081"),
     "$E02F57+1 width-engine LDY: abilityName addr"),
    # monsterSpecialAttackName $E73700 -> $E09420
    (0x202F5D, b"\xE7", b"\xE0", "$E02F5C+1 width-engine bank: monSpec"),
    (0x202F5F, bytes.fromhex("0037"), bytes.fromhex("2094"),
     "$E02F5E+1 width-engine LDY: monSpec addr"),
]

# Phase 2 (NOT applied): char-count loop counters, operand file offsets.
# Bump these once correct resolution is confirmed, to draw longer names.
COUNTERS = {
    "monsterName":       [0x13019],                                  # 10
    "battleCommandName": [0x12A37, 0x12C05, 0x13263, 0x14339, 0x13C09],  # 7
    "itemNames":         [0x12FF4, 0x15E8D],                         # 9
    "abilityName":       [0x12BA6, 0x13C29],                         # 16
    "attackName":        [0x142AA, 0x1586B, 0x202FCA],               # 12, 9, 9
    "monsterSpecialAttackName": [0x12BBF, 0x13C49],                  # 16
}


def snes_to_file(addr):
    return addr - 0xC00000 if addr >= 0xC00000 else addr


def main():
    print("=== FFV String Table Expansion v4 (root fix) ===\n")
    shutil.copy(INPUT_ROM, OUTPUT_ROM)
    rom = bytearray(OUTPUT_ROM.read_bytes())
    print(f"Base: {INPUT_ROM} ({len(rom):,} bytes)\n")

    errors = []

    # 1. Relocate + pad tables
    print("--- Relocating tables ---")
    for name, old_addr, old_size, count, new_size, new_addr in TABLES:
        old_file, new_file = snes_to_file(old_addr), snes_to_file(new_addr)
        region = rom[new_file:new_file + count * new_size]
        if any(b != 0xFF for b in region):
            errors.append(f"{name}: target ${new_addr:06X} not clean freespace!")
        for i in range(count):
            entry = rom[old_file + i*old_size : old_file + i*old_size + old_size]
            rom[new_file + i*new_size : new_file + (i+1)*new_size] = \
                entry + bytes([0xFF] * (new_size - old_size))
        print(f"  {name}: {count} x {old_size}->{new_size}B at ${new_addr:06X}")

    # 2. Contiguous pointer operands
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

    # 3. Byte patches (strides, multiply rewrite, relocated ability routine)
    print("\n--- Byte patches ---")
    for off, old, new, desc in BYTE_PATCHES:
        if off == 0x209920:
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
        print("\n!!! BUILD ABORTED - verification errors !!!")
        for e in errors:
            print("  " + e)
        return 1

    OUTPUT_ROM.write_bytes(rom)
    print(f"\nWrote {OUTPUT_ROM} ({len(rom):,} bytes)")
    print("VWF width table $E05640-$E056FF untouched (no $E05680 hooks).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
