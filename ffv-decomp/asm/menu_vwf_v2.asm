; ============================================================================
; MENU_VWF_V2.ASM - Variable Width Font renderer for FFV menu font (2bpp)
; ============================================================================
;
; v2 rewrite after the 2026-07-04 docs-only audit of menu_vwf.asm (v1).
; v1 was retired for cause; see notes/2BPP_VWF_HOOK_INVESTIGATION.md "v1 audit".
; Summary of what changed and why:
;
;   1. v1 never assembled: it used LDA/STA $7Exxxx,Y everywhere, but the
;      65816 has no "long,Y" addressing mode (only long,X), and no long
;      forms of STZ/DEC. v2 sets DB=$7E and uses absolute,X/Y addressing.
;   2. v1's dest buffer ($7E1E40-$203F) overlapped the NMI/IRQ RAM
;      trampolines at $1F00/$1F04 (context.md, DOC_GAP_AUDIT.md 2.1) —
;      guaranteed crash on the first rendered line. v2 reuses the game's
;      own dialogue pixel-render workspace instead (see WRAM map below),
;      which exists for exactly this purpose and is idle in menus.
;   3. v1's org $D1A119 "866 bytes free" is actually a game data table
;      (verified byte-identical in ff5c.sfc.bak). v2 lives in the RPGe
;      expansion bank at $E0:5000, inside a verified 46KB run of $FF fill
;      ($E0:4C25-$E0:FFFF) — the same bank as Myria's dialogue VWF code.
;   4. v1 borrowed Myria's DIALOGUE width table ($E03225). That table
;      defaults 193 chars to 12px — wider than the menu font's 8px tile —
;      and its indexing base was never verified. v2 ships its own 256-entry
;      table measured from the actual ff5c menu font glyphs, indexed by
;      RAW char code (generated: menu_vwf_widths.asm).
;   5. NEW in v2 (algorithm fix): the menu font's background is palette
;      color 1 flooded across the whole tile (ink = colors 2/3, i.e. BP1).
;      A plain OR merge corrupts shadow pixels (01|10=11 -> white).
;      v2 strips the background at load (BP0 &= BP1 -> ink on transparent),
;      OR-merges the now-sparse ink (widths guarantee a >=1px gap so ink
;      never overlaps), then MenuVWF_Finalize repaints color 1 over every
;      non-ink pixel (BP0 |= ~BP1) so tiles stay opaque like the original.
;   6. v1 pushed registers before setting register sizes (stack imbalance
;      if the caller's M/X differ) and did TXA/ADC/TAX pointer math in
;      8-bit A (wraps at column 16). v2 sets sizes first and computes the
;      overflow column with an assemble-time +16 offset instead.
;   7. Space is $FF and $00 is the terminator (ffv_menufont_ff5c.tbl);
;      v1 special-cased $96 as space. v2 needs no special case: $FF is a
;      no-ink tile (merges nothing) with a measured 4px width.
;   8. Entry points end in RTL (v1 mixed RTS bodies with JSL call notes).
;
; WRAM map — reuses the game's dialogue text-render workspace (C1/2CF1
; uses $F507/$F508+ as cursor/shift buffers and $F357+ as the line buffer;
; see Bank_C1 disassembly). The dialogue engine is idle while the menu
; module runs, and it fully re-initializes these before each use.
; UNVERIFIED ASSUMPTION (the one thing this file still needs a live test
; for): the menu module itself must not use $F357-$F52B for its own state.
; Sentinel test: fill $7E:F357-$F52B with $AA, navigate menus, read back.
;
;   $7E:F507        1 byte   pixel cursor (game's own text cursor slot)
;   $7E:F508-F517  16 bytes  shifted tile buffer      (game: glyph strip 1)
;   $7E:F518-F527  16 bytes  shift overflow buffer    (game: glyph strips 2/3)
;   $7E:F528        1 byte   saved char code          (game: strip 3 tail)
;   $7E:F357-F506 432 bytes  rendered line, 27 tiles  (game: 1bpp line buffer)
;
; Line capacity: 27 tile columns = 216 px (same budget as the game's own
; dialogue line buffer). RenderChar drops characters once cursor >= 208
; so the overflow column can never write past $F506.
;
; Entry points (all JSL/RTL):
;   MenuVWF_Clear       reset cursor, wipe line buffer to 0
;   MenuVWF_RenderChar  A(8-bit) = char code; renders + advances cursor
;   MenuVWF_RenderBuf   X = string address in bank $7E (e.g. $1B00, the
;                       C0/92BD decode buffer), Y = max chars; stops at $00
;   MenuVWF_Finalize    repaint opaque color-1 background; call once after
;                       the last RenderChar, before uploading to VRAM
;   MenuVWF_GetWidth    A low byte = rendered width in pixels
;   MenuVWF_GetTileCount A low byte = 8px tiles needed (width+7)/8
;
; Assemble:  asar menu_vwf_v2.asm ff5c.sfc   (expects menu_vwf_widths.asm
;            in the same directory; regenerate with gen_menu_width_table.py)
; ============================================================================

hirom

; --- resources --------------------------------------------------------------
!MenuFont      = $D1F000        ; 2bpp menu font, 256 tiles x 16 bytes
!MaxCursor     = $D0            ; 208 = last cursor with room for tile+spill

; --- WRAM (bank $7E, addressed via DB=$7E absolute) -------------------------
!VWF_Cursor    = $F507
!VWF_TileBuf   = $F508
!VWF_Overflow  = $F518
!VWF_CharSave  = $F528
!VWF_Dest      = $F357
!VWF_DestSize  = $01B0          ; 432 bytes = 27 tile columns

org $E05000                     ; verified $FF free space, Myria's bank

; ============================================================================
; MenuVWF_RenderChar - render one glyph at the current cursor position
; ============================================================================
MenuVWF_RenderChar:
    php
    rep #$30                    ; known sizes BEFORE pushing (16-bit A/X/Y)
    pha
    phx
    phy
    phb
    pea $7E7E                   ; DB = $7E so abs,X / abs,Y hit WRAM
    plb
    plb

    sep #$20                    ; A 8-bit, X/Y stay 16-bit
    sta.w !VWF_CharSave         ; keep char code for the width lookup

    lda.w !VWF_Cursor           ; line full? then drop the character
    cmp #!MaxCursor
    bcc .haveRoom
    brl .done
.haveRoom:

    rep #$20                    ; X = char * 16 = font ROM offset
    lda.w !VWF_CharSave
    and #$00FF
    asl a
    asl a
    asl a
    asl a
    tax

    ; -- load tile, strip background: BP0 &= BP1 leaves ink on transparent --
    sep #$20
    ldy #$0000
.load:
    lda.l !MenuFont+1,x         ; BP1 (ink mask) of this row
    sta.w !VWF_TileBuf+1,y
    and.l !MenuFont,x           ; BP0 & BP1: color 1 bg -> 0, keeps 2/3
    sta.w !VWF_TileBuf,y
    lda #$00
    sta.w !VWF_Overflow,y
    sta.w !VWF_Overflow+1,y
    inx
    inx
    iny
    iny
    cpy #$0010
    bne .load

    ; -- shift right by (cursor & 7) for sub-pixel alignment ----------------
    rep #$20
    lda.w !VWF_Cursor           ; 16-bit read grabs a stray high byte...
    and #$0007                  ; ...which the mask discards
    beq .noshift
    tay                         ; Y = shift count
    sep #$20
.shiftOuter:
    ldx #$0000
.shiftInner:
    lsr.w !VWF_TileBuf,x        ; bit 0 falls into carry...
    ror.w !VWF_Overflow,x       ; ...and rises into overflow bit 7
    inx
    cpx #$0010
    bne .shiftInner
    dey
    bne .shiftOuter
.noshift:

    ; -- OR the sparse ink into the line buffer -----------------------------
    rep #$20
    lda.w !VWF_Cursor
    and #$00F8                  ; (cursor/8)*16 == (cursor & ~7) * 2
    asl a
    tax                         ; X = dest byte offset, 16-bit safe
    sep #$20
    ldy #$0000
.merge:
    lda.w !VWF_Dest,x
    ora.w !VWF_TileBuf,y
    sta.w !VWF_Dest,x
    lda.w !VWF_Dest+16,x        ; spill column: assemble-time +16, no
    ora.w !VWF_Overflow,y       ; runtime pointer math to wrap
    sta.w !VWF_Dest+16,x
    inx
    iny
    cpy #$0010
    bne .merge

    ; -- advance cursor by this glyph's measured width ----------------------
    rep #$20
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
; MenuVWF_Clear - reset cursor and wipe the line buffer
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
; MenuVWF_RenderBuf - render up to Y chars from a bank-$7E string at X
; (e.g. X=$1B00: the C0/92BD text-engine decode buffer). Stops at $00.
; ============================================================================
MenuVWF_RenderBuf:
    php
    rep #$30
    pha
    phx
    phy
    phb
    pea $7E7E
    plb
    plb
.next:
    cpy #$0000
    beq .done
    sep #$20
    lda.w $0000,x               ; DB=$7E: reads $7E:(X)
    beq .done                   ; $00 = terminator (ffv_menufont tbl)
    jsl MenuVWF_RenderChar      ; preserves A/X/Y/DB
    inx
    dey
    bra .next
.done:
    rep #$30
    plb
    ply
    plx
    pla
    plp
    rtl

; ============================================================================
; MenuVWF_Finalize - repaint opaque background: BP0 |= ~BP1 per row byte.
; Every non-ink pixel becomes color 1, matching the stock font tiles.
; ============================================================================
MenuVWF_Finalize:
    php
    rep #$10
    sep #$20
    pha
    phx
    phb
    pea $7E7E
    plb
    plb
    ldx #$0000
.pass:
    lda.w !VWF_Dest+1,x         ; BP1 of this row
    eor #$FF                    ; non-ink pixels
    ora.w !VWF_Dest,x
    sta.w !VWF_Dest,x           ; BP0 |= ~BP1  -> bg pixels become color 1
    inx
    inx
    cpx #!VWF_DestSize
    bne .pass
    rep #$10
    plb
    plx
    pla
    plp
    rtl

; ============================================================================
; MenuVWF_GetWidth - A low byte = rendered width in pixels (0-216)
; MenuVWF_GetTileCount - A low byte = 8px tile columns used = (width+7)/8
; Both return with caller's P restored; only A's low byte is meaningful.
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
; Measured width table (generated - do not hand-edit)
; ============================================================================
incsrc menu_vwf_widths.asm

print "MenuVWF v2 assembled: code $E05000-", hex(MenuVWF_WidthTable+256-1)
