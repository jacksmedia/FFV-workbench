;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; _Final Fantasy V J (CRC32 = C1BC267D) Galuf Green Coat on Map.ips.commented.asm
;    Disassembled from IPS patch: _Final Fantasy V J (CRC32 = C1BC267D) Galuf Green Coat on Map.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 46 record(s)

;--- Patch at file offset $1AE842 (SNES $DAE842) ---
org $DAE842

    BIT $0B,X               ; [34 0B      ] Test Bits DP,X
    LSR $5D35               ; [4E 35 5D   ] Shift Right Absolute
    BIT $3B,X               ; [34 3B      ] Test Bits DP,X
    TSB $1B                 ; [04 1B      ] Test and Set Bits in DP
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    TSB $04                 ; [04 04      ] Test and Set Bits in DP

;--- Patch at file offset $1AE855 (SNES $DAE855) ---
org $DAE855

    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    ASL $0F                 ; [06 0F      ] Shift Left DP
    PHP                     ; [08         ] Push Processor Status
    ORA [$10],Y             ; [17 10      ] OR A with [DP],Y

;--- Patch at file offset $1AE862 (SNES $DAE862) ---
org $DAE862

    ROL $72D0               ; [2E D0 72   ] Rotate Left Absolute
    LDY #$B2                ; [A0 B2      ] Load Y Immediate
    BIT $A45A               ; [2C 5A A4   ] Test Bits Absolute
    STZ $A060               ; [9C 60 A0   ] Store Zero to Absolute

;--- Patch at file offset $1AE875 (SNES $DAE875) ---
org $DAE875

    BIT $6020               ; [2C 20 60   ] Test Bits Absolute
    BEQ $E88A               ; [F0 10      ] Branch if Equal
    PLA                     ; [68         ] Pull Accumulator
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1AE8C2 (SNES $DAE8C2) ---
org $DAE8C2

    BIT $0F                 ; [24 0F      ] Test Bits DP
    PLD                     ; [2B         ] Pull Direct Page Register
    ORA [$1B]               ; [07 1B      ] OR A with [DP]
    ASL $0F                 ; [06 0F      ] Shift Left DP
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA [$0B]               ; [07 0B      ] OR A with [DP]
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 3B      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    ORA $17171F,X           ; [1F 1F 17 17] OR A with Absolute Long,X
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$07]               ; [07 07      ] OR A with [DP]
    db $0F, $0F                 ; Incomplete/data bytes

;--- Patch at file offset $1AE8E2 (SNES $DAE8E2) ---
org $DAE8E2

    ROL $D2F0               ; [2E F0 D2   ] Rotate Left Absolute
    CPX #$DA                ; [E0 DA      ] Compare X Immediate
    JMP ($E4FA)             ; [6C FA E4   ] Jump Indirect
    INC $B060,X             ; [FE 60 B0   ] Increment Absolute,X

;--- Patch at file offset $1AE8F3 (SNES $DAE8F3) ---
org $DAE8F3

    BEQ $E8E1               ; [F0 EC      ] Branch if Equal
    CPX $E0E0               ; [EC E0 E0   ] Compare X with Absolute
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BVS $E96C               ; [70 70      ] Branch if Overflow Set

;--- Patch at file offset $1AE94E (SNES $DAE94E) ---
org $DAE94E

    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1AE964 (SNES $DAE964) ---
org $DAE964

    TYA                     ; [98         ] Transfer Y to A
    BRK                     ; [00 18      ] Software interrupt
    BRA $E921               ; [80 B8      ] Branch Always
    BRA $E963               ; [80 F8      ] Branch Always
    BRK                     ; [00 A0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AE978 (SNES $DAE978) ---
org $DAE978

    BVC $E9CA               ; [50 50      ] Branch if Overflow Clear
    BPL $E98C               ; [10 10      ] Branch if Plus

;--- Patch at file offset $1AE9CC (SNES $DAE9CC) ---
org $DAE9CC

    AND [$00]               ; [27 00      ] AND A with [DP]
    db $16                      ; Incomplete/data bytes

;--- Patch at file offset $1AE9D6 (SNES $DAE9D6) ---
org $DAE9D6

    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1AE9E6 (SNES $DAE9E6) ---
org $DAE9E6

    INY                     ; [C8         ] Increment Y
    BCS $E9C1               ; [B0 D8      ] Branch if Carry Set
    BCS $E9E3               ; [B0 F8      ] Branch if Carry Set
    RTI                     ; [40         ] Return from Interrupt
    INY                     ; [C8         ] Increment Y
    BRK                     ; [00 50      ] Software interrupt

;--- Patch at file offset $1AE9F9 (SNES $DAE9F9) ---
org $DAE9F9

    BRA $E9C3               ; [80 C8      ] Branch Always
    PHA                     ; [48         ] Push Accumulator

;--- Patch at file offset $1AEA40 (SNES $DAEA40) ---
org $DAEA40

    EOR $093E37             ; [4F 37 3E 09] XOR A with Absolute Long
    EOR $4E02               ; [4D 02 4E   ] XOR A with Absolute
    AND $5B,X               ; [35 5B      ] AND A with DP,X
    BIT $143B               ; [2C 3B 14   ] Test Bits Absolute
    PHD                     ; [0B         ] Push Direct Page Register
    TSB $04                 ; [04 04      ] Test and Set Bits in DP

;--- Patch at file offset $1AEA58 (SNES $DAEA58) ---
org $DAEA58

    ASL $1708               ; [0E 08 17   ] Shift Left Absolute
    BPL $EA64               ; [10 07      ] Branch if Plus
    BRK                     ; [00 03      ] Software interrupt
    ORA $F2,S               ; [03 F2      ] OR A with Stack Relative
    CPX $907E               ; [EC 7E 90   ] Compare X with Absolute
    LDA ($40)               ; [B2 40      ] Load A from (DP)
    ADC ($AC)               ; [72 AC      ] Add with Carry (DP)
    PHX                     ; [DA         ] Push X Register
    BIT $9C,X               ; [34 9C      ] Test Bits DP,X
    PLA                     ; [68         ] Pull Accumulator
    db $A0                      ; Incomplete/data bytes

;--- Patch at file offset $1AEA78 (SNES $DAEA78) ---
org $DAEA78

    BVS $EA8A               ; [70 10      ] Branch if Overflow Set
    PLA                     ; [68         ] Pull Accumulator
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1AEAC6 (SNES $DAEAC6) ---
org $DAEAC6

    JML $245F34             ; [5C 34 5F 24] Jump Long
    AND $081708,X           ; [3F 08 17 08] AND A with Absolute Long,X
    db $11                      ; Incomplete/data bytes

;--- Patch at file offset $1AEAD7 (SNES $DAEAD7) ---
org $DAEAD7

    ORA $07                 ; [05 07      ] OR A with Direct Page
    TSB $0E                 ; [04 0E      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1AEAE2 (SNES $DAEAE2) ---
org $DAEAE2

    INC $F270               ; [EE 70 F2   ] Increment Absolute
    RTS                     ; [60         ] Return from Subroutine
    DEC                     ; [3A         ] Decrement Accumulator
    BIT $A47A               ; [2C 7A A4   ] Test Bits Absolute
    JSR ($E818,X)           ; [FC 18 E8   ] Jump to Subroutine Indirect,X
    BPL $EA77               ; [10 88      ] Branch if Plus
    BRK                     ; [00 DC      ] Software interrupt
    JML $E070F0             ; [5C F0 70 E0] Jump Long
    JMP ($E020)             ; [6C 20 E0   ] Jump Indirect
    CPX #$20                ; [E0 20      ] Compare X Immediate
    SEI                     ; [78         ] Set Interrupt Disable
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $1AEB2C (SNES $DAEB2C) ---
org $DAEB2C

    db $9E                      ; Incomplete/data bytes

;--- Patch at file offset $1AEB3C (SNES $DAEB3C) ---
org $DAEB3C

    RTS                     ; [60         ] Return from Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BIT $30,X               ; [34 30      ] Test Bits DP,X
    AND $1C0A               ; [2D 0A 1C   ] AND A with Absolute
    PLD                     ; [2B         ] Pull Direct Page Register
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA $09,X               ; [15 09      ] OR A with DP,X
    BPL $EB54               ; [10 0B      ] Branch if Plus
    TRB $0B                 ; [14 0B      ] Test and Reset Bits DP
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 1A      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    PLD                     ; [2B         ] Pull Direct Page Register
    PLP                     ; [28         ] Pull Processor Status
    ORA $10,X               ; [15 10      ] OR A with DP,X
    TRB $16                 ; [14 16      ] Test and Reset Bits DP
    ORA [$10],Y             ; [17 10      ] OR A with [DP],Y

;--- Patch at file offset $1AEB7C (SNES $DAEB7C) ---
org $DAEB7C

    BRK                     ; [00 00      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP

;--- Patch at file offset $1AEB8C (SNES $DAEB8C) ---
org $DAEB8C

    LDY $B703,X             ; [BC 03 B7   ] Load Y from Absolute,X

;--- Patch at file offset $1AEBC0 (SNES $DAEBC0) ---
org $DAEBC0

    STA $22,X               ; [95 22      ] Store A to DP,X
    LDY #$17                ; [A0 17      ] Load Y Immediate
    CPX #$1F                ; [E0 1F      ] Compare X Immediate
    TYX                     ; [BB         ] Transfer Y to X
    ORA ($99),Y             ; [11 99      ] OR A with (DP),Y
    BMI $EB7C               ; [30 B1      ] Branch if Minus

;--- Patch at file offset $1AEBD4 (SNES $DAEBD4) ---
org $DAEBD4

    AND $55751F,X           ; [3F 1F 75 55] AND A with Absolute Long,X
    ROR $56,X               ; [76 56      ] Rotate Right DP,X
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AEBE8 (SNES $DAEBE8) ---
org $DAEBE8

    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $1AEC48 (SNES $DAEC48) ---
org $DAEC48

    LDX $5700,Y             ; [BE 00 57   ] Load X from Absolute,Y

;--- Patch at file offset $1AECE4 (SNES $DAECE4) ---
org $DAECE4

    STX $FD65               ; [8E 65 FD   ] Store X to Absolute
    STZ $7F                 ; [64 7F      ] Store Zero to DP
    PHP                     ; [08         ] Push Processor Status
    ORA $002700,X           ; [1F 00 27 00] OR A with Absolute Long,X
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    INC                     ; [1A         ] Increment Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    SEC                     ; [38         ] Set Carry Flag
    ORA $14                 ; [05 14      ] OR A with Direct Page
    TSB $06                 ; [04 06      ] Test and Set Bits in DP
    db $0F, $08                 ; Incomplete/data bytes

;--- Patch at file offset $1AED02 (SNES $DAED02) ---
org $DAED02

    CPX $38                 ; [E4 38      ] Compare X with DP
    INX                     ; [E8         ] Increment X
    BEQ $ED03               ; [F0 FC      ] Branch if Equal
    SEI                     ; [78         ] Set Interrupt Disable
    JSR ($1CF0,X)           ; [FC F0 1C   ] Jump to Subroutine Indirect,X
    BEQ $ECF5               ; [F0 E8      ] Branch if Equal
    BPL $EC97               ; [10 88      ] Branch if Plus
    BRK                     ; [00 D8      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    BEQ $ED06               ; [F0 F0      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag

;--- Patch at file offset $1AED2A (SNES $DAED2A) ---
org $DAED2A

    AND [$28],Y             ; [37 28      ] AND A with [DP],Y
    ORA [$08],Y             ; [17 08      ] OR A with [DP],Y
    db $11                      ; Incomplete/data bytes

;--- Patch at file offset $1AED3A (SNES $DAED3A) ---
org $DAED3A

    db $2E, $20                 ; Incomplete/data bytes

;--- Patch at file offset $1AED48 (SNES $DAED48) ---
org $DAED48

    AND $2F23,Y             ; [39 23 2F   ] AND A with Absolute,Y
    BPL $ED64               ; [10 17      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    db $11                      ; Incomplete/data bytes

;--- Patch at file offset $1AED58 (SNES $DAED58) ---
org $DAED58

    BIT $24                 ; [24 24      ] Test Bits DP

;--- Patch at file offset $1AEDE6 (SNES $DAEDE6) ---
org $DAEDE6

    ROL $E2D0,X             ; [3E D0 E2   ] Rotate Left Absolute,X
    db $DE                      ; Incomplete/data bytes

;--- Patch at file offset $1AEDF6 (SNES $DAEDF6) ---
org $DAEDF6

    ORA ($12)               ; [12 12      ] OR A with (DP)
    db $DE, $0E                 ; Incomplete/data bytes

;--- Patch at file offset $1AEEC2 (SNES $DAEEC2) ---
org $DAEEC2

    BIT $0B,X               ; [34 0B      ] Test Bits DP,X
    LSR $5D05               ; [4E 05 5D   ] Shift Right Absolute
    db $34                      ; Incomplete/data bytes

;--- Patch at file offset $1AEECE (SNES $DAEECE) ---
org $DAEECE

    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    DEC                     ; [3A         ] Decrement Accumulator
    SEC                     ; [38         ] Set Carry Flag
    PHD                     ; [0B         ] Push Direct Page Register
    PHP                     ; [08         ] Push Processor Status
    ORA $34                 ; [05 34      ] OR A with Direct Page
    TSB $06                 ; [04 06      ] Test and Set Bits in DP
    ORA $101E08             ; [0F 08 1E 10] OR A with Absolute Long

;--- Patch at file offset $1AEF02 (SNES $DAEF02) ---
org $DAEF02

    BMI $EF04               ; [30 00      ] Branch if Minus
    BCS $EF56               ; [B0 50      ] Branch if Carry Set
    BMI $EF78               ; [30 70      ] Branch if Minus
    BCS $EF7A               ; [B0 70      ] Branch if Carry Set
    BCS $EF6C               ; [B0 60      ] Branch if Carry Set

;--- Patch at file offset $1AEF14 (SNES $DAEF14) ---
org $DAEF14

    BNE $EF66               ; [D0 50      ] Branch if Not Equal
    BVS $EF88               ; [70 70      ] Branch if Overflow Set
    BEQ $EF8A               ; [F0 70      ] Branch if Equal
    CPX #$60                ; [E0 60      ] Compare X Immediate

;--- Patch at file offset $1AEF6E (SNES $DAEF6E) ---
org $DAEF6E

    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1AEF88 (SNES $DAEF88) ---
org $DAEF88

    ORA $010601,X           ; [1F 01 06 01] OR A with Absolute Long,X
    ORA $02                 ; [05 02      ] OR A with Direct Page
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1AEF99 (SNES $DAEF99) ---
org $DAEF99

    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1AEFA2 (SNES $DAEFA2) ---
org $DAEFA2

    BVC $EFC4               ; [50 20      ] Branch if Overflow Clear
    BVS $EFB6               ; [70 10      ] Branch if Overflow Set
    BEQ $EFA8               ; [F0 00      ] Branch if Equal
    BEQ $EF8A               ; [F0 E0      ] Branch if Equal
    BMI $EF8C               ; [30 E0      ] Branch if Minus
    BCS $EFEE               ; [B0 40      ] Branch if Carry Set
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 C0      ] Software interrupt
    CPY #$A0                ; [C0 A0      ] Compare Y Immediate
    LDY #$90                ; [A0 90      ] Load Y Immediate
    BCC $EFD7               ; [90 20      ] Branch if Carry Clear
    JSR $E0E0               ; [20 E0 E0   ] Jump to Subroutine
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $EF40               ; [80 80      ] Branch Always
    EOR [$3B]               ; [47 3B      ] XOR A with [DP]
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    TSB $074F               ; [0C 4F 07   ] Test and Set Bits Absolute
    EOR $275F36,X           ; [5F 36 5F 27] XOR A with Absolute Long,X
    AND ($0E),Y             ; [31 0E      ] AND A with (DP),Y
    ORA [$08],Y             ; [17 08      ] OR A with [DP],Y
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    SEC                     ; [38         ] Set Carry Flag
    ORA $37370F             ; [0F 0F 37 37] OR A with Absolute Long
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA $1E1E0F             ; [0F 0F 1E 1E] OR A with Absolute Long

;--- Patch at file offset $1B294E (SNES $DB294E) ---
org $DB294E

    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1B296C (SNES $DB296C) ---
org $DB296C

    db $A0                      ; Incomplete/data bytes

;--- End of patch ---