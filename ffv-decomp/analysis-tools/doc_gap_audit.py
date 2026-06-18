"""Documentation gap audit for FFV SNES disassembly docs.

Analyzes the J ROM (canonical) and RPGe ROM:
 1. Classifies 4KB regions as code-like / text / data / free space.
 2. Extracts all JSL (22) and JML (5C) cross-bank targets with call counts.
 3. Flags frequently-called targets that fall OUTSIDE documented ranges.

Documented coverage (verified by inspecting the doc files themselves):
  C0/0000-CCEF   Lenophis txt (RTF by 1337_5k37c3r only reaches C0/60FF)
  C1/0000-FFFF   noisecross (complete)
  C2/0000-9FFF   Modoh c2battle.asm (complete for battle code)
  C3/0000-016D   Lenophis fragment
  C4/0000-0645   Lenophis fragment
  E0/2D40-31B1   Lenophis fragments (RPGe only)
"""
import collections
import math

J_ROM = "_Final Fantasy V J (CRC32 = C1BC267D).sfc"
RPGE_ROM = "_FFV RPGe (CRC32 = 17444605).sfc"

DOCUMENTED = [  # (bank, start, end) inclusive ranges with real disassembly
    (0xC0, 0x0000, 0xCCEF),
    (0xC1, 0x0000, 0xFFFF),
    (0xC2, 0x0000, 0x9FFF),
    (0xC3, 0x0000, 0x016D),
    (0xC4, 0x0000, 0x0645),
    (0xE0, 0x2D40, 0x31B1),
]

def load(path):
    with open(path, "rb") as f:
        return f.read()

def addr_to_off(bank, addr):
    return (bank - 0xC0) * 0x10000 + addr

def off_to_addr(off):
    return 0xC0 + (off >> 16), off & 0xFFFF

def is_documented(bank, addr):
    for b, s, e in DOCUMENTED:
        if bank == b and s <= addr <= e:
            return True
    return False

def entropy(chunk):
    counts = collections.Counter(chunk)
    n = len(chunk)
    return -sum((c / n) * math.log2(c / n) for c in counts.values())

def classify(chunk):
    counts = collections.Counter(chunk)
    top_byte, top_count = counts.most_common(1)[0]
    if top_count / len(chunk) > 0.95:
        return f"FILL(${top_byte:02X})"
    e = entropy(chunk)
    # crude code heuristic: density of common 65816 opcodes in plausible positions
    code_ops = sum(1 for b in chunk if b in (
        0x60, 0x6B, 0x08, 0x28, 0x8B, 0xAB, 0x48, 0x68, 0xDA, 0xFA,
        0xC2, 0xE2, 0x20, 0x22, 0xA9, 0x85, 0x8D, 0xAD, 0xA5, 0xBF, 0x9F))
    code_ratio = code_ops / len(chunk)
    if e > 7.6:
        return "HIGH-ENTROPY (compressed/gfx)"
    if code_ratio > 0.30 and e > 5.0:
        return "CODE-LIKE"
    return f"DATA (e={e:.1f})"

def region_map(rom, label):
    print(f"\n===== REGION MAP: {label} =====")
    prev = None
    run_start = 0
    for off in range(0, len(rom), 0x1000):
        cls = classify(rom[off:off + 0x1000])
        if cls != prev:
            if prev is not None:
                b0, a0 = off_to_addr(run_start)
                b1, a1 = off_to_addr(off - 1)
                print(f"  {b0:02X}/{a0:04X} - {b1:02X}/{a1:04X}  {prev}")
            prev, run_start = cls, off
    b0, a0 = off_to_addr(run_start)
    b1, a1 = off_to_addr(len(rom) - 1)
    print(f"  {b0:02X}/{a0:04X} - {b1:02X}/{a1:04X}  {prev}")

def call_scan(rom, label, max_bank):
    """Scan for JSL targets; count call sites per target."""
    targets = collections.Counter()
    sites = collections.defaultdict(list)
    for i in range(len(rom) - 3):
        if rom[i] == 0x22:  # JSL long
            lo, hi, bank = rom[i + 1], rom[i + 2], rom[i + 3]
            if 0xC0 <= bank <= max_bank:
                tgt = (bank, hi << 8 | lo)
                targets[tgt] += 1
                if len(sites[tgt]) < 4:
                    sites[tgt].append(off_to_addr(i))
    print(f"\n===== UNDOCUMENTED JSL TARGETS (>=3 call sites): {label} =====")
    rows = [(t, c) for t, c in targets.items()
            if c >= 3 and not is_documented(*t)]
    rows.sort(key=lambda r: -r[1])
    for (bank, addr), count in rows[:60]:
        caller_str = ", ".join(f"{b:02X}/{a:04X}" for b, a in sites[(bank, addr)])
        print(f"  {bank:02X}/{addr:04X}  called x{count:<4} e.g. from {caller_str}")

def vectors(rom, label):
    print(f"\n===== VECTORS: {label} =====")
    base = 0xFFE0
    names = {0xFFEA: "NMI(native)", 0xFFEE: "IRQ(native)", 0xFFE6: "BRK",
             0xFFE8: "ABORT", 0xFFE4: "COP", 0xFFFC: "RESET(emu)",
             0xFFFA: "NMI(emu)", 0xFFFE: "IRQ(emu)"}
    for vec, name in sorted(names.items()):
        lo, hi = rom[vec], rom[vec + 1]
        print(f"  {name:12} -> 00/{hi:02X}{lo:02X}")

j = load(J_ROM)
r = load(RPGE_ROM)

vectors(j, "J")
region_map(j, "J (2MB)")
call_scan(j, "J", 0xDF)

# RPGe: what did the translators add in E0-E7 / change in C0-DF?
print("\n===== J vs RPGe: changed 4KB regions in C0-DF =====")
diffs = []
for off in range(0, len(j), 0x1000):
    a, b = j[off:off + 0x1000], r[off:off + 0x1000]
    if a != b:
        nd = sum(1 for x, y in zip(a, b) if x != y)
        diffs.append((off, nd))
for off, nd in diffs:
    bk, ad = off_to_addr(off)
    print(f"  {bk:02X}/{ad:04X}  {nd:5d} bytes differ")

region_map(r[0x200000:], "RPGe expansion banks E0-E7 (offset rebased)")
call_scan(r, "RPGe (incl. E0-E7 targets)", 0xE7)
