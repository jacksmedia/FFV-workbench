"""Dump battle character palettes ($1C/FD00, file 0xE7D00) as RGB from
base and hacked ROM, plus the character record pointer table at $0F/C625."""
import sys

def rgb(w):
    r, g, b = w & 31, (w >> 5) & 31, (w >> 10) & 31
    return r * 8, g * 8, b * 8

def hue_name(r, g, b):
    if max(r, g, b) < 40: return "blk"
    if min(r, g, b) > 200: return "wht"
    if r > g and r > b: return "red" if g < r * 0.6 else "org/ylw"
    if g > r and g > b: return "grn"
    if b > r and b > g: return "pur" if r > b * 0.55 else "blu"
    if r > 150 and g > 150 and b < 100: return "ylw"
    return "gry"

for label, path in (("BASE", sys.argv[1]), ("HACK", sys.argv[2])):
    rom = open(path, "rb").read()
    print(f"=== {label} palettes at $1C/FD00 ===")
    for p in range(16):
        words = [rom[0xE7D00 + p*0x20 + i*2] | rom[0xE7D00 + p*0x20 + i*2 + 1] << 8 for i in range(16)]
        cols = [rgb(w) for w in words]
        # summarize: dominant hues of the non-grayscale mid colors
        summary = " ".join(f"{r:3},{g:3},{b:3}({hue_name(r,g,b)})" for r, g, b in cols[1:8])
        print(f"pal {p:2}: {summary}")
    print()

rom = open(sys.argv[2], "rb").read()
print("=== char record pointers at $0F/C625 (file 0x7C625) ===")
for i in range(8):
    v = rom[0x7C625 + i*2] | rom[0x7C625 + i*2 + 1] << 8
    print(f"slot {i}: ${v:04X}")
