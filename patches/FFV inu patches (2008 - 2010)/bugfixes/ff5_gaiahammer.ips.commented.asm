;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_gaiahammer.ips.commented.asm
;    Disassembled from IPS patch: ff5_gaiahammer.ips
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

;--- Patch at file offset $021465 (SNES $C21465) ---
org $C21465

    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $79FA               ; [8D FA 79   ] Store A to Absolute
    JSR $98E3               ; [20 E3 98   ] Jump to Subroutine
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    STA $65                 ; [85 65      ] Store A to DP
    STZ $66                 ; [64 66      ] Store Zero to DP

;--- End of patch ---