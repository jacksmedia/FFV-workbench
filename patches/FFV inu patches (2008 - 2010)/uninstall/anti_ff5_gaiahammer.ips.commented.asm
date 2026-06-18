;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_gaiahammer.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_gaiahammer.ips
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

    INC $79FA               ; [EE FA 79   ] Increment Absolute
    JSR $98E3               ; [20 E3 98   ] Jump to Subroutine
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    STA $0065               ; [8D 65 00   ] Store A to Absolute
    STZ $0066               ; [9C 66 00   ] Store Zero to Absolute

;--- End of patch ---