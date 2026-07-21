#!/usr/bin/env python3
"""
patch_WW_v0_08.py - Wounded Wardrobe v0.08: menu KO palette fix

v0.07 menu playtest: WW sprites load correctly (right hero, right job) but
render with palette group $15 (Freelancer) instead of the job palette.

Root cause is the FieldChar palette builder at C2:D45F -- the same routine
identified in the April trace (see _WIP.txt 4/24 + patch_WW_v2.py P1). It
rebuilds the menu CGRAM shadow ($7E:7400 + slot*$20) per character:

    C2/D468  LDA $0500,X / AND #$07 / XBA   ; charID
    C2/D46E  LDA $0501,X / AND #$1F         ; job = palette index 0-21
    C2/D475  BIT $051A,X                    ; Status1: N=dead, V=stone
    C2/D478  BVS -> stone palette (src C0:F807, MVN $C0,$7E)
    C2/D47A  BPL -> alive (keep job index)
    C2/D47C  LDA #$15                       ; ** dead -> Freelancer force **
    C2/D47E  XBA / JSR $D492                ; src = C0:F246[charID] + pal*$20,
                                            ; MVN $D4,$7E -> $7E:7400+slot*$20

The battle-side equivalent was fixed long ago (Phase-1 NOPs at C1:B1C7),
which is why battle colors are right while the menu still forces $15. This
routine reads FieldChar ($0500) -- the menu-side data -- and runs on every
menu (re)draw, so a 2-byte NOP makes dead characters keep their job palette
index. Alive and stone paths are untouched (A still holds the job index at
$D47E when the force is skipped or NOP'd).

This was P1 of patch_WW_v2.py (April), dropped from the checkpoint lineage
when the battle fix moved to C1:B1C7. Reinstated here for the menu. (P2 of
that script, C2:D97F, no longer matches this ROM -- already reworked by
another applied patch, and battle is confirmed correct, so it stays as-is.)

Input:  ../patches/ff5c - WWv0.07.sfc
Output: ../patches/ff5c - WWv0.08.sfc
        ../patches/WW_v0.08_checkpoint.ips  (full code-only patch)
"""

import sys
from pathlib import Path

HERE       = Path(__file__).resolve().parent
INPUT_ROM  = HERE.parent / "patches" / "ff5c - WWv0.07.sfc"
OUTPUT_ROM = HERE.parent / "patches" / "ff5c - WWv0.08.sfc"
OUTPUT_IPS = HERE.parent / "patches" / "WW_v0.08_checkpoint.ips"

# --- carried over (verified, not modified) -----------------------------------

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

# --- new in v0.08: menu KO palette fix ---------------------------------------

PALETTE_OFF = 0x02D47C            # SNES $C2:D47C
PALETTE_OLD = bytes.fromhex(
    "A915"        # LDA #$15      dead -> Freelancer palette force
    "EB"          # XBA           (context: kept, verifies unique site)
    "2092D4"      # JSR $D492     palette copier
)
PALETTE_NEW = bytes.fromhex(
    "EAEA"        # NOP NOP       A keeps the job palette index from $C2:D471
    "EB"          # XBA           unchanged
    "2092D4"      # JSR $D492     unchanged
)
assert len(PALETTE_OLD) == len(PALETTE_NEW) == 6


def check(data, off, expect, name):
    got = bytes(data[off : off + len(expect)])
    if got != expect:
        print("  FAIL  %s at $%06X" % (name, off))
        print("        expected %s" % expect.hex(" ").upper())
        print("        found    %s" % got.hex(" ").upper())
        return False
    print("  OK    %s at $%06X verified" % (name, off))
    return True


def write_ips(path):
    def record(off, payload):
        return off.to_bytes(3, "big") + len(payload).to_bytes(2, "big") + payload
    freespace = (
        bytes(8)
        + BATTLE_ROUTINE
        + bytes(MENU_ROUTINE_OFF - (BATTLE_ROUTINE_OFF + len(BATTLE_ROUTINE)))
        + MENU_ROUTINE
        + bytes(DISPATCH_ROUTINE_OFF - (MENU_ROUTINE_OFF + len(MENU_ROUTINE)))
        + DISPATCH_ROUTINE
    )
    ips = b"PATCH"
    ips += record(BATTLE_HOOK_OFF, BATTLE_HOOK)
    ips += record(PHASE1_OFF, PHASE1)
    ips += record(MENU_HOOK_OFF, MENU_HOOK)
    ips += record(DISPATCH_HOOK_OFF, DISPATCH_HOOK)
    ips += record(PALETTE_OFF, PALETTE_NEW[:2])   # just the 2 NOPs
    ips += record(0x285280, freespace)
    ips += b"EOF"
    path.write_bytes(ips)
    print("Written -> %s  (%d bytes)" % (path, len(ips)))


def main():
    if not INPUT_ROM.exists():
        print("ERROR: Input ROM not found: %s" % INPUT_ROM)
        sys.exit(1)

    print("Reading %s  (%d bytes)" % (INPUT_ROM, INPUT_ROM.stat().st_size))
    data = bytearray(INPUT_ROM.read_bytes())

    ok = True
    ok &= check(data, BATTLE_HOOK_OFF, BATTLE_HOOK, "battle hook (v0.05)")
    ok &= check(data, PHASE1_OFF, PHASE1, "Phase-1 NOPs (battle)")
    ok &= check(data, BATTLE_ROUTINE_OFF, BATTLE_ROUTINE, "battle routine (v0.05)")
    ok &= check(data, MENU_HOOK_OFF, MENU_HOOK, "menu hook (v0.06)")
    ok &= check(data, MENU_ROUTINE_OFF, MENU_ROUTINE, "menu routine (v0.06)")
    ok &= check(data, DISPATCH_HOOK_OFF, DISPATCH_HOOK, "dispatch hook (v0.07)")
    ok &= check(data, DISPATCH_ROUTINE_OFF, DISPATCH_ROUTINE, "dispatch routine (v0.07)")
    ok &= check(data, PALETTE_OFF, PALETTE_OLD, "vanilla dead-palette force at C2:D47C")
    if not ok:
        print("Aborting -- ROM state does not match v0.07. Output not written.")
        sys.exit(1)

    data[PALETTE_OFF : PALETTE_OFF + len(PALETTE_NEW)] = PALETTE_NEW

    OUTPUT_ROM.write_bytes(data)
    print("Written -> %s  (%d bytes)" % (OUTPUT_ROM, len(data)))
    write_ips(OUTPUT_IPS)

    print()
    print("Summary:")
    print("  $02D47C (C2:D47C): LDA #$15 -> NOP NOP (menu KO keeps job palette)")
    print("  Verify: KO'd heroes in the menu now render in their job colors.")
    print("  Regression: alive menu colors, stone (if testable), battle.")


if __name__ == "__main__":
    main()
