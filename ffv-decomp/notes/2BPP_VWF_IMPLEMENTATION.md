# 2bpp Menu VWF Implementation Plan

Based on the proven RPGe 1bpp dialogue VWF technique.

---

## 1. The RPGe 1bpp VWF Algorithm (Reference)

### 1.1 Data Structures
- **Font ROM:** $C3EB00 - 1bpp glyphs, 12 bytes per character (8x12 px?)
- **Width Table:** $203225 - 1 byte per character (288 entries)
- **Pixel Cursor:** $F507 - current X position in pixels
- **Temp Buffer:** $F508-$F520 - 36 bytes for shifted glyph
- **Dest Buffer:** $F357+ or $A937+ - accumulated rendered text

### 1.2 Algorithm (C1/2CF1-2DA6)
```
1. LOAD GLYPH
   - Character code in A, subtract $20 to get index
   - X = index * 24 (via $FE67 multiply)
   - Load 12 bytes from font ROM to $F508 (bitplane)
   - Load 12 bytes from font ROM+12 to $F514 (extension?)
   - Clear $F520 (overflow buffer)

2. SHIFT FOR ALIGNMENT
   - shift_amount = $F507 AND 7  (0-7 pixel sub-position)
   - Loop shift_amount times:
     - For each of 12 bytes:
       - LSR $F508,X  (shift bitplane right)
       - ROR $F514,X  (rotate carry into extension)
       - ROR $F520,X  (rotate carry into overflow)

3. MERGE INTO DESTINATION
   - dest_offset = ($F507 / 8) * 16
   - For each of 12 bytes:
     - dest[offset] = dest[offset] OR $F508[i]
     - dest[offset+16] = dest[offset+16] OR $F514[i]
     - dest[offset+32] = dest[offset+32] OR $F520[i]

4. ADVANCE CURSOR
   - $F507 = $F507 + width_table[char_code]
```

---

## 2. Adapting for 2bpp

### 2.1 Key Differences

| Aspect | 1bpp | 2bpp |
|--------|------|------|
| Bytes per tile | 12 | 16 |
| Bitplanes | 1 | 2 (interleaved) |
| Colors | 2 | 4 |
| Shift complexity | Single chain | Dual parallel chains |
| Buffer size | 36 bytes | 48 bytes |

### 2.2 2bpp Tile Format (SNES standard)
```
Byte 0:  Row 0, Bitplane 0
Byte 1:  Row 0, Bitplane 1
Byte 2:  Row 1, Bitplane 0
Byte 3:  Row 1, Bitplane 1
...
Byte 14: Row 7, Bitplane 0
Byte 15: Row 7, Bitplane 1
```

### 2.3 2bpp VWF Algorithm

```
1. LOAD 2BPP TILE
   - char_index = char_code * 16
   - Load 16 bytes from $D1F000 + char_index to buffer
   - Clear overflow buffer (16 bytes)

2. SHIFT FOR ALIGNMENT (process bitplane pairs)
   - shift_amount = $cursor AND 7
   - Loop shift_amount times:
     - For row = 0 to 7:
       - LSR buffer[row*2]      ; BP0 shift
       - ROR overflow[row*2]    ; BP0 overflow
       - LSR buffer[row*2+1]    ; BP1 shift  
       - ROR overflow[row*2+1]  ; BP1 overflow

3. MERGE INTO DESTINATION
   - dest_col = $cursor / 8  (which 8px column)
   - dest_offset = dest_col * 16  (16 bytes per column)
   - For row = 0 to 7:
     - dest[offset + row*2]   |= buffer[row*2]      ; BP0
     - dest[offset + row*2+1] |= buffer[row*2+1]    ; BP1
     - dest[offset+16 + row*2]   |= overflow[row*2] ; BP0 overflow
     - dest[offset+16 + row*2+1] |= overflow[row*2+1] ; BP1 overflow

4. ADVANCE CURSOR
   - $cursor += menu_width_table[char_code]
```

---

## 3. Implementation Components

### 3.1 New Width Table for Menu Font
- Location: Free ROM space (TBD)
- Size: 256 bytes (one per menu font character)
- Format: 1 byte per character = pixel width

Suggest measuring each menu font character and building the table.

### 3.2 WRAM Buffers
```
Buffer         Size     Purpose
-----------    ------   --------------------------
menu_cursor    2 bytes  Current X pixel position (16-bit for >255)
menu_tile_buf  16 bytes Shifted tile being rendered
menu_overflow  16 bytes Bits that shifted past byte boundary
menu_dest      N bytes  Accumulated rendered line (variable width)
```

For a menu line of ~20 characters at ~8px average = 160px = 20 columns × 16 bytes = 320 bytes per line.

### 3.3 New Code (Estimated ~200 bytes)
```asm
; ================================================================
; MenuVWF_RenderChar - Render one 2bpp character with VWF
; Input: A = character code
; Uses: menu_cursor, menu_tile_buf, menu_overflow, menu_dest
; ================================================================
MenuVWF_RenderChar:
    PHA                     ; Save char code
    
    ; 1. Calculate ROM offset: char * 16
    ASL A : ASL A : ASL A : ASL A   ; A = char * 16
    TAX
    
    ; 2. Load 16-byte tile into buffer
    LDY #$0000
.load_loop:
    LDA $D1F000,X
    STA menu_tile_buf,Y
    LDA #$00
    STA menu_overflow,Y
    INX : INY
    CPY #$0010
    BNE .load_loop
    
    ; 3. Calculate shift amount
    LDA menu_cursor
    AND #$07
    BEQ .no_shift
    STA shift_count
    
.shift_outer:
    LDY #$0000
.shift_loop:
    LSR menu_tile_buf,Y     ; Shift BP0
    ROR menu_overflow,Y
    INY
    LSR menu_tile_buf,Y     ; Shift BP1
    ROR menu_overflow,Y
    INY
    CPY #$0010
    BNE .shift_loop
    DEC shift_count
    BNE .shift_outer
    
.no_shift:
    ; 4. Calculate destination offset
    LDA menu_cursor
    LSR A : LSR A : LSR A   ; / 8
    ASL A : ASL A : ASL A : ASL A  ; * 16
    TAX
    
    ; 5. OR into destination
    LDY #$0000
.merge_loop:
    LDA menu_dest,X
    ORA menu_tile_buf,Y
    STA menu_dest,X
    LDA menu_dest+16,X
    ORA menu_overflow,Y
    STA menu_dest+16,X
    INX : INY
    CPY #$0010
    BNE .merge_loop
    
    ; 6. Advance cursor by width
    PLA                     ; Restore char code
    TAX
    LDA menu_width_table,X
    CLC
    ADC menu_cursor
    STA menu_cursor
    
    RTS
```

---

## 4. Integration Points

### 4.1 Where to Hook
Menu text rendering happens somewhere in Bank C2/C3 (undisassembled).
Need to find where menu strings are processed and replace the tile-based
writer with our VWF renderer.

### 4.2 VRAM Upload
After rendering a complete line to menu_dest buffer, need to DMA it to
VRAM during vblank. This replaces the current tile-by-tile placement.

### 4.3 Menu Window Handling
VWF text may overflow current window boundaries. May need to:
- Adjust window sizing
- Implement line wrapping
- Modify scroll behavior

---

## 5. Testing Plan

### Phase 1: Standalone Test
1. Write the VWF render routine
2. Hardcode a test string
3. Render to a fixed VRAM location
4. Verify with Mesen tile viewer

### Phase 2: Width Table
1. Measure each menu font character
2. Build width table
3. Test with various strings

### Phase 3: Integration
1. Find menu text hook point
2. Redirect to VWF renderer
3. Handle VRAM upload
4. Test all menus

---

## 6. Open Questions

1. **Where is free ROM space?** Need ~600 bytes for code + width table
2. **Where is free WRAM?** Need ~400 bytes for buffers
3. **Menu text entry point?** Needs disassembly of C2/C3 menu code
4. **VRAM destination?** Where does menu text currently render?

---

*Document created: 2026-06-17*
*Status: Design phase - ready for prototyping*
