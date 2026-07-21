"""Find JSL/JML hooks into expanded banks $20/$21 in the hacked ROM,
and cross-check which ones live inside IPS-modified regions."""
import sys

def lorom(off):
    return f"${off // 0x8000:02X}/{0x8000 + (off % 0x8000):04X}"

hack = open(sys.argv[1], "rb").read()

for opname, op in (("JSL", 0x22), ("JML", 0x5C)):
    print(f"=== {opname} into banks $20/$21 ===")
    for i in range(len(hack) - 3):
        if hack[i] == op and hack[i + 3] in (0x20, 0x21):
            target = hack[i + 1] | hack[i + 2] << 8 | hack[i + 3] << 16
            # only count plausible code targets ($8000+)
            if (target & 0xFFFF) >= 0x8000:
                print(f"{i:06X} {lorom(i)}  {opname} ${target:06X}")
    print()
