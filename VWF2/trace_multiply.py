"""
Trace the monster name offset calculation.
The display code at C1:3010 uses X as the byte offset.
Find where X is set up with index * entry_size.
"""
rom = open('../ff5c.sfc', 'rb').read()

# Look for code that sets X register before accessing the monster table
# Common patterns:
# - TAX (AA) - transfer A to X
# - LDX (A2, A6, AE, BE) - load X
# - PHX/PLX - push/pull X

# The battle system likely stores monster ID in RAM (like $3Cxx)
# and computes offset = monster_id * 10

# Search for references to the multiply routine
# FFV often uses a generic multiply at C1:3B29 or similar

print("=== Searching for multiply-by-10 setup near monster name code ===\n")

# Look for patterns like: LDA #$0A / JSR multiply
# Or inline: ASL / STA / ASL / ASL / CLC / ADC

# Check around $12F00-$13100 for multiply patterns
print("Code patterns in C1:2F00-3100 range:\n")

# Look for TAX (AA) followed by table access
for offset in range(0x12F00, 0x13100):
    if rom[offset] == 0xAA:  # TAX
        # Look ahead for BF (LDA long,X)
        for lookahead in range(1, 20):
            if offset + lookahead < len(rom) and rom[offset + lookahead] == 0xBF:
                ctx = rom[offset:offset+lookahead+4].hex()
                print(f"  ${offset:05X}: TAX then BF at +{lookahead}: {ctx}")
                break

print("\n\n=== Checking for multiply routines called near $13010 ===\n")

# The JSR at $13017 goes to $0AA9 - let's trace that
# But first, let's look for where the monster offset is computed

# Search for the multiply-by-10 pattern: ASL ASL ASL then ADC (add x2)
# x*10 = x*8 + x*2
for offset in range(0x12E00, 0x13200):
    # Pattern: ASL ASL ASL ... ADC
    if rom[offset] == 0x0A and rom[offset+1] == 0x0A and rom[offset+2] == 0x0A:
        # Found ASL ASL ASL, look for CLC ADC
        for i in range(3, 15):
            if rom[offset+i] == 0x18 and rom[offset+i+1] in [0x65, 0x6D, 0x69, 0x7D]:
                ctx = rom[offset:offset+i+4].hex()
                print(f"  ${offset:05X}: ASL*3 + CLC ADC pattern: {ctx}")
                break

print("\n\n=== Looking for where monster ID is loaded ===\n")

# Monster ID might be at a RAM location like $3C20 range
# Look for LDA $3Cxx near our code
for offset in range(0x12E00, 0x13200):
    if rom[offset] == 0xAD:  # LDA absolute
        addr = rom[offset+1] + (rom[offset+2] << 8)
        if 0x3C00 <= addr <= 0x3D00:
            ctx = rom[offset:offset+8].hex()
            print(f"  ${offset:05X}: LDA ${addr:04X} - {ctx}")
