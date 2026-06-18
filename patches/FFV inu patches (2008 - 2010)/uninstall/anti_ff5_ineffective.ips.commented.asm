;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_ineffective.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_ineffective.ips
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

;--- Patch at file offset $025D9F (SNES $C25D9F) ---
org $C25D9F

    LDA $7C29               ; [AD 29 7C   ] Load A from Absolute
    BEQ $5DC6               ; [F0 22      ] Branch if Equal

;--- Patch at file offset $025DBE (SNES $C25DBE) ---
org $C25DBE

    LDA $7C29               ; [AD 29 7C   ] Load A from Absolute
    BNE $5DA4               ; [D0 E1      ] Branch if Not Equal
    JSR $02C2               ; [20 C2 02   ] Jump to Subroutine

;--- End of patch ---