# 2bpp Menu VWF - Hook Point Investigation

## Status: Code Ready, Hook Point Needed

### What We Have

**VWF Renderer (`ffv-decomp/asm/menu_vwf.asm`):**
- Complete 2bpp VWF algorithm matching Myria's 1bpp design
- Uses Myria's width table at $E03225 (unified widths)
- ~250 bytes, targets free space at $D1A119
- Python prototype verified working

**Python Prototype (`ffv-decomp/analysis-tools/prototype_2bpp_vwf.py`):**
- Algorithm confirmed correct
- Test results: "Will o' Wisp" = 71px (vs 96px fixed) = 26% savings

### What We Need

The hook point where menu text currently gets rendered as fixed-width tiles.

### Investigation Findings

#### Font Loading (Not the Hook)
- C1/91C3-9211: Loads 2bpp font from $D1F000 to VRAM
- This is ONE-TIME loading, not per-character rendering

#### Potential Hook Areas

1. **C2/A000+**: Menu code area (undisassembled beyond C2/9FFF)
   - Found ADC #$40 and ADC #$80 patterns (tile offsets)
   - String loop candidates at C2/B255, C2/C0B5, C2/D820

2. **C3 (mostly undisassembled)**:
   - Section 5 of context.md: "C3 handles the actual rendering of text labels to the tilemap"
   - Only 365 bytes disassembled (C3/0000-016D)

3. **Tilemap buffer $7F7700**:
   - Used throughout C1 for menu graphics
   - Writes at C1/27CB, C1/949C-94BC

### Architecture Understanding

```
Current Flow (Fixed Width):
  Character Code → Add Tile Offset → Write to Tilemap Buffer → DMA to VRAM
  
VWF Flow (What We Need):
  Character Code → VWF Render to Pixel Buffer → DMA to VRAM Tiles
                 → Update Tilemap with VWF Tile Refs
```

### Next Steps to Find Hook

1. **Mesen Trace Method** (Recommended):
   - Open a menu in Mesen
   - Set memory watchpoint on $7F7700 (tilemap buffer)
   - Trace back to find what routine writes character tiles
   - That routine is our hook point

2. **Byte Pattern Search**:
   - Search for STA patterns that write incrementing tile indices
   - Look for loops with INY/INX that iterate through character strings

3. **Cross-reference E7 strings**:
   - Menu text comes from E7 bank
   - Find where E7 pointers get dereferenced for menus
   - The loading routine should lead to the rendering routine

### Known Constraints

- **Transparent Color**: Unknown if 2bpp color 0 behaves like 1bpp color 0
  - Need to test: render VWF buffer to visible VRAM and verify transparency
  
- **VRAM Layout**: Need to determine where VWF tiles should go
  - Currently menu tiles at specific VRAM address
  - May need to reserve separate area for VWF rendered text

### Testing Without Full Integration

Can test VWF rendering in isolation:
1. Assemble menu_vwf.asm to ff5c.sfc
2. In Mesen, manually call MenuVWF_Clear and MenuVWF_RenderString
3. Examine VWF_Dest buffer ($7E1E40) for correct pixel patterns
4. Manual DMA to visible VRAM area to see rendered text

---

*Investigation date: 2026-06-30*
*Status: Hook point search in progress*
