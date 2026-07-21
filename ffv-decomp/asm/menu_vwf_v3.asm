; ============================================================================
; MENU_VWF_V3.ASM - VWF renderer for the FFV menu font, pipeline-correct
; ============================================================================
;
; v3 supersedes v2 after the 2026-07-05 pipeline discovery session.
; v2's core algorithm (2bpp shift + bg strip/repaint) modeled the ROM font
; format, but the menu pipeline never displays that format. What actually
; happens (all verified from disassembly of ff5c.sfc):
;
;   MENU TEXT PIPELINE (2bpp "menu font" is a misnomer - it's 4bpp on screen)
;   1. Font conversion at C1/91A6-9211: reads ONLY bitplane 1 (the ink
;      mask) of each ROM font tile at $D1F000, synthesizes a drop shadow
;      as ink>>1 (1px right), and writes 4bpp tiles (BP0=shadow, BP1=ink,
;      BP2/3=0) to a staging buffer at $7F:8000 (256 tiles x 32 bytes).
;      The ROM font's color-1 flood in BP0 is DISCARDED by this pipeline;
;      on-screen background is color 0 = transparent.
;   2. Upload at C1/9216-9223: $7F:8000, $2000 bytes -> VRAM word $7000
;      via the transfer helper JSR $FD27. Tile N = VRAM word $7000+N*16.
;   3. String draw at C2/E59D (via string ID -> ptr table $C0F987 ->
;      Myria's substitution shim E0/2FF0 -> C2/C340 JSR $E59D):
;      writes tile WORDS, not pixels - each char to $7E:0000+X (staging
;      tilemap) plus a companion tile $51/$52 one 32-tile row above
;      ($7DFFC0+X). Char translation at C2/E5ED: string $20-$48 -> tile
;      char+$40, $49-$52 -> char+$17, $53+ raw (digits $53-$5C direct).
;   4. $1B00 is NOT part of this pipeline - it's the FIELD dialogue (1bpp)
;      decode buffer (town-name banner etc.), fed by C0/92BD.
;
; v3 design consequences:
;   - Composite in 1bpp ink space (like the game, and like Myria's 1998
;     dialogue VWF): 8 bytes per tile column instead of 16.
;   - Shadow is generated at upload, carry-chained across columns (the
;     stock converter loses shadow at tile edges; we don't have to).
;   - No Finalize/background repaint - menu background is transparent.
;   - Width table unchanged from v2: it measures BP1 ink, exactly right.
;   - Output stage writes 4bpp tiles straight to VRAM via $2118/$2119
;     (call during forced blank / menu init only).
;
; WRAM - all inside the sentinel-verified window $7E:F357-$F52B
; (user test 2026-07-04/05: unresponsive during menu, submenu, battle,
; shop activity; these are the game's dialogue text-render buffers,
; idle outside field dialogue):
;
;   $7E:F357-F42E  216 bytes  ink line buffer, 27 columns x 8 bytes
;   $7E:F507         1 byte   pixel cursor (the game's own text cursor)
;   $7E:F508-F50F    8 bytes  glyph ink buffer
;   $7E:F510-F517    8 bytes  shift overflow buffer
;   $7E:F518         1 byte   saved char code
;   $7E:F519         1 byte   upload column counter
;
; Entry points (JSL/RTL; char codes = FONT tile codes, e.g. 'A'=$60,
; '0'=$53, space=$FF, terminator=$00 - see ffv_menufont_ff5c.tbl):
;   MenuVWF_Clear        reset cursor, wipe ink line buffer
;   MenuVWF_RenderChar   A(8-bit low) = font char code
;   MenuVWF_UploadVRAM   X(16-bit) = VRAM word address; packs the line
;                        to 4bpp ink+shadow and streams it out. FORCED
;                        BLANK ONLY.
;   MenuVWF_GetWidth     A low = rendered width in px
;   MenuVWF_GetTileCount A low = 8px columns used = (width+7)/8
;
; MVP TEST HOOK (proof of pipeline, remove before real integration):
;   C1/9226 (5 bytes LDX #$1000 : STX $70) -> JML MenuVWF_MvpHook + NOP.
;   Runs once at menu-module init, right after the stock font upload,
;   still in forced blank. Renders "VWF Test!" and uploads it over the
;   digit tiles $53-$5A (VRAM $7530+). RESULT TO LOOK FOR: everywhere
;   menus would show digits 0-7 (gil, HP, item counts), you'll see
;   slices of the VWF-rendered test string instead. Garbled numbers =
;   SUCCESS; it proves render, pack, shadow, and upload all work.
;
; Assemble:  asar menu_vwf_v3.asm ff5c.sfc   (needs menu_vwf_widths.asm)
; ============================================================================

hirom

; --- resources --------------------------------------------------------------
!MenuFontInk   = $D1F001        ; BP1 rows = odd bytes of each 16-byte tile
!MaxCursor     = $D0            ; 208: last start leaving room for spill col

; --- WRAM (bank $7E via DB; sentinel-verified window) ------------------------
!VWF_Dest      = $F357          ; 27 cols x 8 bytes, column-major ink
!VWF_DestSize  = $00D8          ; 216
!VWF_Cursor    = $F507
!VWF_TileBuf   = $F508
!VWF_Overflow  = $F510
!VWF_CharSave  = $F518
!VWF_ColCount  = $F519

org $E05000                     ; verified $FF free space (E0/4C25-FFFF)

; ============================================================================
; MenuVWF_RenderChar - composite one glyph's ink at the cursor position
; ============================================================================
MenuVWF_RenderChar:
    php
    rep #$30
    pha
    phx
    phy
    phb
    pea $7E7E
    plb
    plb

    sep #$20
    sta.w !VWF_CharSave

    lda.w !VWF_Cursor           ; line full? drop the character
    cmp #!MaxCursor
    bcc .haveRoom
    brl .done
.haveRoom:

    rep #$20                    ; X = char*16 (tile stride in ROM font)
    lda.w !VWF_CharSave
    and #$00FF
    asl a
    asl a
    asl a
    asl a
    tax

    sep #$20                    ; load 8 ink rows (BP1 = odd bytes)
    ldy #$0000
.load:
    lda.l !MenuFontInk,x        ; row ink
    sta.w !VWF_TileBuf,y
    lda #$00
    sta.w !VWF_Overflow,y
    inx
    inx                         ; next row pair (skip BP0 byte)
    iny
    cpy #$0008
    bne .load

    rep #$20                    ; shift right by (cursor & 7)
    lda.w !VWF_Cursor
    and #$0007
    beq .noshift
    tay
    sep #$20
.shiftOuter:
    ldx #$0000
.shiftInner:
    lsr.w !VWF_TileBuf,x        ; glyph bit 0 -> carry
    ror.w !VWF_Overflow,x       ; carry -> overflow bit 7
    inx
    cpx #$0008
    bne .shiftInner
    dey
    bne .shiftOuter
.noshift:

    rep #$20                    ; dest offset = (cursor/8)*8 = cursor & ~7
    lda.w !VWF_Cursor
    and #$00F8
    tax
    sep #$20
    ldy #$0000
.merge:
    lda.w !VWF_Dest,x
    ora.w !VWF_TileBuf,y
    sta.w !VWF_Dest,x
    lda.w !VWF_Dest+8,x         ; spill column, assemble-time offset
    ora.w !VWF_Overflow,y
    sta.w !VWF_Dest+8,x
    inx
    iny
    cpy #$0008
    bne .merge

    rep #$20                    ; cursor += measured width
    lda.w !VWF_CharSave
    and #$00FF
    tax
    sep #$20
    lda.l MenuVWF_WidthTable,x
    clc
    adc.w !VWF_Cursor
    sta.w !VWF_Cursor

.done:
    rep #$30
    plb
    ply
    plx
    pla
    plp
    rtl

; ============================================================================
; MenuVWF_Clear - reset cursor, wipe the ink line buffer
; ============================================================================
MenuVWF_Clear:
    php
    rep #$30
    pha
    phx
    phb
    pea $7E7E
    plb
    plb
    sep #$20
    lda #$00
    sta.w !VWF_Cursor
    rep #$20
    lda #$0000
    ldx #$0000
.wipe:
    sta.w !VWF_Dest,x
    inx
    inx
    cpx #!VWF_DestSize
    bne .wipe
    rep #$30
    plb
    plx
    pla
    plp
    rtl

; ============================================================================
; MenuVWF_UploadVRAM - pack ink line to 4bpp ink+shadow, stream to VRAM
; Input: X (16-bit) = VRAM word address (tile N of menu font = $7000+N*16)
; FORCED BLANK ONLY. Shadow = ink>>1, carry-chained across columns.
; ============================================================================
MenuVWF_UploadVRAM:
    php
    rep #$30
    pha
    phx
    phy
    phb
    pea $7E7E
    plb
    plb

    sep #$20
    lda #$80                    ; increment VRAM addr on $2119 write
    sta.l $002115
    rep #$20
    txa
    sta.l $002116               ; 16-bit store covers $2116+$2117

    lda.w !VWF_Cursor           ; columns = (cursor+7)/8
    and #$00FF
    clc
    adc #$0007
    lsr a
    lsr a
    lsr a
    sep #$20
    sta.w !VWF_ColCount
    beq .done                   ; empty line, nothing to send

    ldy #$0000                  ; Y walks the ink buffer byte-by-byte
.column:
    ldx #$0008                  ; 8 rows: planes 0/1 interleaved by word
.row:
    cpy #$0008                  ; first column has no left neighbor
    bcc .noPrev
    lda.w !VWF_Dest-8,y         ; left column, same row
    lsr a                       ; carry = neighbor's rightmost ink pixel
    bra .shadow
.noPrev:
    clc
.shadow:
    lda.w !VWF_Dest,y
    ror a                       ; shadow row = ink>>1 | neighbor spill
    sta.l $002118               ; BP0 = shadow
    lda.w !VWF_Dest,y
    sta.l $002119               ; BP1 = ink (advances VRAM address)
    iny
    dex
    bne .row

    lda #$00                    ; planes 2/3 = zero, 8 words
    ldx #$0008
.zeros:
    sta.l $002118
    sta.l $002119
    dex
    bne .zeros

    dec.w !VWF_ColCount
    bne .column

.done:
    rep #$30
    plb
    ply
    plx
    pla
    plp
    rtl

; ============================================================================
; MenuVWF_GetWidth / MenuVWF_GetTileCount (A low byte = result)
; ============================================================================
MenuVWF_GetWidth:
    php
    sep #$20
    lda.l $7E0000+!VWF_Cursor
    plp
    rtl

MenuVWF_GetTileCount:
    php
    rep #$20
    lda.l $7E0000+!VWF_Cursor
    and #$00FF
    clc
    adc #$0007
    lsr a
    lsr a
    lsr a
    plp
    rtl

; ============================================================================
; MVP TEST HOOK - stolen from C1/9226 (menu init, post font upload,
; forced blank). Renders a test string over the digit tiles $53+.
; ============================================================================
MenuVWF_MvpHook:
    jsl MenuVWF_Clear
    php
    rep #$10
    sep #$20
    phx
    ldx #$0000
.next:
    lda.l MenuVWF_TestString,x
    beq .fin
    jsl MenuVWF_RenderChar
    inx
    bra .next
.fin:
    rep #$10
    ldx #$7530                  ; VRAM word addr of tile $53 ('0')
    jsl MenuVWF_UploadVRAM
    plx
    plp

    ldx #$1000                  ; replay the 5 stolen bytes
    stx $70
    jml $C1922B                 ; resume stock init

; font tile codes: V W F sp T e s t !  (tbl: A-Z $60+, a-z $7A+, sp $FF)
MenuVWF_TestString:
    db $75,$76,$65,$FF,$73,$7E,$8C,$8D,$A1,$00

; ============================================================================
; Measured ink-width table (BP1-based - correct for this pipeline)
; ============================================================================
incsrc menu_vwf_widths.asm

; ============================================================================
; Hook install: C1/9226  LDX #$1000 : STX $70  ->  JML MenuVWF_MvpHook : NOP
; ============================================================================
org $C19226
    jml MenuVWF_MvpHook
    nop

print "MenuVWF v3: code+table $E05000-", hex(MenuVWF_WidthTable+256-1), "  hook at $C19226"
