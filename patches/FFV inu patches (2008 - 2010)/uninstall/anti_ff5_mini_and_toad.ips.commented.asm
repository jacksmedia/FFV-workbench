;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_mini_and_toad.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_mini_and_toad.ips
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

;--- Patch at file offset $02851E (SNES $C2851E) ---
org $C2851E

    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    STX $54                 ; [86 54      ] Store X to DP

;--- Patch at file offset $02853F (SNES $C2853F) ---
org $C2853F

    db $A2                      ; Incomplete/data bytes

;--- Patch at file offset $028542 (SNES $C28542) ---
org $C28542

    db $86                      ; Incomplete/data bytes

;--- End of patch ---