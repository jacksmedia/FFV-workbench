"""Dump first N item names from FF2US-format ROM (9 bytes/name at 0x78000).
FF2US text: 0x42-0x5B = A-Z, 0x5C-0x75 = a-z, 0x80-0x89 = 0-9, 0xFF = space.
Icons are < 0x42."""
import sys

def ch(b):
    if 0x42 <= b <= 0x5B: return chr(b - 0x42 + 65)
    if 0x5C <= b <= 0x75: return chr(b - 0x5C + 97)
    if 0x80 <= b <= 0x89: return chr(b - 0x80 + 48)
    if b == 0xFF: return " "
    return f"[{b:02X}]"

rom = open(sys.argv[1], "rb").read()
n = int(sys.argv[2]) if len(sys.argv) > 2 else 20
for i in range(n):
    raw = rom[0x78000 + i*9: 0x78000 + i*9 + 9]
    print(f"item {i:3} ({i:02X}): {''.join(ch(b) for b in raw)}")
