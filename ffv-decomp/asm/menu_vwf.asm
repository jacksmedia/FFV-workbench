; ============================================================================
; MENU_VWF.ASM - Variable Width Font Renderer for FFV Menu (2bpp)
; ============================================================================
;
; Adapted from the proven RPGe 1bpp dialogue VWF technique.
; This routine renders 2bpp menu font characters with variable pixel widths.
;
; Algorithm:
;   1. Load 16-byte 2bpp tile from ROM
;   2. Shift both bitplanes right for sub-pixel alignment
;   3. OR into destination buffer at pixel offset
;   4. Advance cursor by character width
;
; Memory Map (adjust base addresses as needed):
;   MenuVWF_Cursor    = 2 bytes - Current X position in pixels
;   MenuVWF_TileBuf   = 16 bytes - Shifted tile buffer
;   MenuVWF_Overflow  = 16 bytes - Bits shifted past boundary
;   MenuVWF_Dest      = 512 bytes - Rendered line buffer (32 tiles)
;
; ROM Requirements:
;   ~200 bytes code + 256 bytes width table = ~456 bytes total
;
; Assemble with: asar menu_vwf.asm ff5_patched.sfc
; ============================================================================

hirom

; ============================================================================
; CONFIGURATION - Adjust these for your ROM
; ============================================================================

; Menu font ROM location (SNES address)
!MenuFont       = $D1F000       ; 2bpp tiles, 16 bytes each

; Width table location (at end of code block)
!WidthTable     = $D1A300       ; 256 bytes - after code at $D1A119

; WRAM buffer locations (find free WRAM)
!VWF_Cursor     = $7E1E00       ; 2 bytes
!VWF_ShiftCnt   = $7E1E02       ; 1 byte
!VWF_TileBuf    = $7E1E10       ; 16 bytes
!VWF_Overflow   = $7E1E20       ; 16 bytes
!VWF_Dest       = $7E1E40       ; 512 bytes (32 tiles × 16 bytes)

; ============================================================================
; MAIN ENTRY POINT
; ============================================================================
; MenuVWF_RenderChar
;   Input:  A = character code (8-bit)
;   Output: Character rendered to VWF_Dest, cursor advanced
;   Clobbers: A, X, Y, DP $70-$7F
; ============================================================================

org $D1A119     ; Free space found: 866 bytes at $D1:A119 (file $112119)

MenuVWF_RenderChar:
    PHP
    PHB
    PHX
    PHY

    ; Set data bank to $7E for WRAM access
    PEA $7E7E
    PLB
    PLB

    SEP #$20            ; 8-bit A
    REP #$10            ; 16-bit X/Y

    ; ── Step 1: Calculate tile ROM offset ──────────────────────────
    ; tile_offset = char_code × 16
    STA $70             ; Save char code
    ASL A
    ASL A
    ASL A
    ASL A               ; A = char × 16 (low byte)
    STA $72             ; $72 = offset low
    LDA $70
    LSR A
    LSR A
    LSR A
    LSR A               ; A = char >> 4 (high byte contribution)
    STA $73             ; $73 = offset high

    ; ── Step 2: Load 16-byte tile into buffer ──────────────────────
    ; Also clear overflow buffer
    REP #$20            ; 16-bit A
    LDA $72             ; Load offset
    CLC
    ADC #$F000          ; Add base ($D1F000 & $FFFF = $F000)
    TAX                 ; X = ROM offset within bank

    SEP #$20            ; 8-bit A
    LDY #$0000

.LoadTileLoop:
    LDA $D10000,X       ; Load from menu font ROM (bank $D1)
    STA !VWF_TileBuf,Y
    LDA #$00
    STA !VWF_Overflow,Y
    INX
    INY
    CPY #$0010
    BNE .LoadTileLoop

    ; ── Step 3: Calculate shift amount ─────────────────────────────
    ; shift = cursor & 7
    LDA !VWF_Cursor
    AND #$07
    BEQ .NoShift        ; Skip if aligned to 8px boundary
    STA !VWF_ShiftCnt

    ; ── Step 4: Shift tile for sub-pixel alignment ─────────────────
    ; For 2bpp: shift both bitplanes in parallel
.ShiftOuter:
    LDY #$0000

.ShiftLoop:
    ; Shift BP0 (even bytes): LSR tile, ROR overflow
    LDA !VWF_TileBuf,Y
    LSR A
    STA !VWF_TileBuf,Y
    LDA !VWF_Overflow,Y
    ROR A               ; Rotate carry in from LSR
    STA !VWF_Overflow,Y
    INY

    ; Shift BP1 (odd bytes): LSR tile, ROR overflow
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
    ; ── Step 5: Calculate destination offset ───────────────────────
    ; dest_col = cursor / 8
    ; dest_offset = dest_col × 16
    REP #$20            ; 16-bit A
    LDA !VWF_Cursor
    LSR A
    LSR A
    LSR A               ; / 8
    ASL A
    ASL A
    ASL A
    ASL A               ; × 16
    TAX                 ; X = dest offset
    SEP #$20            ; 8-bit A

    ; ── Step 6: OR tile into destination ───────────────────────────
    LDY #$0000

.MergeLoop:
    ; Merge main tile
    LDA !VWF_Dest,X
    ORA !VWF_TileBuf,Y
    STA !VWF_Dest,X

    ; Merge overflow into next tile column
    PHX
    TXA
    CLC
    ADC #$10            ; Next tile = +16 bytes
    TAX
    LDA !VWF_Dest,X
    ORA !VWF_Overflow,Y
    STA !VWF_Dest,X
    PLX

    INX
    INY
    CPY #$0010
    BNE .MergeLoop

    ; ── Step 7: Advance cursor by character width ──────────────────
    LDA $70             ; Restore char code
    TAX
    LDA.l !WidthTable,X ; Load width from table
    REP #$20
    AND #$00FF          ; Clear high byte
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

MenuVWF_Clear:
    PHP
    PHB
    REP #$30            ; 16-bit A/X/Y

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

    PLB
    PLP
    RTS

; ============================================================================
; MenuVWF_RenderString - Render null-terminated string
;   Input: X = pointer to string (bank in DB)
; ============================================================================

MenuVWF_RenderString:
    PHP
    PHX
    PHY
    SEP #$20
    REP #$10

.StringLoop:
    LDA $0000,X         ; Load character
    BEQ .StringDone     ; Null terminator
    CMP #$20            ; Space?
    BNE .NotSpace
    ; Handle space - advance cursor by 4 pixels
    REP #$20
    LDA !VWF_Cursor
    CLC
    ADC #$0004
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
; WIDTH TABLE - 256 bytes, one per character
; ============================================================================
; Values represent pixel width including 1px spacing.
; Adjust these based on visual measurement of your font.
; ============================================================================

org !WidthTable

; $00-$4F: Control codes and icons (fixed 8px)
db $08,$08,$08,$08,$08,$08,$08,$08  ; $00-$07
db $08,$08,$08,$08,$08,$08,$08,$08  ; $08-$0F
db $08,$08,$08,$08,$08,$08,$08,$08  ; $10-$17
db $08,$08,$08,$08,$08,$08,$08,$08  ; $18-$1F
db $08,$08,$08,$08,$08,$08,$08,$08  ; $20-$27
db $08,$08,$08,$08,$08,$08,$08,$08  ; $28-$2F
db $08,$08,$08,$08,$08,$08,$08,$08  ; $30-$37
db $08,$08,$08,$08,$08,$08,$08,$08  ; $38-$3F
db $08,$08,$08,$08,$08,$08,$08,$08  ; $40-$47
db $08,$08,$08,$08,$08,$08,$08,$08  ; $48-$4F

; $50-$52: More icons
db $08,$08,$08

; $53-$5C: Digits 0-9 (7px each)
db $07,$07,$07,$07,$07,$07,$07,$07,$07,$07

; $5D-$5F: Icons
db $08,$08,$08

; $60-$79: Uppercase A-Z
db $07  ; $60 A
db $07  ; $61 B
db $07  ; $62 C
db $07  ; $63 D
db $07  ; $64 E
db $07  ; $65 F
db $07  ; $66 G
db $07  ; $67 H
db $05  ; $68 I (narrow)
db $05  ; $69 J (somewhat narrow)
db $07  ; $6A K
db $07  ; $6B L
db $09  ; $6C M (wide)
db $07  ; $6D N
db $07  ; $6E O
db $07  ; $6F P
db $07  ; $70 Q
db $07  ; $71 R
db $07  ; $72 S
db $07  ; $73 T
db $07  ; $74 U
db $07  ; $75 V
db $09  ; $76 W (wide)
db $07  ; $77 X
db $07  ; $78 Y
db $07  ; $79 Z

; $7A-$93: Lowercase a-z
db $07  ; $7A a
db $07  ; $7B b
db $06  ; $7C c
db $07  ; $7D d
db $07  ; $7E e
db $06  ; $7F f
db $07  ; $80 g
db $07  ; $81 h
db $05  ; $82 i (narrow)
db $06  ; $83 j
db $07  ; $84 k
db $05  ; $85 l (narrow)
db $09  ; $86 m (wide)
db $07  ; $87 n
db $07  ; $88 o
db $07  ; $89 p
db $07  ; $8A q
db $06  ; $8B r
db $06  ; $8C s
db $06  ; $8D t
db $07  ; $8E u
db $07  ; $8F v
db $09  ; $90 w (wide)
db $07  ; $91 x
db $07  ; $92 y
db $07  ; $93 z

; $94-$98: Ligatures
db $08,$08,$08,$08,$08

; $99-$A3: Punctuation
db $04  ; $99 ' (apostrophe - narrow)
db $08  ; $9A
db $04  ; $9B : (colon - narrow)
db $08  ; $9C
db $04  ; $9D , (comma - narrow)
db $08  ; $9E
db $08  ; $9F
db $06  ; $A0 /
db $04  ; $A1 ! (narrow)
db $06  ; $A2 ?
db $04  ; $A3 . (period - narrow)

; $A4-$FF: Extended characters and icons (fixed 8px)
db $08,$08,$08,$08,$08,$08,$08,$08  ; $A4-$AB
db $08,$08,$08,$08,$08,$08,$08,$08  ; $AC-$B3
db $08,$08,$08,$08,$08,$08,$08,$08  ; $B4-$BB
db $08,$08,$08,$08,$08,$08,$08,$08  ; $BC-$C3
db $08,$08,$08,$08,$08,$08,$08,$08  ; $C4-$CB
db $08,$08,$08,$08,$08,$08,$08,$08  ; $CC-$D3
db $08,$08,$08,$08,$08,$08,$08,$08  ; $D4-$DB
db $08,$08,$08,$08,$08,$08,$08,$08  ; $DC-$E3
db $08,$08,$08,$08,$08,$08,$08,$08  ; $E4-$EB
db $08,$08,$08,$08,$08,$08,$08,$08  ; $EC-$F3
db $08,$08,$08,$08,$08,$08,$08,$08  ; $F4-$FB
db $08,$08,$08,$08                  ; $FC-$FF

; ============================================================================
; END OF FILE
; ============================================================================
