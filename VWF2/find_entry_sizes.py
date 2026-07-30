"""Find all entry size constants that need patching"""
rom = open('../ff5c.sfc', 'rb').read()

# Search for LDA #$0C (12) near attackName pointers
print("attackName context (searching for LDA #$0C = 12):")
for ptr_offset in [0x12FBD, 0x142AE, 0x1586F]:
    print(f"\n  Near ${ptr_offset:05X}:")
    for offset in range(ptr_offset - 64, ptr_offset + 8):
        if offset > 0 and offset < len(rom) - 1:
            if rom[offset] == 0xA9 and rom[offset+1] == 0x0C:
                print(f"    Found LDA #$0C at ${offset:05X}")

# Show hex near each size location
print("\n\n=== Verifying size locations ===\n")

size_locs = [
    ("monsterName (10->14)", 0x13018, 0x0A, 0x0E),
    ("itemNames (9->13)", 0x12FEA, 0x09, 0x0D),
    ("itemNames (9->13)", 0x12FF3, 0x09, 0x0D),
    ("battleCommandName (7->11)", 0x12A36, 0x07, 0x0B),
    ("abilityName (16->20)", 0x12B93, 0x10, 0x14),
    ("abilityName (16->20)", 0x12BA5, 0x10, 0x14),
    ("monsterSpecialAttackName (16->20)", 0x12BBE, 0x10, 0x14),
]

for name, offset, old, new in size_locs:
    actual = rom[offset+1] if rom[offset] == 0xA9 else rom[offset]
    match = "OK" if rom[offset] == 0xA9 and rom[offset+1] == old else "MISMATCH"
    ctx = rom[offset:offset+4].hex()
    print(f"  ${offset:05X}: {ctx}  ({name}) {match}")
