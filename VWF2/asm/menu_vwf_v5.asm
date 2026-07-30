; ============================================================================
; MENU_VWF_V5.ASM - REAL menu VWF: every text string proportionally spaced
; ============================================================================
;
; Supersedes the v4.x digit-overwrite MVP (pipeline proven in-game
; 2026-07-06). v5 intercepts the menu string writer itself so actual menu
; labels render with per-glyph widths from the measured table.
;
; ARCHITECTURE (ground-truthed; handoff doc 0.2/0.5):
;   C2/E59D = stock string writer: A hi = string bank ($E7/$E0), A lo =
;   length|raw-mode(bit7), Y = string addr, X = staging-tilemap dest
;   (bank $7E). v5 trampolines its first 4 bytes (PHB PHP SEP #$20).
;   Text-mode strings with 1 <= len <= 27 and queue room render through
;   the VWF engine into a 256-slot dynamic tile pool (tile ids $100-$1FF,
;   VRAM words $7800+, verified unreferenced by all menu tilemaps).
;   Pixels queue in WRAM; the menu-NMI hook (C2/FB26) drains them to VRAM
;   during the handler's own force-blank. Tilemap gets pool tile words +
;   flood padding with the exact stock footprint (X and Y advance
;   identically to stock). Raw mode / len 0 or >27 / queue-full fall back
;   to the stock routine (replayed head, resume at C2/E5A1).
;
; POOL: bump allocator, wraps at 256 (self-heals: redraws rewrite the
; map). Reset by the menu-entry hook (C0/44D4) each menu open.
;
; WRAM:
;   $7E:F357-F506  line buffer (27 cols x 16B)   } sentinel-verified
;   $7E:F507-F528  renderer scratch              } window $F357-F52B
;   $7E:F51C-F521  flush-stage scratch (inside the shift Overflow buffer,
;                  which is dead once rendering is done)
;   $7E:F52A       pool bump pointer             } window
;   $7E:F52B       queue busy flag               } window
;   $7E:A937-A938  u16 queue payload bytes used  } battle-dialogue buffer:
;   $7E:A939       string-loop: remaining length } same idle-in-menu class
;   $7E:A93A       string-loop: consumed chars   } as $F357 but NOT YET
;   $7E:A93C-AB36  queue: [u16 vram][u8 tiles][pixels...] entries
;                  } user-verified. SENTINEL TEST: fill $7E:A937-AB36
;                  } with $AA, navigate all menus/shops, read back.
;
; EXPECTED RESULT: menu labels proportionally spaced; digits stay 8px so
; number columns align; the v4 garbled-digits test is retired.
;
; Assemble:  asar menu_vwf_v5.asm ff5c.sfc   (needs menu_vwf_widths.asm)
; ============================================================================

hirom

!MenuFont      = $D1F000
!MaxCursor     = $D0
!VramPoolBase  = $7800          ; VRAM word of pool slot 0 (tile id $100)
!PoolTileBase  = $0100          ; tilemap word for pool slot 0

; renderer WRAM (bank $7E absolute, DB=$7E inside routines)
!VWF_Dest      = $F357
!VWF_DestSize  = $01B0
!VWF_Cursor    = $F507
!VWF_TileBuf   = $F508
!VWF_Overflow  = $F518
!VWF_CharSave  = $F528

; flush-stage scratch (overlaps Overflow - only used after rendering)
!V5_Tiles      = $F51C          ; u8 tile count
!V5_Slot       = $F51D          ; u8 pool base slot
!V5_Count      = $F51E          ; u16 pixel byte count
!V5_MapCnt     = $F520          ; u8 map-cell countdown

!V5_PoolPtr    = $F52A
!V5_Busy       = $F52B

; queue block (battle-dialogue buffer; see sentinel note above)
!Q_Used        = $A937          ; u16
!V5_Len        = $A939          ; u8, string-loop remaining
!V5_Consumed   = $A93A          ; u8, chars consumed
!Q_Base        = $A93C          ; entries
!Q_Cap         = $01FA          ; 506 payload bytes ($A93C-$AB35)

org $E05300

; ============================================================================
; Renderer: RenderChar / Clear / Finalize (proven in v4.2, labels renamed)
; ============================================================================
MenuVWF5_RenderChar:
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

    lda.w !VWF_Cursor
    cmp #!MaxCursor
    bcc .haveRoom
    brl .done
.haveRoom:

    rep #$20
    lda.w !VWF_CharSave
    and #$00FF
    asl a
    asl a
    asl a
    asl a
    tax

    sep #$20
    ldy #$0000
.load:
    lda.l !MenuFont+1,x
    sta.w !VWF_TileBuf+1,y
    and.l !MenuFont,x
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

    rep #$20
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

    rep #$20
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
    lda.w !VWF_Dest+16,x
    ora.w !VWF_Overflow,y
    sta.w !VWF_Dest+16,x
    inx
    iny
    cpy #$0010
    bne .merge

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

MenuVWF5_Clear:
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

MenuVWF5_Finalize:
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
    lda.w !VWF_Dest+1,x
    eor #$FF
    ora.w !VWF_Dest,x
    sta.w !VWF_Dest,x
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
; MenuVWF5_String - trampoline target for C2/E59D
; On entry (we replay the stolen PHB PHP SEP #$20 ourselves):
;   C = bank:(len|mode), Y = string ptr, X = staging map dest
; ============================================================================
MenuVWF5_String:
    phb
    php
    sep #$20
    rep #$20
    pha                         ; full C on stack: 1,s = len|mode, 2,s = bank
    sep #$20

    lda 1,s
    and #$80
    bne .toStock                ; raw word mode
    lda 1,s
    and #$7F
    beq .toStock                ; len 0
    cmp #$1C
    bcs .toStock                ; len > 27: line buffer cap
    sta.l $7E0000+!V5_Len

    rep #$20                    ; queue room for worst case 3 + len*16?
    lda 1,s
    and #$007F
    asl a
    asl a
    asl a
    asl a
    adc #$0003
    adc.l $7E0000+!Q_Used
    cmp #!Q_Cap
    sep #$20
    bcs .toStock

    rep #$20                    ; commit to VWF: restore full C
    pla
    sep #$20
    brl .vwf

.toStock:
    rep #$20
    pla                         ; full C restored (bank byte intact)
    sep #$20
    jml $C2E5A1                 ; resume stock body after the stolen head

; ── VWF path ─────────────────────────────────────────────────────────────
.vwf:
    xba                         ; DB = string bank (as stock does)
    pha
    plb
    xba
    rep #$10                    ; stock relies on caller's 16-bit X/Y
    phx                         ; keep map dest for the flush stage

    lda #$00
    sta.l $7E0000+!V5_Consumed
    jsl MenuVWF5_Clear

.chLoop:
    lda.l $7E0000+!V5_Len
    beq .flush
    dec a
    sta.l $7E0000+!V5_Len
    lda $0000,y                 ; DB = string bank
    beq .flush                  ; $00 terminator: Y not advanced (stock)
    iny
    pha
    lda.l $7E0000+!V5_Consumed
    inc a
    sta.l $7E0000+!V5_Consumed
    pla
    cmp #$20                    ; translate to font tile code (per C2/E5ED)
    bcc .render                 ; <$20: as-is
    cmp #$49
    bcc .grp1                   ; $20-$48: +$40
    cmp #$53
    bcs .render                 ; >=$53: as-is (digits etc.)
    clc                         ; $49-$52: +$17
    adc #$17
    bra .render
.grp1:
    clc
    adc #$40
.render:
    jsl MenuVWF5_RenderChar     ; preserves A/X/Y/DB
    bra .chLoop

.flush:
    lda.l $7E0000+!V5_Consumed
    bne .haveText
    rep #$30                    ; empty string: stock-equivalent exit
    plx
    jml $C2E5EA

.haveText:
    jsl MenuVWF5_Finalize
    lda #$7E                    ; DB = $7E for everything below
    pha
    plb

    rep #$20                    ; tiles = (cursor+7)/8
    lda.w !VWF_Cursor
    and #$00FF
    clc
    adc #$0007
    lsr a
    lsr a
    lsr a
    sep #$20
    sta.w !V5_Tiles

    lda.w !V5_PoolPtr           ; pool bump alloc, wrap at 256
    sta.w !V5_Slot
    clc
    adc.w !V5_Tiles
    bcc .noWrap
    lda #$00
    sta.w !V5_Slot
    lda.w !V5_Tiles
.noWrap:
    sta.w !V5_PoolPtr

    lda #$01                    ; ── queue append ──
    sta.w !V5_Busy
    rep #$30
    lda.w !Q_Used
    tax                         ; X = queue write offset
    lda.w !V5_Slot
    and #$00FF
    asl a
    asl a
    asl a
    clc
    adc #!VramPoolBase
    sta.w !Q_Base,x             ; entry: vram word
    inx
    inx
    sep #$20
    lda.w !V5_Tiles
    sta.w !Q_Base,x             ; entry: tile count
    inx
    rep #$20
    lda.w !V5_Tiles
    and #$00FF
    asl a
    asl a
    asl a
    asl a
    sta.w !V5_Count             ; pixel bytes to copy
    ldy #$0000
    sep #$20
.copy:
    lda.w !VWF_Dest,y
    sta.w !Q_Base,x
    inx
    iny
    rep #$20
    tya
    cmp.w !V5_Count
    sep #$20
    bcc .copy
    rep #$20
    txa
    sta.w !Q_Used               ; commit entry
    sep #$20
    lda #$00
    sta.w !V5_Busy

    rep #$30                    ; ── tilemap: pool words + flood padding ──
    plx                         ; X = original map dest
    lda.w !V5_Consumed          ; (u8; high byte is Q_Base data - mask)
    and #$00FF
    sep #$20
    sta.w !V5_MapCnt
    rep #$20
    lda.w !V5_Slot
    and #$00FF
    clc
    adc #!PoolTileBase
    tay                         ; Y = next pool tile word
.mapLoop:
    lda.w !V5_Tiles
    and #$00FF
    beq .pad
    dec a
    sep #$20
    sta.w !V5_Tiles
    rep #$20
    tya
    iny
    bra .put
.pad:
    lda #$00FF                  ; window flood tile
.put:
    sta.w $0000,x               ; text cell (DB=$7E)
    lda #$00FF
    sta.l $7DFFC0,x             ; companion cell one map row up (stock)
    inx
    inx
    sep #$20
    lda.w !V5_MapCnt
    dec a
    sta.w !V5_MapCnt
    beq .mapDone
    rep #$20
    bra .mapLoop
.mapDone:
    jml $C2E5EA                 ; stock tail: PLP PLB RTS (stack = [B][P])

; ============================================================================
; MenuVWF5_NmiHook - stolen from C2/FB26 (menu NMI force blank):
; drain the pixel queue to VRAM while the screen is blanked.
; ============================================================================
MenuVWF5_NmiHook:
    lda #$80                    ; replay stolen bytes: force blank
    sta.l $002100

    php
    lda.l $7E0000+!V5_Busy      ; mid-append? drain next frame
    bne .skip
    rep #$20
    lda.l $7E0000+!Q_Used
    beq .skipw
    phb                         ; X/Y are free to clobber here: the stock
    sep #$20                    ; handler restores them from its own frame
    lda #$7E
    pha
    plb                         ; DB = $7E
    lda #$80
    sta.l $002115
    rep #$30
    ldx #$0000                  ; X = queue read offset
.entry:
    lda.w !Q_Base,x             ; vram word
    sta.l $002116
    inx
    inx
    sep #$20
    lda.w !Q_Base,x             ; tile count
    inx
    rep #$20
    and #$00FF
    asl a
    asl a
    asl a
    asl a
    tay                         ; Y = pixel byte count (>=16 always)
.words:
    lda.w !Q_Base,x             ; BP0,BP1 row pair
    sta.l $002118               ; word write, VRAM auto-increment
    inx
    inx
    dey
    dey
    bne .words
    txa
    cmp.w !Q_Used
    bcc .entry
    lda #$0000
    sta.w !Q_Used
    plb
.skipw:
.skip:
    plp
    jml $C2FB2B                 ; resume stock NMI handler

; ============================================================================
; MenuVWF5_EntryHook - stolen from C0/44D4 (menu entry force blank):
; fresh pool + queue each menu open.
; ============================================================================
MenuVWF5_EntryHook:
    lda #$80
    sta.l $002100
    php
    lda #$00
    sta.l $7E0000+!V5_PoolPtr
    sta.l $7E0000+!V5_Busy
    rep #$20
    lda #$0000
    sta.l $7E0000+!Q_Used
    plp
    jml $C044D9

; measured ink-width table (BP1-based, generated)
incsrc menu_vwf_widths.asm

; ============================================================================
; Hook installs
; ============================================================================
org $C2E59D                     ; string writer trampoline (exactly 4 bytes)
    jml MenuVWF5_String

org $C2FB26                     ; menu NMI: queue drain
    jml MenuVWF5_NmiHook
    nop

org $C044D4                     ; menu entry: pool/queue reset
    jml MenuVWF5_EntryHook
    nop

print "MenuVWF v5: $E05300-", hex(MenuVWF_WidthTable+256-1), "  hooks E59D/FB26/44D4"
