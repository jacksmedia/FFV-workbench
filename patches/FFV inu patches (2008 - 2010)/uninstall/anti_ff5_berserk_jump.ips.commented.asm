;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_berserk_jump.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_berserk_jump.ips
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

;--- Patch at file offset $021F80 (SNES $C21F80) ---
org $C21F80

    LDA #$80                ; [A9 80      ] Load A Immediate
    STA $2056,X             ; [9D 56 20   ] Store A to Absolute,X
    LDA #$05                ; [A9 05      ] Load A Immediate
    STA $2057,X             ; [9D 57 20   ] Store A to Absolute,X
    STZ $2059,X             ; [9E 59 20   ] Store Zero to Absolute,X
    STZ $205A,X             ; [9E 5A 20   ] Store Zero to Absolute,X
    STZ $205B,X             ; [9E 5B 20   ] Store Zero to Absolute,X
    STZ $205C,X             ; [9E 5C 20   ] Store Zero to Absolute,X
    STZ $205D,X             ; [9E 5D 20   ] Store Zero to Absolute,X
    STZ $205E,X             ; [9E 5E 20   ] Store Zero to Absolute,X
    STZ $205F,X             ; [9E 5F 20   ] Store Zero to Absolute,X
    PHX                     ; [DA         ] Push X Register
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    LDA #$07                ; [A9 07      ] Load A Immediate
    JSR $007C               ; [20 7C 00   ] Jump to Subroutine
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    JSR $01D6               ; [20 D6 01   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    STA $2058,X             ; [9D 58 20   ] Store A to Absolute,X
    JMP $1FB3               ; [4C B3 1F   ] Jump Absolute

;--- End of patch ---