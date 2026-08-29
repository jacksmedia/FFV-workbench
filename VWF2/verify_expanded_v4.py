"""
verify_expanded_v4.py - Static verification of ff5c_expanded_v4.sfc

1. Table integrity: every entry's first old_size bytes at the new location
   must equal the original entry in the base ROM (padding must be $FF).
2. Monster read-path simulation: emulate exactly what the patched code does
   (new $E00030 gives X = id*16; the char loop INXes 10 times reading
   $E05800,X or $E06800,X) and compare against the original path
   (X = id*10, reads $E00050,X / $E00A50,X in the base ROM).
3. Decode sample names via the .tbl for eyeball confirmation.
"""
from pathlib import Path

BASE = bytearray(Path("../ff5c.sfc").read_bytes())
NEW = bytearray(Path("ff5c_expanded_v4.sfc").read_bytes())

TABLES = [
    ("monsterName",              0xE00050, 10, 384, 16, 0xE05800),
    ("itemNames",                0xD11380,  9, 256, 13, 0xE07000),
    ("battleCommandName",        0xE01150,  7,  96, 11, 0xE07D00),
    ("abilityName",              0xE70900, 16, 105, 20, 0xE08120),
    ("attackName",               0xE70F90, 12, 168, 16, 0xE089A0),
    ("monsterSpecialAttackName", 0xE73700, 16,  64, 20, 0xE09420),
]

f = lambda a: a - 0xC00000

# Load .tbl for display
tbl = {}
for line in Path("ffv_menufont_ff5c.tbl").read_text(encoding="utf-8").splitlines():
    line = line.split(";")[0].strip()
    if "=" in line and len(line.split("=")[0]) == 2:
        k, v = line.split("=", 1)
        try:
            tbl[int(k, 16)] = v
        except ValueError:
            pass

def decode(bs):
    return "".join(tbl.get(b, f"<{b:02X}>") for b in bs).replace("[FF]", "_")

# --- 1. Table integrity ---
print("--- Table integrity (all entries) ---")
fail = 0
for name, old_a, old_s, count, new_s, new_a in TABLES:
    bad = 0
    for i in range(count):
        orig = BASE[f(old_a) + i*old_s : f(old_a) + i*old_s + old_s]
        moved = NEW[f(new_a) + i*new_s : f(new_a) + (i+1)*new_s]
        if moved[:old_s] != orig or any(b != 0xFF for b in moved[old_s:]):
            bad += 1
    print(f"  {name}: {count - bad}/{count} OK")
    fail += bad

# --- 2. Monster read-path simulation ---
print("\n--- Monster read-path simulation ---")
mismatch = 0
for mid in range(384):
    # original path (base ROM)
    if mid < 256:
        x = mid * 10
        old_bytes = bytes(BASE[f(0xE00050) + x : f(0xE00050) + x + 10])
    else:
        x = (mid - 256) * 10
        old_bytes = bytes(BASE[f(0xE00A50) + x : f(0xE00A50) + x + 10])
    # patched path (new ROM): new $E00030 -> X = id*16, loop reads base+X..+9
    if mid < 256:
        x = mid * 16
        new_bytes = bytes(NEW[f(0xE05800) + x : f(0xE05800) + x + 10])
    else:
        x = (mid - 256) * 16
        new_bytes = bytes(NEW[f(0xE06800) + x : f(0xE06800) + x + 10])
    if new_bytes != old_bytes:
        mismatch += 1
        if mismatch <= 5:
            print(f"  MISMATCH id {mid}: {old_bytes.hex()} vs {new_bytes.hex()}")
print(f"  384 monster IDs: {384 - mismatch} match, {mismatch} mismatch")

# --- 3. Sample decodes ---
print("\n--- Sample monster names (patched path) ---")
for mid in [0, 1, 2, 5, 27, 100, 255, 256, 300, 383]:
    base_a, rel = (0xE05800, mid) if mid < 256 else (0xE06800, mid - 256)
    bs = bytes(NEW[f(base_a) + rel*16 : f(base_a) + rel*16 + 10])
    print(f"  id {mid:3}: {decode(bs)}")

print("\n--- Sample item/command/ability (patched tables, stride math) ---")
for label, base_a, stride, n, ids in [
    ("item", 0xE07000, 13, 9, [0, 1, 50]),
    ("cmd", 0xE07D00, 11, 7, [0, 1, 5]),
    ("ability", 0xE08120, 20, 16, [0, 5]),
    ("attack", 0xE089A0, 16, 12, [0, 10]),
    ("monSpec", 0xE09420, 20, 16, [0, 3]),
]:
    for i in ids:
        bs = bytes(NEW[f(base_a) + i*stride : f(base_a) + i*stride + n])
        print(f"  {label} {i:3}: {decode(bs)}")

# --- 4. Spot-check patched code bytes ---
print("\n--- Patched code spot checks ---")
checks = [
    ("$E00030 new multiply", 0x200030, "5a9bb938400a0a0a0aaa7a6b"),
    ("C1:3031 read", 0x13031, "bf0058e0"),
    ("C1:3024 read", 0x13024, "bf0068e0"),
    ("$E09920 ability routine", 0x209920,
     "a7b88003adf7dbc22029ff000a0a480a0a186301aa68a90000e2206b"),
    ("VWF width table intact @$E05680", 0x205680, None),
]
for name, off, want in checks:
    got = bytes(NEW[off:off + (len(want)//2 if want else 8)]).hex()
    status = "OK" if (want is None or got == want) else f"FAIL (got {got})"
    if want is None:
        same = bytes(NEW[0x205640:0x205700]) == bytes(BASE[0x205640:0x205700])
        status = "OK (matches base)" if same else "FAIL (differs from base!)"
    print(f"  {name}: {status}")

print(f"\n{'ALL CHECKS PASSED' if fail == 0 and mismatch == 0 else 'FAILURES PRESENT'}")
