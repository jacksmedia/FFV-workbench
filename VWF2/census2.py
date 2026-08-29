"""Find ALL text-encoded arrays in the JSON + decode abilityNameInnate."""
import json
from pathlib import Path

d = json.load(open('../ff5u-sfc.json', encoding='utf-8'))
asm = d['assembly']
ROM = Path('../ff5c.sfc').read_bytes()

print('--- All assembly entries with text-ish type/encoding ---')
for k, o in asm.items():
    if not isinstance(o, dict):
        continue
    sub = o.get('assembly')
    enc = o.get('encoding', '')
    stype = ''
    if isinstance(sub, dict):
        stype = str(sub.get('type', '')) + ' ' + str(sub.get('encoding', ''))
    blob = (str(o.get('type','')) + ' ' + enc + ' ' + stype).lower()
    if 'text' in blob:
        lo, hi = [int(x, 16) for x in o['range'].split('-')]
        n = o.get('array', {}).get('length', '?')
        size = (hi - lo) // n if isinstance(n, int) and n else '?'
        print(f'  {k:28} ${lo:06X}-${hi:06X} count={n!s:>5} entry={size!s:>4}  [{blob.strip()}]')

print()
print('--- abilityNameInnate raw details ---')
o = asm['abilityNameInnate']
print(json.dumps(o, indent=1)[:600])

tbl = {}
for line in Path('ffv_menufont_ff5c.tbl').read_text(encoding='utf-8').splitlines():
    line = line.split(';')[0].strip()
    if '=' in line and len(line.split('=')[0]) == 2:
        k2, v = line.split('=', 1)
        try:
            tbl[int(k2, 16)] = v
        except ValueError:
            pass

def decode(bs):
    return ''.join(tbl.get(b, '<%02X>' % b) for b in bs)

f = lambda a: a - 0xC00000 if a >= 0xC00000 else a
print()
print('--- abilityNameInnate decoded as 8-byte entries ---')
for i in range(6):
    print(f'  [{i}] {decode(ROM[f(0xD16200)+i*8 : f(0xD16200)+(i+1)*8])}')
print('--- abilityNameInnateLong decoded as 24-byte entries ---')
for i in range(4):
    print(f'  [{i}] {decode(ROM[f(0xE77060)+i*24 : f(0xE77060)+(i+1)*24])}')
