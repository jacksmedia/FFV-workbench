;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_zombie_powder.ips.commented.asm
;    Disassembled from IPS patch: ff5_zombie_powder.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 2 record(s)

;--- Patch at file offset $021E4F (SNES $C21E4F) ---
org $C21E4F

    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    AND #$01                ; [29 01      ] AND A with Immediate
    BNE $1E5B               ; [D0 03      ] Branch if Not Equal
    JMP $8FAA               ; [4C AA 8F   ] Jump Absolute
    INC $56                 ; [E6 56      ] Increment DP
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02742F (SNES $C2742F) ---
org $C2742F

    db $4F, $1E                 ; Incomplete/data bytes

;--- End of patch ---