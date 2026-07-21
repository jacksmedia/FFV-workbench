#!/usr/bin/env python3
"""
repair_WW_v0_09.py - fix the v0.09 black-screen-after-title crash.

Root cause (diagnosed 7/19/26): the v0.09 sprite injection wrote a $52DD-byte
blob at $280000, but the WW art region is only 110 blocks x $C0 = $5280 bytes
($280000-$28527F). The 93-byte overrun (sourced from a v0.04-era sheet rip)
destroyed the freespace code the C1/C2 hooks jump to:

    $285288  v0.05 battle slot-map routine  -> replaced with obsolete v0.04 code
    $2852D0  v0.06 menu KO routine          -> half-overwritten
    $285300  v0.07 MVN bank dispatch        -> zeroed entirely

The hooks themselves survived, so the first character-tile copy after the
title screen (C2:D319 JSL $E85300) executes $00 bytes = BRK -> black screen.
Both v0.09 IPS files were generated from the already-broken ROM and encode
the same crash.

This script:
  1. restores $285280-$285331 in ../ff5c.sfc from the v0.08 canonical bytes
     (constants below are verbatim from patch_WW_v0_08.py) - new art kept;
  2. regenerates both v0.09 IPS files from the repaired ROM:
       - "ff5 wounded wardrobe v0.09 (made against vanilla game).ips"
             base: ff5 RPGe [crc32=17444605].sfc (2.5 MB, expands to 4 MB)
       - "ff5-wounded-wardrobe-v0.09 (made against expanded rom).ips"
             base: the same ROM zero-padded to 4 MB
     (+ refreshes the identical copy in ../alpha-not-released/);
  3. verifies: hook sites, routine bytes, art untouched, and both IPS files
     re-applied to their bases reproduce the repaired ROM byte-for-byte.
"""

from pathlib import Path
import sys

HERE     = Path(__file__).resolve().parent
WW       = HERE.parent
ROOT     = WW.parent
ROM      = WW / "ff5c.sfc"
VANILLA  = ROOT / "ff5 RPGe [crc32=17444605].sfc"
IPS_VAN  = WW / "ff5 wounded wardrobe v0.09 (made against vanilla game).ips"
IPS_EXP  = WW / "ff5-wounded-wardrobe-v0.09 (made against expanded rom).ips"
IPS_ALPHA= WW / "alpha-not-released" / "ff5-wounded-wardrobe-v0.09.ips"

ROM_SIZE   = 0x400000
ART_OFF    = 0x280000
ART_END    = 0x285280            # exclusive: 110 blocks x $C0
FREE_OFF   = 0x285280
FREE_END   = 0x285332            # exclusive: end of v0.07 dispatch

# --- canonical v0.08 state (verbatim from patch_WW_v0_08.py) ------------------

BATTLE_HOOK_OFF = 0x012517
BATTLE_HOOK     = bytes.fromhex("E220" "228852E8" "EAEA")

PHASE1_OFF      = 0x01B1C7
PHASE1          = bytes.fromhex("EAEAEA")

BATTLE_ROUTINE_OFF = 0x285288
BATTLE_ROUTINE = bytes.fromhex(
    "088BA97E48ABC2208A4A4A4A8500E220"
    "B9CACF85026403C220A5020A0A186502"
    "1865008502"
    "0A0A0A0A0A0A"
    "85040A1865048576E220A9E88578AB286B"
)
assert len(BATTLE_ROUTINE) == 60

MENU_HOOK_OFF = 0x02D2BB
MENU_HOOK     = bytes.fromhex("22D052E8") + bytes([0xEA] * 16)

MENU_ROUTINE_OFF = 0x2852D0
MENU_ROUTINE = bytes.fromhex(
    "08" "A5EA" "290700" "48" "A5EB" "291F00" "85E0"
    "0A0A" "18" "65E0" "18" "6301" "85E0"
    "0A0A0A0A0A0A" "85E2" "0A" "18" "65E2" "85E0"
    "A9E800" "85E2" "68" "28" "6B"
)
assert len(MENU_ROUTINE) == 46

DISPATCH_HOOK_OFF = 0x02D319
DISPATCH_HOOK     = bytes.fromhex("220053E8" "8021" "EA")

DISPATCH_ROUTINE_OFF = 0x285300
DISPATCH_ROUTINE = bytes.fromhex(
    "A5E2" "658E" "29FF00"
    "C9E800" "F01F"
    "C9D400" "F013"
    "C9D300" "F007"
    "A91F00" "547ED2" "6B"
    "A91F00" "547ED3" "6B"
    "A91F00" "547ED4" "6B"
    "A91F00" "547EE8" "6B"
)
assert len(DISPATCH_ROUTINE) == 50

PALETTE_OFF = 0x02D47C
PALETTE_NEW = bytes.fromhex("EAEA")

FREESPACE = (
    bytes(BATTLE_ROUTINE_OFF - FREE_OFF)            # 8 zero bytes
    + BATTLE_ROUTINE
    + bytes(MENU_ROUTINE_OFF - (BATTLE_ROUTINE_OFF + len(BATTLE_ROUTINE)))
    + MENU_ROUTINE
    + bytes(DISPATCH_ROUTINE_OFF - (MENU_ROUTINE_OFF + len(MENU_ROUTINE)))
    + DISPATCH_ROUTINE
)
assert FREE_OFF + len(FREESPACE) == FREE_END

HOOKS = [
    (BATTLE_HOOK_OFF,   BATTLE_HOOK,   "battle hook (v0.05)"),
    (PHASE1_OFF,        PHASE1,        "Phase-1 NOPs"),
    (MENU_HOOK_OFF,     MENU_HOOK,     "menu hook (v0.06)"),
    (DISPATCH_HOOK_OFF, DISPATCH_HOOK, "dispatch hook (v0.07)"),
    (PALETTE_OFF,       PALETTE_NEW,   "menu KO palette NOPs (v0.08)"),
]

# --- IPS writer ---------------------------------------------------------------

def ips_record(off, payload):
    assert 0 < len(payload) <= 0xFFFF and off != 0x454F46  # 'EOF' offset trap
    return off.to_bytes(3, "big") + len(payload).to_bytes(2, "big") + payload

def ips_rle(off, size, value):
    out = b""
    while size > 0:
        n = min(size, 0xFFFF)
        assert off != 0x454F46
        out += off.to_bytes(3, "big") + b"\x00\x00" + n.to_bytes(2, "big") + bytes([value])
        off += n
        size -= n
    return out

def build_ips(expand_fill):
    """Records: 5 hook sites + art+code block; optional zero-fill to 4 MB
    (needed when the base is the unexpanded 2.5 MB vanilla ROM)."""
    ips = b"PATCH"
    for off, data, _ in HOOKS:
        ips += ips_record(off, data)
    rom = ROM.read_bytes()
    ips += ips_record(ART_OFF, rom[ART_OFF:FREE_END])   # $5332 bytes, one record
    if expand_fill:
        ips += ips_rle(FREE_END, ROM_SIZE - FREE_END, 0x00)
    ips += b"EOF"
    return ips

def apply_ips(base, ips):
    out = bytearray(base)
    i = 5
    while ips[i:i+3] != b"EOF":
        off = int.from_bytes(ips[i:i+3], "big"); i += 3
        size = int.from_bytes(ips[i:i+2], "big"); i += 2
        if size == 0:
            n = int.from_bytes(ips[i:i+2], "big"); val = ips[i+2]; i += 3
            data = bytes([val]) * n
        else:
            data = ips[i:i+size]; i += size
        if off + len(data) > len(out):
            out.extend(bytes(off + len(data) - len(out)))
        out[off:off+len(data)] = data
    return bytes(out)

# --- main ---------------------------------------------------------------------

def main():
    rom = bytearray(ROM.read_bytes())
    assert len(rom) == ROM_SIZE, "unexpected ROM size"

    # 1. verify hooks are present (they survived the overwrite)
    ok = True
    for off, data, name in HOOKS:
        if bytes(rom[off:off+len(data)]) != data:
            print("  FAIL  %s at $%06X" % (name, off)); ok = False
        else:
            print("  OK    %s at $%06X" % (name, off))
    if not ok:
        sys.exit("hook sites do not match v0.08 state - aborting")

    # 2. restore the freespace code block; art region untouched
    before_art = bytes(rom[ART_OFF:ART_END])
    rom[FREE_OFF:FREE_END] = FREESPACE
    if bytes(rom[FREE_END:FREE_END+0x100]) != bytes(0x100):
        sys.exit("expected zero padding after $285331 - aborting")
    ROM.write_bytes(rom)
    assert bytes(rom[ART_OFF:ART_END]) == before_art
    print("  OK    freespace $%06X-$%06X restored, art untouched"
          % (FREE_OFF, FREE_END - 1))

    # 3. regenerate the IPS files
    ips_van = build_ips(expand_fill=True)
    ips_exp = build_ips(expand_fill=False)
    IPS_VAN.write_bytes(ips_van)
    IPS_EXP.write_bytes(ips_exp)
    IPS_ALPHA.write_bytes(ips_exp)
    print("  OK    wrote %s (%d bytes)" % (IPS_VAN.name, len(ips_van)))
    print("  OK    wrote %s (%d bytes) + alpha copy" % (IPS_EXP.name, len(ips_exp)))

    # 4. verify both patches reproduce the repaired ROM from their bases
    vanilla = VANILLA.read_bytes()
    assert len(vanilla) == 0x280000
    got = apply_ips(vanilla, ips_van)
    print("  %s vanilla IPS -> repaired ROM: %s"
          % ("OK  " if got == bytes(rom) else "FAIL", got == bytes(rom)))
    expanded = vanilla + bytes(ROM_SIZE - len(vanilla))
    got = apply_ips(expanded, ips_exp)
    print("  %s expanded IPS -> repaired ROM: %s"
          % ("OK  " if got == bytes(rom) else "FAIL", got == bytes(rom)))

if __name__ == "__main__":
    main()
