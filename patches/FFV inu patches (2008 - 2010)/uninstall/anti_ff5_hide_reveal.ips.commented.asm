;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_hide_reveal.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_hide_reveal.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 4 record(s)

;--- Patch at file offset $0212AE (SNES $C212AE) ---
org $C212AE

    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    BRA $1294               ; [80 E2      ] Branch Always

;--- Patch at file offset $0212FE (SNES $C212FE) ---
org $C212FE

    STZ $3768,X             ; [9E 68 37   ] Store Zero to Absolute,X
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    BRA $12E9               ; [80 E4      ] Branch Always

;--- Patch at file offset $02108F (SNES $C2108F) ---
org $C2108F

    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    BRA $1075               ; [80 E2      ] Branch Always

;--- Patch at file offset $0293DE (SNES $C293DE) ---
org $C293DE

    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    BRA $93C4               ; [80 E2      ] Branch Always

;--- End of patch ---