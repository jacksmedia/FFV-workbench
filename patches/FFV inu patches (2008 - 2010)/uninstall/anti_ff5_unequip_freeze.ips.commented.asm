;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_unequip_freeze.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_unequip_freeze.ips
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

;--- Patch at file offset $016132 (SNES $C16132) ---
org $C16132

    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $CFD5               ; [8D D5 CF   ] Store A to Absolute
    PLX                     ; [FA         ] Pull X Register
    RTS                     ; [60         ] Return from Subroutine

;--- End of patch ---