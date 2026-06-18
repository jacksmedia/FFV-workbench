;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_sword_dance.ips.commented.asm
;    Disassembled from IPS patch: ff5_sword_dance.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 1 record(s)

;--- Patch at file offset $021345 (SNES $C21345) ---
org $C21345

    LDY #$07                ; [A0 07      ] Load Y Immediate
    BRK                     ; [00 85      ] Software interrupt
    ASL $0EBD               ; [0E BD 0E   ] Shift Left Absolute
    JSR $99C9               ; [20 C9 99   ] Jump to Subroutine
    BEQ $135D               ; [F0 0C      ] Branch if Equal
    CMP #$CF                ; [C9 CF      ] Compare A Immediate
    BEQ $135D               ; [F0 08      ] Branch if Equal
    CMP #$D0                ; [C9 D0      ] Compare A Immediate
    BEQ $135D               ; [F0 04      ] Branch if Equal
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    BNE $135F               ; [D0 02      ] Branch if Not Equal
    INC $0E                 ; [E6 0E      ] Increment DP
    INX                     ; [E8         ] Increment X
    DEY                     ; [88         ] Decrement Y
    BNE $134A               ; [D0 E7      ] Branch if Not Equal
    LDA $0E                 ; [A5 0E      ] Load A from DP
    CMP #$03                ; [C9 03      ] Compare A Immediate
    BCC $136E               ; [90 05      ] Branch if Carry Clear
    LDA #$03                ; [A9 03      ] Load A Immediate
    STA $2733               ; [8D 33 27   ] Store A to Absolute
    LDA $2733               ; [AD 33 27   ] Load A from Absolute
    CMP #$03                ; [C9 03      ] Compare A Immediate
    BEQ $13A7               ; [F0 32      ] Branch if Equal
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$79                ; [69 79      ] Add with Carry Immediate
    JSR $1399               ; [20 99 13   ] Jump to Subroutine
    JSR $175F               ; [20 5F 17   ] Jump to Subroutine
    JSR $4AFE               ; [20 FE 4A   ] Jump to Subroutine
    JSR $02A9               ; [20 A9 02   ] Jump to Subroutine
    JSR $02C2               ; [20 C2 02   ] Jump to Subroutine
    JSR $9923               ; [20 23 99   ] Jump to Subroutine
    LDA $2621               ; [AD 21 26   ] Load A from Absolute
    JSR $0324               ; [20 24 03   ] Jump to Subroutine
    JSR $1705               ; [20 05 17   ] Jump to Subroutine
    JSR $1735               ; [20 35 17   ] Jump to Subroutine
    JMP $98E3               ; [4C E3 98   ] Jump Absolute
    STA $2621               ; [8D 21 26   ] Store A to Absolute
    STZ $2620               ; [9C 20 26   ] Store Zero to Absolute
    JSR $992F               ; [20 2F 99   ] Jump to Subroutine
    LDA #$29                ; [A9 29      ] Load A Immediate
    JMP $16E1               ; [4C E1 16   ] Jump Absolute
    LDA #$7D                ; [A9 7D      ] Load A Immediate
    JSR $1399               ; [20 99 13   ] Jump to Subroutine

;--- End of patch ---