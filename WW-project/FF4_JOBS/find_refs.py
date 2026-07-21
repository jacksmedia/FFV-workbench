"""Find references to key battle sprite/palette addresses in FF4 ROMs.

Searches for little-endian byte patterns of the long addresses (and their
16-bit halves paired with a bank load) in base vs hacked ROM, reporting
LoROM code addresses of each hit.
"""
import sys

def lorom(off):
    return f"${off // 0x8000:02X}/{0x8000 + (off % 0x8000):04X}"

def scan(data, label, patterns):
    print(f"=== {label} ===")
    for name, pat in patterns:
        hits = []
        i = data.find(pat)
        while i != -1:
            hits.append(i)
            i = data.find(pat, i + 1)
        locs = " ".join(f"{h:06X}({lorom(h)})" for h in hits[:20])
        extra = f" +{len(hits)-20} more" if len(hits) > 20 else ""
        print(f"{name:24} {len(hits):3} hits: {locs}{extra}")
    print()

patterns = [
    # long address $1A8000 little-endian (e.g. LDA $1A8000,X operand / pointer)
    ("ptr 00 80 1A", bytes([0x00, 0x80, 0x1A])),
    # LDA #$1A (bank byte immediate, 8-bit) followed by nothing specific - too noisy, skip
    # palette table $1CFD00
    ("ptr 00 FD 1C", bytes([0x00, 0xFD, 0x1C])),
    # 16-bit halves: #$8000 immediate is noisy; #$FD00 less so
    ("A9 00 FD (LDA #$FD00)", bytes([0xA9, 0x00, 0xFD])),
    ("A9 00 80 (LDA #$8000)", bytes([0xA9, 0x00, 0x80])),
    ("A9 1A (LDA #$1A 8bit)", bytes([0xA9, 0x1A])),
    ("A9 1C (LDA #$1C 8bit)", bytes([0xA9, 0x1C])),
]

base = open(sys.argv[1], "rb").read()
hack = open(sys.argv[2], "rb").read()
scan(base, "BASE v1.1", patterns)
scan(hack, "HACK 1.5", patterns)
