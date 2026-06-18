;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_auto_jump.ips.commented.asm
;    Disassembled from IPS patch: ff5_auto_jump.ips
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

    LDA #$41                ; [A9 41      ] Load A Immediate
    STA $3CFB,Y             ; [99 FB 3C   ] Store A to Absolute,Y
    PLA                     ; [68         ] Pull Accumulator
    JSR $6163               ; [20 63 61   ] Jump to Subroutine
    STA $3D7F,Y             ; [99 7F 3D   ] Store A to Absolute,Y
    JMP $09C3               ; [4C C3 09   ] Jump Absolute

;--- Patch at file offset $0209C0 (SNES $C209C0) ---
org $C209C0

    JMP $07F7               ; [4C F7 07   ] Jump Absolute
    PHA                     ; [48         ] Push Accumulator
    LDA $47                 ; [A5 47      ] Load A from DP
    TAX                     ; [AA         ] Transfer A to X
    PLA                     ; [68         ] Pull Accumulator
    DEC                     ; [3A         ] Decrement Accumulator
    STA $7C04,X             ; [9D 04 7C   ] Store A to Absolute,X
    INC $7BFC               ; [EE FC 7B   ] Increment Absolute
    RTS                     ; [60         ] Return from Subroutine

;--- End of patch ---