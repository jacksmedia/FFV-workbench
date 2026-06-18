;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_auto_jump.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_auto_jump.ips
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

;--- Patch at file offset $020804 (SNES $C20804) ---
org $C20804

    PLA                     ; [68         ] Pull Accumulator
    JSR $6163               ; [20 63 61   ] Jump to Subroutine
    STA $3D7F,Y             ; [99 7F 3D   ] Store A to Absolute,Y
    LDA #$41                ; [A9 41      ] Load A Immediate
    STA $3CFB,Y             ; [99 FB 3C   ] Store A to Absolute,Y
    INC $7BFC               ; [EE FC 7B   ] Increment Absolute

;--- Patch at file offset $0209C0 (SNES $C209C0) ---
org $C209C0

    TAX                     ; [AA         ] Transfer A to X
    LDA $D15DA0,X           ; [BF A0 5D D1] Load A from Absolute Long,X
    PHA                     ; [48         ] Push Accumulator
    LDA $47                 ; [A5 47      ] Load A from DP
    JSR $0207               ; [20 07 02   ] Jump to Subroutine
    LDX $32                 ; [A6 32      ] Load X from DP
    PLA                     ; [68         ] Pull Accumulator
    db $20, $63                 ; Incomplete/data bytes

;--- End of patch ---