;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_two_handed.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_two_handed.ips
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

    STX $54                 ; [86 54      ] Store X to DP
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02806E (SNES $C2806E) ---
org $C2806E

    PHK                     ; [4B         ] Push Program Bank

;--- Patch at file offset $028072 (SNES $C28072) ---
org $C28072

    TAX                     ; [AA         ] Transfer A to X
    STX $12                 ; [86 12      ] Store X to DP
    ASL $12                 ; [06 12      ] Shift Left DP
    ROL $13                 ; [26 13      ] Rotate Left DP
    CLC                     ; [18         ] Clear Carry Flag
    LDA $10                 ; [A5 10      ] Load A from DP
    ADC $12                 ; [65 12      ] Add with Carry DP
    STA $10                 ; [85 10      ] Store A to DP
    LDA $11                 ; [A5 11      ] Load A from DP
    ADC $13                 ; [65 13      ] Add with Carry DP
    STA $11                 ; [85 11      ] Store A to DP
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    CLC                     ; [18         ] Clear Carry Flag
    LDA $0E                 ; [A5 0E      ] Load A from DP
    ADC $10                 ; [65 10      ] Add with Carry DP
    STA $50                 ; [85 50      ] Store A to DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $14                 ; [A5 14      ] Load A from DP
    JSR $01BA               ; [20 BA 01   ] Jump to Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$02                ; [69 02      ] Add with Carry Immediate
    BRK                     ; [00 85      ] Software interrupt
    EOR ($7B)               ; [52 7B      ] XOR A with (DP)
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2039,X             ; [BD 39 20   ] Load A from Absolute,X
    AND #$20                ; [29 20      ] AND A with Immediate
    BEQ $80CB               ; [F0 20      ] Branch if Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    CLC                     ; [18         ] Clear Carry Flag
    LDA $50                 ; [A5 50      ] Load A from DP
    ADC #$32                ; [69 32      ] Add with Carry Immediate
    BRK                     ; [00 85      ] Software interrupt
    BVC $8131               ; [50 7B      ] Branch if Overflow Clear
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    BRA $80CB               ; [80 11      ] Branch Always
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    CLC                     ; [18         ] Clear Carry Flag
    LDA $0E                 ; [A5 0E      ] Load A from DP
    ADC $10                 ; [65 10      ] Add with Carry DP
    STA $50                 ; [85 50      ] Store A to DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDX #$02                ; [A2 02      ] Load X Immediate
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $028128 (SNES $C28128) ---
org $C28128

    STX $54                 ; [86 54      ] Store X to DP
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02816C (SNES $C2816C) ---
org $C2816C

    STX $54                 ; [86 54      ] Store X to DP
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $0281C8 (SNES $C281C8) ---
org $C281C8

    STX $54                 ; [86 54      ] Store X to DP
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $028202 (SNES $C28202) ---
org $C28202

    STX $54                 ; [86 54      ] Store X to DP
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $0285AA (SNES $C285AA) ---
org $C285AA

    STX $54                 ; [86 54      ] Store X to DP
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02866A (SNES $C2866A) ---
org $C2866A

    STX $54                 ; [86 54      ] Store X to DP
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $028430 (SNES $C28430) ---
org $C28430

    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2021,X             ; [BD 21 20   ] Load A from Absolute,X
    AND #$20                ; [29 20      ] AND A with Immediate
    BEQ $8451               ; [F0 18      ] Branch if Equal
    LDA $2011,X             ; [BD 11 20   ] Load A from Absolute,X
    ORA $2012,X             ; [1D 12 20   ] OR A with Absolute,X
    BNE $8451               ; [D0 10      ] Branch if Not Equal
    LDA $2013,X             ; [BD 13 20   ] Load A from Absolute,X
    BEQ $844B               ; [F0 05      ] Branch if Equal
    LDA $2014,X             ; [BD 14 20   ] Load A from Absolute,X
    BNE $8451               ; [D0 06      ] Branch if Not Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    ASL $52                 ; [06 52      ] Shift Left DP
    SEP #$20                ; [E2 20      ] Set Processor Status Bits

;--- End of patch ---