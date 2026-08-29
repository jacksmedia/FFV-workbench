"""Quantify expansion need per unexpanded table + freespace + ref scan."""
from pathlib import Path

ROM = Path('../ff5c.sfc').read_bytes()
f = lambda a: a - 0xC00000 if a >= 0xC00000 else a

tbl = {}
for line in Path('ffv_menufont_ff5c.tbl').read_text(encoding='utf-8').splitlines():
    raw = line.split(';')[0].strip()
    if '=' in raw and len(raw.split('=')[0]) == 2:
        k, v = raw.split('=', 1)
        try:
            tbl[int(k, 16)] = v
        except ValueError:
            pass

# ligature/compound codes per tbl header: $A6-$A9 and $B1-$BB; plus any
# mapping whose display string is 2+ letters (e.g. "il") marks compression.
LIG = set(range(0xA6, 0xAA)) | set(range(0xB1, 0xBC))
multi = {k for k, v in tbl.items()
         if len(v) >= 2 and v.isalpha() and 0x20 <= k <= 0xE2}
LIG |= multi
print(f'ligature-ish codes: {sorted(hex(x) for x in LIG)}')

def decode(bs):
    return ''.join(tbl.get(b, '<%02X>' % b) for b in bs)

TABLES = [
    ('spellName',         0xD11C80,  6,  87),
    ('jobName',           0xD15600,  8,  22),
    ('characterNames',    0xD15500,  6,   5),
    ('abilityNameInnate', 0xD16200,  8,  33),
    ('battleMessage',     0xE72760,  7, 256),
]

for name, addr, size, count in TABLES:
    full = lig = 0
    lig_samples = []
    for i in range(count):
        e = ROM[f(addr)+i*size : f(addr)+(i+1)*size]
        # "full" = last byte is a real glyph (not space $20/$FF/$00)
        if e[-1] not in (0x20, 0xFF, 0x00, 0x01):
            full += 1
        if any(b in LIG for b in e):
            lig += 1
            if len(lig_samples) < 6:
                lig_samples.append(f'[{i}] {decode(e)}')
    print(f'\n{name}: {count}x{size}  full-width entries: {full}  with ligature codes: {lig}')
    for s in lig_samples:
        print('    ' + s)

# freespace in bank E0 tail (after our tables+routine, before dialog @E10000)
region = ROM[0x20993C:0x210000]
runs, cur = [], 0
for b in region:
    if b == 0xFF:
        cur += 1
    else:
        if cur > 64:
            runs.append(cur)
        cur = 0
if cur > 64:
    runs.append(cur)
nonff = sum(1 for b in region if b != 0xFF)
print(f'\nBank E0 tail $E0993C-$E10000: {len(region)} bytes, non-FF: {nonff}, FF-runs>64: {runs[:10]}')

# contiguous 3-byte address refs for each candidate table
for name, addr, size, count in TABLES:
    pat = bytes([addr & 0xFF, (addr >> 8) & 0xFF, (addr >> 16) & 0xFF])
    hits = []
    start = 0
    while True:
        idx = ROM.find(pat, start)
        if idx < 0:
            break
        hits.append(f'${idx:06X}')
        start = idx + 1
    print(f'{name} ({pat.hex()}): refs at ' + ', '.join(hits))
