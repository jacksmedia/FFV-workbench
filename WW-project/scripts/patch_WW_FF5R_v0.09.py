#!/usr/bin/env python3
"""
patch_WW_FF5R_v0.09.py - Wounded Wardrobe adapted for FF5R romhack

FF5R uses bank E8 for its own code, so this relocates WW to:
  - Sprite art:  EB:E3E0 - EC:365F  (file $2BE3E0, 110 blocks x $C0 = $5280 bytes)
  - Routines:    EC:3668 - EC:371B  (file $2C3668, ~180 bytes)

Because the art spans two banks, the battle and menu routines now compute
the bank dynamically: base $EB, +1 if the offset addition carries.

Hook addresses updated:
  - Battle hook  C1:2517: JSL $EC3668  (was E8:5288)
  - Menu hook    C2:D2BB: JSL $EC36AB  (was E8:52D0)
  - Dispatch     C2:D319: JSL $EC36E0  (was E8:5300)

Dispatch routine now handles both bank $EB and $EC for the MVN copy.

Input:  FF5r Clean.sfc (4 MB, vanilla hook sites intact)
        ff5c.sfc (source for WW sprite art at E8:0000)
Output: FF5r-WW-v0.09.sfc
        ff5-wounded-wardrobe-v0.09-FF5R.ips
"""

from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
WW = HERE.parent

# Input files
FF5R_CLEAN = WW / "FF5r Clean.sfc"
WW_SOURCE = WW / "ff5c.sfc"  # has the art at E8:0000

# Output files
OUTPUT_ROM = WW / "FF5r-WW-v0.09.sfc"
OUTPUT_IPS = WW / "ff5-wounded-wardrobe-v0.09-FF5R.ips"

ROM_SIZE = 0x400000

# --- New addresses (relocated from E8 to EB/EC) ---

# Art: 110 sprites x $C0 bytes = $5280 bytes
ART_SRC_OFF = 0x280000           # source: E8:0000 in ff5c.sfc
ART_DST_OFF = 0x2BE3E0           # dest: EB:E3E0
ART_SIZE = 0x5280
ART_DST_END = ART_DST_OFF + ART_SIZE  # $2C3660, ends at EC:365F

# Routines at EC:3668 (8 bytes after art ends, matching original layout)
BATTLE_ROUTINE_OFF_NEW = 0x2C3668    # EC:3668
# Menu follows battle (67 bytes)
MENU_ROUTINE_OFF_NEW = 0x2C36AB      # EC:36AB (0x2C3668 + 67)
# Dispatch follows menu (53 bytes)
DISPATCH_ROUTINE_OFF_NEW = 0x2C36E0  # EC:36E0 (0x2C36AB + 53)

# Base offset for sprite data (EB:E3E0)
BASE_OFFSET = 0xE3E0
BASE_BANK = 0xEB

# --- Hook sites (same locations, new targets) ---

BATTLE_HOOK_OFF = 0x012517
BATTLE_HOOK_NEW = bytes.fromhex(
    "E220"          # SEP #$20 (8-bit A for the following instructions)
    "226836EC"      # JSL $EC3668  ← new address
    "EAEA"          # NOP NOP (pad to 8 bytes)
)

PHASE1_OFF = 0x01B1C7
PHASE1_NEW = bytes.fromhex("EAEAEA")  # NOPx3 (unchanged)

MENU_HOOK_OFF = 0x02D2BB
MENU_HOOK_NEW = bytes.fromhex(
    "22AB36EC"      # JSL $EC36AB  ← new address
) + bytes([0xEA] * 16)

DISPATCH_HOOK_OFF = 0x02D319
DISPATCH_HOOK_NEW = bytes.fromhex(
    "22E036EC"      # JSL $EC36E0  ← new address
    "8021"          # BRA +33 ($D33C, skip vanilla dispatch)
    "EA"            # NOP
)

PALETTE_OFF = 0x02D47C
PALETTE_NEW = bytes.fromhex("EAEA")  # NOPx2 (unchanged)

# --- Vanilla bytes at hook sites (for verification) ---
# Check just enough to confirm we're at the right instruction

BATTLE_HOOK_VANILLA = bytes.fromhex("BFA724C18576")  # LDA $C124A7,X / STA $76
PHASE1_VANILLA = bytes.fromhex("99897F")  # STA $7F89,Y
MENU_HOOK_VANILLA = bytes.fromhex("A5EA2907")  # LDA $EA / AND #$07 (start)
DISPATCH_VANILLA = bytes.fromhex("A5E2658E")  # LDA $E2 / ADC $8E
PALETTE_VANILLA = bytes.fromhex("A915")  # LDA #$15

# --- New routines with dynamic bank calculation ---

# Battle routine: computes (jobx5 + charID) x $C0 + $E3E0, bank = $EB or $EC
# Entry: X = charID x 8, Y = party slot; must set $76/$78 = 24-bit pointer
BATTLE_ROUTINE_NEW = bytes.fromhex(
    "08"            # PHP
    "8B"            # PHD
    "A97E"          # LDA #$7E
    "48"            # PHA
    "AB"            # PLB (DBR = $7E for $CFCA access)
    "C220"          # REP #$20 (16-bit A)
    "8A"            # TXA
    "4A4A4A"        # LSR x3 → charID
    "8500"          # STA $00 (charID)
    "E220"          # SEP #$20 (8-bit A)
    "B9CACF"        # LDA $CFCA,Y (job)
    "8502"          # STA $02
    "6403"          # STZ $03 ($02 = job, 16-bit)
    "C220"          # REP #$20
    "A502"          # LDA $02 (job)
    "0A0A"          # ASL x2 (jobx4)
    "18"            # CLC
    "6502"          # ADC $02 (jobx5)
    "18"            # CLC
    "6500"          # ADC $00 (jobx5 + charID = index)
    "8502"          # STA $02
    "0A0A0A0A0A0A"  # ASL x6 (indexx64)
    "8504"          # STA $04 (temp)
    "0A"            # ASL (indexx128)
    "18"            # CLC
    "6504"          # ADC $04 (indexx192 = sprite offset)
    # --- New: add base offset and compute bank ---
    "18"            # CLC
    "69E0E3"        # ADC #$E3E0 (base offset; carry set if overflow)
    "8576"          # STA $76 (16-bit pointer low word)
    "E220"          # SEP #$20 (8-bit A)
    "A9EB"          # LDA #$EB (base bank)
    "9002"          # BCC +2 (skip if no carry)
    "1A"            # INC A (A = $EC if carry)
    "8578"          # STA $78 (bank byte)
    "AB"            # PLB
    "28"            # PLP
    "6B"            # RTL
)
assert len(BATTLE_ROUTINE_NEW) == 67, f"battle routine is {len(BATTLE_ROUTINE_NEW)}, expected 67"

# Menu routine: computes same formula from $EA/$EB (FieldChar bytes)
# Entry: 16-bit mode; must set $E0 = offset, $E2 = bank (16-bit $00xx)
MENU_ROUTINE_NEW = bytes.fromhex(
    "08"            # PHP
    "A5EA"          # LDA $EA (charID+row, 16-bit)
    "290700"        # AND #$0007 (mask charID)
    "48"            # PHA (save charID)
    "A5EB"          # LDA $EB (job byte, 16-bit load)
    "291F00"        # AND #$001F (mask job)
    "85E0"          # STA $E0 ($E0 = job)
    "0A0A"          # ASL x2 (jobx4)
    "18"            # CLC
    "65E0"          # ADC $E0 (jobx5)
    "18"            # CLC
    "6301"          # ADC $01,S (jobx5 + charID from stack)
    "85E0"          # STA $E0 (index)
    "0A0A0A0A0A0A"  # ASL x6 (indexx64)
    "85E2"          # STA $E2 (temp)
    "0A"            # ASL (indexx128)
    "18"            # CLC
    "65E2"          # ADC $E2 (indexx192)
    # --- New: add base offset and compute bank ---
    "18"            # CLC
    "69E0E3"        # ADC #$E3E0 (base offset)
    "85E0"          # STA $E0 (final offset)
    "A9EB00"        # LDA #$00EB (base bank, 16-bit for dispatch compat)
    "690000"        # ADC #$0000 (add carry: becomes $00EC if overflow)
    "85E2"          # STA $E2 (bank)
    "68"            # PLA (clean stack)
    "28"            # PLP
    "6B"            # RTL
)
assert len(MENU_ROUTINE_NEW) == 53, f"menu routine is {len(MENU_ROUTINE_NEW)}, expected 53"

# Dispatch routine: handles D2/D3/D4 (vanilla) + EB/EC (WW relocated)
# Entry: $E2 = bank, $8E = offset adjust; does MVN to $7E
# Layout: header(7) + 4 checks(20) + 5 handlers(35) = 62 bytes
#   Offsets: 0-6 header, 7-11 EC chk, 12-16 EB chk, 17-21 D4 chk, 22-26 D3 chk
#            27-33 D2 hdlr, 34-40 D3 hdlr, 41-47 D4 hdlr, 48-54 EB hdlr, 55-61 EC hdlr
DISPATCH_ROUTINE_NEW = bytes.fromhex(
    "A5E2"          # LDA $E2
    "658E"          # ADC $8E (vanilla bank resolution)
    "29FF00"        # AND #$00FF (isolate bank byte)
    # Check for WW banks first (most common for WW users)
    "C9EC00"        # CMP #$00EC (WW high bank)
    "F02B"          # BEQ → EC handler (offset 55, from 12 = +43)
    "C9EB00"        # CMP #$00EB (WW low bank)
    "F01F"          # BEQ → EB handler (offset 48, from 17 = +31)
    # Vanilla cases
    "C9D400"        # CMP #$00D4
    "F013"          # BEQ → D4 handler (offset 41, from 22 = +19)
    "C9D300"        # CMP #$00D3
    "F007"          # BEQ → D3 handler (offset 34, from 27 = +7)
    # Default: D2
    "A91F00"        # LDA #$001F
    "547ED2"        # MVN $7E,$D2
    "6B"            # RTL
    # D3 handler (offset 34)
    "A91F00"        # LDA #$001F
    "547ED3"        # MVN $7E,$D3
    "6B"            # RTL
    # D4 handler (offset 41)
    "A91F00"        # LDA #$001F
    "547ED4"        # MVN $7E,$D4
    "6B"            # RTL
    # EB handler (offset 48, WW low bank)
    "A91F00"        # LDA #$001F
    "547EEB"        # MVN $7E,$EB
    "6B"            # RTL
    # EC handler (offset 55, WW high bank)
    "A91F00"        # LDA #$001F
    "547EEC"        # MVN $7E,$EC
    "6B"            # RTL
)
assert len(DISPATCH_ROUTINE_NEW) == 62, f"dispatch routine is {len(DISPATCH_ROUTINE_NEW)}, expected 62"


def ips_record(off, payload):
    """Create an IPS record for a contiguous patch."""
    assert len(payload) > 0 and len(payload) <= 0xFFFF
    assert off != 0x454F46  # 'EOF' collision
    return off.to_bytes(3, "big") + len(payload).to_bytes(2, "big") + payload


def build_ips(art_data):
    """Build IPS with hooks, routines, and art."""
    ips = b"PATCH"

    # Hook patches (in ROM order)
    ips += ips_record(BATTLE_HOOK_OFF, BATTLE_HOOK_NEW)
    ips += ips_record(PHASE1_OFF, PHASE1_NEW)
    ips += ips_record(MENU_HOOK_OFF, MENU_HOOK_NEW)
    ips += ips_record(DISPATCH_HOOK_OFF, DISPATCH_HOOK_NEW)
    ips += ips_record(PALETTE_OFF, PALETTE_NEW)

    # Art data at EB:E3E0
    ips += ips_record(ART_DST_OFF, art_data)

    # Routines at EC:3668 (contiguous block)
    routines = BATTLE_ROUTINE_NEW + MENU_ROUTINE_NEW + DISPATCH_ROUTINE_NEW
    ips += ips_record(BATTLE_ROUTINE_OFF_NEW, routines)

    ips += b"EOF"
    return ips


def verify(data, off, expected, name, exact=True):
    """Verify bytes at offset match expected."""
    got = bytes(data[off:off + len(expected)])
    if exact:
        match = got == expected
    else:
        match = got[:len(expected)] == expected[:len(got)]
    if match:
        print(f"  OK    {name} at ${off:06X}")
    else:
        print(f"  FAIL  {name} at ${off:06X}")
        print(f"        expected {expected.hex(' ').upper()}")
        print(f"        found    {got.hex(' ').upper()}")
    return match


def main():
    if not FF5R_CLEAN.exists():
        sys.exit(f"ERROR: FF5R Clean ROM not found: {FF5R_CLEAN}")
    if not WW_SOURCE.exists():
        sys.exit(f"ERROR: WW source ROM not found: {WW_SOURCE}")

    print(f"Reading {FF5R_CLEAN.name} ({FF5R_CLEAN.stat().st_size:,} bytes)")
    rom = bytearray(FF5R_CLEAN.read_bytes())
    if len(rom) != ROM_SIZE:
        sys.exit(f"ERROR: Expected {ROM_SIZE} bytes, got {len(rom)}")

    print(f"Reading art from {WW_SOURCE.name}")
    ww_rom = WW_SOURCE.read_bytes()
    art_data = ww_rom[ART_SRC_OFF:ART_SRC_OFF + ART_SIZE]
    if len(art_data) != ART_SIZE:
        sys.exit(f"ERROR: Art data incomplete (got {len(art_data)}, need {ART_SIZE})")

    print("\nVerifying FF5R hook sites are vanilla...")
    ok = True
    ok &= verify(rom, BATTLE_HOOK_OFF, BATTLE_HOOK_VANILLA, "battle hook site")
    ok &= verify(rom, PHASE1_OFF, PHASE1_VANILLA, "Phase-1 palette site")
    ok &= verify(rom, MENU_HOOK_OFF, MENU_HOOK_VANILLA, "menu hook site")
    ok &= verify(rom, DISPATCH_HOOK_OFF, DISPATCH_VANILLA, "dispatch site")
    ok &= verify(rom, PALETTE_OFF, PALETTE_VANILLA, "menu palette site")
    if not ok:
        sys.exit("Hook site verification failed - FF5R may have modified these")

    print("\nVerifying freespace is clear...")
    if rom[ART_DST_OFF:ART_DST_OFF + 64] != bytes(64):
        sys.exit(f"ERROR: Art destination ${ART_DST_OFF:06X} is not empty")
    if rom[BATTLE_ROUTINE_OFF_NEW:BATTLE_ROUTINE_OFF_NEW + 64] != bytes(64):
        sys.exit(f"ERROR: Routine destination ${BATTLE_ROUTINE_OFF_NEW:06X} is not empty")
    print(f"  OK    EB:E3E0 - EC:371B is clear")

    print("\nApplying patches...")
    # Hooks
    rom[BATTLE_HOOK_OFF:BATTLE_HOOK_OFF + len(BATTLE_HOOK_NEW)] = BATTLE_HOOK_NEW
    rom[PHASE1_OFF:PHASE1_OFF + len(PHASE1_NEW)] = PHASE1_NEW
    rom[MENU_HOOK_OFF:MENU_HOOK_OFF + len(MENU_HOOK_NEW)] = MENU_HOOK_NEW
    rom[DISPATCH_HOOK_OFF:DISPATCH_HOOK_OFF + len(DISPATCH_HOOK_NEW)] = DISPATCH_HOOK_NEW
    rom[PALETTE_OFF:PALETTE_OFF + len(PALETTE_NEW)] = PALETTE_NEW
    # Art
    rom[ART_DST_OFF:ART_DST_OFF + ART_SIZE] = art_data
    # Routines
    routines = BATTLE_ROUTINE_NEW + MENU_ROUTINE_NEW + DISPATCH_ROUTINE_NEW
    rom[BATTLE_ROUTINE_OFF_NEW:BATTLE_ROUTINE_OFF_NEW + len(routines)] = routines

    OUTPUT_ROM.write_bytes(rom)
    print(f"  Written {OUTPUT_ROM.name} ({len(rom):,} bytes)")

    ips = build_ips(art_data)
    OUTPUT_IPS.write_bytes(ips)
    print(f"  Written {OUTPUT_IPS.name} ({len(ips):,} bytes)")

    print("\n" + "=" * 60)
    print("FF5R Wounded Wardrobe v0.09 - Relocation Summary")
    print("=" * 60)
    print("\nHook site changes (in-place, same addresses as vanilla WW):")
    print(f"  C1:2517  JSL $EC3668  (battle sprite loader)")
    print(f"  C1:B1C7  NOPx3        (battle palette: keep job colors)")
    print(f"  C2:D2BB  JSL $EC36AB  (menu sprite loader)")
    print(f"  C2:D319  JSL $EC36E0  (MVN bank dispatch)")
    print(f"  C2:D47C  NOPx2        (menu palette: keep job colors)")
    print("\nRelocated data (moved from E8 to EB/EC):")
    print(f"  EB:E3E0 - EC:365F  Sprite art (110 x $C0 = $5280 bytes)")
    print(f"  EC:3668 - EC:36A9  Battle routine (67 bytes)")
    print(f"  EC:36AB - EC:36DF  Menu routine (53 bytes)")
    print(f"  EC:36E0 - EC:371B  Dispatch routine (60 bytes)")
    print("\nKey difference: routines now compute bank dynamically (EB or EC)")
    print("because sprite data spans the bank boundary at EB:FFFF -> EC:0000.")
    print("\nTest: KO a party member, check battle and menu for correct job sprite.")


if __name__ == "__main__":
    main()
