"""Search a ROM for byte patterns, report LoROM addresses, optionally
restricted to IPS-modified regions (pass the .ips as third arg)."""
import sys

def lorom(off):
    return f"${off // 0x8000:02X}/{0x8000 + (off % 0x8000):04X}"

def ips_regions(path):
    ips = open(path, "rb").read()
    i, regs = 5, []
    while i < len(ips):
        if ips[i:i+3] == b"EOF" and (i + 3 == len(ips) or i + 6 == len(ips)):
            break
        off = int.from_bytes(ips[i:i+3], "big"); i += 3
        size = int.from_bytes(ips[i:i+2], "big"); i += 2
        if size == 0:
            size = int.from_bytes(ips[i:i+2], "big"); i += 2; i += 1
        else:
            i += size
        regs.append((off, off + size))
    return regs

rom = open(sys.argv[1], "rb").read()
regs = ips_regions(sys.argv[2]) if len(sys.argv) > 2 and sys.argv[2].endswith(".ips") else None
pats = sys.argv[3 if regs else 2:]

def in_regs(i):
    if regs is None:
        return True
    return any(s <= i < e for s, e in regs)

for p in pats:
    pat = bytes.fromhex(p)
    hits = []
    i = rom.find(pat)
    while i != -1:
        if in_regs(i):
            hits.append(i)
        i = rom.find(pat, i + 1)
    print(f"{p}: {len(hits)} hits " + " ".join(lorom(h) for h in hits[:30]))
