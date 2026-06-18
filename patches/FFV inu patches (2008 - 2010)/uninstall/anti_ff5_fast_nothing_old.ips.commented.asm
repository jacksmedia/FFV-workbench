;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_fast_nothing_old.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_fast_nothing_old.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 2 record(s)

;--- Patch at file offset $01B68C (SNES $C1B68C) ---
org $C1B68C

    STZ $DB6B               ; [9C 6B DB   ] Store Zero to Absolute
    STZ $DB77               ; [9C 77 DB   ] Store Zero to Absolute
    JSR $9D93               ; [20 93 9D   ] Jump to Subroutine
    JSR $8D47               ; [20 47 8D   ] Jump to Subroutine
    TAX                     ; [AA         ] Transfer A to X
    STZ $DB6A               ; [9C 6A DB   ] Store Zero to Absolute

;--- Patch at file offset $01B6C1 (SNES $C1B6C1) ---
org $C1B6C1

    LDA $C1B746,X           ; [BF 46 B7 C1] Load A from Absolute Long,X
    STA $70                 ; [85 70      ] Store A to DP
    LDA $C1B747,X           ; [BF 47 B7 C1] Load A from Absolute Long,X
    STA $71                 ; [85 71      ] Store A to DP
    JSR $B742               ; [20 42 B7   ] Jump to Subroutine
    LDX $F86A               ; [AE 6A F8   ] Load X from Absolute
    BNE $B69C               ; [D0 C7      ] Branch if Not Equal
    LDA $DB61               ; [AD 61 DB   ] Load A from Absolute
    BEQ $B71D               ; [F0 43      ] Branch if Equal
    STZ $F8B4               ; [9C B4 F8   ] Store Zero to Absolute
    LDA #$80                ; [A9 80      ] Load A Immediate
    STA $DB60               ; [8D 60 DB   ] Store A to Absolute
    JSR $02F2               ; [20 F2 02   ] Jump to Subroutine
    LDA #$10                ; [A9 10      ] Load A Immediate
    STA $BC85               ; [8D 85 BC   ] Store A to Absolute
    LDA #$1F                ; [A9 1F      ] Load A Immediate
    STA $F86C               ; [8D 6C F8   ] Store A to Absolute
    JSR $B3FE               ; [20 FE B3   ] Jump to Subroutine
    JSR $24D5               ; [20 D5 24   ] Jump to Subroutine
    JSR $B40A               ; [20 0A B4   ] Jump to Subroutine
    TDC                     ; [7B         ] Transfer Direct Page to A
    STZ $7E                 ; [64 7E      ] Store Zero to DP
    JSR $7B43               ; [20 43 7B   ] Jump to Subroutine
    JSR $02F2               ; [20 F2 02   ] Jump to Subroutine
    LDA $D0EE               ; [AD EE D0   ] Load A from Absolute
    BNE $B6FE               ; [D0 F8      ] Branch if Not Equal
    STZ $DB60               ; [9C 60 DB   ] Store Zero to Absolute
    LDX $F86E               ; [AE 6E F8   ] Load X from Absolute
    CPX #$68                ; [E0 68      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    TSB $00A2               ; [0C A2 00   ] Test and Set Bits Absolute
    BRK                     ; [00 8E      ] Software interrupt
    ROR $A2F8               ; [6E F8 A2   ] Rotate Right Absolute
    ORA $A84C00,X           ; [1F 00 4C A8] OR A with Absolute Long,X
    LDX $9C,Y               ; [B6 9C      ] Load X from DP,Y
    LSR $DB,X               ; [56 DB      ] Shift Right DP,X
    LDA $F86D               ; [AD 6D F8   ] Load A from Absolute
    BNE $B733               ; [D0 0E      ] Branch if Not Equal
    INC $F86D               ; [EE 6D F8   ] Increment Absolute
    LDX $F86E               ; [AE 6E F8   ] Load X from Absolute
    JSR $8D41               ; [20 41 8D   ] Jump to Subroutine
    BEQ $B733               ; [F0 03      ] Branch if Equal
    JMP $B6A8               ; [4C A8 B6   ] Jump Absolute
    STZ $DBDF               ; [9C DF DB   ] Store Zero to Absolute
    STZ $BC85               ; [9C 85 BC   ] Store Zero to Absolute
    JSR $AD2D               ; [20 2D AD   ] Jump to Subroutine
    JSR $1CB8               ; [20 B8 1C   ] Jump to Subroutine
    db $4C, $BB                 ; Incomplete/data bytes

;--- End of patch ---