#!/usr/bin/env python3
"""
patch_WW_v0_06.py - Wounded Wardrobe v0.06: Menu KO sprite hook

Adds the Menu context on top of v0.05 (battle context). Together these cover
BOTH consumers of the original KO sprite art -- a whole-ROM search finds
exactly two references to the D4:9400 wounded graphics:

  1. Battle: pointer matrix C1:24A3, consumer C1:2517  (hooked in v0.05)
  2. Menu:   pointer table  C0:EC97, consumer C2:D2C3  (hooked here)

Menu loader C2:D298 (called per slot 0-3 from the loop at C2:D240):

    C2/D2A9  LDA $000500,X   ; 16-bit: $EA = charID/row byte, $EB = JOB byte
    C2/D2AF  JSR $D2DB       ; walk ptr = base[charID] + (job&$1F)*$600
    C2/D2B2  ... JSR $D304   ; copy 24 tiles of walk poses
    C2/D2BB  LDA $EA / AND #$0007 / ASL ASL / TAX
    C2/D2C3  LDA $C0EC97,X -> $E0   ; KO ptr = D4:9400 + charID*$C0
    C2/D2C9  LDA $C0EC99,X -> $E2   ; bank word
    C2/D2CF  ... JSR $D304   ; copy 6 tiles of KO pose

The game itself derives charID = FieldChar byte0 & 7 and job = byte1 & $1F
right at the hook site, so the WW substitution is a straight recompute:

    $E0 = (job*5 + charID) * $C0      ; block offset, same layout as battle
    $E2 = $00E8                       ; bank word (was $00D4)

Hook: replace the 20 bytes at $02D2BB (charID mask + table lookup) with
JSL $E852D0 + 16 NOPs. Falls through to the vanilla 6-tile copy at C2:D2CF.
Entry state: M=0 (16-bit A) preserved via PHP/PLP; only $E0/$E2 written
(both are the routine's own outputs). Job changes made inside the menu
refresh correctly because $EA/$EB are reloaded every time D298 runs.

Input:  ../patches/ff5c - WWv0.05.sfc
Output: ../patches/ff5c - WWv0.06.sfc
        ../patches/WW_v0.06_checkpoint.ips  (code-only, applies to clean
        expanded ROM too: battle hook + phase-1 NOPs + menu hook + routines)
"""

import sys
from pathlib import Path

HERE       = Path(__file__).resolve().parent
INPUT_ROM  = HERE.parent / "patches" / "ff5c - WWv0.05.sfc"
OUTPUT_ROM = HERE.parent / "patches" / "ff5c - WWv0.06.sfc"
OUTPUT_IPS = HERE.parent / "patches" / "WW_v0.06_checkpoint.ips"

# --- carried over from v0.05 (verified, not modified) -----------------------

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
assert len(BATTLE_ROUTINE) == 60, len(BATTLE_ROUTINE)

# --- new in v0.06: menu hook -------------------------------------------------

MENU_HOOK_OFF = 0x02D2BB          # SNES $C2:D2BB
MENU_HOOK_OLD = bytes.fromhex(
    "A5EA"        # LDA $EA
    "290700"      # AND #$0007       charID
    "0A0A"        # ASL ASL          *4
    "AA"          # TAX
    "BF97ECC0"    # LDA $C0EC97,X    KO ptr low word
    "85E0"        # STA $E0
    "BF99ECC0"    # LDA $C0EC99,X    KO ptr bank word
    "85E2"        # STA $E2
)                 # 20 bytes, falls through to LDA #$0006 at $C2:D2CF
assert len(MENU_HOOK_OLD) == 20

MENU_HOOK_NEW = bytes.fromhex("22D052E8") + bytes([0xEA] * 16)  # JSL $E852D0
assert len(MENU_HOOK_NEW) == 20

# --- new in v0.06: menu routine at E8:52D0 -----------------------------------
# Entry: M=0 (16-bit A), $EA = charID/row byte, $EB = job byte, DP = $0000.
MENU_ROUTINE_OFF = 0x2852D0
MENU_ROUTINE = bytes.fromhex(
    "08"          # PHP
    "A5EA"        # LDA $EA          low = charID/row byte
    "290700"      # AND #$0007       charID (game's own mask, cf. $C2:D2BE)
    "48"          # PHA
    "A5EB"        # LDA $EB          low = job byte
    "291F00"      # AND #$001F       job (game's own mask, cf. $C2:D2E0)
    "85E0"        # STA $E0
    "0A0A"        # ASL x2           job*4
    "18" "65E0"   # CLC / ADC $E0    job*5
    "18" "6301"   # CLC / ADC $01,S  + charID  -> block index 0-109
    "85E0"        # STA $E0
    "0A0A0A0A0A0A"# ASL x6           idx*64
    "85E2"        # STA $E2
    "0A"          # ASL              idx*128
    "18" "65E2"   # CLC / ADC $E2    idx*192 = idx*$C0  (max $51C0)
    "85E0"        # STA $E0          source offset within bank
    "A9E800"      # LDA #$00E8
    "85E2"        # STA $E2          bank word (vanilla had $00D4)
    "68"          # PLA              discard saved charID
    "28"          # PLP
    "6B"          # RTL
)
assert len(MENU_ROUTINE) == 46, len(MENU_ROUTINE)


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
    # one freespace record covering table gap + both routines contiguously
    freespace = (
        bytes(8)                                  # $285280 zeroed (ex-table)
        + BATTLE_ROUTINE                          # $285288 (60 bytes)
        + bytes(MENU_ROUTINE_OFF - (BATTLE_ROUTINE_OFF + len(BATTLE_ROUTINE)))
        + MENU_ROUTINE                            # $2852D0 (46 bytes)
    )
    ips = b"PATCH"
    ips += record(BATTLE_HOOK_OFF, BATTLE_HOOK)
    ips += record(PHASE1_OFF, PHASE1)
    ips += record(MENU_HOOK_OFF, MENU_HOOK_NEW)
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
    ok &= check(data, BATTLE_HOOK_OFF, BATTLE_HOOK, "v0.05 battle hook")
    ok &= check(data, PHASE1_OFF, PHASE1, "Phase-1 NOPs")
    ok &= check(data, BATTLE_ROUTINE_OFF, BATTLE_ROUTINE, "v0.05 battle routine")
    ok &= check(data, MENU_HOOK_OFF, MENU_HOOK_OLD, "vanilla menu KO lookup")
    ok &= check(data, MENU_ROUTINE_OFF, bytes(len(MENU_ROUTINE)), "freespace at E8:52D0")
    if not ok:
        print("Aborting -- ROM state does not match v0.05. Output not written.")
        sys.exit(1)

    data[MENU_HOOK_OFF : MENU_HOOK_OFF + 20] = MENU_HOOK_NEW
    data[MENU_ROUTINE_OFF : MENU_ROUTINE_OFF + len(MENU_ROUTINE)] = MENU_ROUTINE

    OUTPUT_ROM.write_bytes(data)
    print("Written -> %s  (%d bytes)" % (OUTPUT_ROM, len(data)))
    write_ips(OUTPUT_IPS)

    print()
    print("Summary:")
    print("  Menu hook  $02D2BB (C2:D2BB): JSL $E852D0 + 16 NOP")
    print("  Menu routine E8:52D0: $E0 = (job*5+charID)*$C0, $E2 = $00E8")
    print("  Verify: open the main menu with a KO'd hero -- the wounded pose")
    print("  should show the job/hero numeral. Change jobs in-menu and the")
    print("  KO sprite should update. Battle behavior unchanged from v0.05.")


if __name__ == "__main__":
    main()
