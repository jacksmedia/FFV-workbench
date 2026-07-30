; ============================================================================
; MENU_VWF_V4.ASM - VWF for the FFV menu, targeting the GROUND-TRUTHED
; menu pipeline (savestate forensics, 2026-07-05; handoff doc 0.2)
; ============================================================================
;
; Architecture this build targets (all verified against ff5c_11.mss):
;   - Menu font: RAW 2bpp, 256 tiles, VRAM word $6000 (tile N = $6000+N*8)
;   - Color 1 = flooded window background, colors 2/3 = ink (BP1 = ink mask)
;   - Menu program runs from RAM at $7F:8000; its NMI handler is ROM at
;     C2/FB0C and force-blanks the screen every frame while a menu is open
;
; v4 = v2's renderer (strip flood -> OR sparse ink -> repaint flood), which
; the forensics proved is the correct model for menus, plus a 2bpp VRAM
; uploader that rides the menu's own NMI at the force-blank moment.
;
; MVP TEST (this build): each menu NMI, upload a VWF-rendered "VWF Test!"
; strip over the digit tiles $53-$5B. The render itself runs once (flag
; byte $F529) - expect at most a one-frame blink the first time.
; SUCCESS = digits 0-8 anywhere in menus (gil, HP, LV, item counts) show
; slices of proportionally-spaced text. Works from savestates: the hook
; fires every menu frame, no reboot needed. Battle/field are untouched
; (this NMI vector is only installed while the menu module runs).
;
; HOOK: C2/FB26  LDA #$80 : STA $2100  (5 bytes) -> JML MenuVWF4_NmiHook
; + NOP. The stub replays the force-blank first, so VRAM is writable.
; At the hook: A is 8-bit, DB=$00, DP = interrupted code's (NOT $0100 yet;
; the handler's PEA/PLD happens after FB2B) - so the stub avoids DP access.
; X/Y are free to clobber: the handler restores them from its own stack
; frame at exit.
;
; WRAM - all inside the sentinel-verified window $7E:F357-$F52B:
;   $7E:F357-F506  432 bytes  2bpp line buffer, 27 columns x 16 bytes
;   $7E:F507         1 byte   pixel cursor
;   $7E:F508-F517   16 bytes  glyph buffer (bg-stripped)
;   $7E:F518-F527   16 bytes  shift overflow buffer
;   $7E:F528         1 byte   saved char code
;   $7E:F529         1 byte   render-once flag ($A5 = rendered)
;
; Char codes = font tile codes (tbl: 'A'=$60, 'a'=$7A, '0'=$53, space $FF
; renders as blank + 4px; $00 terminates).
;
; Assemble:  asar menu_vwf_v4.asm ff5c.sfc   (needs menu_vwf_widths.asm)
; Coexists with the inert v3 block at $E05000-$E05294 (intro pipeline).
; ============================================================================

hirom

!MenuFont      = $D1F000        ; 2bpp menu font in ROM
!MaxCursor     = $D0            ; 208 = last start with room for spill col
!VramFontBase  = $7000          ; menu font base, VRAM words (GROUND TRUTH:
                                ; ppu.layers[*].chrAddress=$7000 read from
                                ; ff5c_11.mss PPU registers, 2026-07-06;
                                ; menu is BG MODE 0 - all layers 2bpp)
!TestTile      = $53            ; '0' - first digit tile we overwrite

!VWF_Dest      = $F357
!VWF_DestSize  = $01B0          ; 432 bytes = 27 columns
!VWF_Cursor    = $F507
!VWF_TileBuf   = $F508
!VWF_Overflow  = $F518
!VWF_CharSave  = $F528
!VWF_Flag      = $F529          ; word $F529-F52A; $C3A5 = rendered
!FlagMagic     = $C3A5

org $E05300                     ; verified $FF free space, after v3 block

; ============================================================================
; MenuVWF4_RenderChar - composite one glyph at the cursor (A = char code)
; Strips the color-1 flood at load (BP0 &= BP1) so ink ORs cleanly.
; ============================================================================
MenuVWF4_RenderChar:
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

    rep #$20                    ; X = char * 16 = ROM tile offset
    lda.w !VWF_CharSave
    and #$00FF
    asl a
    asl a
    asl a
    asl a
    tax

    sep #$20                    ; load tile, strip background
    ldy #$0000
.load:
    lda.l !MenuFont+1,x         ; BP1 = ink mask
    sta.w !VWF_TileBuf+1,y
    and.l !MenuFont,x           ; BP0 & BP1: flood -> 0, keeps colors 2/3
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

    rep #$20                    ; shift right by (cursor & 7)
    lda.w !VWF_Cursor
    and #$0007
    beq .noshift
    tay
    sep #$20
.shiftOuter:
    ldx #$0000
.shiftInner:
    lsr.w !VWF_TileBuf,x
    ror.w !VWF_Overflow,x
    inx
    cpx #$0010
    bne .shiftInner
    dey
    bne .shiftOuter
.noshift:

    rep #$20                    ; dest offset = (cursor/8)*16
    lda.w !VWF_Cursor
    and #$00F8
    asl a
    tax
    sep #$20
    ldy #$0000
.merge:
    lda.w !VWF_Dest,x
    ora.w !VWF_TileBuf,y
    sta.w !VWF_Dest,x
    lda.w !VWF_Dest+16,x        ; spill column, assemble-time offset
    ora.w !VWF_Overflow,y
    sta.w !VWF_Dest+16,x
    inx
    iny
    cpy #$0010
    bne .merge

    rep #$20                    ; cursor += measured ink width
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
; MenuVWF4_Clear - reset cursor, wipe the line buffer
; ============================================================================
MenuVWF4_Clear:
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
; MenuVWF4_Finalize - repaint the window flood: BP0 |= ~BP1 per row byte.
; Call once after the last RenderChar; makes non-ink pixels color 1 so
; VWF tiles match the stock font's opaque background.
; ============================================================================
MenuVWF4_Finalize:
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
    lda.w !VWF_Dest+1,x         ; BP1 (ink)
    eor #$FF
    ora.w !VWF_Dest,x
    sta.w !VWF_Dest,x           ; BP0 |= ~BP1
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
; MenuVWF4_Upload - stream the rendered line to VRAM as raw 2bpp
; Input: X (16-bit) = VRAM word address. BLANK PERIODS ONLY.
; Dest layout is already native 2bpp, so this is a straight word stream;
; a 16-bit store to $2118 writes both planes of a row in one op.
; ============================================================================
MenuVWF4_Upload:
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
    lda #$80                    ; increment on $2119 access
    sta.l $002115
    rep #$20
    txa
    sta.l $002116

    lda.w !VWF_Cursor           ; bytes = ((cursor+7) & ~7) * 2
    and #$00FF
    clc
    adc #$0007
    and #$00F8
    asl a
    beq .done
    tay
    ldx #$0000
.stream:
    lda.w !VWF_Dest,x           ; BP0,BP1 row pair
    sta.l $002118               ; word write hits $2118+$2119
    inx
    inx
    dey
    dey
    bne .stream
.done:
    rep #$30
    plb
    ply
    plx
    pla
    plp
    rtl

; ============================================================================
; MenuVWF4_DoRender - render the test string + finalize (JSL from hooks)
; ============================================================================
MenuVWF4_DoRender:
    php
    sep #$20
    rep #$10
    jsl MenuVWF4_Clear
    ldx #$0000
.next:
    lda.l MenuVWF4_TestString,x
    beq .strDone
    jsl MenuVWF4_RenderChar
    inx
    bra .next
.strDone:
    jsl MenuVWF4_Finalize
    plp
    rtl

; ============================================================================
; MenuVWF4_NmiHook - stolen from C2/FB26 (menu NMI, pre-VRAM-work).
; Renders once per menu session (16-bit magic flag), uploads every frame.
; ============================================================================
MenuVWF4_NmiHook:
    lda #$80                    ; replay stolen bytes: force blank,
    sta.l $002100               ; making VRAM writable right now

    php
    rep #$20
    lda.l $7E0000+!VWF_Flag
    cmp #!FlagMagic
    beq .rendered
    jsl MenuVWF4_DoRender
    rep #$20
    lda #!FlagMagic
    sta.l $7E0000+!VWF_Flag
.rendered:
    rep #$10
    ldx #!VramFontBase+(!TestTile*8)   ; word $6298 = digit '0' tile
    jsl MenuVWF4_Upload
    plp
    jml $C2FB2B                 ; resume the stock NMI handler

; ============================================================================
; MenuVWF4_EntryHook - stolen from C0/44D4 (menu-entry force blank, NMI
; being disabled, right before the field launches the menu RAM program).
; Independent second test point: resets the flag so each menu open
; re-renders, then primes the digit tiles once right here. Even if the
; menu init re-uploads the stock font over them, the NMI hook re-asserts
; every frame.
; ============================================================================
MenuVWF4_EntryHook:
    lda #$80                    ; replay stolen bytes: force blank
    sta.l $002100
    php
    rep #$10
    phx                         ; mainline code - preserve X ourselves
    sep #$20
    jsl MenuVWF4_DoRender
    rep #$20
    lda #!FlagMagic
    sta.l $7E0000+!VWF_Flag
    ldx #!VramFontBase+(!TestTile*8)
    jsl MenuVWF4_Upload
    plx
    plp
    jml $C044D9                 ; resume: SEI, then JSL $C30000

; font tile codes: V W F sp T e s t !
MenuVWF4_TestString:
    db $75,$76,$65,$FF,$73,$7E,$8C,$8D,$A1,$00

; measured ink-width table (BP1-based; same generator as v2/v3)
incsrc menu_vwf_widths.asm

; ============================================================================
; Hook installs
; ============================================================================
org $C2FB26                     ; menu NMI, per-frame
    jml MenuVWF4_NmiHook
    nop

org $C044D4                     ; menu entry, once per open
    jml MenuVWF4_EntryHook
    nop

print "MenuVWF v4.1: $E05300-", hex(MenuVWF_WidthTable+256-1), "  hooks $C2FB26 + $C044D4"
