;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_lv5_death.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_lv5_death.ips
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

;--- Patch at file offset $02727C (SNES $C2727C) ---
org $C2727C

    TSB $20C2               ; [0C C2 20   ] Test and Set Bits Absolute
    LDA $2008,X             ; [BD 08 20   ] Load A from Absolute,X
    STA $2006,X             ; [9D 06 20   ] Store A to Absolute,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    RTS                     ; [60         ] Return from Subroutine
    JSR $902B               ; [20 2B 90   ] Jump to Subroutine

;--- End of patch ---