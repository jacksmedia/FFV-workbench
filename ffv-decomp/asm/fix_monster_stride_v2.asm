; fix_monster_stride_v2.asm - FIXED
; The LDA must happen BEFORE PLP restores 8-bit X mode!

arch snes.cpu
hirom

; ============================================================
; Hooks
; ============================================================
org $C13031
    JSL FixMonster_0_255

org $C13024
    JSL FixMonster_256_383

; ============================================================
; Fix routine for monsters 0-255
; ============================================================
org $E05680

FixMonster_0_255:
    PHB                     ; Save data bank
    PHY                     ; Save Y
    PHP                     ; Save processor status

    REP #$30                ; 16-bit A and X/Y

    TXA                     ; A = old_offset
    LDY.w #0                ; Y = monster_id counter

.div10_loop_a:
    CMP.w #10
    BCC .div10_done_a
    SEC
    SBC.w #10
    INY
    BRA .div10_loop_a

.div10_done_a:
    TYA                     ; A = monster_id
    ASL                     ; ×2
    ASL                     ; ×4
    ASL                     ; ×8
    ASL                     ; ×16
    TAX                     ; X = new_offset (16-bit, CORRECT!)

    ; DO THE READ NOW while X is still 16-bit!
    SEP #$20                ; 8-bit A only (X stays 16-bit!)
    LDA.l $E05800,X         ; Read byte with full 16-bit X

    ; Save result and restore state
    STA $00                 ; Stash the byte we read
    REP #$20                ; 16-bit A for stack ops
    PLP                     ; Restore original P (may change A/X size)
    PLY                     ; Restore Y
    PLB                     ; Restore B
    LDA $00                 ; Get our byte back (8-bit read is fine)
    RTL


; ============================================================
; Fix routine for monsters 256-383
; ============================================================
FixMonster_256_383:
    PHB
    PHY
    PHP

    REP #$30

    TXA
    LDY.w #0

.div10_loop_b:
    CMP.w #10
    BCC .div10_done_b
    SEC
    SBC.w #10
    INY
    BRA .div10_loop_b

.div10_done_b:
    TYA
    ASL
    ASL
    ASL
    ASL
    TAX

    SEP #$20                ; 8-bit A, X stays 16-bit
    LDA.l $E06800,X         ; Read with full 16-bit X

    STA $00
    REP #$20
    PLP
    PLY
    PLB
    LDA $00
    RTL
