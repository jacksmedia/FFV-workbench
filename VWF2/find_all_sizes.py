"""Find ALL entry size constants in battle/menu banks"""
rom = open('../ff5c.sfc', 'rb').read()

# Search for LDA #$0A (10) - monsterName old size
print("=== LDA #$0A (10) - monsterName old size ===")
print("C1 bank (battle):")
for offset in range(0x10000, 0x20000):
    if rom[offset] == 0xA9 and rom[offset+1] == 0x0A:
        snes = 0xC10000 + (offset - 0x10000)
        ctx = rom[offset:offset+8].hex()
        print(f"  ${offset:05X} ({snes:06X}): {ctx}")

print("\nC3 bank (menu):")
for offset in range(0x30000, 0x40000):
    if rom[offset] == 0xA9 and rom[offset+1] == 0x0A:
        snes = 0xC30000 + (offset - 0x30000)
        ctx = rom[offset:offset+8].hex()
        print(f"  ${offset:05X} ({snes:06X}): {ctx}")

# Also check C2 bank
print("\nC2 bank:")
for offset in range(0x20000, 0x30000):
    if rom[offset] == 0xA9 and rom[offset+1] == 0x0A:
        snes = 0xC20000 + (offset - 0x20000)
        ctx = rom[offset:offset+8].hex()
        print(f"  ${offset:05X} ({snes:06X}): {ctx}")
