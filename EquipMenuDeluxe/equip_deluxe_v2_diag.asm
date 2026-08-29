; ============================================================================
; EQUIP_DELUXE_V2_DIAG.ASM - Diagnostic Version
; ============================================================================
; GOAL: Verify tilemap writing works by drawing hardcoded test tiles.
;       Once tiles appear, we know the mechanism works and can debug logic.
;
; Assemble:  asar equip_deluxe_v2_diag.asm ff5c.sfc
; ============================================================================

hirom

; ============================================================================
; TILEMAP GEOMETRY - CORRECTED per Mesen Tilemap Viewer
; ============================================================================
; Menu tilemap buffer in WRAM bank $7E (NOT $7F!)
; User confirmed: helmet icon at Row 15, Col 2 is at $7E:7790
; Offset for (15,2) = 15×64 + 2×2 = $3C4
; Therefore base = $7790 - $3C4 = $73CC
;
!TilemapBase    = $7E73CC

; Target rows in lower-left area (row × 64 + col × 2)
; Row 14, col 1 = just above and left of the helmet position
!TestRow1       = $0382         ; Row 14, col 1
!TestRow2       = $03C2         ; Row 15, col 1 (same row as helmet)
!TestRow3       = $0402         ; Row 16, col 1

; ============================================================================
; TEST TILES - Using $D5-$DC range as requested
; ============================================================================
!TileFire       = $D5
!TileIce        = $D6
!TileLightning  = $D7
!TilePoison     = $D8
!TileHoly       = $D9
!TileEarth      = $DA
!TileWind       = $DB
!TileWater      = $DC

; ============================================================================
; HOOK INSTALLATION
; ============================================================================
; Hook at C2/CB86, but this time we CALL the original routine first.
;
; Original:
;   CB86: JSR $CB95   (3 bytes)
;   CB89: PLP         (1 byte)
;   CB8A: PLB
;   CB8B: RTS
;
; New: Replace JSR $CB95 with JSR to our shim, keep PLP intact
; Actually, JSR is 3 bytes and our JSL is 4, so we have to replace JSR+PLP.
; Our code will call $CB95, then do PLP equivalent, then return.

org $C2CB86
    jsl DiagHook                ; 4 bytes replaces JSR $CB95 + PLP

; ============================================================================
; DIAGNOSTIC HOOK - E0/8000
; ============================================================================

org $E08000

DiagHook:
    ; Save state
    phb
    php
    sep #$30                    ; 8-bit A/X/Y

    ; NOTE: We skip CB95 for now. If labels are missing, that's expected.
    ; This test is ONLY to verify tilemap writes appear on screen.

    ; Set DBR = $7E for tilemap buffer access (CORRECTED from $7F)
    lda #$7E
    pha
    plb

    ; ========================================
    ; TEST 1: Write 8 element tiles to Row 14
    ; ========================================
    rep #$10                    ; 16-bit X/Y for offsets > 255
    ldx.w #!TestRow1

    lda #!TileFire
    sta.l !TilemapBase,x
    lda #$20                    ; Palette 0, priority 1
    sta.l !TilemapBase+1,x
    inx : inx

    lda #!TileIce
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #!TileLightning
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #!TilePoison
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #!TileHoly
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #!TileEarth
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #!TileWind
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #!TileWater
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x

    ; ========================================
    ; TEST 2: Write numbers 0-7 to Row 15
    ; (Using existing font tiles $60-$67 = 'A'-'H')
    ; ========================================
    ldx.w #!TestRow2

    lda #$60                    ; 'A'
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #$61                    ; 'B'
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #$62                    ; 'C'
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #$63                    ; 'D'
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #$64                    ; 'E'
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #$65                    ; 'F'
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #$66                    ; 'G'
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #$67                    ; 'H'
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x

    ; ========================================
    ; TEST 3: Write "TEST" to Row 16 using font
    ; T=$73, E=$64, S=$72, T=$73
    ; ========================================
    ldx.w #!TestRow3

    lda #$73                    ; 'T'
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #$64                    ; 'E'
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #$72                    ; 'S'
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x
    inx : inx

    lda #$73                    ; 'T'
    sta.l !TilemapBase,x
    lda #$20
    sta.l !TilemapBase+1,x

    sep #$10                    ; Back to 8-bit X/Y

    ; Restore state
    plp
    plb

    ; Clean up JSL return and do original PLP
    sep #$20
    pla                         ; Discard ret_lo
    pla                         ; Discard ret_hi
    pla                         ; Discard ret_bank
    plp                         ; Original PLP

    jml $C2CB8A                 ; Return to PLB / RTS

; ============================================================================
; END - Diagnostic version
; ============================================================================
; Expected results:
;   Row 14: 8 tiles from $D5-$DC (element icon slots)
;   Row 15: "ABCDEFGH" (existing font tiles)
;   Row 16: "TEST" (existing font tiles)
;
; If ABCDEFGH and TEST appear but Row 14 is blank/garbage:
;   -> Tiles $D5-$DC don't have graphics loaded
;
; If nothing appears:
;   -> Tilemap address or offset is wrong
;
; R.Hand/L.Hand labels WILL be missing (we skip CB95)
; ============================================================================
