"""extract_font_tiles.py — FFV (RPGe) 2bpp font tile extractor

Font tiles are stored in ROM as SNES 2bpp (16 bytes/tile), starting at
ROM file offset $11F000.  The "1bpp" in ffv_font.tbl refers to 1-byte-per-
character text encoding, NOT the tile storage format.

This script extracts all 256 8x8 tiles from the ROM and writes:

  out/font/font_sheet.png          16x16 composite tile sheet
  out/font/font_sheet_labeled.png  same sheet annotated with tile IDs
                                   and table-file characters
  out/font/tiles/tile_XX.png       individual tile per hex index

Palette source  : PRG ROM file offset $F827-$F82E (annotated in screenshot)
Tile format     : SNES 2bpp, 8x8 px, 16 bytes/tile
Tile data base  : ROM file offset $11F000 (annotated in Tile Molester view)
Anchor          : tile $61 = 'B'  (confirmed via Mesen tilemap viewer)
                  tile_index = row*16 + col  ->  6*16+1 = $61

Usage:
    python extract_font_tiles.py                         # RPGe ROM, hardcoded offset
    python extract_font_tiles.py 0x11F000                # RPGe ROM, explicit offset
    python extract_font_tiles.py 0x11F000 ff5c.sfc       # custom ROM, explicit offset
    python extract_font_tiles.py auto ff5c.sfc            # custom ROM, auto-search

Output goes to:  out/<rom_stem>/font/
  e.g. out/FFV RPGe (CRC32 = 17444605)/font/  or  out/ff5c/font/

Requirements:
    pip install Pillow
"""

import sys
from pathlib import Path

# ── paths ──────────────────────────────────────────────────────────────────────

# Default ROM (overridden by CLI argument)
DEFAULT_ROM = Path(r"C:\Users\J4cks\Desktop\work5\crawler\_FFV RPGe (CRC32 = 17444605).sfc")

TBL_PATH = Path(r"C:\Users\J4cks\Desktop\work5\crawler\ffv_menufont_RPGe.tbl")

BASE_OUT  = Path(r"C:\Users\J4cks\Desktop\work5\crawler\out")

# ── tile format ────────────────────────────────────────────────────────────────

NUM_TILES      = 256
TILE_PX        = 8    # pixels per tile side
BYTES_PER_TILE = 16   # SNES 2bpp: 2 bytes per row × 8 rows

# Known-good ROM offset for the font tile block (confirmed via Tile Molester).
# Override via CLI: python extract_font_tiles.py 0x<offset>
FONT_TILES_ROM_OFFSET = 0x11F000

SHEET_COLS = 16      # tiles per row in composite sheet
SCALE      = 4       # each ROM pixel -> SCALE x SCALE output pixels
LABEL_H    = 12      # px height of label strip beneath each tile cell

# Second sheet uses a light background so dark-blue icon tiles are visible.
# PALETTE_RGB[0] (black) is remapped to this colour for the "light" sheet.
LIGHT_BG = (220, 220, 220)   # light grey

# ── palette ────────────────────────────────────────────────────────────────────
#
# Source: PRG ROM file offset $F827 (SNES address $00:F827, Memory Type PRG ROM).
# Raw bytes at $F827-$F82E:  00 00 | 00 40 | CE 39 | FF 7F
# Decoded as little-endian SNES BGR555 words:
#
#   index  BGR555  R5  G5  B5   R8    G8    B8    role in-game
#   -----  ------  --  --  --  ---   ---   ---   -------------------
#     0    0x0000   0   0   0    0     0     0    black (background)
#     1    0x4000   0   0  16    0     0   131    dark blue (shadow)
#     2    0x39CE  14  14  14  115   115   115    mid grey
#     3    0x7FFF  31  31  31  255   255   255    white (text body)
#
# 2bpp palette index mapping:
#   index 0 -> colour 0 (black, background/transparent)
#   index 1 -> colour 1 (dark blue, outer shadow/glow)
#   index 2 -> colour 2 (mid grey, inner anti-alias)
#   index 3 -> colour 3 (white, letter body)

PALETTE_ROM_OFFSET = 0xF827

_PALETTE_BGR555 = [0x0000, 0x4000, 0x39CE, 0x7FFF]

def _bgr555_to_rgb8(word: int) -> tuple:
    r = (word & 0x001F)
    g = (word & 0x03E0) >> 5
    b = (word & 0x7C00) >> 10
    scale = lambda v: (v * 255) // 31
    return (scale(r), scale(g), scale(b))

PALETTE_RGB = [_bgr555_to_rgb8(c) for c in _PALETTE_BGR555]
# ── SNES 2bpp decoder ──────────────────────────────────────────────────────────

def decode_2bpp_tile(data: bytes) -> list:
    """
    Decode a 16-byte SNES 2bpp tile into an 8x8 grid of palette indices (0-3).

    SNES 2bpp row layout (2 bytes per row, 8 rows = 16 bytes):
        byte 2r+0 = bitplane 0 for row r
        byte 2r+1 = bitplane 1 for row r
    MSB of each byte = leftmost pixel (pixel 0), LSB = rightmost (pixel 7).
    Palette index = (bitplane1_bit << 1) | bitplane0_bit  -> 0-3
    """
    assert len(data) == BYTES_PER_TILE, f"Expected 16 bytes, got {len(data)}"
    rows = []
    for r in range(TILE_PX):
        p0  = data[r * 2]
        p1  = data[r * 2 + 1]
        row = []
        for x in range(TILE_PX):
            shift = 7 - x
            row.append(((p1 >> shift) & 1) << 1 | ((p0 >> shift) & 1))
        rows.append(row)
    return rows

def tile_to_image(grid: list, scale: int = 1, bg_override=None):
    """
    Render an 8x8 palette-index grid to a PIL RGB Image.

    bg_override: if set, replaces PALETTE_RGB[0] (black/transparent) with
                 this colour — useful for making dark-blue icon tiles visible
                 against a light background.
    """
    from PIL import Image
    palette = list(PALETTE_RGB)
    if bg_override is not None:
        palette[0] = bg_override
    sz  = TILE_PX * scale
    img = Image.new("RGB", (sz, sz))
    px  = img.load()
    for y, row in enumerate(grid):
        for x, idx in enumerate(row):
            colour = palette[idx]
            for sy in range(scale):
                for sx in range(scale):
                    px[x * scale + sx, y * scale + sy] = colour
    return img

# ── palette verifier ───────────────────────────────────────────────────────────

def verify_palette(rom: bytes) -> bool:
    """Cross-check hard-coded palette against the ROM bytes at $F827."""
    raw     = rom[PALETTE_ROM_OFFSET : PALETTE_ROM_OFFSET + 8]
    rom_bgr = [int.from_bytes(raw[i*2:i*2+2], "little") for i in range(4)]
    rom_rgb = [_bgr555_to_rgb8(c) for c in rom_bgr]
    if rom_rgb != PALETTE_RGB:
        print("  [!] Palette mismatch — ROM values differ from hard-coded constants.")
        print(f"      ROM BGR555 words : {[hex(c) for c in rom_bgr]}")
        print(f"      Hard-coded       : {[hex(c) for c in _PALETTE_BGR555]}")
        return False
    return True

# ── table file loader ──────────────────────────────────────────────────────────

def load_table(path: Path) -> dict:
    """
    Parse ffv_font.tbl (HH=value per line, ; comments, blank lines ignored).
    Returns {tile_index: label_string}.
    """
    table = {}
    if not path.exists():
        return table
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.split(";")[0].strip()
        if "=" not in line:
            continue
        hex_part, _, val = line.partition("=")
        try:
            table[int(hex_part.strip(), 16)] = val.strip()
        except ValueError:
            continue
    return table

# ── heuristic offset finder ────────────────────────────────────────────────────

def find_font_offset(rom: bytes) -> list:
    """
    Search the ROM for a 2bpp font block (256 tiles x 16 bytes = 4096 bytes).

    Primary check: known offset FONT_TILES_ROM_OFFSET is returned immediately
    if its tile $61 is non-zero and tile $FF is all-zero.

    Fallback full scan constraints per candidate start offset O:
      - Tile $FF (space, at O + 0xFF*16) must be all-zero (16 zero bytes).
      - All 26 uppercase tiles $60-$79 must be non-zero.
      - All 26 lowercase tiles $7A-$93 must be non-zero.
      - All 10 digit tiles $53-$5C must be non-zero.
      - Tiles $60 (A), $61 (B), $70 (Q) must all differ from each other.
      - Tile $61 ('B') first two bytes must differ from last two bytes
        (rows 0 and 7 differ — rules out uniform fills).

    Scans tile-aligned (16-byte steps).
    """
    BLOCK = NUM_TILES * BYTES_PER_TILE   # 4096 bytes

    def tile(o, idx):
        s = o + idx * BYTES_PER_TILE
        return rom[s : s + BYTES_PER_TILE]

    # Fast-path: test the known offset first
    o = FONT_TILES_ROM_OFFSET
    if (o + BLOCK <= len(rom)
            and not any(tile(o, 0xFF))
            and any(tile(o, 0x61))):
        return [o]

    NONZERO = list(range(0x60, 0x7A)) + list(range(0x7A, 0x94)) + list(range(0x53, 0x5D))
    candidates = []

    for o in range(0, len(rom) - BLOCK, BYTES_PER_TILE):
        if any(tile(o, 0xFF)):
            continue
        if any(not any(tile(o, idx)) for idx in NONZERO):
            continue
        a, b, q = tile(o, 0x60), tile(o, 0x61), tile(o, 0x70)
        if a == b or b == q or a == q:
            continue
        if b[:2] == b[14:16]:   # top row == bottom row -> suspicious
            continue
        candidates.append(o)

    return candidates

# ── sheet builder ──────────────────────────────────────────────────────────────

def build_sheet(grids: list, labels: dict, annotate: bool, path: Path,
                bg_override=None):
    """
    Composite 16x16 tile sheet, optionally annotated with hex IDs + labels.

    grids       : list of 256 decoded tile grids (list of list of int)
    bg_override : passed through to tile_to_image(); use LIGHT_BG for the
                  light-background sheet so dark-blue icons are visible
    """
    from PIL import Image, ImageDraw

    tw       = TILE_PX * SCALE
    th       = TILE_PX * SCALE
    cell_h   = th + (LABEL_H if annotate else 0)
    rows     = NUM_TILES // SHEET_COLS
    bg_fill  = bg_override if bg_override else (30, 30, 30)

    sheet = Image.new("RGB", (SHEET_COLS * tw, rows * cell_h), bg_fill)
    draw  = ImageDraw.Draw(sheet) if annotate else None

    for i, grid in enumerate(grids):
        img = tile_to_image(grid, scale=SCALE, bg_override=bg_override)
        col = i % SHEET_COLS
        row = i // SHEET_COLS
        x   = col * tw
        y   = row * cell_h
        sheet.paste(img, (x, y))
        if annotate:
            raw_label = labels.get(i, "")
            if raw_label.startswith("[") and raw_label.endswith("]"):
                display = raw_label[1:-1][:5]
            else:
                display = raw_label
            text = f"{i:02X} {display}"
            max_ch = (tw - 2) // 6
            if len(text) > max_ch:
                text = text[:max_ch]
            text_col = (80, 80, 80) if bg_override else (160, 160, 160)
            draw.text((x + 1, y + th + 1), text, fill=text_col)

    sheet.save(path)
    print(f"  Saved: {path}")

# ── main ───────────────────────────────────────────────────────────────────────

def main():
    try:
        from PIL import Image, ImageDraw
    except ImportError:
        sys.exit("Pillow is required:  pip install Pillow")

    # ── parse CLI:  [offset]  [rom_path]  ──
    font_offset = None
    rom_path    = DEFAULT_ROM

    args = sys.argv[1:]
    for arg in args:
        p = Path(arg)
        if p.suffix.lower() in (".sfc", ".smc", ".bin") or p.exists():
            rom_path = p if p.is_absolute() else Path.cwd() / p
        elif arg.lower() == "auto":
            font_offset = None      # explicit auto-search
        else:
            try:
                font_offset = int(arg, 0)
            except ValueError:
                sys.exit(f"Unrecognised argument: {arg!r}\n"
                         f"Usage: extract_font_tiles.py [offset|auto] [rom_path]")

    # Derive per-ROM output dirs from the ROM stem
    rom_stem  = rom_path.stem          # e.g. "ff5c" or "_FFV RPGe (CRC32 = 17444605)"
    out_dir   = BASE_OUT / rom_stem / "font"
    tiles_dir = out_dir / "tiles"

    # Load ROM
    if not rom_path.exists():
        sys.exit(f"ROM not found: {rom_path}")
    rom = rom_path.read_bytes()
    print(f"ROM loaded: {len(rom):,} bytes  ({rom_path.name})")

    # Sanity-check palette
    print(f"Verifying palette at ROM offset 0x{PALETTE_ROM_OFFSET:05X}...")
    if verify_palette(rom):
        print(f"  Palette OK: {PALETTE_RGB}")

    # Find or confirm tile offset
    if font_offset is None:
        if FONT_TILES_ROM_OFFSET:
            # Known-good offset is hardcoded — use it directly.
            font_offset = FONT_TILES_ROM_OFFSET
            print(f"\nUsing hardcoded offset: 0x{font_offset:06X}"
                  f"  (override: python extract_font_tiles.py 0x<offset>)")
        else:
            # Offset unknown — run heuristic scan as a diagnostic aid.
            print(f"\nSearching ROM for 2bpp font block"
                  f" ({NUM_TILES} tiles x {BYTES_PER_TILE} bytes = "
                  f"{NUM_TILES * BYTES_PER_TILE} bytes)...")
            candidates = find_font_offset(rom)
            if not candidates:
                print("  No candidates found.")
                print("  In Tile Molester, set codec to 'SNES 2bpp' and note the")
                print("  file offset where tile $00 starts, then re-run:")
                print("    python extract_font_tiles.py 0x<offset>")
                return
            font_offset = candidates[0]
            print(f"  Best candidate: 0x{font_offset:06X}")
            if len(candidates) > 1:
                print(f"  ({len(candidates)-1} other candidates also matched)")
                print(f"  If output looks wrong, re-run with a different offset.")
    else:
        print(f"\nUsing supplied offset: 0x{font_offset:06X}")

    needed = font_offset + NUM_TILES * BYTES_PER_TILE
    if needed > len(rom):
        sys.exit(f"Offset 0x{font_offset:06X} + {NUM_TILES * BYTES_PER_TILE} bytes "
                 f"exceeds ROM size ({len(rom):,} bytes).")

    # Load table labels
    table = load_table(TBL_PATH)
    print(f"Table: {len(table)} entries from {TBL_PATH.name}" if table
          else "Table file not found — labels will be hex-only.")

    # Extract tiles
    out_dir.mkdir(parents=True, exist_ok=True)
    tiles_dir.mkdir(exist_ok=True)

    print(f"\nExtracting {NUM_TILES} tiles from 0x{font_offset:06X}...")
    grids = []
    for i in range(NUM_TILES):
        start = font_offset + i * BYTES_PER_TILE
        raw   = rom[start : start + BYTES_PER_TILE]
        grid  = decode_2bpp_tile(raw)
        grids.append(grid)
        # Save individual tile with black bg (authentic game colours)
        tile_to_image(grid, scale=SCALE).save(tiles_dir / f"tile_{i:02X}.png")

    print(f"  {NUM_TILES} individual tiles saved to {tiles_dir}/")

    # Build composite sheets
    print("\nBuilding composite sheets...")
    build_sheet(grids, table, annotate=False,
                path=out_dir / "font_sheet.png")
    build_sheet(grids, table, annotate=True,
                path=out_dir / "font_sheet_labeled.png")
    # Light-background sheet: colour-0 replaced with LIGHT_BG so dark-blue
    # icon tiles ($40-$52 range) are visible for identification.
    build_sheet(grids, table, annotate=True,
                path=out_dir / "font_sheet_light.png",
                bg_override=LIGHT_BG)

    print(f"\nDone. Output: {out_dir}")
    print(f"Pin this offset for future runs:")
    print(f"  python extract_font_tiles.py 0x{font_offset:06X} {rom_path.name}")


if __name__ == "__main__":
    main()
