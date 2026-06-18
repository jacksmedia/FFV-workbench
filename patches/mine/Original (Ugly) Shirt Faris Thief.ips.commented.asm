;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; Original (Ugly) Shirt Faris Thief.ips.commented.asm
;    Disassembled from IPS patch: Original (Ugly) Shirt Faris Thief.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 47 record(s)

;--- Patch at file offset $139849 (SNES $D39849) ---
org $D39849

    ORA #$95                ; [09 95      ] OR A with Immediate
    PHD                     ; [0B         ] Push Direct Page Register
    PHB                     ; [8B         ] Push Data Bank
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $139858 (SNES $D39858) ---
org $D39858

    CLC                     ; [18         ] Clear Carry Flag
    ORA $0B6A,Y             ; [19 6A 0B   ] OR A with Absolute,Y
    db $64                      ; Incomplete/data bytes

;--- Patch at file offset $139881 (SNES $D39881) ---
org $D39881

    ORA [$08]               ; [07 08      ] OR A with [DP]
    ORA [$07]               ; [07 07      ] OR A with [DP]
    BRK                     ; [00 03      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $139894 (SNES $D39894) ---
org $D39894

    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)

;--- Patch at file offset $1398A1 (SNES $D398A1) ---
org $D398A1

    BRA $98A1               ; [80 FE      ] Branch Always
    CPX #$6E                ; [E0 6E      ] Compare X Immediate
    BRK                     ; [00 64      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1398B0 (SNES $D398B0) ---
org $D398B0

    BRK                     ; [00 80      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CPX $C0                 ; [E4 C0      ] Compare X with DP
    CPY $C0                 ; [C4 C0      ] Compare Y with DP
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $139909 (SNES $D39909) ---
org $D39909

    EOR ($FF,X)             ; [41 FF      ] XOR A with (DP,X)
    ADC ($9B,S),Y           ; [73 9B      ] Add with Carry (SR),Y
    db $17                      ; Incomplete/data bytes

;--- Patch at file offset $139918 (SNES $D39918) ---
org $D39918

    RTS                     ; [60         ] Return from Subroutine
    ORA ($70),Y             ; [11 70      ] OR A with (DP),Y
    ORA $74,S               ; [03 74      ] OR A with Stack Relative

;--- Patch at file offset $139941 (SNES $D39941) ---
org $D39941

    ORA $331127             ; [0F 27 11 33] OR A with Absolute Long
    BRK                     ; [00 23      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $139952 (SNES $D39952) ---
org $D39952

    ASL $0F1F,X             ; [1E 1F 0F   ] Shift Left Absolute,X
    db $0F, $1E, $1E            ; Incomplete/data bytes

;--- Patch at file offset $139961 (SNES $D39961) ---
org $D39961

    BRA $994A               ; [80 E7      ] Branch Always
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    BRK                     ; [00 B4      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    BMI $9967               ; [30 FC      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    LDY $FC68,X             ; [BC 68 FC   ] Load Y from Absolute,X
    BRK                     ; [00 18      ] Software interrupt
    LDY $00                 ; [A4 00      ] Load Y from DP
    PHX                     ; [DA         ] Push X Register
    BRA $98FA               ; [80 84      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    RTS                     ; [60         ] Return from Subroutine
    CPY #$F0                ; [C0 F0      ] Compare Y Immediate
    TYA                     ; [98         ] Transfer Y to A
    LDY #$68                ; [A0 68      ] Load Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    ORA [$10]               ; [07 10      ] OR A with [DP]
    ORA $BF107B             ; [0F 7B 10 BF] OR A with Absolute Long
    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $139994 (SNES $D39994) ---
org $D39994

    db $0E, $1E                 ; Incomplete/data bytes

;--- Patch at file offset $1399A1 (SNES $D399A1) ---
org $D399A1

    BRA $99A2               ; [80 FF      ] Branch Always
    SED                     ; [F8         ] Set Decimal Flag
    STA $1CDF00,X           ; [9F 00 DF 1C] Store A to Absolute Long,X

;--- Patch at file offset $1399B2 (SNES $D399B2) ---
org $D399B2

    BRK                     ; [00 FA      ] Software interrupt
    BEQ $99A8               ; [F0 F2      ] Branch if Equal
    STZ $78                 ; [64 78      ] Store Zero to DP

;--- Patch at file offset $139A41 (SNES $D39A41) ---
org $D39A41

    PHP                     ; [08         ] Push Processor Status
    TYX                     ; [BB         ] Transfer Y to X
    ORA $0799               ; [0D 99 07   ] OR A with Absolute
    SBC $67FC68,X           ; [FF 68 FC 67] Subtract with Borrow Absolute Long,X
    CMP $008F40             ; [CF 40 8F 00] Compare A with Absolute Long
    ADC $282000,X           ; [7F 00 20 28] Add with Carry Absolute Long,X
    TSB $4D                 ; [04 4D      ] Test and Set Bits in DP
    ROR $07                 ; [66 07      ] Rotate Right DP
    RTS                     ; [60         ] Return from Subroutine
    PHP                     ; [08         ] Push Processor Status
    RTL                     ; [6B         ] Return from Subroutine Long

;--- Patch at file offset $139A64 (SNES $D39A64) ---
org $D39A64

    CMP $00DF00             ; [CF 00 DF 00] Compare A with Absolute Long

;--- Patch at file offset $139A74 (SNES $D39A74) ---
org $D39A74

    BVS $9AE6               ; [70 70      ] Branch if Overflow Set
    BVS $9AEA               ; [70 72      ] Branch if Overflow Set

;--- Patch at file offset $139A89 (SNES $D39A89) ---
org $D39A89

    ORA #$15                ; [09 15      ] OR A with Immediate
    PHD                     ; [0B         ] Push Direct Page Register
    PHD                     ; [0B         ] Push Direct Page Register
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $139A98 (SNES $D39A98) ---
org $D39A98

    CLC                     ; [18         ] Clear Carry Flag
    ORA $0B0A,Y             ; [19 0A 0B   ] OR A with Absolute,Y
    TSB $07                 ; [04 07      ] Test and Set Bits in DP
    ORA [$05]               ; [07 05      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$10]               ; [07 10      ] OR A with [DP]
    ORA $BF107B             ; [0F 7B 10 BF] OR A with Absolute Long
    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $139AB4 (SNES $D39AB4) ---
org $D39AB4

    db $0E, $1E                 ; Incomplete/data bytes

;--- Patch at file offset $139AED (SNES $D39AED) ---
org $D39AED

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $139AFC (SNES $D39AFC) ---
org $D39AFC

    COP #$A4                ; [02 A4      ] Coprocessor interrupt
    RTS                     ; [60         ] Return from Subroutine
    ROR $7E                 ; [66 7E      ] Rotate Right DP
    ORA ($10,X)             ; [01 10      ] OR A with (DP,X)
    ORA $BF107B             ; [0F 7B 10 BF] OR A with Absolute Long
    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $139B14 (SNES $D39B14) ---
org $D39B14

    db $0E, $1E                 ; Incomplete/data bytes

;--- Patch at file offset $139B21 (SNES $D39B21) ---
org $D39B21

    SED                     ; [F8         ] Set Decimal Flag
    TDC                     ; [7B         ] Transfer Direct Page to A
    BEQ $9AC1               ; [F0 9C      ] Branch if Equal
    BRK                     ; [00 DE      ] Software interrupt
    db $1C                      ; Incomplete/data bytes

;--- Patch at file offset $139B30 (SNES $D39B30) ---
org $D39B30

    CPX #$FA                ; [E0 FA      ] Compare X Immediate
    BRA $9B24               ; [80 F0      ] Branch Always
    BEQ $9B26               ; [F0 F0      ] Branch if Equal
    STZ $78                 ; [64 78      ] Store Zero to DP

;--- Patch at file offset $139B6B (SNES $D39B6B) ---
org $D39B6B

    RTI                     ; [40         ] Return from Interrupt
    db $FF, $F0                 ; Incomplete/data bytes

;--- Patch at file offset $139B7A (SNES $D39B7A) ---
org $D39B7A

    PHP                     ; [08         ] Push Processor Status
    INY                     ; [C8         ] Increment Y
    COP #$F4                ; [02 F4      ] Coprocessor interrupt
    SEP #$EC                ; [E2 EC      ] Set Processor Status Bits
    SEI                     ; [78         ] Set Interrupt Disable
    ORA [$10]               ; [07 10      ] OR A with [DP]
    ORA $BF107B             ; [0F 7B 10 BF] OR A with Absolute Long
    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $139B94 (SNES $D39B94) ---
org $D39B94

    db $0E, $1E                 ; Incomplete/data bytes

;--- Patch at file offset $139BA1 (SNES $D39BA1) ---
org $D39BA1

    BEQ $9BA2               ; [F0 FF      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    STZ $DE00,X             ; [9E 00 DE   ] Store Zero to Absolute,X
    db $1C                      ; Incomplete/data bytes

;--- Patch at file offset $139BB0 (SNES $D39BB0) ---
org $D39BB0

    BRA $9BA8               ; [80 F6      ] Branch Always
    BRK                     ; [00 FA      ] Software interrupt
    BEQ $9BA6               ; [F0 F0      ] Branch if Equal
    STZ $78                 ; [64 78      ] Store Zero to DP

;--- Patch at file offset $139C09 (SNES $D39C09) ---
org $D39C09

    ORA #$35                ; [09 35      ] OR A with Immediate
    PHD                     ; [0B         ] Push Direct Page Register
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $139C18 (SNES $D39C18) ---
org $D39C18

    PHP                     ; [08         ] Push Processor Status
    AND #$0A                ; [29 0A      ] AND A with Immediate
    PHD                     ; [0B         ] Push Direct Page Register
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $139C2B (SNES $D39C2B) ---
org $D39C2B

    RTI                     ; [40         ] Return from Interrupt
    db $FF, $F0                 ; Incomplete/data bytes

;--- Patch at file offset $139C3A (SNES $D39C3A) ---
org $D39C3A

    PHP                     ; [08         ] Push Processor Status
    INY                     ; [C8         ] Increment Y
    COP #$F4                ; [02 F4      ] Coprocessor interrupt
    CPX #$E6                ; [E0 E6      ] Compare X Immediate
    PHP                     ; [08         ] Push Processor Status
    ORA [$04]               ; [07 04      ] OR A with [DP]
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    BRK                     ; [00 03      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $139C61 (SNES $D39C61) ---
org $D39C61

    SED                     ; [F8         ] Set Decimal Flag
    SBC $0072F0,X           ; [FF F0 72 00] Subtract with Borrow Absolute Long,X
    RTS                     ; [60         ] Return from Subroutine
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $139C70 (SNES $D39C70) ---
org $D39C70

    BRK                     ; [00 FA      ] Software interrupt
    BRK                     ; [00 F2      ] Software interrupt
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate

;--- Patch at file offset $139CCB (SNES $D39CCB) ---
org $D39CCB

    PLA                     ; [68         ] Pull Accumulator
    LDY $28,X               ; [B4 28      ] Load Y from DP,X
    STY $08,X               ; [94 08      ] Store Y to DP,X

;--- Patch at file offset $139D01 (SNES $D39D01) ---
org $D39D01

    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    COP #$76                ; [02 76      ] Coprocessor interrupt
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $139D10 (SNES $D39D10) ---
org $D39D10

    BRK                     ; [00 04      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    INC                     ; [1A         ] Increment Accumulator
    db $0D, $3D                 ; Incomplete/data bytes

;--- Patch at file offset $139D23 (SNES $D39D23) ---
org $D39D23

    PHP                     ; [08         ] Push Processor Status
    ROL $9E0C,X             ; [3E 0C 9E   ] Rotate Left Absolute,X
    STY $FE                 ; [84 FE      ] Store Y to DP
    db $C4                      ; Incomplete/data bytes

;--- Patch at file offset $139D32 (SNES $D39D32) ---
org $D39D32

    BRK                     ; [00 08      ] Software interrupt
    CPX #$EC                ; [E0 EC      ] Compare X Immediate
    SEI                     ; [78         ] Set Interrupt Disable
    db $FC, $10                 ; Incomplete/data bytes

;--- Patch at file offset $139D89 (SNES $D39D89) ---
org $D39D89

    ADC ($B7,X)             ; [61 B7      ] Add with Carry (DP,X)
    ASL                     ; [0A         ] Shift Left Accumulator
    STA ($0E,S),Y           ; [93 0E      ] Store A to (SR),Y

;--- Patch at file offset $139D98 (SNES $D39D98) ---
org $D39D98

    RTS                     ; [60         ] Return from Subroutine
    ORA ($48),Y             ; [11 48      ] OR A with (DP),Y
    ASL                     ; [0A         ] Shift Left Accumulator
    db $4C                      ; Incomplete/data bytes

;--- Patch at file offset $139DAA (SNES $D39DAA) ---
org $D39DAA

    db $BF, $30                 ; Incomplete/data bytes

;--- Patch at file offset $139DC9 (SNES $D39DC9) ---
org $D39DC9

    ADC ($B7,X)             ; [61 B7      ] Add with Carry (DP,X)
    ASL                     ; [0A         ] Shift Left Accumulator
    STA ($0E,S),Y           ; [93 0E      ] Store A to (SR),Y

;--- Patch at file offset $139DD8 (SNES $D39DD8) ---
org $D39DD8

    RTS                     ; [60         ] Return from Subroutine
    ORA ($48),Y             ; [11 48      ] OR A with (DP),Y
    ASL                     ; [0A         ] Shift Left Accumulator
    db $4C                      ; Incomplete/data bytes

;--- Patch at file offset $139DEA (SNES $D39DEA) ---
org $D39DEA

    db $BF, $30                 ; Incomplete/data bytes

;--- End of patch ---