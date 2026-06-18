;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_core-1.6_to_1.7.ips.commented.asm
;    Disassembled from IPS patch: ff5_core-1.6_to_1.7.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 4 record(s)

;--- Patch at file offset $01B660 (SNES $C1B660) ---
org $C1B660

    SEC                     ; [38         ] Set Carry Flag
    LDA #$70                ; [A9 70      ] Load A Immediate
    TAX                     ; [AA         ] Transfer A to X
    STZ $D1D8,X             ; [9E D8 D1   ] Store Zero to Absolute,X
    STZ $D258,X             ; [9E 58 D2   ] Store Zero to Absolute,X
    STZ $D2D8,X             ; [9E D8 D2   ] Store Zero to Absolute,X
    STZ $D358,X             ; [9E 58 D3   ] Store Zero to Absolute,X
    SBC #$10                ; [E9 10      ] Subtract with Borrow Immediate
    BCS $B663               ; [B0 EF      ] Branch if Carry Set
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $01B687 (SNES $C1B687) ---
org $C1B687

    ROL $B5,X               ; [36 B5      ] Rotate Left DP,X
    JMP $B68C               ; [4C 8C B6   ] Jump Absolute
    JSR $9D93               ; [20 93 9D   ] Jump to Subroutine
    JSR $8D47               ; [20 47 8D   ] Jump to Subroutine
    TAX                     ; [AA         ] Transfer A to X
    JMP $B69C               ; [4C 9C B6   ] Jump Absolute
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    BRA $B6AC               ; [80 0E      ] Branch Always

;--- Patch at file offset $01B69E (SNES $C1B69E) ---
org $C1B69E

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $01B6AC (SNES $C1B6AC) ---
org $C1B6AC

    STZ $DB6A               ; [9C 6A DB   ] Store Zero to Absolute
    STX $F86E               ; [8E 6E F8   ] Store X to Absolute
    STZ $F86D               ; [9C 6D F8   ] Store Zero to Absolute
    STZ $DB6B               ; [9C 6B DB   ] Store Zero to Absolute
    STZ $DB77               ; [9C 77 DB   ] Store Zero to Absolute
    INC $DB77               ; [EE 77 DB   ] Increment Absolute
    STZ $F86A               ; [9C 6A F8   ] Store Zero to Absolute
    STZ $F86B               ; [9C 6B F8   ] Store Zero to Absolute
    JSR $A847               ; [20 47 A8   ] Jump to Subroutine
    JSR $B300               ; [20 00 B3   ] Jump to Subroutine
    LDA $F582               ; [AD 82 F5   ] Load A from Absolute
    STA $D1BC               ; [8D BC D1   ] Store A to Absolute
    AND #$3F                ; [29 3F      ] AND A with Immediate
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    JSR ($B746,X)           ; [FC 46 B7   ] Jump to Subroutine Indirect,X
    JSR $B660               ; [20 60 B6   ] Jump to Subroutine
    LDX $F86A               ; [AE 6A F8   ] Load X from Absolute
    BNE $B6AF               ; [D0 D0      ] Branch if Not Equal
    LDA $DB61               ; [AD 61 DB   ] Load A from Absolute
    BEQ $B720               ; [F0 3C      ] Branch if Equal
    STZ $F8B4               ; [9C B4 F8   ] Store Zero to Absolute
    LDA #$80                ; [A9 80      ] Load A Immediate
    STA $DB60               ; [8D 60 DB   ] Store A to Absolute
    JSR $02F2               ; [20 F2 02   ] Jump to Subroutine
    LDA #$10                ; [A9 10      ] Load A Immediate
    STA $BC85               ; [8D 85 BC   ] Store A to Absolute
    LDA #$1F                ; [A9 1F      ] Load A Immediate
    JSR $B3FE               ; [20 FE B3   ] Jump to Subroutine
    JSR $24D5               ; [20 D5 24   ] Jump to Subroutine
    JSR $B40A               ; [20 0A B4   ] Jump to Subroutine
    TDC                     ; [7B         ] Transfer Direct Page to A
    STZ $7E                 ; [64 7E      ] Store Zero to DP
    JSR $7B43               ; [20 43 7B   ] Jump to Subroutine
    JSR $02F2               ; [20 F2 02   ] Jump to Subroutine
    LDA $D0EE               ; [AD EE D0   ] Load A from Absolute
    BNE $B705               ; [D0 F8      ] Branch if Not Equal
    LDX $F86E               ; [AE 6E F8   ] Load X from Absolute
    CPX #$68                ; [E0 68      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    PHD                     ; [0B         ] Push Direct Page Register
    LDX #$00                ; [A2 00      ] Load X Immediate
    BRK                     ; [00 8E      ] Software interrupt
    ROR $A2F8               ; [6E F8 A2   ] Rotate Right Absolute
    ORA $9B8000,X           ; [1F 00 80 9B] OR A with Absolute Long,X
    STZ $DB56               ; [9C 56 DB   ] Store Zero to Absolute
    LDA $F86D               ; [AD 6D F8   ] Load A from Absolute
    BNE $B733               ; [D0 0B      ] Branch if Not Equal
    INC $F86D               ; [EE 6D F8   ] Increment Absolute
    LDX $F86E               ; [AE 6E F8   ] Load X from Absolute
    JSR $8D41               ; [20 41 8D   ] Jump to Subroutine
    BNE $B6BB               ; [D0 88      ] Branch if Not Equal
    STZ $DBDF               ; [9C DF DB   ] Store Zero to Absolute
    STZ $BC85               ; [9C 85 BC   ] Store Zero to Absolute
    JSR $AD2D               ; [20 2D AD   ] Jump to Subroutine
    JSR $1CB8               ; [20 B8 1C   ] Jump to Subroutine
    JMP $3CBB               ; [4C BB 3C   ] Jump Absolute
    JMP ($0070)             ; [6C 70 00   ] Jump Indirect

;--- End of patch ---