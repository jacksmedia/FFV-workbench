;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_atomos_wormhole.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_atomos_wormhole.ips
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

;--- Patch at file offset $02795D (SNES $C2795D) ---
org $C2795D

    ORA $4C,S               ; [03 4C      ] OR A with Stack Relative
    ORA $8E                 ; [05 8E      ] OR A with Direct Page
    INC $56                 ; [E6 56      ] Increment DP
    RTS                     ; [60         ] Return from Subroutine

;--- End of patch ---