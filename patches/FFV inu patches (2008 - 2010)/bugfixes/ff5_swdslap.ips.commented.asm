;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_swdslap.ips.commented.asm
;    Disassembled from IPS patch: ff5_swdslap.ips
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

;--- Patch at file offset $027019 (SNES $C27019) ---
org $C27019

    db $0D, $84                 ; Incomplete/data bytes

;--- Patch at file offset $02840D (SNES $C2840D) ---
org $C2840D

    JSR $8A05               ; [20 05 8A   ] Jump to Subroutine
    LDX $7B6D               ; [AE 6D 7B   ] Load X from Absolute
    BEQ $842B               ; [F0 16      ] Branch if Equal
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $201F,X             ; [BD 1F 20   ] Load A from Absolute,X
    BIT #$02                ; [89 02      ] Test Bits Immediate
    BEQ $842B               ; [F0 0D      ] Branch if Equal
    LDX #$3C                ; [A2 3C      ] Load X Immediate
    JSR $5886               ; [20 86 58   ] Jump to Subroutine
    JSR $8B7D               ; [20 7D 8B   ] Jump to Subroutine
    JSR $8D2E               ; [20 2E 8D   ] Jump to Subroutine
    STZ $56                 ; [64 56      ] Store Zero to DP
    RTS                     ; [60         ] Return from Subroutine

;--- End of patch ---