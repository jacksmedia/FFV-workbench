; ============================================================================
; MENU_VWF.ASM - Variable Width Font Renderer for FFV Menu (2bpp)
; ============================================================================
;
; *** DEPRECATED 2026-07-04 - superseded by menu_vwf_v2.asm ***
; Docs-only audit found this file never assembled (65816 has no long,Y
; addressing), its dest buffer overlapped the NMI/IRQ RAM trampolines at
; $1F00/$1F04, its org target $D1A119 is live game data (not free space),
; and a plain OR merge corrupts the menu font's color-1 background.
; Kept for history; see v2 header for the full audit trail.
; ============================================================================
;
; Adapted from Myria's proven RPGe 1bpp dialogue VWF technique.
; This routine renders 2bpp menu font characters with variable pixel widths.
;
; DESIGN GOALS:
;   1. Use Myria's existing VWF width table at $E03225 (unified widths)
;   2. Match her algorithm: load tile -> shift for alignment -> OR into buffer
;   3. Handle 2bpp format (two bitplanes shifted in parallel)
;
; Algorithm:
;   1. Load 16-byte 2bpp tile from ROM ($D1F000)
;   2. Shift both bitplanes right for sub-pixel alignment
;   3. OR into destination buffer at pixel offset
;   4. Advance cursor by character width from Myria's table
;
; WRAM Usage (~550 bytes total):
;   VWF_Cursor    = 2 bytes  - Current X position in pixels (16-bit for >255)
;   VWF_CharCode  = 1 byte   - Current character being rendered
;   VWF_ShiftCnt  = 1 byte   - Shift counter (0-7)
;   VWF_TileBuf   = 16 bytes - Shifted tile buffer
;   VWF_Overflow  = 16 bytes - Bits that shifted past byte boundary
;   VWF_Dest      = 512 bytes - Rendered line buffer (32 tiles × 16 bytes)
;
; ROM Usage: ~250 bytes code (uses Myria's width table, no local table)
;
; Assemble: asar menu_vwf.asm ff5c.sfc
; ============================================================================

hirom

; ============================================================================
; CONFIGURATION
; ============================================================================

; Menu font ROM location (SNES address, 2bpp, 256 tiles × 16 bytes)
!MenuFont       = $D1F000

; Myria's VWF width table in RPGe expansion ROM
; Indexed by (char_code - $20), 288 entries
; Values: 3-12 pixels per character
!WidthTable     = $E03225

; Character code offset (menu font starts at tile $00 for code $00)
; But Myria's table is indexed by (char - $20) for the DIALOGUE font
; For menu font, we need to determine if same table applies or needs offset
; Currently assuming same encoding — test and adjust if needed
!CharOffset     = $20

; WRAM buffer locations (verify these are free during menus)
; $7E1E00-$7E2040 = 576 bytes needed
!VWF_Cursor     = $7E1E00       ; 2 bytes
!VWF_CharCode   = $7E1E02       ; 1 byte
!VWF_ShiftCnt   = $7E1E03       ; 1 byte
!VWF_TileBuf    = $7E1E10       ; 16 bytes
!VWF_Overflow   = $7E1E20       ; 16 bytes
!VWF_Dest       = $7E1E40       ; 512 bytes

; ============================================================================
; CODE LOCATION - Free space in Bank D1
; ============================================================================

org $D1A119     ; 866 bytes free at $D1:A119 (file $112119)

; ============================================================================
; MenuVWF_RenderChar - Render one 2bpp character with VWF
; ============================================================================
; Input:  A = character code (8-bit)
; Output: Character rendered to VWF_Dest, cursor advanced
; Preserves: All registers except P
; ============================================================================

MenuVWF_RenderChar:
    PHP
    PHB
    PHX
    PHY
    PHA                     ; Save char code on stack

    ; Set data bank to $7E for WRAM access
    PEA $7E7E
    PLB
    PLB

    SEP #$20                ; 8-bit A
    REP #$10                ; 16-bit X/Y

    ; ── Step 1: Save char code and calculate tile ROM offset ───────────
    ; tile_offset = char_code × 16
    PLA                     ; Restore char code
    STA !VWF_CharCode       ; Save for width lookup later

    ; Calculate offset: char × 16 = char << 4
    ; But char is 8-bit, so we need 16-bit result
    REP #$20                ; 16-bit A
    AND #$00FF              ; Clear high byte
    ASL A
    ASL A
    ASL A
    ASL A                   ; A = char × 16
    TAX                     ; X = ROM offset into font

    ; ── Step 2: Load 16-byte tile into buffer ──────────────────────────
    SEP #$20                ; 8-bit A
    LDY #$0000

.LoadTileLoop:
    LDA.l !MenuFont,X       ; Load from menu font ROM (long addressing)
    STA !VWF_TileBuf,Y
    LDA #$00
    STA !VWF_Overflow,Y     ; Clear overflow
    INX
    INY
    CPY #$0010
    BNE .LoadTileLoop

    ; ── Step 3: Calculate shift amount ─────────────────────────────────
    ; shift = cursor & 7 (sub-pixel position)
    LDA !VWF_Cursor
    AND #$07
    BEQ .NoShift            ; Skip if aligned to 8px boundary
    STA !VWF_ShiftCnt

    ; ── Step 4: Shift tile for sub-pixel alignment ─────────────────────
    ; For 2bpp: shift both bitplanes RIGHT
    ; Bits that fall off go into overflow buffer
    ; This is the core VWF operation from Myria's algorithm
.ShiftOuter:
    LDY #$0000

.ShiftLoop:
    ; 2bpp format: Row N = bytes 2N (BP0) and 2N+1 (BP1)
    ; Shift BP0 (even byte): LSR tile, ROR overflow
    LDA !VWF_TileBuf,Y
    LSR A
    STA !VWF_TileBuf,Y
    LDA !VWF_Overflow,Y
    ROR A                   ; Carry from LSR rotates in
    STA !VWF_Overflow,Y
    INY

    ; Shift BP1 (odd byte): LSR tile, ROR overflow
    LDA !VWF_TileBuf,Y
    LSR A
    STA !VWF_TileBuf,Y
    LDA !VWF_Overflow,Y
    ROR A
    STA !VWF_Overflow,Y
    INY

    CPY #$0010
    BNE .ShiftLoop

    DEC !VWF_ShiftCnt
    BNE .ShiftOuter

.NoShift:
    ; ── Step 5: Calculate destination offset ───────────────────────────
    ; dest_col = cursor / 8  (which 8px tile column)
    ; dest_offset = dest_col × 16  (16 bytes per 2bpp tile)
    REP #$20                ; 16-bit A
    LDA !VWF_Cursor
    LSR A
    LSR A
    LSR A                   ; / 8 = tile column
    ASL A
    ASL A
    ASL A
    ASL A                   ; × 16 = byte offset
    TAX                     ; X = dest offset
    SEP #$20                ; 8-bit A

    ; ── Step 6: OR tile into destination buffer ────────────────────────
    ; Merge shifted tile with existing content (additive rendering)
    ; Also merge overflow into the next tile column
    LDY #$0000

.MergeLoop:
    ; Merge main tile
    LDA !VWF_Dest,X
    ORA !VWF_TileBuf,Y
    STA !VWF_Dest,X

    ; Merge overflow into next tile column (+16 bytes)
    PHX
    TXA
    CLC
    ADC #$10
    TAX
    LDA !VWF_Dest,X
    ORA !VWF_Overflow,Y
    STA !VWF_Dest,X
    PLX

    INX
    INY
    CPY #$0010
    BNE .MergeLoop

    ; ── Step 7: Advance cursor by character width ──────────────────────
    ; Load width from Myria's table, indexed by (char_code - $20)
    LDA !VWF_CharCode
    SEC
    SBC #!CharOffset        ; char_code - $20 = table index
    TAX
    LDA.l !WidthTable,X     ; Load width (3-12 pixels)

    REP #$20
    AND #$00FF              ; Clear high byte
    CLC
    ADC !VWF_Cursor
    STA !VWF_Cursor
    SEP #$20

    PLY
    PLX
    PLB
    PLP
    RTS

; ============================================================================
; MenuVWF_Clear - Clear destination buffer and reset cursor
; ============================================================================
; Call before rendering each new line of text
; ============================================================================

MenuVWF_Clear:
    PHP
    PHB
    PHX
    REP #$30                ; 16-bit A/X/Y

    PEA $7E7E
    PLB
    PLB

    ; Clear cursor
    STZ !VWF_Cursor

    ; Clear destination buffer (512 bytes = 256 words)
    LDA #$0000
    LDX #$0000
.ClearLoop:
    STA !VWF_Dest,X
    INX
    INX
    CPX #$0200
    BNE .ClearLoop

    PLX
    PLB
    PLP
    RTS

; ============================================================================
; MenuVWF_RenderString - Render null-terminated string
; ============================================================================
; Input: X = pointer to string (current data bank)
; Call MenuVWF_Clear first, then this, then MenuVWF_Upload
; ============================================================================

MenuVWF_RenderString:
    PHP
    PHX
    PHY
    SEP #$20
    REP #$10

.StringLoop:
    LDA $0000,X             ; Load character
    BEQ .StringDone         ; Null terminator
    CMP #$96                ; Space character in FFV encoding
    BNE .NotSpace
    ; Handle space - advance cursor (use space width from table)
    LDA #$96
    SEC
    SBC #!CharOffset
    TAY
    LDA.l !WidthTable,Y     ; Get space width
    REP #$20
    AND #$00FF
    CLC
    ADC !VWF_Cursor
    STA !VWF_Cursor
    SEP #$20
    BRA .NextChar
.NotSpace:
    JSR MenuVWF_RenderChar
.NextChar:
    INX
    BRA .StringLoop

.StringDone:
    PLY
    PLX
    PLP
    RTS

; ============================================================================
; MenuVWF_GetWidth - Get rendered width in pixels
; ============================================================================
; Output: A (16-bit) = current cursor position = rendered width
; ============================================================================

MenuVWF_GetWidth:
    PHP
    REP #$20
    LDA !VWF_Cursor
    PLP
    RTS

; ============================================================================
; MenuVWF_GetTileCount - Get number of 8px tiles needed
; ============================================================================
; Output: A (8-bit) = (cursor + 7) / 8 = tiles needed
; ============================================================================

MenuVWF_GetTileCount:
    PHP
    REP #$20
    LDA !VWF_Cursor
    CLC
    ADC #$0007              ; Round up
    LSR A
    LSR A
    LSR A                   ; / 8
    SEP #$20
    PLP
    RTS

; ============================================================================
; INTEGRATION NOTES
; ============================================================================
;
; To hook this into the menu system:
;
; 1. Find where menu text currently writes tile indices to tilemap
;    (likely in Bank C3, undisassembled)
;
; 2. Before that code runs, call:
;    JSL MenuVWF_Clear      ; Start fresh
;    [loop over characters]
;    JSL MenuVWF_RenderChar ; For each char
;
; 3. After rendering, DMA VWF_Dest to VRAM:
;    - Destination: wherever menu tiles go (probably BG1 or BG2)
;    - Source: $7E1E40 (VWF_Dest)
;    - Size: MenuVWF_GetTileCount × 16 bytes
;
; 4. Update tilemap to reference the new VWF tiles instead of
;    fixed font tiles
;
; The key unknowns are:
; - Where menu text tilemap writes happen in C3
; - VRAM address for menu text tiles
; - Whether transparent color $00 behaves correctly (test needed)
;
; ============================================================================
; END OF FILE
; ============================================================================
