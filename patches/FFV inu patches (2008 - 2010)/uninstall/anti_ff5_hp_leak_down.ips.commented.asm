;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_hp_leak_down.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_hp_leak_down.ips
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

;--- Patch at file offset $0217F8 (SNES $C217F8) ---
org $C217F8

    LDA #$FF                ; [A9 FF      ] Load A Immediate
    STA $41CC               ; [8D CC 41   ] Store A to Absolute
    RTS                     ; [60         ] Return from Subroutine

;--- End of patch ---