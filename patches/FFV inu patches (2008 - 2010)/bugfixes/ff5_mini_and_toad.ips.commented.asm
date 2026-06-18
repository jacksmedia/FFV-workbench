;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_mini_and_toad.ips.commented.asm
;    Disassembled from IPS patch: ff5_mini_and_toad.ips
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

    STZ $54                 ; [64 54      ] Store Zero to DP
    STZ $55                 ; [64 55      ] Store Zero to DP

;--- Patch at file offset $02853F (SNES $C2853F) ---
org $C2853F

    db $A0                      ; Incomplete/data bytes

;--- Patch at file offset $028542 (SNES $C28542) ---
org $C28542

    db $84                      ; Incomplete/data bytes

;--- End of patch ---