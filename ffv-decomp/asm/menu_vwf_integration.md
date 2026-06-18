# Menu VWF Integration Guide

## Code Size Estimate

| Component | Size |
|-----------|------|
| MenuVWF_RenderChar | ~130 bytes |
| MenuVWF_Clear | ~30 bytes |
| MenuVWF_RenderString | ~40 bytes |
| Width Table | 256 bytes |
| **Total** | **~456 bytes** |

## ROM Space Requirements

Need ~512 bytes of contiguous free space for code + table.

**Suggested locations to check in D1/D2:**
- End of data blocks before next structure
- Gaps between data tables (FF-padded areas)
- Unused portion of expanded ROM

## WRAM Requirements

Need ~550 bytes of free WRAM:
- `VWF_Cursor` (2 bytes)
- `VWF_ShiftCnt` (1 byte)
- `VWF_TileBuf` (16 bytes)
- `VWF_Overflow` (16 bytes)
- `VWF_Dest` (512 bytes for 32 tiles)

**Potential WRAM locations:**
- Check for unused scratch RAM in $7E1Exx-$7E1Fxx range
- Battle-only RAM that's free during menus
- Or extend into $7F bank if needed

## Integration Steps

### Step 1: Find Free Space
Look for blocks of $FF bytes in banks D1/D2:
```python
# Quick search for 512+ bytes of FF
for offset in range(0x110000, 0x140000, 0x100):
    if all(rom[offset:offset+512] == b'\xFF' * 512):
        print(f"Free space at ${offset:06X}")
```

### Step 2: Patch ROM Addresses
In `menu_vwf.asm`, update:
- `org $D1FD00` → actual code location
- `!WidthTable = $D1FE00` → actual table location
- `!VWF_*` addresses → free WRAM locations

### Step 3: Find Menu Text Hook
Need to locate where menu text is currently rendered.
Look for:
- Calls that write to tilemap with menu font tiles
- String processing loops in Bank C2/C3
- References to item names, spell names, etc.

### Step 4: Hook the Menu System
Replace the existing tile-based text writer with calls to:
1. `JSR MenuVWF_Clear` at start of line
2. `JSR MenuVWF_RenderChar` for each character
3. DMA `VWF_Dest` to VRAM after line complete

### Step 5: Handle VRAM Upload
After rendering a line, need to DMA the buffer to VRAM.
This should happen during vblank. Add to NMI handler or
existing menu VRAM update routine.

```asm
; Example: DMA VWF_Dest to VRAM at $5800 (menu text area)
LDA #$80
STA $2115       ; VRAM increment mode
LDX #$5800
STX $2116       ; VRAM address
LDA #$01
STA $4300       ; DMA mode: 2-byte to $2118/2119
LDA #$18
STA $4301       ; Dest: $2118 (VRAM data)
LDX #!VWF_Dest
STX $4302       ; Source address
LDA #$7E
STA $4304       ; Source bank
LDX #$0200      ; 512 bytes (32 tiles)
STX $4305       ; Transfer size
LDA #$01
STA $420B       ; Start DMA channel 0
```

## Testing with Mesen

### Quick Test via Memory Edit
1. Assemble the code and note byte values
2. In Mesen Memory Editor, write to a test WRAM location
3. Write test code that calls the VWF routine
4. Set a breakpoint and step through

### Visual Verification
1. Render to VWF_Dest buffer
2. Examine buffer in Memory Editor
3. Manual DMA to a visible VRAM location
4. Check tilemap viewer for result

## Width Table Refinement

The width values in `menu_vwf.asm` are estimates. Refine by:
1. View each menu font character in Tile Molester
2. Measure actual glyph width in pixels
3. Add 1px spacing
4. Update table accordingly

Pay special attention to:
- Narrow: i, l, I, !, ., ,, :, ' (3-5px)
- Wide: M, W, m, w (8-9px)
- Standard: most letters (6-7px)
