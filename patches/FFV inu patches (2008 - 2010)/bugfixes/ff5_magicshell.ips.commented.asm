;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_magicshell.ips.commented.asm
;    Disassembled from IPS patch: ff5_magicshell.ips
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

;--- Patch at file offset $0238A6 (SNES $C238A6) ---
org $C238A6

    AND #$A0                ; [29 A0      ] AND A with Immediate
    BNE $38F0               ; [D0 46      ] Branch if Not Equal
    LDA $0047               ; [AD 47 00   ] Load A from Absolute
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BCC $38F0               ; [90 3F      ] Branch if Carry Clear
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $2008,X             ; [BD 08 20   ] Load A from Absolute,X
    JSR $01BE               ; [20 BE 01   ] Jump to Subroutine
    CMP $2006,X             ; [DD 06 20   ] Compare A with Absolute,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    BCC $38F0               ; [90 2F      ] Branch if Carry Clear
    JSR $3C7F               ; [20 7F 3C   ] Jump to Subroutine
    LDY $32                 ; [A4 32      ] Load Y from DP
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

;--- Patch at file offset $023B62 (SNES $C23B62) ---
org $C23B62

    AND #$A0                ; [29 A0      ] AND A with Immediate
    BNE $3BAD               ; [D0 47      ] Branch if Not Equal
    LDA $7C73               ; [AD 73 7C   ] Load A from Absolute
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BCC $3BAD               ; [90 40      ] Branch if Carry Clear
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $2008,X             ; [BD 08 20   ] Load A from Absolute,X
    JSR $01BE               ; [20 BE 01   ] Jump to Subroutine
    CMP $2006,X             ; [DD 06 20   ] Compare A with Absolute,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    BCC $3BAD               ; [90 30      ] Branch if Carry Clear
    JSR $3C7F               ; [20 7F 3C   ] Jump to Subroutine
    LDY $32                 ; [A4 32      ] Load Y from DP
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
    NOP                     ; [EA         ] No Operation

;--- End of patch ---