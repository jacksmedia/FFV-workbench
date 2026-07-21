#!/usr/bin/env python3
"""
patch_WW_v0_07.py - Wounded Wardrobe v0.07: menu MVN bank dispatch fix

v0.06 menu playtest showed KO tiles sourced from bank $D2 with the CORRECT
computed offsets ((job*5+charID)*$C0 -- verified 3/3 against test data:
Faris job0 -> $0240, Lenna job1 -> $0480, Bartz job10 -> $2580). Root cause
is in the menu tile copier C2:D304:

    C2/D311  LDA $E0 / CLC / ADC $C00000,X / TAX   ; src = $E0 + param[0]
    C2/D319  LDA $E2 / ADC $8E / AND #$00FF        ; bank byte (carry chained!)
    C2/D320  CMP #$00D4 / BEQ -> MVN $D4,$7E
    C2/D325  CMP #$00D3 / BEQ -> MVN $D3,$7E
    C2/D32A  LDA #$001F / MVN $D2,$7E              ; DEFAULT
    C2/D340  PLX / INX x4 / DEC $E8 / BNE loop     ; per-tile param entries

The 65816 MVN opcode hardcodes src/dest banks in the instruction, so the
devs enumerated the three vanilla graphics banks with $D2 as fall-through.
Our bank $E8 matches neither compare and lands in the $D2 default -- vanilla
walk-sprite bank + WW offset, exactly the observed corruption.

Fix: re-implement the dispatch in freespace with a fourth case for $E8.
The 7 bytes at $02D319 (LDA $E2 / ADC $8E / AND #$00FF) are replaced by
JSL $E85300 + BRA $D340 + NOP. The freespace routine reproduces the vanilla
logic byte-for-byte in behavior (ADC $8E still inherits the live carry from
the 24-bit source add at D314; MVN leaves DB=$7E exactly as vanilla; RTL
returns to the BRA which rejoins the per-tile loop). Only a resolved bank
of $E8 behaves differently -- and only WW code ever produces it, so every
other caller of C2:D304 (walk sprites, other menu graphics) is unaffected.

Input:  ../patches/ff5c - WWv0.06.sfc
Output: ../patches/ff5c - WWv0.07.sfc
        ../patches/WW_v0.07_checkpoint.ips  (full code-only patch, applies
        cleanly to a clean 4MB expanded ROM)
"""

import sys
from pathlib import Path

HERE       = Path(__file__).resolve().parent
INPUT_ROM  = HERE.parent / "patches" / "ff5c - WWv0.06.sfc"
OUTPUT_ROM = HERE.parent / "patches" / "ff5c - WWv0.07.sfc"
OUTPUT_IPS = HERE.parent / "patches" / "WW_v0.07_checkpoint.ips"

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

# --- new in v0.07: MVN bank dispatch ----------------------------------------

DISPATCH_HOOK_OFF = 0x02D319          # SNES $C2:D319
DISPATCH_HOOK_OLD = bytes.fromhex(
    "A5E2"        # LDA $E2
    "658E"        # ADC $8E          (carry live from ADC $C00000,X at D314)
    "29FF00"      # AND #$00FF
)                 # 7 bytes; vanilla falls into the CMP chain at $C2:D320
DISPATCH_HOOK_NEW = bytes.fromhex(
    "220053E8"    # JSL $E85300      (flags untouched -> carry survives)
    "8021"        # BRA $D340        (rejoin per-tile loop: PLX / INX x4 ...)
    "EA"          # NOP              (unreachable, cosmetic)
)
assert len(DISPATCH_HOOK_NEW) == len(DISPATCH_HOOK_OLD) == 7
# Original CMP chain at $02D320-$02D33F stays in ROM but is now unreachable.

# Freespace dispatch at E8:5300 -- vanilla logic + $E8 case.
# Entry: M=0 (16-bit A), X=src offset, Y=dest offset, carry = bit16 of src add.
DISPATCH_ROUTINE_OFF = 0x285300
DISPATCH_ROUTINE = bytes.fromhex(
    "A5E2"        # LDA $E2
    "658E"        # ADC $8E          same carry semantics as vanilla
    "29FF00"      # AND #$00FF       resolved bank byte
    "C9E800"      # CMP #$00E8
    "F01F"        # BEQ .e8
    "C9D400"      # CMP #$00D4
    "F013"        # BEQ .d4
    "C9D300"      # CMP #$00D3
    "F007"        # BEQ .d3
    "A91F00"      # LDA #$001F       32 bytes per tile
    "547ED2"      # MVN $D2,$7E      default (vanilla)
    "6B"          # RTL
    "A91F00"      # .d3  LDA #$001F
    "547ED3"      #      MVN $D3,$7E
    "6B"          #      RTL
    "A91F00"      # .d4  LDA #$001F
    "547ED4"      #      MVN $D4,$7E
    "6B"          #      RTL
    "A91F00"      # .e8  LDA #$001F
    "547EE8"      #      MVN $E8,$7E  ** the WW case **
    "6B"          #      RTL
)
assert len(DISPATCH_ROUTINE) == 50


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
        bytes(8)                                  # $285280 zeroed (ex-table)
        + BATTLE_ROUTINE                          # $285288
        + bytes(MENU_ROUTINE_OFF - (BATTLE_ROUTINE_OFF + len(BATTLE_ROUTINE)))
        + MENU_ROUTINE                            # $2852D0
        + bytes(DISPATCH_ROUTINE_OFF - (MENU_ROUTINE_OFF + len(MENU_ROUTINE)))
        + DISPATCH_ROUTINE                        # $285300
    )
    ips = b"PATCH"
    ips += record(BATTLE_HOOK_OFF, BATTLE_HOOK)
    ips += record(PHASE1_OFF, PHASE1)
    ips += record(MENU_HOOK_OFF, MENU_HOOK)
    ips += record(DISPATCH_HOOK_OFF, DISPATCH_HOOK_NEW)
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
    ok &= check(data, PHASE1_OFF, PHASE1, "Phase-1 NOPs")
    ok &= check(data, BATTLE_ROUTINE_OFF, BATTLE_ROUTINE, "battle routine (v0.05)")
    ok &= check(data, MENU_HOOK_OFF, MENU_HOOK, "menu hook (v0.06)")
    ok &= check(data, MENU_ROUTINE_OFF, MENU_ROUTINE, "menu routine (v0.06)")
    ok &= check(data, DISPATCH_HOOK_OFF, DISPATCH_HOOK_OLD, "vanilla bank resolve at C2:D319")
    ok &= check(data, DISPATCH_ROUTINE_OFF, bytes(len(DISPATCH_ROUTINE)), "freespace at E8:5300")
    if not ok:
        print("Aborting -- ROM state does not match v0.06. Output not written.")
        sys.exit(1)

    data[DISPATCH_HOOK_OFF : DISPATCH_HOOK_OFF + 7] = DISPATCH_HOOK_NEW
    data[DISPATCH_ROUTINE_OFF : DISPATCH_ROUTINE_OFF + len(DISPATCH_ROUTINE)] = DISPATCH_ROUTINE

    OUTPUT_ROM.write_bytes(data)
    print("Written -> %s  (%d bytes)" % (OUTPUT_ROM, len(data)))
    write_ips(OUTPUT_IPS)

    print()
    print("Summary:")
    print("  Dispatch hook $02D319 (C2:D319): JSL $E85300 / BRA $D340 / NOP")
    print("  Dispatch at E8:5300: vanilla D2/D3/D4 MVN cases + new E8 case")
    print("  Verify: menu KO tiles should now come from $28xxxx (E8 bank).")
    print("  Regression: alive walk sprites in menu (D2/D3/D4 sources) and")
    print("  battle behavior must be unchanged.")


if __name__ == "__main__":
    main()
