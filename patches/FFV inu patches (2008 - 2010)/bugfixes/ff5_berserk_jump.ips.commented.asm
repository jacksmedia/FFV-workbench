;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_berserk_jump.ips.commented.asm
;    Disassembled from IPS patch: ff5_berserk_jump.ips
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

    LDA $201E,X             ; [BD 1E 20   ] Load A from Absolute,X
    AND #$10                ; [29 10      ] AND A with Immediate
    BNE $1FB3               ; [D0 2C      ] Branch if Not Equal
    LDA #$80                ; [A9 80      ] Load A Immediate
    STA $2056,X             ; [9D 56 20   ] Store A to Absolute,X
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
    STZ $2059,X             ; [9E 59 20   ] Store Zero to Absolute,X
    STZ $205A,X             ; [9E 5A 20   ] Store Zero to Absolute,X
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    AND #$01                ; [29 01      ] AND A with Immediate
    BEQ $1FAE               ; [F0 04      ] Branch if Equal
    LDA #$26                ; [A9 26      ] Load A Immediate
    BRA $1FB0               ; [80 02      ] Branch Always
    LDA #$05                ; [A9 05      ] Load A Immediate
    JMP $1F6B               ; [4C 6B 1F   ] Jump Absolute

;--- End of patch ---