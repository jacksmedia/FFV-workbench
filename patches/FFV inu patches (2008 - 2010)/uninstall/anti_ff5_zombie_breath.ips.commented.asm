;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_zombie_breath.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_zombie_breath.ips
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

;--- Patch at file offset $02710F (SNES $C2710F) ---
org $C2710F

    LDX $49                 ; [A6 49      ] Load X from DP
    LDA #$02                ; [A9 02      ] Load A Immediate
    STA $59                 ; [85 59      ] Store A to DP
    JSR $8CAC               ; [20 AC 8C   ] Jump to Subroutine

;--- End of patch ---