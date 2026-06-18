;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_weak_category.ips.commented.asm
;    Disassembled from IPS patch: ff5_weak_category.ips
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

;--- Patch at file offset $028812 (SNES $C28812) ---
org $C28812

    BVC $879C               ; [50 88      ] Branch if Overflow Clear
    JSR $93F8               ; [20 F8 93   ] Jump to Subroutine
    LDX $7B69               ; [AE 69 7B   ] Load X from Absolute
    BEQ $8841               ; [F0 25      ] Branch if Equal
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2055,X             ; [BD 55 20   ] Load A from Absolute,X
    BIT #$40                ; [89 40      ] Test Bits Immediate
    BEQ $8828               ; [F0 03      ] Branch if Equal
    JMP $8926               ; [4C 26 89   ] Jump Absolute
    BIT #$20                ; [89 20      ] Test Bits Immediate
    BEQ $882F               ; [F0 03      ] Branch if Equal
    JMP $894D               ; [4C 4D 89   ] Jump Absolute
    LDA $62                 ; [A5 62      ] Load A from DP
    BEQ $883A               ; [F0 07      ] Branch if Equal
    LDX $7B69               ; [AE 69 7B   ] Load X from Absolute
    STX $7B71               ; [8E 71 7B   ] Store X to Absolute
    RTS                     ; [60         ] Return from Subroutine
    LDA $63                 ; [A5 63      ] Load A from DP
    BEQ $8841               ; [F0 03      ] Branch if Equal
    JMP $8862               ; [4C 62 88   ] Jump Absolute
    LDX $7B69               ; [AE 69 7B   ] Load X from Absolute
    STX $7B6D               ; [8E 6D 7B   ] Store X to Absolute
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $028850 (SNES $C28850) ---
org $C28850

    LDA $39                 ; [A5 39      ] Load A from DP
    TAX                     ; [AA         ] Transfer A to X
    LDA $79FD,X             ; [BD FD 79   ] Load A from Absolute,X
    LDX $49                 ; [A6 49      ] Load X from DP
    AND $2064,X             ; [3D 64 20   ] AND A with Absolute,X
    BEQ $8861               ; [F0 04      ] Branch if Equal
    ASL $52                 ; [06 52      ] Shift Left DP
    ROL $53                 ; [26 53      ] Rotate Left DP
    RTS                     ; [60         ] Return from Subroutine
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $202D,X             ; [BD 2D 20   ] Load A from Absolute,X
    TAX                     ; [AA         ] Transfer A to X
    STX $54                 ; [86 54      ] Store X to DP
    JSR $93F8               ; [20 F8 93   ] Jump to Subroutine
    LDX $7B69               ; [AE 69 7B   ] Load X from Absolute
    db $8E, $6B                 ; Incomplete/data bytes

;--- Patch at file offset $028A06 (SNES $C28A06) ---
org $C28A06

    BVC $8990               ; [50 88      ] Branch if Overflow Clear
    JSR $93F8               ; [20 F8 93   ] Jump to Subroutine
    LDX $7B69               ; [AE 69 7B   ] Load X from Absolute
    BEQ $8A2B               ; [F0 1B      ] Branch if Equal
    LDX $52                 ; [A6 52      ] Load X from DP
    BNE $8A19               ; [D0 05      ] Branch if Not Equal
    INC $52                 ; [E6 52      ] Increment DP
    JSR $8850               ; [20 50 88   ] Jump to Subroutine
    LDA $62                 ; [A5 62      ] Load A from DP
    BEQ $8A24               ; [F0 07      ] Branch if Equal
    LDX $7B69               ; [AE 69 7B   ] Load X from Absolute
    STX $7B71               ; [8E 71 7B   ] Store X to Absolute
    RTS                     ; [60         ] Return from Subroutine
    LDA $63                 ; [A5 63      ] Load A from DP
    BEQ $8A2B               ; [F0 03      ] Branch if Equal
    JMP $8862               ; [4C 62 88   ] Jump Absolute
    LDX $7B69               ; [AE 69 7B   ] Load X from Absolute
    STX $7B6D               ; [8E 6D 7B   ] Store X to Absolute
    RTS                     ; [60         ] Return from Subroutine

;--- End of patch ---