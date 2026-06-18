;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_mimic_meteor.ips.commented.asm
;    Disassembled from IPS patch: ff5_mimic_meteor.ips
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

    TSB $A9                 ; [04 A9      ] Test and Set Bits in DP
    COP #$80                ; [02 80      ] Coprocessor interrupt
    COP #$A9                ; [02 A9      ] Coprocessor interrupt
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
    ASL $DCD0               ; [0E D0 DC   ] Shift Left Absolute
    STZ $1A                 ; [64 1A      ] Store Zero to DP
    LDA $79FF               ; [AD FF 79   ] Load A from Absolute
    AND #$7F                ; [29 7F      ] AND A with Immediate
    TAX                     ; [AA         ] Transfer A to X
    STX $0E                 ; [86 0E      ] Store X to DP
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2039,X             ; [BD 39 20   ] Load A from Absolute,X
    AND #$08                ; [29 08      ] AND A with Immediate
    BEQ $5FEA               ; [F0 06      ] Branch if Equal
    LSR $0E                 ; [46 0E      ] Shift Right DP
    BCC $5FEA               ; [90 02      ] Branch if Carry Clear
    INC $0E                 ; [E6 0E      ] Increment DP
    LDA $2056,X             ; [BD 56 20   ] Load A from Absolute,X
    AND #$01                ; [29 01      ] AND A with Immediate
    BEQ $6008               ; [F0 17      ] Branch if Equal

;--- End of patch ---