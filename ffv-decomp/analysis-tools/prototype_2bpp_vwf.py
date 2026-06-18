"""prototype_2bpp_vwf.py - 2bpp VWF rendering algorithm prototype

Demonstrates the Variable Width Font rendering technique for SNES 2bpp tiles,
adapted from the proven RPGe 1bpp dialogue VWF approach.

This prototype:
1. Loads 2bpp tiles from the FFV ROM
2. Renders text with variable character widths
3. Outputs the result as a PNG for visual verification

Once verified, this algorithm can be translated to 65816 assembly.

Usage:
    python prototype_2bpp_vwf.py
    python prototype_2bpp_vwf.py "Hello World"
"""

import sys
from pathlib import Path

# ── Configuration ──────────────────────────────────────────────────────────────

ROM_PATH = Path(r"C:\Users\xj4x\Documents\5work\crawler\ff5 RPGe [crc32=17444605].sfc")
MENU_FONT_OFFSET = 0x11F000  # $D1F000 in SNES addressing (file offset)
OUTPUT_DIR = Path(r"C:\Users\xj4x\Documents\5work\crawler\out\vwf_test")

# 2bpp palette (same as menu font)
PALETTE = [
    (0, 0, 0),       # 0: Black (transparent)
    (0, 0, 131),     # 1: Dark blue (shadow)
    (115, 115, 115), # 2: Grey (anti-alias)
    (255, 255, 255), # 3: White (text body)
]

# ── 2bpp Tile Decoding ─────────────────────────────────────────────────────────

def decode_2bpp_tile(data: bytes) -> list:
    """
    Decode a 16-byte SNES 2bpp tile into 8x8 palette indices.

    SNES 2bpp format (interleaved):
        Byte 2r+0 = Row r, Bitplane 0
        Byte 2r+1 = Row r, Bitplane 1
    MSB = leftmost pixel (x=0), LSB = rightmost (x=7)
    Palette index = (BP1 << 1) | BP0
    """
    rows = []
    for r in range(8):
        bp0 = data[r * 2]
        bp1 = data[r * 2 + 1]
        row = []
        for x in range(8):
            shift = 7 - x
            idx = ((bp1 >> shift) & 1) << 1 | ((bp0 >> shift) & 1)
            row.append(idx)
        rows.append(row)
    return rows


def encode_2bpp_tile(grid: list) -> bytes:
    """
    Encode 8x8 palette indices back to 16-byte SNES 2bpp format.
    """
    data = bytearray(16)
    for r in range(8):
        bp0 = 0
        bp1 = 0
        for x in range(8):
            idx = grid[r][x] if r < len(grid) and x < len(grid[r]) else 0
            shift = 7 - x
            bp0 |= ((idx >> 0) & 1) << shift
            bp1 |= ((idx >> 1) & 1) << shift
        data[r * 2] = bp0
        data[r * 2 + 1] = bp1
    return bytes(data)


# ── VWF Rendering Engine ───────────────────────────────────────────────────────

class VWFRenderer:
    """
    Variable Width Font renderer for 2bpp tiles.

    Implements the RPGe algorithm adapted for 2bpp:
    1. Load tile into buffer
    2. Shift by sub-pixel amount
    3. OR into destination at pixel offset
    4. Advance cursor by character width
    """

    def __init__(self, rom: bytes, font_offset: int):
        self.rom = rom
        self.font_offset = font_offset
        self.cursor = 0  # Current X position in pixels

        # Destination buffer: enough for 256 pixels wide (32 tiles × 16 bytes)
        # Each "column" is 16 bytes (one 2bpp 8x8 tile)
        self.dest_buffer = bytearray(32 * 16)

        # Temp buffers for shift operation
        self.tile_buf = bytearray(16)
        self.overflow_buf = bytearray(16)

        # Default width table (will be overwritten with measured values)
        self.width_table = self._build_default_widths()

    def _build_default_widths(self) -> list:
        """Build a default width table - all 8 pixels."""
        return [8] * 256

    def set_width_table(self, widths: list):
        """Set custom width table."""
        self.width_table = widths

    def reset(self):
        """Clear the destination buffer and reset cursor."""
        self.cursor = 0
        for i in range(len(self.dest_buffer)):
            self.dest_buffer[i] = 0

    def load_tile(self, char_code: int):
        """Load a 2bpp tile from ROM into the tile buffer."""
        offset = self.font_offset + char_code * 16
        for i in range(16):
            self.tile_buf[i] = self.rom[offset + i] if offset + i < len(self.rom) else 0
            self.overflow_buf[i] = 0

    def shift_tile(self, shift_amount: int):
        """
        Shift the tile buffer right by shift_amount pixels (0-7).

        This is the core VWF operation - it aligns the character
        to the correct sub-pixel position.

        For 2bpp, we shift BOTH bitplanes in parallel to maintain
        the color relationships.
        """
        for _ in range(shift_amount):
            # Process each row (2 bytes per row: BP0, BP1)
            for row in range(8):
                bp0_idx = row * 2
                bp1_idx = row * 2 + 1

                # Shift BP0: tile_buf[bp0] -> overflow[bp0]
                carry0 = self.tile_buf[bp0_idx] & 1
                self.tile_buf[bp0_idx] >>= 1
                self.overflow_buf[bp0_idx] = (self.overflow_buf[bp0_idx] >> 1) | (carry0 << 7)

                # Shift BP1: tile_buf[bp1] -> overflow[bp1]
                carry1 = self.tile_buf[bp1_idx] & 1
                self.tile_buf[bp1_idx] >>= 1
                self.overflow_buf[bp1_idx] = (self.overflow_buf[bp1_idx] >> 1) | (carry1 << 7)

    def merge_to_dest(self):
        """
        OR the shifted tile (and overflow) into the destination buffer.

        dest_col = cursor / 8 (which 8-pixel column)
        Each column is 16 bytes in the dest buffer.
        """
        dest_col = self.cursor // 8
        dest_offset = dest_col * 16

        # Merge main tile
        for i in range(16):
            if dest_offset + i < len(self.dest_buffer):
                self.dest_buffer[dest_offset + i] |= self.tile_buf[i]

        # Merge overflow into next column
        next_offset = dest_offset + 16
        for i in range(16):
            if next_offset + i < len(self.dest_buffer):
                self.dest_buffer[next_offset + i] |= self.overflow_buf[i]

    def render_char(self, char_code: int):
        """
        Render a single character at the current cursor position.
        """
        # 1. Load tile
        self.load_tile(char_code)

        # 2. Shift for sub-pixel alignment
        shift_amount = self.cursor % 8
        if shift_amount > 0:
            self.shift_tile(shift_amount)

        # 3. Merge into destination
        self.merge_to_dest()

        # 4. Advance cursor
        width = self.width_table[char_code] if char_code < len(self.width_table) else 8
        self.cursor += width

    def render_string(self, text: str, char_map: dict):
        """
        Render a string of text.

        char_map: dict mapping ASCII characters to tile codes
        """
        for ch in text:
            if ch in char_map:
                self.render_char(char_map[ch])
            elif ch == ' ':
                self.cursor += 4  # Space width

    def get_rendered_width(self) -> int:
        """Return the current cursor position (rendered width in pixels)."""
        return self.cursor

    def get_rendered_tiles(self) -> list:
        """
        Extract rendered tiles from the destination buffer.
        Returns list of 8x8 grids (palette indices).
        """
        tiles = []
        num_cols = (self.cursor + 7) // 8 + 1  # Tiles needed

        for col in range(min(num_cols, 32)):
            offset = col * 16
            tile_data = bytes(self.dest_buffer[offset:offset + 16])
            tiles.append(decode_2bpp_tile(tile_data))

        return tiles


# ── Character Mapping ──────────────────────────────────────────────────────────

def build_char_map() -> dict:
    """
    Build mapping from ASCII characters to menu font tile codes.
    Based on ffv_menufont_RPGe.tbl analysis.
    """
    char_map = {}

    # Uppercase A-Z at $60-$79 (tiles 96-121)
    for i, ch in enumerate('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
        char_map[ch] = 0x60 + i

    # Lowercase a-z at $7A-$93 (tiles 122-147)
    for i, ch in enumerate('abcdefghijklmnopqrstuvwxyz'):
        char_map[ch] = 0x7A + i

    # Digits 0-9 at $53-$5C (tiles 83-92)
    for i, ch in enumerate('0123456789'):
        char_map[ch] = 0x53 + i

    # Some punctuation
    char_map['!'] = 0xA1
    char_map['?'] = 0xA2
    char_map['.'] = 0xA3
    char_map[','] = 0x9D
    char_map["'"] = 0x99
    char_map[':'] = 0x9B

    return char_map


def measure_widths_from_tiles(rom: bytes, font_offset: int) -> list:
    """
    Build width table for the menu font.

    The menu font tiles are designed to fill the 8x8 space, so we can't
    auto-detect from pixel content. Instead, we use widths based on:
    1. The 1bpp dialogue font widths (known working)
    2. Visual analysis of character shapes

    These widths are estimates - should be refined with visual testing.
    """
    # Default all to 8
    widths = [8] * 256

    # Based on 1bpp dialogue VWF table analysis and character shapes:

    # Narrow characters (3-4 pixels)
    narrow_3 = [
        0x99,  # ' (apostrophe)
        0x9B,  # :
        0x9D,  # ,
        0xA1,  # !
        0xA3,  # .
    ]
    for code in narrow_3:
        widths[code] = 4  # 3px char + 1px spacing

    # Narrow 'i', 'l', 'I' (4-5 pixels)
    narrow_4 = [
        0x68,  # I
        0x82,  # i
        0x85,  # l
        0x69,  # J (somewhat narrow)
    ]
    for code in narrow_4:
        widths[code] = 5

    # Standard characters (6-7 pixels)
    standard = list(range(0x60, 0x68)) + list(range(0x6A, 0x6C)) + \
               list(range(0x6D, 0x76)) + list(range(0x77, 0x7A)) + \
               list(range(0x7A, 0x82)) + list(range(0x83, 0x85)) + \
               list(range(0x87, 0x94))
    for code in standard:
        widths[code] = 7

    # Wide characters (8-9 pixels) - M, W, m, w
    wide = [
        0x6C,  # M
        0x76,  # W
        0x86,  # m
        0x90,  # w
    ]
    for code in wide:
        widths[code] = 9

    # Digits (6-7 pixels)
    for code in range(0x53, 0x5D):  # 0-9
        widths[code] = 7

    return widths


# ── Image Output ───────────────────────────────────────────────────────────────

def tiles_to_image(tiles: list, palette=PALETTE, scale: int = 4):
    """
    Convert a list of 8x8 tile grids to a PIL Image.
    """
    try:
        from PIL import Image
    except ImportError:
        print("Pillow required: pip install Pillow")
        return None

    if not tiles:
        return None

    width = len(tiles) * 8 * scale
    height = 8 * scale

    img = Image.new("RGB", (width, height), palette[0])
    px = img.load()

    for tile_idx, grid in enumerate(tiles):
        for y, row in enumerate(grid):
            for x, idx in enumerate(row):
                color = palette[idx] if idx < len(palette) else (255, 0, 255)
                for sy in range(scale):
                    for sx in range(scale):
                        px_x = tile_idx * 8 * scale + x * scale + sx
                        px_y = y * scale + sy
                        if 0 <= px_x < width and 0 <= px_y < height:
                            px[px_x, px_y] = color

    return img


# ── Main ───────────────────────────────────────────────────────────────────────

def main():
    # Parse args
    test_text = sys.argv[1] if len(sys.argv) > 1 else "VWF Test!"

    print(f"2bpp VWF Prototype")
    print(f"=" * 40)

    # Load ROM
    if not ROM_PATH.exists():
        print(f"ROM not found: {ROM_PATH}")
        return 1

    rom = ROM_PATH.read_bytes()
    print(f"ROM loaded: {len(rom):,} bytes")

    # Create renderer
    renderer = VWFRenderer(rom, MENU_FONT_OFFSET)

    # Measure character widths
    print("Measuring character widths...")
    widths = measure_widths_from_tiles(rom, MENU_FONT_OFFSET)
    renderer.set_width_table(widths)

    # Print some width examples
    char_map = build_char_map()
    print("\nSample widths:")
    for ch in "iIlMWm.!":
        if ch in char_map:
            code = char_map[ch]
            print(f"  '{ch}' (${code:02X}) = {widths[code]}px")

    # Render test string
    print(f"\nRendering: '{test_text}'")
    renderer.reset()
    renderer.render_string(test_text, char_map)

    print(f"Rendered width: {renderer.get_rendered_width()} pixels")
    print(f"Tiles used: {(renderer.get_rendered_width() + 7) // 8}")

    # Compare to fixed width
    fixed_width = sum(8 for ch in test_text if ch in char_map or ch == ' ')
    print(f"Fixed 8px would be: {fixed_width} pixels")
    print(f"VWF saves: {fixed_width - renderer.get_rendered_width()} pixels")

    # Output image
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    tiles = renderer.get_rendered_tiles()

    img = tiles_to_image(tiles)
    if img:
        output_path = OUTPUT_DIR / "vwf_test.png"
        img.save(output_path)
        print(f"\nOutput saved: {output_path}")

        # Also save a version with light background
        img_light = tiles_to_image(tiles,
            palette=[(220, 220, 220), (0, 0, 131), (115, 115, 115), (255, 255, 255)])
        img_light.save(OUTPUT_DIR / "vwf_test_light.png")

    # Dump width table for assembly use
    print("\nWidth table (non-8 values):")
    for code in range(256):
        if widths[code] != 8 and widths[code] > 0:
            ch = next((c for c, cc in char_map.items() if cc == code), '?')
            print(f"  ${code:02X} '{ch}' = {widths[code]}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
