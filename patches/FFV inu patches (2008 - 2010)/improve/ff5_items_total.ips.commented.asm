;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_items_total.ips.commented.asm
;    Disassembled from IPS patch: ff5_items_total.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 3 record(s)

;--- Patch at file offset $02AC5E (SNES $C2AC5E) ---
org $C2AC5E

    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA #$A9                ; [A9 A9      ] Load A Immediate
    LDA ($20,S),Y           ; [B3 20      ] Load A from (SR),Y
    CLV                     ; [B8         ] Clear Overflow Flag
    CMP ($A5,X)             ; [C1 A5      ] Compare A with (DP,X)
    EOR $29,X               ; [55 29      ] XOR A with DP,X
    SBC $183A00,X           ; [FF 00 3A 18] Subtract with Borrow Absolute Long,X
    ADC $6B                 ; [65 6B      ] Add with Carry DP
    TAX                     ; [AA         ] Transfer A to X
    LDA $288A,X             ; [BD 8A 28   ] Load A from Absolute,X
    AND #$7F                ; [29 7F      ] AND A with Immediate
    BRK                     ; [00 F0      ] Software interrupt
    TSB $AA0A               ; [0C 0A AA   ] Test and Set Bits Absolute
    LDA $D14000,X           ; [BF 00 40 D1] Load A from Absolute Long,X
    STA $2CEB               ; [8D EB 2C   ] Store A to Absolute
    JSR $DA16               ; [20 16 DA   ] Jump to Subroutine
    LDX #$76                ; [A2 76      ] Load X Immediate
    EOR ($A0)               ; [52 A0      ] XOR A with (DP)
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    AND $31A9               ; [2D A9 31   ] AND A with Absolute
    ROR $ED4C,X             ; [7E 4C ED   ] Rotate Right Absolute,X
    db $E4                      ; Incomplete/data bytes

;--- Patch at file offset $02C783 (SNES $C2C783) ---
org $C2C783

    STX $2D1B               ; [8E 1B 2D   ] Store X to Absolute
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $7A00,X             ; [BD 00 7A   ] Load A from Absolute,X
    BNE $C795               ; [D0 08      ] Branch if Not Equal
    STZ $7B00,X             ; [9E 00 7B   ] Store Zero to Absolute,X
    STZ $288A,X             ; [9E 8A 28   ] Store Zero to Absolute,X
    BRA $C7B5               ; [80 20      ] Branch Always
    INC $2D1B               ; [EE 1B 2D   ] Increment Absolute
    PHX                     ; [DA         ] Push X Register
    PHA                     ; [48         ] Push Accumulator
    JSR $D9AB               ; [20 AB D9   ] Jump to Subroutine
    PLA                     ; [68         ] Pull Accumulator
    CMP #$E0                ; [C9 E0      ] Compare A Immediate
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    db $90                      ; Incomplete/data bytes

;--- Patch at file offset $02C7BA (SNES $C2C7BA) ---
org $C2C7BA

    db $CD                      ; Incomplete/data bytes

;--- End of patch ---