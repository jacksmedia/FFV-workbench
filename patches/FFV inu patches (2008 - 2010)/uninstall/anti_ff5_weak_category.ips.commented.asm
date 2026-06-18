;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_weak_category.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_weak_category.ips
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

    SED                     ; [F8         ] Set Decimal Flag
    STA ($AE,S),Y           ; [93 AE      ] Store A to (SR),Y
    ADC #$7B                ; [69 7B      ] Add with Carry Immediate
    BNE $881D               ; [D0 04      ] Branch if Not Equal
    STX $7B6D               ; [8E 6D 7B   ] Store X to Absolute
    RTS                     ; [60         ] Return from Subroutine
    LDA $39                 ; [A5 39      ] Load A from DP
    TAX                     ; [AA         ] Transfer A to X
    LDA $79FD,X             ; [BD FD 79   ] Load A from Absolute,X
    LDX $49                 ; [A6 49      ] Load X from DP
    AND $2064,X             ; [3D 64 20   ] AND A with Absolute,X
    BEQ $8830               ; [F0 06      ] Branch if Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    ASL $52                 ; [06 52      ] Shift Left DP
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2055,X             ; [BD 55 20   ] Load A from Absolute,X
    AND #$40                ; [29 40      ] AND A with Immediate
    BEQ $883C               ; [F0 03      ] Branch if Equal
    JMP $8926               ; [4C 26 89   ] Jump Absolute
    LDA $2055,X             ; [BD 55 20   ] Load A from Absolute,X
    AND #$20                ; [29 20      ] AND A with Immediate
    BEQ $8846               ; [F0 03      ] Branch if Equal
    JMP $894D               ; [4C 4D 89   ] Jump Absolute
    LDA $62                 ; [A5 62      ] Load A from DP

;--- Patch at file offset $028850 (SNES $C28850) ---
org $C28850

    RTS                     ; [60         ] Return from Subroutine
    LDA $63                 ; [A5 63      ] Load A from DP
    BEQ $886D               ; [F0 18      ] Branch if Equal
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $202D,X             ; [BD 2D 20   ] Load A from Absolute,X
    TAX                     ; [AA         ] Transfer A to X
    STX $54                 ; [86 54      ] Store X to DP
    JSR $93F8               ; [20 F8 93   ] Jump to Subroutine
    LDX $7B69               ; [AE 69 7B   ] Load X from Absolute
    BNE $8869               ; [D0 04      ] Branch if Not Equal
    STX $7B6B               ; [8E 6B 7B   ] Store X to Absolute
    RTS                     ; [60         ] Return from Subroutine
    STX $7B6B               ; [8E 6B 7B   ] Store X to Absolute
    RTS                     ; [60         ] Return from Subroutine
    LDX $7B69               ; [AE 69 7B   ] Load X from Absolute
    db $8E, $6D                 ; Incomplete/data bytes

;--- Patch at file offset $028A06 (SNES $C28A06) ---
org $C28A06

    SED                     ; [F8         ] Set Decimal Flag
    STA ($AE,S),Y           ; [93 AE      ] Store A to (SR),Y
    ADC #$7B                ; [69 7B      ] Add with Carry Immediate
    BEQ $8A47               ; [F0 3A      ] Branch if Equal
    LDX $52                 ; [A6 52      ] Load X from DP
    BNE $8A26               ; [D0 15      ] Branch if Not Equal
    INC $52                 ; [E6 52      ] Increment DP
    LDA $39                 ; [A5 39      ] Load A from DP
    TAX                     ; [AA         ] Transfer A to X
    LDA $79FD,X             ; [BD FD 79   ] Load A from Absolute,X
    LDX $49                 ; [A6 49      ] Load X from DP
    AND $2064,X             ; [3D 64 20   ] AND A with Absolute,X
    BEQ $8A26               ; [F0 06      ] Branch if Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    ASL $52                 ; [06 52      ] Shift Left DP
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $62                 ; [A5 62      ] Load A from DP
    BEQ $8A31               ; [F0 07      ] Branch if Equal
    LDX $7B69               ; [AE 69 7B   ] Load X from Absolute
    STX $7B71               ; [8E 71 7B   ] Store X to Absolute
    RTS                     ; [60         ] Return from Subroutine
    db $A5                      ; Incomplete/data bytes

;--- End of patch ---