#!/usr/bin/env python3
"""
patch_ko_v2.py - KO Palette Fix v2.0 for FFV RPGe (ff5c.sfc)

Patches two sites where the game forces Freelancer (palette group $15) on KO'd characters,
restoring their alive-state job palette instead.

Input:  ff5c.sfc.bak  (clean 4MB expanded ROM, no prior hack edits)
Output: ff5c_ko_v2.sfc

P1  $C2:D47C  Battle init/refresh ($D45F): remove dead->Freelancer force.
    Applies when $D3DB runs (every frame or on battle events) and $D45F checks
    death status on $051A,X. Without the patch: LDA #$15 overrides job palette.
    With NOP NOP: $0501,X job palette passes through unchanged to $D492/MVN->CGRAM.

P2  $C2:D97F  KO event handler ($D986+): load job palette instead of Freelancer,
    and bypass JSR $D987 entirely to prevent $0501,X corruption.
    Original: LDA #$15 / JSR $D987  ($D987 does STA $D8, JSR $E47D, STA $0501,X)
    Patched:  LDA $0501,X / STA $D8 (load real job palette, skip $D987 completely)
    Effect:   $D8 = correct job palette, $0501,X untouched, OAM retains alive attrib.

NOTE: P3 (NOP STA $0501,X inside $D987) was considered but dropped -- $D987 is
also called from $C2:A425 (legitimate palette group initializer) where the STA
$0501,X write IS needed.
"""

import sys
from pathlib import Path

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------

INPUT_ROM  = Path("ff5c.sfc.bak")
OUTPUT_ROM = Path("ff5c_ko_v2.sfc")

PATCHES = [
    {
        "name": "P1 -- $C2:D47C -- battle init: NOP dead->Freelancer force",
        "find":    bytes([0xA9, 0x15, 0xEB, 0x20, 0x92, 0xD4]),
        "replace": bytes([0xEA, 0xEA, 0xEB, 0x20, 0x92, 0xD4]),
        # A9 15       = LDA #$15  (force Freelancer palette index on dead chars)
        # EB          = XBA       (swap into low byte)
        # 20 92 D4    = JSR $D492 (palette writer -> MVN to CGRAM shadow)
        # ->  EA EA   = NOP NOP; XBA and JSR $D492 unchanged.
        #     $0501,X job palette passes through; CGRAM shadow = correct job colors.
    },
    {
        "name": "P2 -- $C2:D97F -- KO handler: load job palette, skip JSR $D987",
        "find":    bytes([0xA9, 0x15, 0x20, 0x87, 0xD9]),
        "replace": bytes([0xBD, 0x01, 0x05, 0x85, 0xD8]),
        # Original 5 bytes:
        #   A9 15       = LDA #$15     (Freelancer into A)
        #   20 87 D9    = JSR $D987    (STA $D8, JSR $E47D OAM update, STA $0501,X)
        #
        # Patched 5 bytes:
        #   BD 01 05    = LDA $0501,X  (load actual job palette; X = char struct ptr)
        #   85 D8       = STA $D8      (store for any downstream reads, harmless)
        #
        # Falls through to PLB / PLP / RTS (end of KO handler).
        # Effect: $0501,X uncorrupted; OAM retains alive-state palette attrib;
        #         next $D3DB/$D45F run writes correct CGRAM shadow.
    },
]

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def find_all(data: bytes, pattern: bytes) -> list:
    offsets = []
    start = 0
    while True:
        idx = data.find(pattern, start)
        if idx == -1:
            break
        offsets.append(idx)
        start = idx + 1
    return offsets


def apply_patch(data: bytearray, patch: dict) -> int:
    """Apply one patch in-place. Returns the file offset. Raises ValueError on mismatch."""
    offsets = find_all(data, patch["find"])

    if len(offsets) == 0:
        raise ValueError(
            "%s\n  Pattern NOT FOUND: %s\n"
            "  Verify INPUT_ROM is the clean .bak file (no prior hacks)."
            % (patch["name"], patch["find"].hex(" ").upper())
        )

    if len(offsets) > 1:
        locs = " / ".join("$%06X" % o for o in offsets)
        raise ValueError(
            "%s\n  Pattern found %d times (expected 1): %s\n"
            "  Extend the search pattern or inspect ROM."
            % (patch["name"], len(offsets), locs)
        )

    off = offsets[0]
    data[off : off + len(patch["replace"])] = patch["replace"]
    return off

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    if not INPUT_ROM.exists():
        print("ERROR: Input ROM not found: %s" % INPUT_ROM)
        sys.exit(1)

    print("Reading %s  (%d bytes)" % (INPUT_ROM, INPUT_ROM.stat().st_size))
    data = bytearray(INPUT_ROM.read_bytes())

    print()
    all_ok = True
    for patch in PATCHES:
        try:
            file_off = apply_patch(data, patch)
            # HiROM: file $020000 = SNES $C2:0000
            snes_lo = 0xC20000 + (file_off - 0x020000)
            print("  OK  %s" % patch["name"])
            print("      file $%06X  (SNES ~$%06X)" % (file_off, snes_lo))
            print("      %s  ->  %s" % (
                patch["find"].hex(" ").upper(),
                patch["replace"].hex(" ").upper()
            ))
            print()
        except ValueError as e:
            print("  FAIL  %s" % e)
            print()
            all_ok = False

    if not all_ok:
        print("Aborting -- one or more patches failed. Output not written.")
        sys.exit(1)

    OUTPUT_ROM.write_bytes(data)
    print("Written -> %s  (%d bytes)" % (OUTPUT_ROM, OUTPUT_ROM.stat().st_size))
    print()
    print("Summary:")
    print("  P1  $C2:D47C  LDA #\$15 (dead->Freelancer in battle init)  ->  NOP NOP")
    print("  P2  $C2:D97F  LDA #\$15 / JSR \$D987 (KO handler)  ->  LDA \$0501,X / STA \$D8")
    print()
    print("Load ff5c_ko_v2.sfc in Mesen and KO a character mid-battle.")
    print("They should retain their alive-state job palette colors.")


if __name__ == "__main__":
    main()
