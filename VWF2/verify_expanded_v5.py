"""Static verification of ff5c_expanded_v5.sfc (extends v4 checks)."""
from pathlib import Path

BASE = Path('../ff5c.sfc').read_bytes()
NEW = Path('ff5c_expanded_v5.sfc').read_bytes()
f = lambda a: a - 0xC00000 if a >= 0xC00000 else a

TABLES = [
    ("monsterName",              0xE00050, 10, 384, 16, 0xE05800),
    ("itemNames",                0xD11380,  9, 256, 13, 0xE07000),
    ("battleCommandName",        0xE01150,  7,  96, 11, 0xE07D00),
    ("abilityName",              0xE70900, 16, 105, 20, 0xE08120),
    ("attackName",               0xE70F90, 12, 168, 16, 0xE089A0),
    ("monsterSpecialAttackName", 0xE73700, 16,  64, 20, 0xE09420),
    ("spellName",                0xD11C80,  6,  87, 12, 0xE09940),
    ("jobName",                  0xD15600,  8,  22, 12, 0xE09D60),
    ("abilityNameInnate",        0xD16200,  8,  33, 12, 0xE09E70),
]

tbl = {}
for line in Path('ffv_menufont_ff5c.tbl').read_text(encoding='utf-8').splitlines():
    raw = line.split(';')[0].strip()
    if '=' in raw and len(raw.split('=')[0]) == 2:
        k, v = raw.split('=', 1)
        try:
            tbl[int(k, 16)] = v
        except ValueError:
            pass

def decode(bs):
    return ''.join(tbl.get(b, '<%02X>' % b) for b in bs).replace('[FF]', '_')

fail = 0
print('--- Table integrity + stride read-path (every entry) ---')
for name, old_a, old_s, count, new_s, new_a in TABLES:
    bad = 0
    for i in range(count):
        orig = BASE[f(old_a)+i*old_s : f(old_a)+i*old_s+old_s]
        # what the patched code reads: new_base + i*new_stride, old_s chars
        got = NEW[f(new_a)+i*new_s : f(new_a)+i*new_s+old_s]
        pad = NEW[f(new_a)+i*new_s+old_s : f(new_a)+(i+1)*new_s]
        if got != orig or any(b != 0xFF for b in pad):
            bad += 1
    print(f'  {name}: {count-bad}/{count} OK')
    fail += bad

print('\n--- Sample decodes (patched read path) ---')
for name, old_a, old_s, count, new_s, new_a in TABLES[6:]:
    for i in ([0, 8, 21, 35, 86] if name == 'spellName' else [0, 8, 10, 21]):
        if i >= count:
            continue
        bs = NEW[f(new_a)+i*new_s : f(new_a)+i*new_s+old_s]
        print(f'  {name}[{i}]: {decode(bs)}')

print('\n--- Code spot checks ---')
checks = [
    ('$E0A000 shim (cnt=6, stride=12)', 0x20A000, 'a9068570a90c85806b'),
    ('shim call @12ABD', 0x12ABD, '2200a0e0eaea'),
    ('shim call @12C41', 0x12C41, '2200a0e0eaea'),
    ('shim call @12FCB', 0x12FCB, '2200a0e0eaea'),
    ('spell BF @12FD6', 0x12FD6, 'bf4099e0'),
    ('spell BF @15839', 0x15839, 'bf4099e0'),
    ('job BF @12A7F', 0x12A7F, 'bf609de0'),
    ('job BF @1312B', 0x1312B, 'bf609de0'),
    ('width spellName', 0x202F40, 'a9e0a04099'),
    ('width spellName+1', 0x202F47, 'a9e0a04199'),
    ('$E00030 multiply x16 (v4)', 0x200030, '5a9bb938400a0a0a0aaa7a6b'),
    ('$E09920 ability x20 (v4)', 0x209920, 'a7b88003adf7dbc22029ff000a0a480a0a186301aa68a90000e2206b'),
]
for name, off, want in checks:
    got = NEW[off:off+len(want)//2].hex()
    ok = got == want
    fail += (not ok)
    print(f'  {name}: {"OK" if ok else "FAIL got " + got}')

same = NEW[0x205640:0x205700] == BASE[0x205640:0x205700]
print(f'  VWF width table $E05640-$E056FF: {"OK (matches base)" if same else "FAIL"}')
fail += (not same)

print(f'\n{"ALL CHECKS PASSED" if fail == 0 else "FAILURES: %d" % fail}')
