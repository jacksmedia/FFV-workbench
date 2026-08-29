"""Census of all fixed-size name tables in ff5u-sfc.json vs expanded set."""
import json
from pathlib import Path

d = json.load(open('../ff5u-sfc.json', encoding='utf-8'))
asm = d['assembly']
ROM = Path('../ff5c.sfc').read_bytes()

tbl = {}
for line in Path('ffv_menufont_ff5c.tbl').read_text(encoding='utf-8').splitlines():
    line = line.split(';')[0].strip()
    if '=' in line and len(line.split('=')[0]) == 2:
        k, v = line.split('=', 1)
        try:
            tbl[int(k, 16)] = v
        except ValueError:
            pass

def decode(bs):
    return ''.join(tbl.get(b, '<%02X>' % b) for b in bs).replace('[FF]', '_')

f = lambda a: a - 0xC00000 if a >= 0xC00000 else a

DONE = {'monsterName', 'itemNames', 'battleCommandName', 'abilityName',
        'attackName', 'monsterSpecialAttackName'}

keys = ['abilityName', 'abilityNameInnate', 'abilityNameInnateLong',
        'attackName', 'attackNameLong', 'battleCommandName', 'characterNames',
        'itemNames', 'itemNamesLong', 'jobName', 'monsterName',
        'monsterSpecialAttackName', 'spellName']

for k in keys:
    o = asm[k]
    lo, hi = [int(x, 16) for x in o['range'].split('-')]
    n = o.get('array', {}).get('length')
    if not n:
        n = '?'
        size = '?'
    else:
        size = (hi - lo) // n
    mark = 'DONE' if k in DONE else '    '
    print(f'{mark} {k:26} ${lo:06X}  count={n!s:>4}  entry={size!s:>3}')
    if k not in DONE and isinstance(size, int):
        for i in [0, 1, 2, 3]:
            bs = ROM[f(lo) + i*size : f(lo) + (i+1)*size]
            print(f'         [{i}] {decode(bs)}')
