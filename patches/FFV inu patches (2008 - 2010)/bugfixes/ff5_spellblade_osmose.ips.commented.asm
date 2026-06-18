;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_spellblade_osmose.ips.commented.asm
;    Disassembled from IPS patch: ff5_spellblade_osmose.ips
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

;--- Patch at file offset $028967 (SNES $C28967) ---
org $C28967

    CMP #$0F                ; [C9 0F      ] Compare A Immediate
    AND [$90]               ; [27 90      ] AND A with [DP]
    LSR $0FA9               ; [4E A9 0F   ] Shift Right Absolute
    AND [$80]               ; [27 80      ] AND A with [DP]
    db $49                      ; Incomplete/data bytes

;--- Patch at file offset $02897B (SNES $C2897B) ---
org $C2897B

    CMP #$0F                ; [C9 0F      ] Compare A Immediate
    AND [$90]               ; [27 90      ] AND A with [DP]
    MVN $A9,$0F             ; [54 A9 0F   ] Block Move Negative
    AND [$80]               ; [27 80      ] AND A with [DP]
    db $4F                      ; Incomplete/data bytes

;--- End of patch ---