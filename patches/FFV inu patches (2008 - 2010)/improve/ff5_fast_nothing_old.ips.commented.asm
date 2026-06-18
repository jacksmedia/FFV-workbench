;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_fast_nothing_old.ips.commented.asm
;    Disassembled from IPS patch: ff5_fast_nothing_old.ips
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

    JSR $B732               ; [20 32 B7   ] Jump to Subroutine
    CMP #$AA                ; [C9 AA      ] Compare A Immediate
    BEQ $B676               ; [F0 E3      ] Branch if Equal
    CMP #$AC                ; [C9 AC      ] Compare A Immediate
    BEQ $B676               ; [F0 DF      ] Branch if Equal
    CMP #$EE                ; [C9 EE      ] Compare A Immediate
    BEQ $B676               ; [F0 DB      ] Branch if Equal
    TAX                     ; [AA         ] Transfer A to X

;--- Patch at file offset $01B6C1 (SNES $C1B6C1) ---
org $C1B6C1

    JSR ($B746,X)           ; [FC 46 B7   ] Jump to Subroutine Indirect,X
    LDX $F86A               ; [AE 6A F8   ] Load X from Absolute
    BNE $B69C               ; [D0 D3      ] Branch if Not Equal
    LDA $DB61               ; [AD 61 DB   ] Load A from Absolute
    BEQ $B710               ; [F0 42      ] Branch if Equal
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
    BNE $B6F2               ; [D0 F8      ] Branch if Not Equal
    STZ $DB60               ; [9C 60 DB   ] Store Zero to Absolute
    LDX $F86E               ; [AE 6E F8   ] Load X from Absolute
    CPX #$68                ; [E0 68      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    PHD                     ; [0B         ] Push Direct Page Register
    LDX #$00                ; [A2 00      ] Load X Immediate
    BRK                     ; [00 8E      ] Software interrupt
    ROR $A2F8               ; [6E F8 A2   ] Rotate Right Absolute
    ORA $988000,X           ; [1F 00 80 98] OR A with Absolute Long,X
    STZ $DB56               ; [9C 56 DB   ] Store Zero to Absolute
    LDA $F86D               ; [AD 6D F8   ] Load A from Absolute
    BNE $B723               ; [D0 0B      ] Branch if Not Equal
    INC $F86D               ; [EE 6D F8   ] Increment Absolute
    LDX $F86E               ; [AE 6E F8   ] Load X from Absolute
    JSR $8D41               ; [20 41 8D   ] Jump to Subroutine
    BNE $B6A8               ; [D0 85      ] Branch if Not Equal
    STZ $DBDF               ; [9C DF DB   ] Store Zero to Absolute
    STZ $BC85               ; [9C 85 BC   ] Store Zero to Absolute
    JSR $AD2D               ; [20 2D AD   ] Jump to Subroutine
    JSR $1CB8               ; [20 B8 1C   ] Jump to Subroutine
    JMP $3CBB               ; [4C BB 3C   ] Jump Absolute
    STZ $DB6B               ; [9C 6B DB   ] Store Zero to Absolute
    STZ $DB77               ; [9C 77 DB   ] Store Zero to Absolute
    JSR $9D93               ; [20 93 9D   ] Jump to Subroutine
    STZ $DB6A               ; [9C 6A DB   ] Store Zero to Absolute
    JMP $8D47               ; [4C 47 8D   ] Jump Absolute

;--- End of patch ---