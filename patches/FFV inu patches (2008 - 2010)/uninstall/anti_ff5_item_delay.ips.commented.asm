;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_item_delay.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_item_delay.ips
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

;--- Patch at file offset $021B68 (SNES $C21B68) ---
org $C21B68

    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $021B6C (SNES $C21B6C) ---
org $C21B6C

    JSR $1C36               ; [20 36 1C   ] Jump to Subroutine
    LDA $D10A80,X           ; [BF 80 0A D1] Load A from Absolute Long,X
    AND #$03                ; [29 03      ] AND A with Immediate
    TAX                     ; [AA         ] Transfer A to X
    LDA $D0ECEE,X           ; [BF EE EC D0] Load A from Absolute Long,X
    BRA $1BF7               ; [80 7B      ] Branch Always

;--- End of patch ---