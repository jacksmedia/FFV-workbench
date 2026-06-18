;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_two_handed.ips.commented.asm
;    Disassembled from IPS patch: ff5_two_handed.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 10 record(s)

;--- Patch at file offset $02803B (SNES $C2803B) ---
org $C2803B

    JMP $80BA               ; [4C BA 80   ] Jump Absolute

;--- Patch at file offset $02806E (SNES $C2806E) ---
org $C2806E

    db $32                      ; Incomplete/data bytes

;--- Patch at file offset $028072 (SNES $C28072) ---
org $C28072

    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    ASL                     ; [0A         ] Shift Left Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    ADC $0E                 ; [65 0E      ] Add with Carry DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC $10                 ; [65 10      ] Add with Carry DP
    STA $50                 ; [85 50      ] Store A to DP
    LDA $14                 ; [A5 14      ] Load A from DP
    JSR $01BA               ; [20 BA 01   ] Jump to Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$02                ; [69 02      ] Add with Carry Immediate
    BRK                     ; [00 85      ] Software interrupt
    EOR ($7B)               ; [52 7B      ] XOR A with (DP)
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $2039,X             ; [BD 39 20   ] Load A from Absolute,X
    AND #$20                ; [29 20      ] AND A with Immediate
    BEQ $80B1               ; [F0 1F      ] Branch if Equal
    CLC                     ; [18         ] Clear Carry Flag
    LDA $50                 ; [A5 50      ] Load A from DP
    ADC #$32                ; [69 32      ] Add with Carry Immediate
    STA $50                 ; [85 50      ] Store A to DP
    LDA $51                 ; [A5 51      ] Load A from DP
    ADC #$00                ; [69 00      ] Add with Carry Immediate
    STA $51                 ; [85 51      ] Store A to DP
    BRA $80B1               ; [80 10      ] Branch Always
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    LDA $0E                 ; [A5 0E      ] Load A from DP
    ADC $10                 ; [65 10      ] Add with Carry DP
    STA $50                 ; [85 50      ] Store A to DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDX #$02                ; [A2 02      ] Load X Immediate
    BRK                     ; [00 86      ] Software interrupt
    EOR ($A6)               ; [52 A6      ] XOR A with (DP)
    EOR #$BD                ; [49 BD      ] XOR A with Immediate
    AND $AA20               ; [2D 20 AA   ] AND A with Absolute
    STX $54                 ; [86 54      ] Store X to DP
    RTS                     ; [60         ] Return from Subroutine
    STX $54                 ; [86 54      ] Store X to DP
    LDA $39                 ; [A5 39      ] Load A from DP
    TAX                     ; [AA         ] Transfer A to X
    LDA $7A00,X             ; [BD 00 7A   ] Load A from Absolute,X
    AND #$40                ; [29 40      ] AND A with Immediate
    BEQ $80B9               ; [F0 F3      ] Branch if Equal
    JMP $8431               ; [4C 31 84   ] Jump Absolute

;--- Patch at file offset $028128 (SNES $C28128) ---
org $C28128

    JMP $80BA               ; [4C BA 80   ] Jump Absolute

;--- Patch at file offset $02816C (SNES $C2816C) ---
org $C2816C

    JMP $80BA               ; [4C BA 80   ] Jump Absolute

;--- Patch at file offset $0281C8 (SNES $C281C8) ---
org $C281C8

    JMP $80BA               ; [4C BA 80   ] Jump Absolute

;--- Patch at file offset $028202 (SNES $C28202) ---
org $C28202

    JMP $80BA               ; [4C BA 80   ] Jump Absolute

;--- Patch at file offset $0285AA (SNES $C285AA) ---
org $C285AA

    JMP $80BA               ; [4C BA 80   ] Jump Absolute

;--- Patch at file offset $02866A (SNES $C2866A) ---
org $C2866A

    JMP $80BA               ; [4C BA 80   ] Jump Absolute

;--- Patch at file offset $028430 (SNES $C28430) ---
org $C28430

    RTS                     ; [60         ] Return from Subroutine
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2021,X             ; [BD 21 20   ] Load A from Absolute,X
    AND #$20                ; [29 20      ] AND A with Immediate
    BEQ $8451               ; [F0 17      ] Branch if Equal
    LDA $2011,X             ; [BD 11 20   ] Load A from Absolute,X
    ORA $2012,X             ; [1D 12 20   ] OR A with Absolute,X
    BNE $8451               ; [D0 0F      ] Branch if Not Equal
    LDA $2013,X             ; [BD 13 20   ] Load A from Absolute,X
    BEQ $844C               ; [F0 05      ] Branch if Equal
    LDA $2014,X             ; [BD 14 20   ] Load A from Absolute,X
    BNE $8451               ; [D0 05      ] Branch if Not Equal
    ASL $52                 ; [06 52      ] Shift Left DP
    ROL $53                 ; [26 53      ] Rotate Left DP
    RTS                     ; [60         ] Return from Subroutine

;--- End of patch ---