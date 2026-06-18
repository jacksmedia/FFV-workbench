"""find_free_space.py - Find contiguous free ROM space in FFV

Searches for blocks of $FF bytes that could be used for new code/data.

Usage:
    python find_free_space.py                    # Search all banks
    python find_free_space.py D1 D2              # Search specific banks
    python find_free_space.py --min-size 512     # Find blocks >= 512 bytes
"""

import sys
from pathlib import Path

ROM_PATH = Path(r"C:\Users\xj4x\Documents\5work\crawler\ff5 RPGe [crc32=17444605].sfc")

def find_free_blocks(rom: bytes, start: int, end: int, min_size: int = 256) -> list:
    """Find contiguous blocks of $FF bytes."""
    blocks = []
    in_block = False
    block_start = 0

    for offset in range(start, min(end, len(rom))):
        if rom[offset] == 0xFF:
            if not in_block:
                in_block = True
                block_start = offset
        else:
            if in_block:
                block_size = offset - block_start
                if block_size >= min_size:
                    blocks.append((block_start, block_size))
                in_block = False

    # Check final block
    if in_block:
        block_size = min(end, len(rom)) - block_start
        if block_size >= min_size:
            blocks.append((block_start, block_size))

    return blocks

def file_to_snes(offset: int) -> str:
    """Convert file offset to SNES HiROM address."""
    bank = (offset >> 16) + 0xC0
    addr = (offset & 0xFFFF) | 0x8000
    if offset >= 0x400000:
        # Handle expanded ROM
        bank = (offset >> 16)
    return f"${bank:02X}:{addr:04X}"

def main():
    args = sys.argv[1:]

    min_size = 256
    banks = []

    for arg in args:
        if arg.startswith('--min-size='):
            min_size = int(arg.split('=')[1])
        elif arg.startswith('--min-size'):
            continue  # Handle next iteration
        elif arg.isalnum() and len(arg) <= 2:
            try:
                banks.append(int(arg, 16))
            except ValueError:
                pass

    # Default: search D0-D9 (common data banks)
    if not banks:
        banks = [0xD0, 0xD1, 0xD2, 0xD3, 0xD4, 0xD5, 0xD6, 0xD7, 0xD8, 0xD9]

    print(f"Searching for free space (minimum {min_size} bytes)")
    print(f"Banks: {', '.join(f'${b:02X}' for b in banks)}")
    print("=" * 60)

    if not ROM_PATH.exists():
        print(f"ROM not found: {ROM_PATH}")
        return 1

    rom = ROM_PATH.read_bytes()
    print(f"ROM size: {len(rom):,} bytes\n")

    total_free = 0

    for bank in banks:
        # Convert bank to file offset range
        # HiROM: Bank $C0+ maps to file offset (bank-$C0)*$10000
        if bank >= 0xC0:
            start = (bank - 0xC0) * 0x10000
        else:
            start = bank * 0x10000
        end = start + 0x10000

        blocks = find_free_blocks(rom, start, end, min_size)

        if blocks:
            print(f"Bank ${bank:02X} ({start:06X}-{end-1:06X}):")
            for offset, size in blocks:
                snes = file_to_snes(offset)
                print(f"  {offset:06X} ({snes}): {size:,} bytes free")
                total_free += size
            print()

    print("=" * 60)
    print(f"Total free space found: {total_free:,} bytes")

    # Highlight best candidates for VWF code (~512 bytes needed)
    print(f"\nBest candidates for VWF code (need ~512 bytes):")

    for bank in banks:
        if bank >= 0xC0:
            start = (bank - 0xC0) * 0x10000
        else:
            start = bank * 0x10000
        end = start + 0x10000

        blocks = find_free_blocks(rom, start, end, 512)
        for offset, size in blocks:
            snes = file_to_snes(offset)
            print(f"  {snes} - {size:,} bytes")

    return 0

if __name__ == "__main__":
    sys.exit(main())
