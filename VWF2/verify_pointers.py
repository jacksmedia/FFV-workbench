"""Verify and find correct pointer offsets"""
rom = open('../ff5c.sfc', 'rb').read()

# Expected addresses to find
targets = [
    ("monsterName",     0xE00050, "50 00 E0"),
    ("itemNames",       0xD11380, "80 13 D1"),
    ("battleCommandName", 0xE01150, "50 11 E0"),
    ("abilityName",     0xE70900, "00 09 E7"),
    ("attackName",      0xE70F90, "90 0F E7"),
    ("monsterSpecialAttackName", 0xE73700, "00 37 E7"),
]

# Search ranges (C1 bank and C3 bank)
ranges = [
    (0x10000, 0x20000, "C1"),
    (0x30000, 0x40000, "C3"),
    (0x0D0000, 0x0E0000, "CD"),
]

for name, addr, pattern_str in targets:
    pattern = bytes([addr & 0xFF, (addr >> 8) & 0xFF, (addr >> 16) & 0xFF])
    print(f"\n{name} (${addr:06X} = {pattern.hex()}):")

    for start, end, bank in ranges:
        for offset in range(start, min(end, len(rom) - 2)):
            if rom[offset:offset+3] == pattern:
                # Check if preceded by BF (LDA long,X)
                if offset > 0 and rom[offset-1] == 0xBF:
                    snes_addr = offset - 1 + 0xC00000 - (start - 0x10000) if start == 0x10000 else offset - 1 + 0xC00000
                    print(f"  ${offset:05X} ({bank}) - BF at ${offset-1:05X} (SNES ${snes_addr:06X})")
                else:
                    # Might be data pointer
                    print(f"  ${offset:05X} ({bank}) - data pointer")
