"""Dump IPS patch records with LoROM address mapping and region clustering.

Usage: python ips_dump.py <patch.ips> [--gap N]

FF4 US is LoROM: file offset -> SNES $bank:8000+off  (bank = off // 0x8000)
Clusters records separated by < gap bytes (default 256) into regions.
"""
import sys
import struct

def lorom(off):
    return f"${off // 0x8000:02X}/{0x8000 + (off % 0x8000):04X}"

def parse(path):
    data = open(path, "rb").read()
    assert data[:5] == b"PATCH", "not an IPS file"
    i = 5
    recs = []
    while i < len(data):
        if data[i:i+3] == b"EOF" and (i + 3 == len(data) or i + 6 == len(data)):
            break
        off = int.from_bytes(data[i:i+3], "big"); i += 3
        size = int.from_bytes(data[i:i+2], "big"); i += 2
        if size == 0:  # RLE
            rle_size = int.from_bytes(data[i:i+2], "big"); i += 2
            val = data[i]; i += 1
            recs.append((off, rle_size, True, bytes([val])))
        else:
            recs.append((off, size, False, data[i:i+size])); i += size
    return recs

def main():
    path = sys.argv[1]
    gap = 256
    if "--gap" in sys.argv:
        gap = int(sys.argv[sys.argv.index("--gap") + 1])
    recs = sorted(parse(path))
    total = sum(r[1] for r in recs)
    print(f"{len(recs)} records, {total} bytes total written")
    print()
    # cluster
    regions = []
    for off, size, rle, payload in recs:
        if regions and off - (regions[-1][1]) < gap:
            regions[-1][1] = max(regions[-1][1], off + size)
            regions[-1][2] += size
            regions[-1][3] += 1
        else:
            regions.append([off, off + size, size, 1])
    print(f"{len(regions)} regions (gap threshold {gap}):")
    print(f"{'file range':>17}  {'SNES range':>17}  {'bytes':>8}  recs")
    for start, end, written, n in regions:
        print(f"{start:07X}-{end:07X}  {lorom(start)}-{lorom(end-1)}  {written:8}  {n}")

if __name__ == "__main__":
    main()
