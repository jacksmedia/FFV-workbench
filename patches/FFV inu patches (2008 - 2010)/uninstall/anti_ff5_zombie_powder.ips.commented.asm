;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_zombie_powder.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_zombie_powder.ips
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

;--- Patch at file offset $021E4F (SNES $C21E4F) ---
org $C21E4F

    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    LDA #$03                ; [A9 03      ] Load A Immediate
    JSR $007C               ; [20 7C 00   ] Jump to Subroutine
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    JSR $01D6               ; [20 D6 01   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    db $9D, $59                 ; Incomplete/data bytes

;--- Patch at file offset $02742F (SNES $C2742F) ---
org $C2742F

    TAX                     ; [AA         ] Transfer A to X
    db $8F                      ; Incomplete/data bytes

;--- End of patch ---