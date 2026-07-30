#!/usr/bin/env python3
"""
FFV Spear Palette Fix - Test Patch

This patch removes the hardcoded spear skip at C1/66BC that prevents
spear weapons from using palette variation like swords/knives/katanas.

BEFORE: Spears always use offset 0 (brown/generic shaft)
AFTER:  Spears use the same offset calculation as other weapons

Location: C1/66BC (file offset $0166BC)
Original: F0 0B (BEQ $66C9 - skip offset calc for spears)
Patched:  EA EA (NOP NOP - let spears use offset calc)

Usage:
    python patch_spear_palette.py ff5c.sfc
    python patch_spear_palette.py ff5c.sfc --revert

Author: FFV Clean project, 2026-07-29
"""

import sys
import os
import shutil

PATCH_OFFSET = 0x0166BC
ORIGINAL_BYTES = bytes([0xF0, 0x0B])  # BEQ $66C9
PATCHED_BYTES = bytes([0xEA, 0xEA])   # NOP NOP

def main():
    if len(sys.argv) < 2:
        print(__doc__)
        print("Error: Please provide ROM filename")
        sys.exit(1)

    rom_path = sys.argv[1]
    revert = "--revert" in sys.argv

    if not os.path.exists(rom_path):
        print(f"Error: ROM file not found: {rom_path}")
        sys.exit(1)

    # Create backup
    backup_path = rom_path + ".pre-spear-patch"
    if not os.path.exists(backup_path):
        shutil.copy(rom_path, backup_path)
        print(f"Created backup: {backup_path}")

    with open(rom_path, "r+b") as f:
        f.seek(PATCH_OFFSET)
        current = f.read(2)

        if revert:
            if current == ORIGINAL_BYTES:
                print("Already at original state (spear skip active)")
            else:
                f.seek(PATCH_OFFSET)
                f.write(ORIGINAL_BYTES)
                print("Reverted: Spear skip restored (original behavior)")
        else:
            if current == PATCHED_BYTES:
                print("Already patched (spear offset calc enabled)")
            elif current == ORIGINAL_BYTES:
                f.seek(PATCH_OFFSET)
                f.write(PATCHED_BYTES)
                print("Patched: Spear offset calculation now enabled!")
                print("")
                print("Test this by:")
                print("  1. Load a save with a spear-wielding character")
                print("  2. Enter battle and use Fight")
                print("  3. The spear shaft should now change color based on weapon")
            else:
                print(f"Warning: Unexpected bytes at patch location: {current.hex()}")
                print(f"Expected original: {ORIGINAL_BYTES.hex()}")
                print("ROM may already be modified. Use --force to patch anyway.")

if __name__ == "__main__":
    main()
