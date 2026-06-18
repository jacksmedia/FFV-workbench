;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_return.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_return.ips
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

;--- Patch at file offset $0264B2 (SNES $C264B2) ---
org $C264B2

    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $201C,X             ; [BD 1C 20   ] Load A from Absolute,X
    ORA $2072,X             ; [1D 72 20   ] OR A with Absolute,X
    AND #$02                ; [29 02      ] AND A with Immediate
    BEQ $64CD               ; [F0 0F      ] Branch if Equal
    LDA $7B2C               ; [AD 2C 7B   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA $7B2D,X             ; [BD 2D 7B   ] Load A from Absolute,X
    AND #$7F                ; [29 7F      ] AND A with Immediate
    CMP #$60                ; [C9 60      ] Compare A Immediate
    BNE $64D9               ; [D0 0E      ] Branch if Not Equal
    BRA $64FE               ; [80 31      ] Branch Always
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    ORA $2073,X             ; [1D 73 20   ] OR A with Absolute,X
    AND #$40                ; [29 40      ] AND A with Immediate
    BEQ $64F7               ; [F0 1E      ] Branch if Equal
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2057,X             ; [BD 57 20   ] Load A from Absolute,X
    CMP #$1D                ; [C9 1D      ] Compare A Immediate
    BNE $64F3               ; [D0 11      ] Branch if Not Equal
    LDA $7B2C               ; [AD 2C 7B   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA $7B2D,X             ; [BD 2D 7B   ] Load A from Absolute,X
    AND #$7F                ; [29 7F      ] AND A with Immediate
    CMP #$60                ; [C9 60      ] Compare A Immediate
    BEQ $64FE               ; [F0 0F      ] Branch if Equal

;--- End of patch ---