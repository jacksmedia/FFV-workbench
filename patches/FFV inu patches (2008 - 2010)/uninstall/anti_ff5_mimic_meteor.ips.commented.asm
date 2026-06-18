;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_mimic_meteor.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_mimic_meteor.ips
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

;--- Patch at file offset $025F7B (SNES $C25F7B) ---
org $C25F7B

    ORA #$A9                ; [09 A9      ] OR A with Immediate
    COP #$85                ; [02 85      ] Coprocessor interrupt
    ASL $208D               ; [0E 8D 20   ] Shift Left Absolute
    ROL $80                 ; [26 80      ] Rotate Left DP
    ORA [$A9]               ; [07 A9      ] OR A with [DP]
    BRK                     ; [00 85      ] Software interrupt
    ASL $208D               ; [0E 8D 20   ] Shift Left Absolute
    ROL $AD                 ; [26 AD      ] Rotate Left DP
    JSL $218D27             ; [22 27 8D 21] Jump to Subroutine Long
    ROL $20                 ; [26 20      ] Rotate Left DP
    AND $FA2099             ; [2F 99 20 FA] AND A with Absolute Long
    TYA                     ; [98         ] Transfer Y to A
    STZ $384C,X             ; [9E 4C 38   ] Store Zero to Absolute,X
    STZ $3850,X             ; [9E 50 38   ] Store Zero to Absolute,X
    LDA #$FC                ; [A9 FC      ] Load A Immediate
    STA $384D,X             ; [9D 4D 38   ] Store A to Absolute,X
    LDA $0E                 ; [A5 0E      ] Load A from DP
    STA $384E,X             ; [9D 4E 38   ] Store A to Absolute,X
    LDA $2621               ; [AD 21 26   ] Load A from Absolute
    STA $384F,X             ; [9D 4F 38   ] Store A to Absolute,X
    LDA $41                 ; [A5 41      ] Load A from DP
    STA $0E                 ; [85 0E      ] Store A to DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    LDA $262A,X             ; [BD 2A 26   ] Load A from Absolute,X
    STA $79FC,Y             ; [99 FC 79   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    CPX #$05                ; [E0 05      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    SBC ($C8,S),Y           ; [F3 C8      ] Subtract with Borrow (SR),Y
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    LDA $262A,X             ; [BD 2A 26   ] Load A from Absolute,X
    STA $79FC,Y             ; [99 FC 79   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    CPX #$08                ; [E0 08      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    SBC ($C6,S),Y           ; [F3 C6      ] Subtract with Borrow (SR),Y
    ASL $0EA5               ; [0E A5 0E   ] Shift Left Absolute
    BNE $5FB2               ; [D0 DA      ] Branch if Not Equal
    STZ $1A                 ; [64 1A      ] Store Zero to DP
    LDA $79FF               ; [AD FF 79   ] Load A from Absolute
    AND #$7F                ; [29 7F      ] AND A with Immediate
    TAX                     ; [AA         ] Transfer A to X
    STX $0E                 ; [86 0E      ] Store X to DP
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2039,X             ; [BD 39 20   ] Load A from Absolute,X
    AND #$08                ; [29 08      ] AND A with Immediate
    BEQ $5FF1               ; [F0 06      ] Branch if Equal
    LSR $0E                 ; [46 0E      ] Shift Right DP
    BCC $5FF1               ; [90 02      ] Branch if Carry Clear
    INC $0E                 ; [E6 0E      ] Increment DP

;--- End of patch ---