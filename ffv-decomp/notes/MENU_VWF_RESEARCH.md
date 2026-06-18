# FFV Menu VWF Research Notes

**Goal:** Implement Variable Width Font for the Menu system (currently fixed 8px per character)

**Reference:** GBA FFV (2006) successfully uses VWF in menus, proving the concept works.

---

## 1. Current Font System Analysis

### 1.1 Menu Font (2bpp)
- **ROM Location:** $D1F000 (file offset $11F000)
- **Format:** SNES 2bpp, 8x8 pixels per tile, 16 bytes per tile
- **Palette:** 4 colors (black bg, dark blue shadow, mid grey AA, white body)
- **Total:** 256 tiles = 4096 bytes
- **Loader Code:** C1/91C3-9211

```asm
; C1/91C3 - Menu font loading (simplified)
C1/91C3: BF00F0D1  lda $D1F000,X   ; Load 2bpp tile from ROM
C1/91C7: 2900FF    and #$FF00      ; Process for VRAM format
         ...
C1/920C: E8        inx
C1/920D: E8        inx
C1/920E: E00010    cpx #$1000      ; Loop through 4096 bytes
C1/9211: D0E8      bne $91FB
```

**Key Finding:** No pixel-level positioning. Tiles placed on 8px grid via tilemap.

### 1.2 Dialogue Font (1bpp)
- **ROM Location:** $C3EB00 (file offset $03EB00)
- **Format:** 1bpp, 12 bytes per character (8x12?)
- **Palette:** 2 colors (transparent + text color)
- **VWF Logic:** C1/2CF1-2DA6

```asm
; C1/2D06 - 1bpp font loading with bit-shifting
C1/2D06: BF00EBC3  lda $C3EB00,X   ; Load 1bpp glyph
C1/2D0A: 9908F5    sta $F508,Y     ; Store to buffer
         ...

; C1/2D28-2D3A - Pixel alignment via bit-shifting
C1/2D28: A20000    ldx #$0000
C1/2D2B: 5E08F5    lsr $F508,X     ; Shift bits right
C1/2D2E: 7E14F5    ror $F514,X     ; Rotate through buffer
C1/2D31: 7E20F5    ror $F520,X
         ...
C1/2D3C: D0EA      bne $2D28       ; Loop (F507 AND 7) times

; C1/2DA0-2DA6 - Cursor advance (THE PROBLEM)
C1/2DA0: AD07F5    lda $F507       ; Current pixel position
C1/2DA3: 18        clc
C1/2DA4: 690D      adc #$0D        ; Add FIXED 13 pixels (not VWF!)
C1/2DA6: 8D07F5    sta $F507
```

**Key Finding:** Has pixel-level rendering but uses FIXED width (13 pixels), not table-based.

---

## 2. VWF Width Table

### 2.1 Documentation Claims
- **Location:** $203225 (or $2FC000)
- **Size:** 288 bytes (18 rows x 16 columns)
- **Values:** $03 (narrow, e.g., "i") to $0C (wide, e.g., "M", "W")

### 2.2 Verified Width Table Contents

**CONFIRMED AT $203225** - The width table exists with proper variable values:

| Char Code | Character | Width (px) |
|-----------|-----------|------------|
| $68 | I | 3 |
| $82 | i | 3 |
| $85 | l | 3 |
| $99 | ' | 3 |
| $9B | : | 3 |
| $9D | , | 3 |
| $A1 | ! | 3 |
| $A3 | . | 3 |
| $60-$67 | A-H | 6-7 |
| $6C | M | 11 |
| $76 | W | 11 |
| $86 | m | 11 |
| $90 | w | 11 |

**Distribution:** 10 chars at 3px, 16 at 6px, 44 at 7px, 7 at 8px, 4 at 11px, 193 at 12px (icons/fixed)

### 2.3 The Problem
The width table exists but **IS NOT USED**. At C1/2DA4, the code does:
```asm
C1/2DA4: 690D      adc #$0D        ; Hardcoded 13 pixels - IGNORES WIDTH TABLE!
```

To enable true VWF, this needs to be replaced with:
```asm
; Load width from table based on character code
LDA $203225,X   ; X = character code
ADC $F507       ; Add to current position
STA $F507
```

---

## 3. Implementation Plan for Menu VWF

### 3.1 Requirements
1. **Width Table:** Create 256-byte table with per-character widths for Menu font
2. **Pixel Buffer:** Allocate WRAM for rendered text (need 2bpp format)
3. **Rendering Code:** New routine to:
   - Load 2bpp tile data
   - Shift bits for sub-pixel alignment (more complex than 1bpp)
   - OR into destination buffer
   - Look up and advance by character width
4. **Tilemap Update:** Convert rendered buffer to VRAM tiles

### 3.2 Key Differences from Dialogue VWF
| Aspect | Dialogue (1bpp) | Menu (2bpp) |
|--------|-----------------|-------------|
| Bitplanes | 1 | 2 |
| Colors | 2 | 4 |
| Shift complexity | Single shift chain | Two parallel shift chains |
| Buffer size | 24 bytes/row | 32 bytes/row |

### 3.3 Code Space Needed
- ~200 bytes for VWF render routine
- 256 bytes for width table
- Free ROM space candidates: Bank $20-$27 unused areas, or expand ROM

### 3.4 Integration Points
- Hook menu text writer (needs more research into C2/C3 menu code)
- Replace tilemap-based text with bitmap-based
- May need to modify menu window sizing/scrolling

---

## 4. Next Steps

1. **Verify width table location:** Read $203225 from RPGe ROM, confirm byte values
2. **Find dialogue VWF table lookup:** Search other banks for width table usage
3. **Study GBA VWF:** Reference how FF5 Advance implements menu VWF
4. **Prototype:** Create minimal 2bpp VWF routine and test with Mesen

---

## 5. Key RAM Addresses

| Address | Purpose |
|---------|---------|
| $F507 | Pixel cursor position (sub-pixel in bits 0-2, byte offset in bits 3+) |
| $F508-$F520 | Character bitmap buffer (36 bytes) |
| $BCA0-$BCA5 | Text pointer and attributes |
| $DBF1 | Display mode flag |

---

---

## 6. Quick Win: Enable Dialogue VWF

The dialogue font's VWF infrastructure is already in place - just need to hook up the width table lookup.

### 6.1 Current Code (C1/2DA0-2DA6)
```asm
C1/2DA0: AD07F5    lda $F507       ; Current pixel position
C1/2DA3: 18        clc
C1/2DA4: 690D      adc #$0D        ; Add FIXED 13 pixels (WRONG!)
C1/2DA6: 8D07F5    sta $F507
```

### 6.2 Required Patch
Replace the fixed `adc #$0D` with a width table lookup:

```asm
; Need to load character code into X first
; X should contain ($82 - $20) = character index
C1/2DA0: AD07F5    lda $F507       ; Current pixel position  
C1/2DA3: 18        clc
C1/2DA4: 7F253220  adc $203225,X   ; Add width from table (4 bytes)
C1/2DA8: 8D07F5    sta $F507
```

**Problem:** The instruction change is 4 bytes (`adc #$0D` = 2 bytes, `adc $203225,X` = 4 bytes).
Need to reorganize the routine or jump to expanded code.

### 6.3 Alternative: Free Space Patch

If no inline space, hook into free space:

```asm
; At C1/2DA4, replace with:
C1/2DA4: 4CXXXX    jmp $XXXX       ; Jump to free space (3 bytes)

; In free space (bank C1 or expansion):
XXXX: BF253220    lda $203225,X   ; Load width from table
      18          clc
      6D07F5      adc $F507       ; Add to current position
      8D07F5      sta $F507
      60          rts
```

---

## 7. Menu VWF: Full Implementation Required

The Menu font requires building VWF from scratch because:
1. It's 2bpp (4 colors) vs dialogue's 1bpp (2 colors)
2. Currently uses tile-based placement (8px grid) not pixel-based
3. No existing bitmap buffer or shift logic

### 7.1 Implementation Outline

1. **Allocate 2bpp render buffer** in WRAM (~512 bytes for 32 chars × 16 bytes)
2. **Create 2bpp VWF renderer** that:
   - Loads 16-byte tiles from $D1F000
   - Shifts both bitplanes for pixel alignment
   - ORs into destination buffer
   - Looks up width and advances cursor
3. **Create Menu width table** (256 bytes) with per-character widths
4. **Hook menu text writer** to use new renderer instead of tilemap

Estimated code size: ~300 bytes
Estimated ROM space needed: ~600 bytes (code + width table)

---

*Research date: 2026-06-17*
*Status: Analysis complete - dialogue VWF is a quick patch, menu VWF requires new code*
