;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; Final Fantasy V vanilla field sprites.ips.commented.asm
;    Disassembled from IPS patch: Final Fantasy V vanilla field sprites.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 202 record(s)

;--- Patch at file offset $13026F (SNES $D3026F) ---
org $D3026F

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13027F (SNES $D3027F) ---
org $D3027F

    db $14                      ; Incomplete/data bytes

;--- Patch at file offset $1302A1 (SNES $D302A1) ---
org $D302A1

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1302B1 (SNES $D302B1) ---
org $D302B1

    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $13030B (SNES $D3030B) ---
org $D3030B

    BRK                     ; [00 27      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13031B (SNES $D3031B) ---
org $D3031B

    TSB $18                 ; [04 18      ] Test and Set Bits in DP
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $13032F (SNES $D3032F) ---
org $D3032F

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13033F (SNES $D3033F) ---
org $D3033F

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $130361 (SNES $D30361) ---
org $D30361

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $130371 (SNES $D30371) ---
org $D30371

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1303A1 (SNES $D303A1) ---
org $D303A1

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1303B1 (SNES $D303B1) ---
org $D303B1

    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $130445 (SNES $D30445) ---
org $D30445

    BRK                     ; [00 14      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $130455 (SNES $D30455) ---
org $D30455

    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1304CD (SNES $D304CD) ---
org $D304CD

    BRK                     ; [00 49      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1304DD (SNES $D304DD) ---
org $D304DD

    PLP                     ; [28         ] Pull Processor Status
    BMI $04EE               ; [30 0E      ] Branch if Minus

;--- Patch at file offset $130561 (SNES $D30561) ---
org $D30561

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $130571 (SNES $D30571) ---
org $D30571

    db $0C                      ; Incomplete/data bytes

;--- Patch at file offset $1305ED (SNES $D305ED) ---
org $D305ED

    BRK                     ; [00 EF      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1305FD (SNES $D305FD) ---
org $D305FD

    BVC $064F               ; [50 50      ] Branch if Overflow Clear
    ASL                     ; [0A         ] Shift Left Accumulator

;--- Patch at file offset $1306C3 (SNES $D306C3) ---
org $D306C3

    BRK                     ; [00 64      ] Software interrupt
    BRK                     ; [00 27      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1306D3 (SNES $D306D3) ---
org $D306D3

    TSB $0718               ; [0C 18 07   ] Test and Set Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1306EB (SNES $D306EB) ---
org $D306EB

    COP #$46                ; [02 46      ] Coprocessor interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1306FB (SNES $D306FB) ---
org $D306FB

    PHA                     ; [48         ] Push Accumulator
    BMI $06C6               ; [30 C8      ] Branch if Minus

;--- Patch at file offset $1307AF (SNES $D307AF) ---
org $D307AF

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1307BF (SNES $D307BF) ---
org $D307BF

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1307EF (SNES $D307EF) ---
org $D307EF

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1307FF (SNES $D307FF) ---
org $D307FF

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1AD842 (SNES $DAD842) ---
org $DAD842

    ADC $335F20,X           ; [7F 20 5F 33] Add with Carry Absolute Long,X
    ROR $2F23,X             ; [7E 23 2F   ] Rotate Right Absolute,X
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $1AD852 (SNES $DAD852) ---
org $DAD852

    TSB $24                 ; [04 24      ] Test and Set Bits in DP
    TSB $17                 ; [04 17      ] Test and Set Bits in DP
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AD8A4 (SNES $DAD8A4) ---
org $DAD8A4

    db $F4, $78                 ; Incomplete/data bytes

;--- Patch at file offset $1AD8B4 (SNES $DAD8B4) ---
org $DAD8B4

    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $1AD8C2 (SNES $DAD8C2) ---
org $DAD8C2

    db $3F, $17                 ; Incomplete/data bytes

;--- Patch at file offset $1AD8CA (SNES $DAD8CA) ---
org $DAD8CA

    db $0F, $07                 ; Incomplete/data bytes

;--- Patch at file offset $1AD8D2 (SNES $DAD8D2) ---
org $DAD8D2

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AD8DA (SNES $DAD8DA) ---
org $DAD8DA

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AD8E2 (SNES $DAD8E2) ---
org $DAD8E2

    INC $FAEC,X             ; [FE EC FA   ] Increment Absolute,X
    db $EC, $7E                 ; Incomplete/data bytes

;--- Patch at file offset $1AD8F2 (SNES $DAD8F2) ---
org $DAD8F2

    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$CC                ; [C0 CC      ] Compare Y Immediate

;--- Patch at file offset $1AD94A (SNES $DAD94A) ---
org $DAD94A

    ORA $03                 ; [05 03      ] OR A with Direct Page

;--- Patch at file offset $1AD95A (SNES $DAD95A) ---
org $DAD95A

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AD964 (SNES $DAD964) ---
org $DAD964

    BEQ $D9A6               ; [F0 40      ] Branch if Equal
    BVS $D948               ; [70 E0      ] Branch if Overflow Set

;--- Patch at file offset $1AD974 (SNES $DAD974) ---
org $DAD974

    JSR $0060               ; [20 60 00   ] Jump to Subroutine
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1AD9CA (SNES $DAD9CA) ---
org $DAD9CA

    PHD                     ; [0B         ] Push Direct Page Register
    ORA [$15]               ; [07 15      ] OR A with [DP]
    db $0F, $0F                 ; Incomplete/data bytes

;--- Patch at file offset $1AD9DA (SNES $DAD9DA) ---
org $DAD9DA

    BRK                     ; [00 01      ] Software interrupt
    db $0C                      ; Incomplete/data bytes

;--- Patch at file offset $1AD9E4 (SNES $DAD9E4) ---
org $DAD9E4

    SED                     ; [F8         ] Set Decimal Flag
    BCC $D9D3               ; [90 EC      ] Branch if Carry Clear
    CLV                     ; [B8         ] Clear Overflow Flag
    JSR ($F8D8,X)           ; [FC D8 F8   ] Jump to Subroutine Indirect,X
    CPX #$B8                ; [E0 B8      ] Compare X Immediate
    db $70                      ; Incomplete/data bytes

;--- Patch at file offset $1AD9F4 (SNES $DAD9F4) ---
org $DAD9F4

    JSR $80B0               ; [20 B0 80   ] Jump to Subroutine
    LDY #$00                ; [A0 00      ] Load Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $DA2D               ; [80 30      ] Branch Always

;--- Patch at file offset $1ADA42 (SNES $DADA42) ---
org $DADA42

    db $7F, $3B                 ; Incomplete/data bytes

;--- Patch at file offset $1ADA4A (SNES $DADA4A) ---
org $DADA4A

    db $0F, $07                 ; Incomplete/data bytes

;--- Patch at file offset $1ADA52 (SNES $DADA52) ---
org $DADA52

    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    COP #$03                ; [02 03      ] Coprocessor interrupt
    BRK                     ; [00 07      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADA62 (SNES $DADA62) ---
org $DADA62

    INC $FED4,X             ; [FE D4 FE   ] Increment Absolute,X

;--- Patch at file offset $1ADA72 (SNES $DADA72) ---
org $DADA72

    PHP                     ; [08         ] Push Processor Status
    TRB $6800               ; [1C 00 68   ] Test and Reset Bits Absolute

;--- Patch at file offset $1ADAC2 (SNES $DADAC2) ---
org $DADAC2

    ADC $337F38             ; [6F 38 7F 33] Add with Carry Absolute Long
    LSR $2F33,X             ; [5E 33 2F   ] Shift Right Absolute,X
    ORA [$1F],Y             ; [17 1F      ] OR A with [DP],Y
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1ADAD2 (SNES $DADAD2) ---
org $DADAD2

    BRK                     ; [00 08      ] Software interrupt
    TSB $37                 ; [04 37      ] Test and Set Bits in DP
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADAE2 (SNES $DADAE2) ---
org $DADAE2

    INC $4C,X               ; [F6 4C      ] Increment DP,X
    INC $7ACC,X             ; [FE CC 7A   ] Increment Absolute,X
    CPY $E8F4               ; [CC F4 E8   ] Compare Y with Absolute
    SED                     ; [F8         ] Set Decimal Flag
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $1ADAF2 (SNES $DADAF2) ---
org $DADAF2

    JSR $2060               ; [20 60 20   ] Jump to Subroutine
    CPX $C0C0               ; [EC C0 C0   ] Compare X with Absolute
    BRK                     ; [00 E0      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADB0C (SNES $DADB0C) ---
org $DADB0C

    AND $153A19,X           ; [3F 19 3A 15] AND A with Absolute Long,X

;--- Patch at file offset $1ADB1C (SNES $DADB1C) ---
org $DADB1C

    BRK                     ; [00 18      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADB2C (SNES $DADB2C) ---
org $DADB2C

    ADC $315A31,X           ; [7F 31 5A 31] Add with Carry Absolute Long,X

;--- Patch at file offset $1ADB3C (SNES $DADB3C) ---
org $DADB3C

    BRK                     ; [00 30      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    db $3C, $1B                 ; Incomplete/data bytes

;--- Patch at file offset $1ADB4B (SNES $DADB4B) ---
org $DADB4B

    ORA [$0E]               ; [07 0E      ] OR A with [DP]
    ORA [$06]               ; [07 06      ] OR A with [DP]
    ORA $00,S               ; [03 00      ] OR A with Stack Relative

;--- Patch at file offset $1ADB5A (SNES $DADB5A) ---
org $DADB5A

    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)

;--- Patch at file offset $1ADB6C (SNES $DADB6C) ---
org $DADB6C

    ADC $357E39             ; [6F 39 7E 35] Add with Carry Absolute Long

;--- Patch at file offset $1ADB7C (SNES $DADB7C) ---
org $DADB7C

    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt

;--- Patch at file offset $1ADBE4 (SNES $DADBE4) ---
org $DADBE4

    ROR $DFB7,X             ; [7E B7 DF   ] Rotate Right Absolute,X
    AND [$BF],Y             ; [37 BF      ] AND A with [DP],Y
    BEQ $DBDB               ; [F0 F0      ] Branch if Equal

;--- Patch at file offset $1ADBF4 (SNES $DADBF4) ---
org $DADBF4

    STA $33,S               ; [83 33      ] Store A to Stack Relative
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt

;--- Patch at file offset $1ADC47 (SNES $DADC47) ---
org $DADC47

    db $7F, $7F, $3D            ; Incomplete/data bytes

;--- Patch at file offset $1ADC56 (SNES $DADC56) ---
org $DADC56

    ADC ($77),Y             ; [71 77      ] Add with Carry (DP),Y
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $1ADC6E (SNES $DADC6E) ---
org $DADC6E

    db $7F                      ; Incomplete/data bytes

;--- Patch at file offset $1ADC7F (SNES $DADC7F) ---
org $DADC7F

    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $1ADC8F (SNES $DADC8F) ---
org $DADC8F

    PLA                     ; [68         ] Pull Accumulator

;--- Patch at file offset $1ADC9E (SNES $DADC9E) ---
org $DADC9E

    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1ADCE0 (SNES $DADCE0) ---
org $DADCE0

    db $BD                      ; Incomplete/data bytes

;--- Patch at file offset $1ADCE8 (SNES $DADCE8) ---
org $DADCE8

    TSC                     ; [3B         ] Transfer Stack Pointer to A
    ORA $1E1E29             ; [0F 29 1E 1E] OR A with Absolute Long
    TSB $040F               ; [0C 0F 04   ] Test and Set Bits Absolute
    BPL $DD0A               ; [10 18      ] Branch if Plus

;--- Patch at file offset $1ADCF8 (SNES $DADCF8) ---
org $DADCF8

    BRK                     ; [00 03      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    TSB $040C               ; [0C 0C 04   ] Test and Set Bits Absolute
    TSB $FC                 ; [04 FC      ] Test and Set Bits in DP
    SEC                     ; [38         ] Set Carry Flag

;--- Patch at file offset $1ADD0B (SNES $DADD0B) ---
org $DADD0B

    RTS                     ; [60         ] Return from Subroutine
    BEQ $DD6E               ; [F0 60      ] Branch if Equal
    INX                     ; [E8         ] Increment X
    BVS $DD11               ; [70 00      ] Branch if Overflow Set
    SEC                     ; [38         ] Set Carry Flag

;--- Patch at file offset $1ADD1A (SNES $DADD1A) ---
org $DADD1A

    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BVS $DD90               ; [70 70      ] Branch if Overflow Set
    EOR $2F3A,X             ; [5D 3A 2F   ] XOR A with Absolute,X
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $1ADD2B (SNES $DADD2B) ---
org $DADD2B

    ASL $0F                 ; [06 0F      ] Shift Left DP
    ASL $17                 ; [06 17      ] Shift Left DP
    ASL $0800               ; [0E 00 08   ] Shift Left Absolute
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1ADD3A (SNES $DADD3A) ---
org $DADD3A

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADD44 (SNES $DADD44) ---
org $DADD44

    SBC $73FF78,X           ; [FF 78 FF 73] Subtract with Borrow Absolute Long,X
    ROR $1B03,X             ; [7E 03 1B   ] Rotate Right Absolute,X
    db $0F, $0F, $06            ; Incomplete/data bytes

;--- Patch at file offset $1ADD54 (SNES $DADD54) ---
org $DADD54

    TSB $1C                 ; [04 1C      ] Test and Set Bits in DP
    TSB $67                 ; [04 67      ] Test and Set Bits in DP
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 03      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADD6E (SNES $DADD6E) ---
org $DADD6E

    PLX                     ; [FA         ] Pull X Register

;--- Patch at file offset $1ADD7E (SNES $DADD7E) ---
org $DADD7E

    TSB $70                 ; [04 70      ] Test and Set Bits in DP

;--- Patch at file offset $1ADD8E (SNES $DADD8E) ---
org $DADD8E

    db $5F                      ; Incomplete/data bytes

;--- Patch at file offset $1ADD9E (SNES $DADD9E) ---
org $DADD9E

    db $20, $0E                 ; Incomplete/data bytes

;--- Patch at file offset $1ADDE0 (SNES $DADDE0) ---
org $DADDE0

    AND [$DE],Y             ; [37 DE      ] AND A with [DP],Y
    SBC $FE06,Y             ; [F9 06 FE   ] Subtract with Borrow Absolute,Y
    CPY #$70                ; [C0 70      ] Compare Y Immediate
    CPY #$D8                ; [C0 D8      ] Compare Y Immediate
    BEQ $DDB3               ; [F0 C8      ] Branch if Equal
    BEQ $DDBD               ; [F0 D0      ] Branch if Equal
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 16      ] Software interrupt
    JSR $2020               ; [20 20 20   ] Jump to Subroutine
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $DD7B               ; [80 80      ] Branch Always
    BRA $DDBD               ; [80 C0      ] Branch Always

;--- Patch at file offset $1ADE04 (SNES $DADE04) ---
org $DADE04

    db $F4, $78                 ; Incomplete/data bytes

;--- Patch at file offset $1ADE0C (SNES $DADE0C) ---
org $DADE0C

    JSR ($FC28,X)           ; [FC 28 FC   ] Jump to Subroutine Indirect,X
    TYA                     ; [98         ] Transfer Y to A
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    TSB $20                 ; [04 20      ] Test and Set Bits in DP
    BRK                     ; [00 40      ] Software interrupt
    BNE $DE01               ; [D0 E0      ] Branch if Not Equal
    BRK                     ; [00 D8      ] Software interrupt
    CPX #$F6                ; [E0 F6      ] Compare X Immediate
    SEI                     ; [78         ] Set Interrupt Disable
    SBC $FDF6,X             ; [FD F6 FD   ] Subtract with Borrow Absolute,X
    PLX                     ; [FA         ] Pull X Register
    INC $FEF4,X             ; [FE F4 FE   ] Increment Absolute,X
    BIT $9CFA               ; [2C FA 9C   ] Test Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    TSB $20                 ; [04 20      ] Test and Set Bits in DP
    BRK                     ; [00 40      ] Software interrupt

;--- Patch at file offset $1ADEC0 (SNES $DADEC0) ---
org $DADEC0

    ADC $7F3A,X             ; [7D 3A 7F   ] Add with Carry Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    LDA $63FE73,X           ; [BF 73 FE 63] Load A from Absolute Long,X
    ADC $060F07             ; [6F 07 0F 06] Add with Carry Absolute Long
    ORA $0E1706             ; [0F 06 17 0E] OR A with Absolute Long
    BRK                     ; [00 18      ] Software interrupt
    TSB $2C                 ; [04 2C      ] Test and Set Bits in DP
    TSB $17                 ; [04 17      ] Test and Set Bits in DP
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADEEC (SNES $DADEEC) ---
org $DADEEC

    JSR ($D818,X)           ; [FC 18 D8   ] Jump to Subroutine Indirect,X
    db $70                      ; Incomplete/data bytes

;--- Patch at file offset $1ADEFC (SNES $DADEFC) ---
org $DADEFC

    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    BMI $DEF3               ; [30 F0      ] Branch if Minus
    db $A0                      ; Incomplete/data bytes

;--- Patch at file offset $1ADF0A (SNES $DADF0A) ---
org $DADF0A

    CPX #$80                ; [E0 80      ] Compare X Immediate
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $DF10               ; [80 00      ] Branch Always
    BRA $DE92               ; [80 80      ] Branch Always
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADF1A (SNES $DADF1A) ---
org $DADF1A

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADF6A (SNES $DADF6A) ---
org $DADF6A

    ORA $03                 ; [05 03      ] OR A with Direct Page

;--- Patch at file offset $1ADF7A (SNES $DADF7A) ---
org $DADF7A

    BRK                     ; [00 00      ] Software interrupt
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    ORA $3F06,Y             ; [19 06 3F   ] OR A with Absolute,Y
    ORA $1F24,Y             ; [19 24 1F   ] OR A with Absolute,Y
    AND $001F1F,X           ; [3F 1F 1F 00] AND A with Absolute Long,X
    ORA $03                 ; [05 03      ] OR A with Direct Page

;--- Patch at file offset $1ADF92 (SNES $DADF92) ---
org $DADF92

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADFA3 (SNES $DADFA3) ---
org $DADFA3

    BRA $DF85               ; [80 E0      ] Branch Always
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPX #$80                ; [E0 80      ] Compare X Immediate

;--- Patch at file offset $1ADFB2 (SNES $DADFB2) ---
org $DADFB2

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 C0      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADFC2 (SNES $DADFC2) ---
org $DADFC2

    ADC $377F37,X           ; [7F 37 7F 37] Add with Carry Absolute Long,X
    LSR $2F23,X             ; [5E 23 2F   ] Shift Right Absolute,X
    ORA [$09]               ; [07 09      ] OR A with [DP]
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1ADFD2 (SNES $DADFD2) ---
org $DADFD2

    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 37      ] Software interrupt
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE017 (SNES $DAE017) ---
org $DAE017

    db $1E                      ; Incomplete/data bytes

;--- Patch at file offset $1AE046 (SNES $DAE046) ---
org $DAE046

    db $3F                      ; Incomplete/data bytes

;--- Patch at file offset $1AE04F (SNES $DAE04F) ---
org $DAE04F

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    ASL $11                 ; [06 11      ] Shift Left DP
    db $13                      ; Incomplete/data bytes

;--- Patch at file offset $1AE05E (SNES $DAE05E) ---
org $DAE05E

    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1AE06D (SNES $DAE06D) ---
org $DAE06D

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE07C (SNES $DAE07C) ---
org $DAE07C

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AE0B7 (SNES $DAE0B7) ---
org $DAE0B7

    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $1AE0CF (SNES $DAE0CF) ---
org $DAE0CF

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE0DE (SNES $DAE0DE) ---
org $DAE0DE

    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1AE0ED (SNES $DAE0ED) ---
org $DAE0ED

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE0F4 (SNES $DAE0F4) ---
org $DAE0F4

    BRK                     ; [00 C0      ] Software interrupt

;--- Patch at file offset $1AE0FC (SNES $DAE0FC) ---
org $DAE0FC

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AE12A (SNES $DAE12A) ---
org $DAE12A

    db $B4                      ; Incomplete/data bytes

;--- Patch at file offset $1AE13B (SNES $DAE13B) ---
org $DAE13B

    CLD                     ; [D8         ] Clear Decimal Flag

;--- Patch at file offset $1AE148 (SNES $DAE148) ---
org $DAE148

    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1AE164 (SNES $DAE164) ---
org $DAE164

    LDY #$C0                ; [A0 C0      ] Load Y Immediate
    db $E0                      ; Incomplete/data bytes

;--- Patch at file offset $1AE16F (SNES $DAE16F) ---
org $DAE16F

    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $E0F6               ; [80 80      ] Branch Always

;--- Patch at file offset $1AE17E (SNES $DAE17E) ---
org $DAE17E

    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1AE1A8 (SNES $DAE1A8) ---
org $DAE1A8

    db $B6                      ; Incomplete/data bytes

;--- Patch at file offset $1AE1B9 (SNES $DAE1B9) ---
org $DAE1B9

    db $EC                      ; Incomplete/data bytes

;--- Patch at file offset $1AE1CF (SNES $DAE1CF) ---
org $DAE1CF

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE1DE (SNES $DAE1DE) ---
org $DAE1DE

    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    CPX #$00                ; [E0 00      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRA $E245               ; [80 60      ] Branch Always

;--- Patch at file offset $1AE1ED (SNES $DAE1ED) ---
org $DAE1ED

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AE1F4 (SNES $DAE1F4) ---
org $DAE1F4

    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AE1FC (SNES $DAE1FC) ---
org $DAE1FC

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1AE246 (SNES $DAE246) ---
org $DAE246

    db $3F                      ; Incomplete/data bytes

;--- Patch at file offset $1AE24F (SNES $DAE24F) ---
org $DAE24F

    BRK                     ; [00 00      ] Software interrupt
    TSB $0000               ; [0C 00 00   ] Test and Set Bits Absolute
    BRK                     ; [00 04      ] Software interrupt
    ORA ($13),Y             ; [11 13      ] OR A with (DP),Y

;--- Patch at file offset $1AE25E (SNES $DAE25E) ---
org $DAE25E

    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1AE26D (SNES $DAE26D) ---
org $DAE26D

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE275 (SNES $DAE275) ---
org $DAE275

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1AE27C (SNES $DAE27C) ---
org $DAE27C

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AE2AA (SNES $DAE2AA) ---
org $DAE2AA

    PHX                     ; [DA         ] Push X Register

;--- Patch at file offset $1AE2BB (SNES $DAE2BB) ---
org $DAE2BB

    db $EC                      ; Incomplete/data bytes

;--- Patch at file offset $1AE2C6 (SNES $DAE2C6) ---
org $DAE2C6

    db $3F                      ; Incomplete/data bytes

;--- Patch at file offset $1AE2D5 (SNES $DAE2D5) ---
org $DAE2D5

    ASL $11                 ; [06 11      ] Shift Left DP
    db $13                      ; Incomplete/data bytes

;--- Patch at file offset $1AE2E6 (SNES $DAE2E6) ---
org $DAE2E6

    db $FC                      ; Incomplete/data bytes

;--- Patch at file offset $1AE2F5 (SNES $DAE2F5) ---
org $DAE2F5

    RTS                     ; [60         ] Return from Subroutine
    DEY                     ; [88         ] Decrement Y
    INY                     ; [C8         ] Increment Y

;--- Patch at file offset $1AE32E (SNES $DAE32E) ---
org $DAE32E

    PLY                     ; [7A         ] Pull Y Register

;--- Patch at file offset $1AE33F (SNES $DAE33F) ---
org $DAE33F

    db $20, $3C                 ; Incomplete/data bytes

;--- Patch at file offset $1AE34D (SNES $DAE34D) ---
org $DAE34D

    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE35C (SNES $DAE35C) ---
org $DAE35C

    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1AE3C2 (SNES $DAE3C2) ---
org $DAE3C2

    db $CF                      ; Incomplete/data bytes

;--- Patch at file offset $1AE3D3 (SNES $DAE3D3) ---
org $DAE3D3

    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $1AE3E1 (SNES $DAE3E1) ---
org $DAE3E1

    LDY $AC53               ; [AC 53 AC   ] Load Y from Absolute
    EOR ($BE),Y             ; [51 BE      ] XOR A with (DP),Y
    db $DF, $AC, $FE            ; Incomplete/data bytes

;--- Patch at file offset $1AE3F0 (SNES $DAE3F0) ---
org $DAE3F0

    COP #$0A                ; [02 0A      ] Coprocessor interrupt
    BPL $E410               ; [10 1C      ] Branch if Plus
    ORA ($39,X)             ; [01 39      ] OR A with (DP,X)
    COP #$22                ; [02 22      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1AE417 (SNES $DAE417) ---
org $DAE417

    db $1E                      ; Incomplete/data bytes

;--- Patch at file offset $1AE442 (SNES $DAE442) ---
org $DAE442

    ORA $0E,X               ; [15 0E      ] OR A with DP,X
    ROL $7901,X             ; [3E 01 79   ] Rotate Left Absolute,X
    ORA [$3E]               ; [07 3E      ] OR A with [DP]
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $1AE451 (SNES $DAE451) ---
org $DAE451

    BRK                     ; [00 00      ] Software interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ORA ($38,X)             ; [01 38      ] OR A with (DP,X)
    db $39, $18                 ; Incomplete/data bytes

;--- Patch at file offset $1AE4E2 (SNES $DAE4E2) ---
org $DAE4E2

    ORA [$0C],Y             ; [17 0C      ] OR A with [DP],Y
    db $1E                      ; Incomplete/data bytes

;--- Patch at file offset $1AE4F2 (SNES $DAE4F2) ---
org $DAE4F2

    BRK                     ; [00 00      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA #$01                ; [09 01      ] OR A with Immediate
    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $1AE511 (SNES $DAE511) ---
org $DAE511

    db $D0                      ; Incomplete/data bytes

;--- Patch at file offset $1AE520 (SNES $DAE520) ---
org $DAE520

    db $3D                      ; Incomplete/data bytes

;--- Patch at file offset $1AE531 (SNES $DAE531) ---
org $DAE531

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE540 (SNES $DAE540) ---
org $DAE540

    DEC                     ; [3A         ] Decrement Accumulator
    db $05                      ; Incomplete/data bytes

;--- Patch at file offset $1AE577 (SNES $DAE577) ---
org $DAE577

    db $1E                      ; Incomplete/data bytes

;--- Patch at file offset $1AE5B9 (SNES $DAE5B9) ---
org $DAE5B9

    db $1E                      ; Incomplete/data bytes

;--- Patch at file offset $1AE5E4 (SNES $DAE5E4) ---
org $DAE5E4

    db $02                      ; Incomplete/data bytes

;--- Patch at file offset $1AE5ED (SNES $DAE5ED) ---
org $DAE5ED

    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $1AE5F4 (SNES $DAE5F4) ---
org $DAE5F4

    BRK                     ; [00 30      ] Software interrupt

;--- Patch at file offset $1AE5FC (SNES $DAE5FC) ---
org $DAE5FC

    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1AE60A (SNES $DAE60A) ---
org $DAE60A

    AND $001700             ; [2F 00 17 00] AND A with Absolute Long
    db $BE, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1AE617 (SNES $DAE617) ---
org $DAE617

    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 F6      ] Software interrupt
    BRK                     ; [00 FA      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt

;--- Patch at file offset $1AE62A (SNES $DAE62A) ---
org $DAE62A

    PLD                     ; [2B         ] Pull Direct Page Register
    BRK                     ; [00 17      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE637 (SNES $DAE637) ---
org $DAE637

    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 F6      ] Software interrupt
    BRK                     ; [00 FA      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt

;--- Patch at file offset $1AE697 (SNES $DAE697) ---
org $DAE697

    db $1E                      ; Incomplete/data bytes

;--- Patch at file offset $1AE6C4 (SNES $DAE6C4) ---
org $DAE6C4

    db $2C                      ; Incomplete/data bytes

;--- Patch at file offset $1AE6D3 (SNES $DAE6D3) ---
org $DAE6D3

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE700 (SNES $DAE700) ---
org $DAE700

    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $1AE70F (SNES $DAE70F) ---
org $DAE70F

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE71E (SNES $DAE71E) ---
org $DAE71E

    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1AE760 (SNES $DAE760) ---
org $DAE760

    ORA ($0E,S),Y           ; [13 0E      ] OR A with (SR),Y
    db $0E                      ; Incomplete/data bytes

;--- Patch at file offset $1AE782 (SNES $DAE782) ---
org $DAE782

    db $1F, $03, $25            ; Incomplete/data bytes

;--- Patch at file offset $1AE793 (SNES $DAE793) ---
org $DAE793

    BRK                     ; [00 04      ] Software interrupt
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1AE7AF (SNES $DAE7AF) ---
org $DAE7AF

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE7BE (SNES $DAE7BE) ---
org $DAE7BE

    BRA $E740               ; [80 80      ] Branch Always
    ORA $0C1300             ; [0F 00 13 0C] OR A with Absolute Long
    BIT $3F1B,X             ; [3C 1B 3F   ] Test Bits Absolute,X
    ORA ($1A)               ; [12 1A      ] OR A with (DP)
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $1AE7D4 (SNES $DAE7D4) ---
org $DAE7D4

    BRK                     ; [00 03      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 05      ] Software interrupt

;--- Patch at file offset $1AEFB6 (SNES $DAEFB6) ---
org $DAEFB6

    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AF030 (SNES $DAF030) ---
org $DAF030

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1AF0A4 (SNES $DAF0A4) ---
org $DAF0A4

    DEY                     ; [88         ] Decrement Y

;--- Patch at file offset $1AF0B1 (SNES $DAF0B1) ---
org $DAF0B1

    BRK                     ; [00 C0      ] Software interrupt
    CPX #$70                ; [E0 70      ] Compare X Immediate
    BVS $F0A7               ; [70 F0      ] Branch if Overflow Set

;--- Patch at file offset $1AF122 (SNES $DAF122) ---
org $DAF122

    db $A0                      ; Incomplete/data bytes

;--- Patch at file offset $1AF133 (SNES $DAF133) ---
org $DAF133

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AF1A2 (SNES $DAF1A2) ---
org $DAF1A2

    db $A0                      ; Incomplete/data bytes

;--- Patch at file offset $1AF1B3 (SNES $DAF1B3) ---
org $DAF1B3

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AF226 (SNES $DAF226) ---
org $DAF226

    PHA                     ; [48         ] Push Accumulator

;--- Patch at file offset $1AF233 (SNES $DAF233) ---
org $DAF233

    BRK                     ; [00 E0      ] Software interrupt
    CPX #$B0                ; [E0 B0      ] Compare X Immediate
    db $B0                      ; Incomplete/data bytes

;--- Patch at file offset $1AF2A2 (SNES $DAF2A2) ---
org $DAF2A2

    db $50                      ; Incomplete/data bytes

;--- Patch at file offset $1AF2B3 (SNES $DAF2B3) ---
org $DAF2B3

    db $A0                      ; Incomplete/data bytes

;--- Patch at file offset $1AF408 (SNES $DAF408) ---
org $DAF408

    WDM #$00                ; [42 00      ] Reserved (WDM)
    STA ($00)               ; [92 00      ] Store A to (DP)
    db $A4                      ; Incomplete/data bytes

;--- Patch at file offset $1AF419 (SNES $DAF419) ---
org $DAF419

    AND $6D25,X             ; [3D 25 6D   ] AND A with Absolute,X
    PHD                     ; [0B         ] Push Direct Page Register
    TCD                     ; [5B         ] Transfer A to Direct Page

;--- Patch at file offset $1AF491 (SNES $DAF491) ---
org $DAF491

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AF4C4 (SNES $DAF4C4) ---
org $DAF4C4

    db $90                      ; Incomplete/data bytes

;--- Patch at file offset $1AF4D5 (SNES $DAF4D5) ---
org $DAF4D5

    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $1AF591 (SNES $DAF591) ---
org $DAF591

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AF5D3 (SNES $DAF5D3) ---
org $DAF5D3

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AF604 (SNES $DAF604) ---
org $DAF604

    db $8C                      ; Incomplete/data bytes

;--- Patch at file offset $1AF611 (SNES $DAF611) ---
org $DAF611

    BRK                     ; [00 C0      ] Software interrupt
    CPX #$70                ; [E0 70      ] Compare X Immediate
    db $70                      ; Incomplete/data bytes

;--- Patch at file offset $1AF624 (SNES $DAF624) ---
org $DAF624

    db $8E                      ; Incomplete/data bytes

;--- Patch at file offset $1AF635 (SNES $DAF635) ---
org $DAF635

    db $70                      ; Incomplete/data bytes

;--- Patch at file offset $1AF671 (SNES $DAF671) ---
org $DAF671

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AF6B1 (SNES $DAF6B1) ---
org $DAF6B1

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AF722 (SNES $DAF722) ---
org $DAF722

    db $11                      ; Incomplete/data bytes

;--- Patch at file offset $1AF733 (SNES $DAF733) ---
org $DAF733

    db $0E                      ; Incomplete/data bytes

;--- End of patch ---