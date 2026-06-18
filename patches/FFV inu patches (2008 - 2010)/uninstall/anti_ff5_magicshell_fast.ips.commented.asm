;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_magicshell_fast.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_magicshell_fast.ips
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

;--- Patch at file offset $0238C2 (SNES $C238C2) ---
org $C238C2

    ADC $32A43C,X           ; [7F 3C A4 32] Add with Carry Absolute Long,X
    LDA #$20                ; [A9 20      ] Load A Immediate
    STA $2056,Y             ; [99 56 20   ] Store A to Absolute,Y
    LDA #$2C                ; [A9 2C      ] Load A Immediate
    STA $2057,Y             ; [99 57 20   ] Store A to Absolute,Y
    LDA #$7C                ; [A9 7C      ] Load A Immediate
    STA $205A,Y             ; [99 5A 20   ] Store A to Absolute,Y
    LDA $4755               ; [AD 55 47   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    JSR $01D6               ; [20 D6 01   ] Jump to Subroutine
    STA $2059,Y             ; [99 59 20   ] Store A to Absolute,Y
    TDC                     ; [7B         ] Transfer Direct Page to A
    STA $2058,Y             ; [99 58 20   ] Store A to Absolute,Y
    JSR $3E91               ; [20 91 3E   ] Jump to Subroutine
    JSR $3D9C               ; [20 9C 3D   ] Jump to Subroutine
    INC $474E               ; [EE 4E 47   ] Increment Absolute
    JMP $3C0C               ; [4C 0C 3C   ] Jump Absolute

;--- Patch at file offset $023B7E (SNES $C23B7E) ---
org $C23B7E

    ADC $32A43C,X           ; [7F 3C A4 32] Add with Carry Absolute Long,X
    LDA #$20                ; [A9 20      ] Load A Immediate
    STA $2056,Y             ; [99 56 20   ] Store A to Absolute,Y
    LDA #$2C                ; [A9 2C      ] Load A Immediate
    STA $2057,Y             ; [99 57 20   ] Store A to Absolute,Y
    LDA #$7C                ; [A9 7C      ] Load A Immediate
    STA $205A,Y             ; [99 5A 20   ] Store A to Absolute,Y
    LDA $4755               ; [AD 55 47   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    JSR $01D6               ; [20 D6 01   ] Jump to Subroutine
    STA $2059,Y             ; [99 59 20   ] Store A to Absolute,Y
    TDC                     ; [7B         ] Transfer Direct Page to A
    STA $2058,Y             ; [99 58 20   ] Store A to Absolute,Y
    JSR $3E91               ; [20 91 3E   ] Jump to Subroutine
    JSR $3D9C               ; [20 9C 3D   ] Jump to Subroutine
    INC $474E               ; [EE 4E 47   ] Increment Absolute
    JMP $3C0C               ; [4C 0C 3C   ] Jump Absolute

;--- End of patch ---