;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; Green Shirt Faris Thief.ips.commented.asm
;    Disassembled from IPS patch: Green Shirt Faris Thief.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 51 record(s)

;--- Patch at file offset $00FFDC (SNES $C0FFDC) ---
org $C0FFDC

    SBC $0648,Y             ; [F9 48 06   ] Subtract with Borrow Absolute,Y
    db $B7                      ; Incomplete/data bytes

;--- Patch at file offset $139849 (SNES $D39849) ---
org $D39849

    BRK                     ; [00 95      ] Software interrupt
    BRK                     ; [00 8B      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $139858 (SNES $D39858) ---
org $D39858

    ORA $6B19,Y             ; [19 19 6B   ] OR A with Absolute,Y
    PHD                     ; [0B         ] Push Direct Page Register
    db $67                      ; Incomplete/data bytes

;--- Patch at file offset $139880 (SNES $D39880) ---
org $D39880

    ADC $0800,Y             ; [79 00 08   ] Add with Carry Absolute,Y
    BRK                     ; [00 06      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $139894 (SNES $D39894) ---
org $D39894

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1398A1 (SNES $D398A1) ---
org $D398A1

    BRK                     ; [00 FE      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    ROL $24C0               ; [2E C0 24   ] Rotate Left Absolute
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1398B0 (SNES $D398B0) ---
org $D398B0

    BRA $9832               ; [80 80      ] Branch Always
    DEY                     ; [88         ] Decrement Y
    CPX $40                 ; [E4 40      ] Compare X with DP
    MVP $40,$40             ; [44 40 40   ] Block Move Positive

;--- Patch at file offset $139909 (SNES $D39909) ---
org $D39909

    RTI                     ; [40         ] Return from Interrupt
    SBC $109B70,X           ; [FF 70 9B 10] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $139918 (SNES $D39918) ---
org $D39918

    ADC ($11,X)             ; [61 11      ] Add with Carry (DP,X)
    ADC ($03,S),Y           ; [73 03      ] Add with Carry (SR),Y
    db $77                      ; Incomplete/data bytes

;--- Patch at file offset $139940 (SNES $D39940) ---
org $D39940

    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    JSR $300E               ; [20 0E 30   ] Jump to Subroutine
    db $0F, $21, $1E            ; Incomplete/data bytes

;--- Patch at file offset $139952 (SNES $D39952) ---
org $D39952

    ORA [$17],Y             ; [17 17      ] OR A with [DP],Y
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    COP #$02                ; [02 02      ] Coprocessor interrupt

;--- Patch at file offset $139961 (SNES $D39961) ---
org $D39961

    BRK                     ; [00 E7      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    ROR $9480,X             ; [7E 80 94   ] Rotate Right Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    SEC                     ; [38         ] Set Carry Flag
    BEQ $99E7               ; [F0 7C      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    LDY $FC68,X             ; [BC 68 FC   ] Load Y from Absolute,X
    BRK                     ; [00 98      ] Software interrupt
    LDY $80                 ; [A4 80      ] Load Y from DP
    PHX                     ; [DA         ] Push X Register
    BRA $98FA               ; [80 84      ] Branch Always
    JSR $5020               ; [20 20 50   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    CLV                     ; [B8         ] Clear Overflow Flag
    CPY #$68                ; [C0 68      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 71      ] Software interrupt
    ASL $7EB9,X             ; [1E B9 7E   ] Shift Left Absolute,X

;--- Patch at file offset $139994 (SNES $D39994) ---
org $D39994

    COP #$12                ; [02 12      ] Coprocessor interrupt

;--- Patch at file offset $1399A0 (SNES $D399A0) ---
org $D399A0

    SBC $38FF00,X           ; [FF 00 FF 38] Subtract with Borrow Absolute Long,X
    ORA $7C9FF0             ; [0F F0 9F 7C] OR A with Absolute Long

;--- Patch at file offset $1399B2 (SNES $D399B2) ---
org $D399B2

    CPY #$FA                ; [C0 FA      ] Compare Y Immediate
    BCC $9948               ; [90 92      ] Branch if Carry Clear
    db $44, $58                 ; Incomplete/data bytes

;--- Patch at file offset $139A41 (SNES $D39A41) ---
org $D39A41

    BRK                     ; [00 BB      ] Software interrupt
    BRK                     ; [00 99      ] Software interrupt
    BRK                     ; [00 FF      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    SBC [$6B],Y             ; [F7 6B      ] Subtract with Borrow [DP],Y
    CMP #$46                ; [C9 46      ] Compare A Immediate
    PHB                     ; [8B         ] Push Data Bank
    TSB $7F                 ; [04 7F      ] Test and Set Bits in DP
    BRK                     ; [00 28      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    ORA $674D               ; [0D 4D 67   ] OR A with Absolute
    ORA [$68]               ; [07 68      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    db $6C                      ; Incomplete/data bytes

;--- Patch at file offset $139A64 (SNES $D39A64) ---
org $D39A64

    STA $708F70             ; [8F 70 8F 70] Store A to Absolute Long

;--- Patch at file offset $139A74 (SNES $D39A74) ---
org $D39A74

    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    BVC $9ACA               ; [50 52      ] Branch if Overflow Clear

;--- Patch at file offset $139A89 (SNES $D39A89) ---
org $D39A89

    BRK                     ; [00 15      ] Software interrupt
    BRK                     ; [00 0B      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $139A98 (SNES $D39A98) ---
org $D39A98

    ORA $0B19,Y             ; [19 19 0B   ] OR A with Absolute,Y
    PHD                     ; [0B         ] Push Direct Page Register
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$05]               ; [07 05      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 71      ] Software interrupt
    ASL $7EB9,X             ; [1E B9 7E   ] Shift Left Absolute,X

;--- Patch at file offset $139AB4 (SNES $D39AB4) ---
org $D39AB4

    COP #$12                ; [02 12      ] Coprocessor interrupt

;--- Patch at file offset $139B01 (SNES $D39B01) ---
org $D39B01

    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 71      ] Software interrupt
    ASL $7EB9,X             ; [1E B9 7E   ] Shift Left Absolute,X

;--- Patch at file offset $139B14 (SNES $D39B14) ---
org $D39B14

    COP #$12                ; [02 12      ] Coprocessor interrupt

;--- Patch at file offset $139B20 (SNES $D39B20) ---
org $D39B20

    SBC $007B00,X           ; [FF 00 7B 00] Subtract with Borrow Absolute Long,X
    TSB $9EF0               ; [0C F0 9E   ] Test and Set Bits Absolute
    db $7C                      ; Incomplete/data bytes

;--- Patch at file offset $139B30 (SNES $D39B30) ---
org $D39B30

    SED                     ; [F8         ] Set Decimal Flag
    PLX                     ; [FA         ] Pull X Register
    BEQ $9B24               ; [F0 F0      ] Branch if Equal
    BCC $9AC6               ; [90 90      ] Branch if Carry Clear
    db $44, $58                 ; Incomplete/data bytes

;--- Patch at file offset $139B69 (SNES $D39B69) ---
org $D39B69

    STX $FE                 ; [86 FE      ] Store X to DP
    PHP                     ; [08         ] Push Processor Status
    db $FF, $10                 ; Incomplete/data bytes

;--- Patch at file offset $139B78 (SNES $D39B78) ---
org $D39B78

    BRK                     ; [00 B6      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    INY                     ; [C8         ] Increment Y
    SEP #$F4                ; [E2 F4      ] Set Processor Status Bits
    SEP #$EC                ; [E2 EC      ] Set Processor Status Bits
    ADC $1000,Y             ; [79 00 10   ] Add with Carry Absolute,Y
    BRK                     ; [00 71      ] Software interrupt
    ASL $7EB9,X             ; [1E B9 7E   ] Shift Left Absolute,X

;--- Patch at file offset $139B94 (SNES $D39B94) ---
org $D39B94

    ASL                     ; [0A         ] Shift Left Accumulator
    INC                     ; [1A         ] Increment Accumulator

;--- Patch at file offset $139BA0 (SNES $D39BA0) ---
org $D39BA0

    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    ASL $9EF0               ; [0E F0 9E   ] Shift Left Absolute
    db $7C                      ; Incomplete/data bytes

;--- Patch at file offset $139BB0 (SNES $D39BB0) ---
org $D39BB0

    BEQ $9BA8               ; [F0 F6      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    PLX                     ; [FA         ] Pull X Register
    BCC $9B46               ; [90 90      ] Branch if Carry Clear
    db $44, $58                 ; Incomplete/data bytes

;--- Patch at file offset $139C09 (SNES $D39C09) ---
org $D39C09

    BRK                     ; [00 35      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $139C18 (SNES $D39C18) ---
org $D39C18

    ORA #$29                ; [09 29      ] OR A with Immediate
    PHD                     ; [0B         ] Push Direct Page Register
    PHD                     ; [0B         ] Push Direct Page Register
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $139C29 (SNES $D39C29) ---
org $D39C29

    STX $FE                 ; [86 FE      ] Store X to DP
    BRK                     ; [00 FF      ] Software interrupt
    BRK                     ; [00 FF      ] Software interrupt
    CPX #$18                ; [E0 18      ] Compare X Immediate
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $139C38 (SNES $D39C38) ---
org $D39C38

    BRK                     ; [00 B6      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    INY                     ; [C8         ] Increment Y
    SBC ($F4)               ; [F2 F4      ] Subtract with Borrow (DP)
    CPX #$E6                ; [E0 E6      ] Compare X Immediate
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $139C61 (SNES $D39C61) ---
org $D39C61

    BRK                     ; [00 FF      ] Software interrupt
    BRK                     ; [00 32      ] Software interrupt
    CPY #$20                ; [C0 20      ] Compare Y Immediate
    CPY #$F0                ; [C0 F0      ] Compare Y Immediate
    db $E0                      ; Incomplete/data bytes

;--- Patch at file offset $139C70 (SNES $D39C70) ---
org $D39C70

    SED                     ; [F8         ] Set Decimal Flag
    PLX                     ; [FA         ] Pull X Register
    BEQ $9C66               ; [F0 F2      ] Branch if Equal
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $139CCB (SNES $D39CCB) ---
org $D39CCB

    RTS                     ; [60         ] Return from Subroutine
    LDY $20,X               ; [B4 20      ] Load Y from DP,X
    STY $00,X               ; [94 00      ] Store Y to DP,X

;--- Patch at file offset $139CE8 (SNES $D39CE8) ---
org $D39CE8

    SBC $027F00,X           ; [FF 00 7F 02] Subtract with Borrow Absolute Long,X
    EOR [$02]               ; [47 02      ] XOR A with [DP]

;--- Patch at file offset $139CFA (SNES $D39CFA) ---
org $D39CFA

    STY $06                 ; [84 06      ] Store Y to DP
    BMI $9C88               ; [30 8A      ] Branch if Minus
    BEQ $9D08               ; [F0 08      ] Branch if Equal
    ADC $182700,X           ; [7F 00 27 18] Add with Carry Absolute Long,X
    ADC ($3D)               ; [72 3D      ] Add with Carry (DP)

;--- Patch at file offset $139D10 (SNES $D39D10) ---
org $D39D10

    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    COP #$02                ; [02 02      ] Coprocessor interrupt
    TSB $34                 ; [04 34      ] Test and Set Bits in DP

;--- Patch at file offset $139D23 (SNES $D39D23) ---
org $D39D23

    BRK                     ; [00 1E      ] Software interrupt
    CPX #$8E                ; [E0 8E      ] Compare X Immediate
    BEQ $9D17               ; [F0 EE      ] Branch if Equal
    db $D0                      ; Incomplete/data bytes

;--- Patch at file offset $139D32 (SNES $D39D32) ---
org $D39D32

    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BIT $1C2C               ; [2C 2C 1C   ] Test Bits Absolute
    db $9C, $14                 ; Incomplete/data bytes

;--- Patch at file offset $139D89 (SNES $D39D89) ---
org $D39D89

    RTS                     ; [60         ] Return from Subroutine
    LDA [$00],Y             ; [B7 00      ] Load A from [DP],Y
    STA ($00,S),Y           ; [93 00      ] Store A to (SR),Y

;--- Patch at file offset $139D98 (SNES $D39D98) ---
org $D39D98

    ADC ($11,X)             ; [61 11      ] Add with Carry (DP,X)
    LSR                     ; [4A         ] Shift Right Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    db $4E                      ; Incomplete/data bytes

;--- Patch at file offset $139DAA (SNES $D39DAA) ---
org $D39DAA

    db $9F, $10                 ; Incomplete/data bytes

;--- Patch at file offset $139DC9 (SNES $D39DC9) ---
org $D39DC9

    RTS                     ; [60         ] Return from Subroutine
    LDA [$00],Y             ; [B7 00      ] Load A from [DP],Y
    STA ($00,S),Y           ; [93 00      ] Store A to (SR),Y

;--- Patch at file offset $139DD8 (SNES $D39DD8) ---
org $D39DD8

    ADC ($11,X)             ; [61 11      ] Add with Carry (DP,X)
    LSR                     ; [4A         ] Shift Right Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    db $4E                      ; Incomplete/data bytes

;--- Patch at file offset $139DEA (SNES $D39DEA) ---
org $D39DEA

    db $9F, $10                 ; Incomplete/data bytes

;--- Patch at file offset $14AC40 (SNES $D4AC40) ---
org $D4AC40

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14AC4C (SNES $D4AC4C) ---
org $D4AC4C

    ASL $7D,X               ; [16 7D      ] Shift Left DP,X
    PHD                     ; [0B         ] Push Direct Page Register
    PHA                     ; [48         ] Push Accumulator

;--- Patch at file offset $14AC56 (SNES $D4AC56) ---
org $D4AC56

    RTI                     ; [40         ] Return from Interrupt
    db $1D                      ; Incomplete/data bytes

;--- End of patch ---