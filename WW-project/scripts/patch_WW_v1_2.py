#!/usr/bin/env python3
"""
FFV KO Palette Hack — v1.2 patch script

Single hook inside the $7CB5 palette loader loop at $C1:7CD9.
  - ALIVE iteration ($9A != 0): saves palette_group to $7F:08C0+slot
  - KO    iteration ($9A == 0): restores palette_group from $7F:08C0+slot
                                (if backup == 0, keeps 0 = genuine Freelancer)

WRAM backup table: $7F:08C0–$7F:08C3 (confirmed unwritten during battle)

Usage:
  python patch_ko_v1_2.py <input_rom> [output_rom]

  input_rom:  path to a CLEAN ff5c.sfc (no prior KO hack patches)
  output_rom: optional; defaults to ff5c_v1.2.sfc
"""

import sys
from pathlib import Path

# ── Patch site ───────────────────────────────────────────────────────────────

# Hook: $7CB5 loop body at file offset $017CD9
# Replaces: 29 1C 4A 85 9A  (AND #$1C / LSR / STA $9A — 5 bytes)
# With:     5C 9C FF C9 EA  (JML $C9FF9C / NOP)
HOOK_OFFSET   = 0x017CD9
HOOK_ORIGINAL = bytes([0x29, 0x1C, 0x4A, 0x85, 0x9A])
HOOK_PATCH    = bytes([0x5C, 0x9C, 0xFF, 0xC9, 0xEA])

# ── Payload ──────────────────────────────────────────────────────────────────
# File offset $09FF9C (SNES $C9FF9C) — 38 bytes
#
# Entry state: A = $D10A (loop pre-loaded it with LDA $D10A before our hook)
#
# Layout:
#   +00  replicate hook-site (AND #$1C / LSR / STA $9A)
#   +05  extract slot from $D10A → X
#   +16  reload $9A; branch on alive vs KO
#   +20  [KO path]   LDA $7F08C0,X → if non-zero STA $9A → skip SAVE
#   +30  [SAVE path] STA $7F08C0,X  (A still = $9A from the LDA above)
#   +34  JML $C17CDE  (return to: LDA $88 / JSR $0A32)
#
PAYLOAD_OFFSET = 0x09FF9C
PAYLOAD = bytes([
    # --- replicate hook-site ---
    0x29, 0x1C,              # AND #$1C          isolate palette bits 4-2
    0x4A,                    # LSR               → palette_group (0-7)
    0x85, 0x9A,              # STA $9A           store
    # --- extract slot → X ---
    0xAD, 0x0A, 0xD1,        # LDA $D10A         re-read for slot bits
    0x29, 0x60,              # AND #$60          bits 6-5
    0x4A, 0x4A, 0x4A,        # LSR × 3
    0x4A, 0x4A,              # LSR × 2          → slot 0-3
    0xAA,                    # TAX
    # --- branch: alive vs KO ---
    0xA5, 0x9A,              # LDA $9A
    0xD0, 0x0A,              # BNE +$0A          alive ($9A!=0) → SAVE at +30
    # --- KO path ($9A == 0) ---
    0xBF, 0xC0, 0x08, 0x7F,  # LDA $7F08C0,X    load saved palette_group
    0xF0, 0x08,              # BEQ +$08          backup==0 → genuine Freelancer; skip to JML
    0x85, 0x9A,              # STA $9A           restore palette_group
    0x80, 0x04,              # BRA +$04          → JML
    # --- SAVE path (alive, $9A != 0) ---
    0x9F, 0xC0, 0x08, 0x7F,  # STA $7F08C0,X    backup[slot] = palette_group
    # --- return ---
    0x5C, 0xDE, 0x7C, 0xC1,  # JML $C17CDE      → LDA $88 / JSR $0A32
])

# ── Helpers ──────────────────────────────────────────────────────────────────

def verify_branch(payload, branch_offset, expected_target, label):
    raw = payload[branch_offset + 1]
    displacement = raw if raw < 0x80 else raw - 0x100
    pc_after = branch_offset + 2
    actual = pc_after + displacement
    if actual != expected_target:
        raise AssertionError(
            f"Branch self-test FAILED — {label}: "
            f"at +{branch_offset} disp={raw:#04x} → +{actual}, expected +{expected_target}"
        )
    print(f"  branch ok: {label:40s}  +{branch_offset} → +{actual}")


def check_site(rom, offset, expected, label):
    actual = rom[offset : offset + len(expected)]
    if actual == expected:
        print(f"  ok:   {label}  (${offset:06X})")
        return True
    print(f"  FAIL: {label}  (${offset:06X})")
    print(f"        expected: {expected.hex(' ').upper()}")
    print(f"        found:    {actual.hex(' ').upper()}")
    return False

# ── Main ─────────────────────────────────────────────────────────────────────

def main():
    args = sys.argv[1:]
    if not args:
        print(__doc__)
        print("Error: no input ROM specified.")
        sys.exit(1)

    in_path  = Path(args[0])
    out_path = Path(args[1]) if len(args) > 1 else Path("ff5c_v1.2.sfc")

    if not in_path.exists():
        print(f"Error: '{in_path}' not found.")
        sys.exit(1)

    rom = bytearray(in_path.read_bytes())
    print(f"Loaded '{in_path.name}'  ({len(rom):,} bytes / {len(rom) // 1024} KB)")

    if len(rom) != 0x400000:
        print(f"  [WARN] Expected 4 MB (0x400000), got {len(rom):#x}. Proceeding anyway.")

    # ── Self-test: branch displacements ──────────────────────────────────────
    print("\nBranch displacement self-tests:")
    assert len(PAYLOAD) == 38, f"Payload size wrong: {len(PAYLOAD)} (expected 38)"
    # BNE at +18 → SAVE at +30
    verify_branch(PAYLOAD, branch_offset=18, expected_target=30, label="BNE alive→SAVE  (+18 → +30)")
    # BEQ at +24 → JML at +34
    verify_branch(PAYLOAD, branch_offset=24, expected_target=34, label="BEQ backup=0→JML (+24 → +34)")
    # BRA at +28 → JML at +34
    verify_branch(PAYLOAD, branch_offset=28, expected_target=34, label="BRA KO→JML      (+28 → +34)")

    # ── Pre-patch ROM verification ────────────────────────────────────────────
    print("\nPre-patch ROM checks:")
    ok = all([
        check_site(rom, HOOK_OFFSET,    HOOK_ORIGINAL, "Hook site   ($7CB5 loop  $017CD9)"),
        check_site(rom, PAYLOAD_OFFSET, bytes(38),      "Freespace   ($09FF9C  all-zero)"),
    ])

    if not ok:
        print("\nPre-patch checks FAILED — ROM may not be a clean ff5c.")
        print("Patch NOT applied.")
        sys.exit(1)

    # ── Apply ─────────────────────────────────────────────────────────────────
    rom[HOOK_OFFSET    : HOOK_OFFSET    + len(HOOK_PATCH)] = HOOK_PATCH
    rom[PAYLOAD_OFFSET : PAYLOAD_OFFSET + len(PAYLOAD)]    = PAYLOAD

    out_path.write_bytes(rom)

    print(f"\nPatch applied successfully → '{out_path.name}'")
    print(f"  Hook     ${HOOK_OFFSET:06X}  29 1C 4A 85 9A → 5C 9C FF C9 EA  (JML $C9FF9C + NOP)")
    print(f"  Payload  ${PAYLOAD_OFFSET:06X}  {len(PAYLOAD)} bytes  (save+restore combined)")
    print(f"  WRAM     $7F:08C0–$7F:08C3  (confirmed unwritten during battle)")


if __name__ == "__main__":
    main()
