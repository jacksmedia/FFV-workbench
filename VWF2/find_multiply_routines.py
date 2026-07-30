"""
Find multiplication routines for monster name lookup.
The stride calculation (index * entry_size) happens before the display loop.
"""
rom = open('../ff5c.sfc', 'rb').read()

# Common 65816 multiply patterns:
# 1. Dedicated multiply routine - look for JSR/JSL calls
# 2. Shift-and-add: ASL (0A, 06, 0E, 1E, 16) + ADC
# 3. Table of offsets

# Search for routines that reference $E00050 or compute offsets
print("=== Looking for monster name offset computation ===\n")

# The display routine at C1:3010 is probably called via JSR/JSL
# Let's find who calls it

# Search for JSR $3010 (20 10 30) or JSL $C13010 (22 10 30 C1)
print("Calls to C1:3010 display routine:")
for offset in range(0x10000, 0x20000):
    # JSR $3010
    if rom[offset:offset+3] == bytes([0x20, 0x10, 0x30]):
        print(f"  ${offset:05X}: JSR $3010")
    # JSL $C13010
    if rom[offset:offset+4] == bytes([0x22, 0x10, 0x30, 0xC1]):
        print(f"  ${offset:05X}: JSL $C13010")

# Also look for where X register is set up before the table access
# Common pattern: TAX (AA), TXA (8A), LDX (A2, A6, AE, BE)
# Combined with multiplication

print("\n\n=== Looking for multiplication setup ===")
# Look for patterns like: multiply subroutine followed by storing to X
# Or ASL chains (multiply by 2) near our pointers

# Search for JSR $3929 (a known FFV multiply routine in some versions)
print("\nJSR patterns near $13000-$13050:")
for offset in range(0x12F00, 0x13100):
    if rom[offset] == 0x20:  # JSR
        target = rom[offset+1] + (rom[offset+2] << 8)
        print(f"  ${offset:05X}: JSR ${target:04X}")

print("\n\n=== Searching for multiply-by-10 patterns ===")
# x*10 = x*8 + x*2 = (x<<3) + (x<<1)
# Look for ASL ASL ASL (triple shift = *8) patterns
for offset in range(0x10000, 0x20000):
    # Three consecutive ASLs would be 0A 0A 0A
    if rom[offset:offset+3] == bytes([0x0A, 0x0A, 0x0A]):
        ctx = rom[offset-4:offset+8].hex()
        print(f"  ${offset:05X}: ASL ASL ASL pattern: {ctx}")
