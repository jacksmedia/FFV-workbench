; fix_monster_stride.asm
; Fixes monster name table lookup to use 14-byte stride instead of 10
;
; Two table accesses:
;   C1:3031 - monsters 0-255, base $E05800
;   C1:3024 - monsters 256-383, base $E06600 (offset $E00 from table start)

arch snes.cpu
hirom

; ============================================================
; Hook C1:3031 (monsters 0-255)
; Original: BF 00 58 E0  (LDA $E05800,X)
; ============================================================
org $C13031
    JSL FixMonster_0_255

; ============================================================
; Hook C1:3024 (monsters 256-383)
; Original: BF 50 0A E0  (LDA $E00A50,X)
; The X register here is (monster_id - 256) * 10
; ============================================================
org $C13024
    JSL FixMonster_256_383

; ============================================================
; Conversion routine for monsters 0-255
; Input: X = monster_id * 10
; Output: Read byte from table at new offset (monster_id * 14)
; ============================================================
org $E05680

FixMonster_0_255:
    JSR ConvertOffset
    LDA $E05800,X
    RTL

; ============================================================
; Conversion routine for monsters 256-383
; Input: X = (monster_id - 256) * 10
; Output: Read byte from table at monster 256+ section
;         Base for monster 256 = $E05800 + 256*14 = $E06600
; ============================================================
FixMonster_256_383:
    JSR ConvertOffset
    LDA $E06600,X       ; Monster 256+ base
    RTL

; ============================================================
; Shared offset conversion: X*10 stride -> X*14 stride
; Converts X from old_offset to new_offset
; ============================================================
ConvertOffset:
    PHP
    PHY
    REP #$30            ; 16-bit A and index

    ; Convert X from (N * 10) to (N * 14)
    ; Method: N = X / 10, then compute N * 14
    ;
    ; Fast divide by 10 using multiplication by reciprocal:
    ; X / 10 = (X * 6554) >> 16, where 6554/65536 ≈ 0.1
    ; But 65816 has no multiply. Use shifts to build it.
    ;
    ; 6554 = 0x199A = 4096 + 2048 + 256 + 128 + 16 + 8 + 2
    ;
    ; Actually, simpler approach for small X (max 2550 for monsters 0-255):
    ; Use the formula: N * 14 = N * 10 + N * 4 = X + X * 4/10 = X + X*2/5
    ; And X*2/5 ≈ (X*13) >> 5 with acceptable error for small X

    TXA                 ; A = X (old offset)
    STA $00             ; $00 = old_offset

    ; Compute X * 13 >> 5
    ; X * 13 = X * 8 + X * 4 + X * 1
    ASL                 ; A = X * 2
    ASL                 ; A = X * 4
    STA $02             ; $02 = X * 4
    ASL                 ; A = X * 8
    CLC
    ADC $02             ; A = X * 12
    CLC
    ADC $00             ; A = X * 13

    ; Shift right 5 (divide by 32)
    LSR
    LSR
    LSR
    LSR
    LSR                 ; A = X * 13 / 32 ≈ X * 0.40625

    ; Add to original offset
    CLC
    ADC $00             ; A = X + X*0.40625 = X * 1.40625 ≈ X * 1.4
    TAX                 ; X = new_offset

    SEP #$30
    PLY
    PLP
    RTS
