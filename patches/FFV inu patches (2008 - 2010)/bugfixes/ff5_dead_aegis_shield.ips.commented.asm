;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_dead_aegis_shield.ips.commented.asm
;    Disassembled from IPS patch: ff5_dead_aegis_shield.ips
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

;--- Patch at file offset $028F89 (SNES $C28F89) ---
org $C28F89

    BNE $8FA7               ; [D0 1C      ] Branch if Not Equal
    NOP                     ; [EA         ] No Operation
    LDA $201A,X             ; [BD 1A 20   ] Load A from Absolute,X
    BMI $8FA7               ; [30 16      ] Branch if Minus
    JSR $7E81               ; [20 81 7E   ] Jump to Subroutine
    LDA $56                 ; [A5 56      ] Load A from DP
    BNE $8FA9               ; [D0 11      ] Branch if Not Equal
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $201A,X             ; [BD 1A 20   ] Load A from Absolute,X
    BIT #$02                ; [89 02      ] Test Bits Immediate
    BNE $8FA7               ; [D0 06      ] Branch if Not Equal

;--- End of patch ---