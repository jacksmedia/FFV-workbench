"""Apply an IPS patch and compare the result to a reference ROM."""
import sys

def apply(rom, ips):
    data = bytearray(rom)
    assert ips[:5] == b"PATCH"
    i = 5
    while i < len(ips):
        if ips[i:i+3] == b"EOF" and (i + 3 == len(ips) or i + 6 == len(ips)):
            i += 3
            if i + 3 <= len(ips):  # truncate extension
                data = data[:int.from_bytes(ips[i:i+3], "big")]
            break
        off = int.from_bytes(ips[i:i+3], "big"); i += 3
        size = int.from_bytes(ips[i:i+2], "big"); i += 2
        if size == 0:
            size = int.from_bytes(ips[i:i+2], "big"); i += 2
            chunk = bytes([ips[i]]) * size; i += 1
        else:
            chunk = ips[i:i+size]; i += size
        if off + size > len(data):
            data.extend(b"\x00" * (off + size - len(data)))
        data[off:off+size] = chunk
    return bytes(data)

rom = open(sys.argv[1], "rb").read()
ips = open(sys.argv[2], "rb").read()
ref = open(sys.argv[3], "rb").read()
out = apply(rom, ips)
print(f"patched size {len(out):#x}, reference size {len(ref):#x}")
if out == ref:
    print("EXACT MATCH: reference = base + ips")
else:
    diffs = [i for i in range(min(len(out), len(ref))) if out[i] != ref[i]]
    print(f"{len(diffs)} differing bytes")
    if diffs:
        print(f"first diff at {diffs[0]:06X}, last at {diffs[-1]:06X}")
        # summarize diff regions
        regions = []
        for d in diffs:
            if regions and d - regions[-1][1] < 512:
                regions[-1][1] = d
            else:
                regions.append([d, d])
        print(f"{len(regions)} diff regions (first 30):")
        for s, e in regions[:30]:
            print(f"  {s:06X}-{e:06X}")
