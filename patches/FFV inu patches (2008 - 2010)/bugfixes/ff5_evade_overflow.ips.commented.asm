;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_evade_overflow.ips.commented.asm
;    Disassembled from IPS patch: ff5_evade_overflow.ips
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

;--- Patch at file offset $027C0E (SNES $C27C0E) ---
org $C27C0E

    EOR #$18                ; [49 18      ] XOR A with Immediate
    LDA $2002,X             ; [BD 02 20   ] Load A from Absolute,X
    ADC $2078,X             ; [7D 78 20   ] Add with Carry Absolute,X
    BCC $7C1A               ; [90 02      ] Branch if Carry Clear
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    STA $0F                 ; [85 0F      ] Store A to DP
    CLC                     ; [18         ] Clear Carry Flag
    LDA $57                 ; [A5 57      ] Load A from DP
    ADC $7BE5               ; [6D E5 7B   ] Add with Carry Absolute
    STA $0E                 ; [85 0E      ] Store A to DP
    SEC                     ; [38         ] Set Carry Flag

;--- Patch at file offset $028B9E (SNES $C28B9E) ---
org $C28B9E

    ASL $57A6               ; [0E A6 57   ] Shift Left Absolute
    BMI $8BCB               ; [30 28      ] Branch if Minus
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $2065,X             ; [BD 65 20   ] Load A from Absolute,X
    AND #$20                ; [29 20      ] AND A with Immediate
    BEQ $8BB0               ; [F0 04      ] Branch if Equal
    LDA #$1E                ; [A9 1E      ] Load A Immediate
    BRA $8BCB               ; [80 1B      ] Branch Always

;--- Patch at file offset $028BB7 (SNES $C28BB7) ---
org $C28BB7

    BCC $8BBB               ; [90 02      ] Branch if Carry Clear
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    JSR $01C0               ; [20 C0 01   ] Jump to Subroutine
    STA $0F                 ; [85 0F      ] Store A to DP
    SEC                     ; [38         ] Set Carry Flag
    LDA $0E                 ; [A5 0E      ] Load A from DP
    SBC $0F                 ; [E5 0F      ] Subtract with Borrow DP
    BEQ $8BC9               ; [F0 02      ] Branch if Equal
    BCS $8BCB               ; [B0 02      ] Branch if Carry Set
    LDA #$01                ; [A9 01      ] Load A Immediate

;--- End of patch ---