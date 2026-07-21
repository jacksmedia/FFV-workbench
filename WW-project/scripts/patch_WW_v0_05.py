#!/usr/bin/env python3
"""
patch_WW_v0_05.py - Wounded Wardrobe v0.05: correct hero/job sourcing

Fixes the v0.04 slot-mapping bug. Root cause (Bank C1 loader at $C1:24E2):

    C1/24EE  LDA $CFC6,Y     ; Y = party slot 0-3, A = CHARACTER ID (0-4)
    C1/2505  ASL x3 / TAX    ; X = charID * 8  (row into pointer matrix C1:24A3)
    C1/2517  LDA $C124A7,X   ; <-- our hook site: loads KO sprite source ptr
    C1/2526  LDA $CFCA,Y     ; job (0-21), * $600 = walk sprite offset

So at the hook, X encodes the HERO (charID*8), not the slot, and Y holds the
slot. v0.04 computed slot = ((X-8)>>3)&3 -- wrong basis, and underflows for
Bartz (charID 0). It then read hero identity from FieldChar byte 0 ($0500),
which is CharRow (row/position), not a hero ID. Hence sprites tracked party
position instead of hero identity.

v0.05 routine (60 bytes, replaces v0.04's 87 at $285288):
    hero = X >> 3                     ; charID direct from register
    job  = $7E:CFCA,Y                 ; game's own per-slot job table
    $76  = (job*5 + hero) * $C0       ; offset within sprite bank
    $78  = #$E8                       ; bank -> source = E8:offset
Exits with A = $E8 (8-bit) because the two residual bytes after the hook
(24 C1 = BIT $C1, then 85 78 = STA $78) re-store A to $78 -- same convention
as v0.04.

Hook at $012517 and Phase-1 NOPs at $01B1C7 are unchanged from v0.04.

Input:  ../ff5c.sfc  (v0.04-patched, 4MB expanded, numeral test sprites at $280000)
Output: ../patches/ff5c - WWv0.05.sfc
        ../patches/WW_v0.05_checkpoint.ips  (code-only, applies to clean ROM too)
"""

import sys
from pathlib import Path

HERE       = Path(__file__).resolve().parent
INPUT_ROM  = HERE.parent / "ff5c.sfc"
OUTPUT_ROM = HERE.parent / "patches" / "ff5c - WWv0.05.sfc"
OUTPUT_IPS = HERE.parent / "patches" / "WW_v0.05_checkpoint.ips"

# --- expected current contents (safety check before overwrite) -------------

HOOK_OFF   = 0x012517
HOOK       = bytes.fromhex("E2 20 22 88 52 E8 EA EA".replace(" ", ""))

PHASE1_OFF = 0x01B1C7
PHASE1     = bytes.fromhex("EAEAEA")

TABLE_OFF  = 0x285280          # v0.04 SlotWRAMTable -- now unused, zeroed
OLD_TABLE  = bytes.fromhex("00 05 50 05 A0 05 F0 05".replace(" ", ""))

ROUTINE_OFF = 0x285288
OLD_ROUTINE = bytes.fromhex(
    "08 8B DA 5A 48 A9 7E 48 AB 68 C2 20 8A 38 E9 08"
    "00 4A 4A 4A 29 03 00 0A AA BF 80 52 E8 A8 E2 20"
    "B9 00 00 29 07 85 00 64 01 C8 B9 00 00 C2 20 29"
    "FF 00 85 02 0A 0A 18 65 02 18 65 00 85 02 0A 0A"
    "0A 0A 0A 0A 85 04 0A 18 65 04 85 76 E2 20 A9 E8"
    "85 78 7A FA AB 28 6B".replace(" ", "").replace("\n", "")
)  # 87 bytes

# --- v0.05 routine ----------------------------------------------------------
# Entry (from hook E2 20 / JSL $E85288): M=1 (8-bit A), X/Y 16-bit,
# X = charID*8, Y = party slot, DP = $0000.
NEW_ROUTINE = bytes.fromhex(
    "08"          # PHP
    "8B"          # PHB
    "A97E"        # LDA #$7E
    "48 AB"       # PHA / PLB          DB = $7E
    "C220"        # REP #$20           16-bit A
    "8A"          # TXA                A = charID*8
    "4A 4A 4A"    # LSR x3             A = hero (0-4)
    "8500"        # STA $00            hero, 16-bit clean
    "E220"        # SEP #$20
    "B9CACF"      # LDA $CFCA,Y        job (0-21) for this slot
    "8502"        # STA $02
    "6403"        # STZ $03            job, 16-bit clean
    "C220"        # REP #$20
    "A502"        # LDA $02
    "0A 0A"       # ASL x2             job*4
    "18 6502"     # CLC / ADC $02      job*5
    "18 6500"     # CLC / ADC $00      job*5 + hero   (0-109)
    "8502"        # STA $02
    "0A 0A 0A 0A 0A 0A"  # ASL x6      idx*64
    "8504"        # STA $04
    "0A"          # ASL                idx*128
    "18 6504"     # CLC / ADC $04      idx*192 = idx*$C0  (max $51C0)
    "8576"        # STA $76            source offset
    "E220"        # SEP #$20
    "A9E8"        # LDA #$E8
    "8578"        # STA $78            source bank; A stays $E8 for hook tail
    "AB"          # PLB
    "28"          # PLP
    "6B"          # RTL
    .replace(" ", "")
)
assert len(NEW_ROUTINE) == 60, len(NEW_ROUTINE)

# new freespace block: zeroed table (8) + routine (60) + zero-pad over old tail
FREESPACE = bytes(8) + NEW_ROUTINE + bytes(len(OLD_ROUTINE) - len(NEW_ROUTINE))


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
    ips = b"PATCH"
    ips += record(HOOK_OFF, HOOK)
    ips += record(PHASE1_OFF, PHASE1)
    ips += record(TABLE_OFF, FREESPACE)
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
    ok &= check(data, HOOK_OFF, HOOK, "v0.04 hook")
    ok &= check(data, PHASE1_OFF, PHASE1, "Phase-1 NOPs")
    ok &= check(data, TABLE_OFF, OLD_TABLE, "v0.04 SlotWRAMTable")
    ok &= check(data, ROUTINE_OFF, OLD_ROUTINE, "v0.04 routine")
    if not ok:
        print("Aborting -- ROM state does not match v0.04. Output not written.")
        sys.exit(1)

    data[TABLE_OFF : TABLE_OFF + len(FREESPACE)] = FREESPACE

    OUTPUT_ROM.write_bytes(data)
    print("Written -> %s  (%d bytes)" % (OUTPUT_ROM, len(data)))
    write_ips(OUTPUT_IPS)

    print()
    print("Summary:")
    print("  hero = X>>3 (charID at hook), job = $7E:CFCA,Y (slot's job)")
    print("  KO sprite source = E8:0000 + (job*5 + hero)*$C0")
    print("  Verify: numeral sprite should equal job*5+hero regardless of")
    print("  party order. Reorder the party and re-check all four slots.")


if __name__ == "__main__":
    main()
