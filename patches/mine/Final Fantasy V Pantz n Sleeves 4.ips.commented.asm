;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; Final Fantasy V Pantz n Sleeves 4.ips.commented.asm
;    Disassembled from IPS patch: Final Fantasy V Pantz n Sleeves 4.ips
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

    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $13027F (SNES $D3027F) ---
org $D3027F

    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1302A1 (SNES $D302A1) ---
org $D302A1

    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1302B1 (SNES $D302B1) ---
org $D302B1

    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $13030B (SNES $D3030B) ---
org $D3030B

    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $13031B (SNES $D3031B) ---
org $D3031B

    BRK                     ; [00 18      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13032F (SNES $D3032F) ---
org $D3032F

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $13033F (SNES $D3033F) ---
org $D3033F

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $130361 (SNES $D30361) ---
org $D30361

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $130371 (SNES $D30371) ---
org $D30371

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1303A1 (SNES $D303A1) ---
org $D303A1

    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1303B1 (SNES $D303B1) ---
org $D303B1

    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $130445 (SNES $D30445) ---
org $D30445

    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $130455 (SNES $D30455) ---
org $D30455

    BRK                     ; [00 0B      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1304CD (SNES $D304CD) ---
org $D304CD

    PHP                     ; [08         ] Push Processor Status
    EOR #$08                ; [49 08      ] XOR A with Immediate

;--- Patch at file offset $1304DD (SNES $D304DD) ---
org $D304DD

    JSR $0630               ; [20 30 06   ] Jump to Subroutine

;--- Patch at file offset $130561 (SNES $D30561) ---
org $D30561

    db $0C                      ; Incomplete/data bytes

;--- Patch at file offset $130571 (SNES $D30571) ---
org $D30571

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1305ED (SNES $D305ED) ---
org $D305ED

    BPL $05DE               ; [10 EF      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1305FD (SNES $D305FD) ---
org $D305FD

    RTI                     ; [40         ] Return from Interrupt
    BVC $0602               ; [50 02      ] Branch if Overflow Clear

;--- Patch at file offset $1306C3 (SNES $D306C3) ---
org $D306C3

    TSB $64                 ; [04 64      ] Test and Set Bits in DP
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1306D3 (SNES $D306D3) ---
org $D306D3

    PHP                     ; [08         ] Push Processor Status
    CLC                     ; [18         ] Clear Carry Flag
    ORA $18,S               ; [03 18      ] OR A with Stack Relative
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1306EB (SNES $D306EB) ---
org $D306EB

    WDM #$46                ; [42 46      ] Reserved (WDM)
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1306FB (SNES $D306FB) ---
org $D306FB

    PHP                     ; [08         ] Push Processor Status
    BMI $0686               ; [30 88      ] Branch if Minus

;--- Patch at file offset $1307AF (SNES $D307AF) ---
org $D307AF

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1307BF (SNES $D307BF) ---
org $D307BF

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1307EF (SNES $D307EF) ---
org $D307EF

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1307FF (SNES $D307FF) ---
org $D307FF

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AD842 (SNES $DAD842) ---
org $DAD842

    EOR $234F00             ; [4F 00 4F 23] XOR A with Absolute Long
    ROR $2F23,X             ; [7E 23 2F   ] Rotate Right Absolute,X
    ORA [$08]               ; [07 08      ] OR A with [DP]
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AD852 (SNES $DAD852) ---
org $DAD852

    BIT $04,X               ; [34 04      ] Test Bits DP,X
    BIT $07,X               ; [34 07      ] Test Bits DP,X
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $1AD8A4 (SNES $DAD8A4) ---
org $DAD8A4

    STZ $F8,X               ; [74 F8      ] Store Zero to DP,X

;--- Patch at file offset $1AD8B4 (SNES $DAD8B4) ---
org $DAD8B4

    SED                     ; [F8         ] Set Decimal Flag

;--- Patch at file offset $1AD8C2 (SNES $DAD8C2) ---
org $DAD8C2

    db $2F, $07                 ; Incomplete/data bytes

;--- Patch at file offset $1AD8CA (SNES $DAD8CA) ---
org $DAD8CA

    PHP                     ; [08         ] Push Processor Status
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AD8D2 (SNES $DAD8D2) ---
org $DAD8D2

    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1AD8DA (SNES $DAD8DA) ---
org $DAD8DA

    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $1AD8E2 (SNES $DAD8E2) ---
org $DAD8E2

    SBC ($E0)               ; [F2 E0      ] Subtract with Borrow (DP)
    SBC ($E0)               ; [F2 E0      ] Subtract with Borrow (DP)
    db $72                      ; Incomplete/data bytes

;--- Patch at file offset $1AD8F2 (SNES $DAD8F2) ---
org $DAD8F2

    TSB $0CE0               ; [0C E0 0C   ] Test and Set Bits Absolute
    CPX #$CC                ; [E0 CC      ] Compare X Immediate
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1AD94A (SNES $DAD94A) ---
org $DAD94A

    TSB $00                 ; [04 00      ] Test and Set Bits in DP

;--- Patch at file offset $1AD95A (SNES $DAD95A) ---
org $DAD95A

    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $1AD964 (SNES $DAD964) ---
org $DAD964

    BCC $D966               ; [90 00      ] Branch if Carry Clear
    BVC $D928               ; [50 C0      ] Branch if Overflow Clear

;--- Patch at file offset $1AD974 (SNES $DAD974) ---
org $DAD974

    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 20      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AD9CA (SNES $DAD9CA) ---
org $DAD9CA

    ORA #$01                ; [09 01      ] OR A with Immediate
    TRB $0C                 ; [14 0C      ] Test and Reset Bits DP
    db $0E                      ; Incomplete/data bytes

;--- Patch at file offset $1AD9DA (SNES $DAD9DA) ---
org $DAD9DA

    ASL $01                 ; [06 01      ] Shift Left DP
    db $0F                      ; Incomplete/data bytes

;--- Patch at file offset $1AD9E4 (SNES $DAD9E4) ---
org $DAD9E4

    INY                     ; [C8         ] Increment Y
    BRA $D9B3               ; [80 CC      ] Branch Always
    TYA                     ; [98         ] Transfer Y to A
    JSR ($98D8,X)           ; [FC D8 98   ] Jump to Subroutine Indirect,X
    BRA $D9A5               ; [80 B8      ] Branch Always
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $1AD9F4 (SNES $DAD9F4) ---
org $DAD9F4

    BMI $D976               ; [30 80      ] Branch if Minus
    BCS $D978               ; [B0 80      ] Branch if Carry Set
    BRK                     ; [00 C0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRA $DA6D               ; [80 70      ] Branch Always

;--- Patch at file offset $1ADA42 (SNES $DADA42) ---
org $DADA42

    db $5F, $1B                 ; Incomplete/data bytes

;--- Patch at file offset $1ADA4A (SNES $DADA4A) ---
org $DADA4A

    PHP                     ; [08         ] Push Processor Status
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADA52 (SNES $DADA52) ---
org $DADA52

    JSR $2018               ; [20 18 20   ] Jump to Subroutine
    ASL $02                 ; [06 02      ] Shift Left DP
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA [$07]               ; [07 07      ] OR A with [DP]

;--- Patch at file offset $1ADA62 (SNES $DADA62) ---
org $DADA62

    PLX                     ; [FA         ] Pull X Register
    BNE $DA5B               ; [D0 F6      ] Branch if Not Equal

;--- Patch at file offset $1ADA72 (SNES $DADA72) ---
org $DADA72

    TSB $0818               ; [0C 18 08   ] Test and Set Bits Absolute
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $1ADAC2 (SNES $DADAC2) ---
org $DADAC2

    EOR $134F08             ; [4F 08 4F 13] XOR A with Absolute Long
    LSR $2F33,X             ; [5E 33 2F   ] Shift Right Absolute,X
    ORA [$19],Y             ; [17 19      ] OR A with [DP],Y
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADAD2 (SNES $DADAD2) ---
org $DADAD2

    BMI $DADC               ; [30 08      ] Branch if Minus
    BIT $07,X               ; [34 07      ] Test Bits DP,X
    AND $03,S               ; [23 03      ] AND A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1ADAE2 (SNES $DADAE2) ---
org $DADAE2

    SBC ($40)               ; [F2 40      ] Subtract with Borrow (DP)
    SBC ($C8)               ; [F2 C8      ] Subtract with Borrow (DP)
    PLY                     ; [7A         ] Pull Y Register
    CPY $E8F4               ; [CC F4 E8   ] Compare Y with Absolute
    TYA                     ; [98         ] Transfer Y to A
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADAF2 (SNES $DADAF2) ---
org $DADAF2

    BIT $2C60               ; [2C 60 2C   ] Test Bits Absolute
    CPX #$C4                ; [E0 C4      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$60                ; [E0 60      ] Compare X Immediate

;--- Patch at file offset $1ADB0C (SNES $DADB0C) ---
org $DADB0C

    AND [$19]               ; [27 19      ] AND A with [DP]
    ROL                     ; [2A         ] Rotate Left Accumulator
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1ADB1C (SNES $DADB1C) ---
org $DADB1C

    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 14      ] Software interrupt

;--- Patch at file offset $1ADB2C (SNES $DADB2C) ---
org $DADB2C

    EOR $014A31             ; [4F 31 4A 01] XOR A with Absolute Long

;--- Patch at file offset $1ADB3C (SNES $DADB3C) ---
org $DADB3C

    BMI $DB3E               ; [30 00      ] Branch if Minus
    BIT $00,X               ; [34 00      ] Test Bits DP,X
    db $2C, $0B                 ; Incomplete/data bytes

;--- Patch at file offset $1ADB4B (SNES $DADB4B) ---
org $DADB4B

    BRK                     ; [00 0E      ] Software interrupt
    ORA [$06]               ; [07 06      ] OR A with [DP]
    ORA $10,S               ; [03 10      ] OR A with Stack Relative

;--- Patch at file offset $1ADB5A (SNES $DADB5A) ---
org $DADB5A

    ORA [$00]               ; [07 00      ] OR A with [DP]

;--- Patch at file offset $1ADB6C (SNES $DADB6C) ---
org $DADB6C

    EOR $014A39             ; [4F 39 4A 01] XOR A with Absolute Long

;--- Patch at file offset $1ADB7C (SNES $DADB7C) ---
org $DADB7C

    JSR $3400               ; [20 00 34   ] Jump to Subroutine
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADBE4 (SNES $DADBE4) ---
org $DADBE4

    PLY                     ; [7A         ] Pull Y Register
    LDA ($CB,S),Y           ; [B3 CB      ] Load A from (SR),Y
    ORA $8F,S               ; [03 8F      ] OR A with Stack Relative
    CPX #$D0                ; [E0 D0      ] Compare X Immediate

;--- Patch at file offset $1ADBF4 (SNES $DADBF4) ---
org $DADBF4

    STA [$33]               ; [87 33      ] Store A to [DP]
    AND [$03],Y             ; [37 03      ] AND A with [DP],Y
    BMI $DBFA               ; [30 00      ] Branch if Minus
    db $20, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1ADC47 (SNES $DADC47) ---
org $DADC47

    ADC [$73],Y             ; [77 73      ] Add with Carry [DP],Y
    db $31                      ; Incomplete/data bytes

;--- Patch at file offset $1ADC56 (SNES $DADC56) ---
org $DADC56

    ADC $3C77,Y             ; [79 77 3C   ] Add with Carry Absolute,Y

;--- Patch at file offset $1ADC6E (SNES $DADC6E) ---
org $DADC6E

    db $5F                      ; Incomplete/data bytes

;--- Patch at file offset $1ADC7F (SNES $DADC7F) ---
org $DADC7F

    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1ADC8F (SNES $DADC8F) ---
org $DADC8F

    db $6C                      ; Incomplete/data bytes

;--- Patch at file offset $1ADC9E (SNES $DADC9E) ---
org $DADC9E

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADCE0 (SNES $DADCE0) ---
org $DADCE0

    db $AD                      ; Incomplete/data bytes

;--- Patch at file offset $1ADCE8 (SNES $DADCE8) ---
org $DADCE8

    AND ($03,S),Y           ; [33 03      ] AND A with (SR),Y
    AND #$18                ; [29 18      ] AND A with Immediate
    ASL $0F0C,X             ; [1E 0C 0F   ] Shift Left Absolute,X
    TSB $10                 ; [04 10      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1ADCF8 (SNES $DADCF8) ---
org $DADCF8

    TSB $1E03               ; [0C 03 1E   ] Test and Set Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    TSB $040C               ; [0C 0C 04   ] Test and Set Bits Absolute
    TSB $F4                 ; [04 F4      ] Test and Set Bits in DP
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $1ADD0B (SNES $DADD0B) ---
org $DADD0B

    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    INX                     ; [E8         ] Increment X
    BVS $DD19               ; [70 08      ] Branch if Overflow Set
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $1ADD1A (SNES $DADD1A) ---
org $DADD1A

    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 60      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BVS $DD90               ; [70 70      ] Branch if Overflow Set
    EOR $2F0A               ; [4D 0A 2F   ] XOR A with Absolute
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1ADD2B (SNES $DADD2B) ---
org $DADD2B

    BRK                     ; [00 0F      ] Software interrupt
    ASL $17                 ; [06 17      ] Shift Left DP
    ASL $0830               ; [0E 30 08   ] Shift Left Absolute
    db $14                      ; Incomplete/data bytes

;--- Patch at file offset $1ADD3A (SNES $DADD3A) ---
org $DADD3A

    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1ADD44 (SNES $DADD44) ---
org $DADD44

    SBC $638F68             ; [EF 68 8F 63] Subtract with Borrow Absolute Long
    ROR $1303,X             ; [7E 03 13   ] Rotate Right Absolute,X
    ORA $09,S               ; [03 09      ] OR A with Stack Relative
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADD54 (SNES $DADD54) ---
org $DADD54

    TRB $0C                 ; [14 0C      ] Test and Reset Bits DP
    STZ $07,X               ; [74 07      ] Store Zero to DP,X
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    TSB $0603               ; [0C 03 06   ] Test and Set Bits Absolute

;--- Patch at file offset $1ADD6E (SNES $DADD6E) ---
org $DADD6E

    TXS                     ; [9A         ] Transfer X to Stack Pointer

;--- Patch at file offset $1ADD7E (SNES $DADD7E) ---
org $DADD7E

    STZ $10                 ; [64 10      ] Store Zero to DP

;--- Patch at file offset $1ADD8E (SNES $DADD8E) ---
org $DADD8E

    db $59                      ; Incomplete/data bytes

;--- Patch at file offset $1ADD9E (SNES $DADD9E) ---
org $DADD9E

    ROL $08                 ; [26 08      ] Rotate Left DP

;--- Patch at file offset $1ADDE0 (SNES $DADDE0) ---
org $DADDE0

    AND ($D6),Y             ; [31 D6      ] AND A with (DP),Y
    SBC $FE00,Y             ; [F9 00 FE   ] Subtract with Borrow Absolute,Y
    CPY #$70                ; [C0 70      ] Compare Y Immediate
    CPY #$C8                ; [C0 C8      ] Compare Y Immediate
    BRA $DD73               ; [80 88      ] Branch Always
    BRA $DDBD               ; [80 D0      ] Branch Always
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    ASL $2610               ; [0E 10 26   ] Shift Left Absolute
    JSR $E020               ; [20 20 E0   ] Jump to Subroutine
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BVS $DDBA               ; [70 C0      ] Branch if Overflow Set
    BEQ $DD7C               ; [F0 80      ] Branch if Equal
    db $E0                      ; Incomplete/data bytes

;--- Patch at file offset $1ADE04 (SNES $DADE04) ---
org $DADE04

    STZ $F8,X               ; [74 F8      ] Store Zero to DP,X

;--- Patch at file offset $1ADE0C (SNES $DADE0C) ---
org $DADE0C

    PEA $F420               ; [F4 20 F4   ] Push Effective Absolute
    BCC $DE11               ; [90 00      ] Branch if Carry Clear
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 F4      ] Software interrupt
    BRK                     ; [00 28      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BNE $DE01               ; [D0 E0      ] Branch if Not Equal
    BRK                     ; [00 D8      ] Software interrupt
    CPX #$76                ; [E0 76      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    SBC $FDF6,X             ; [FD F6 FD   ] Subtract with Borrow Absolute,X
    PLX                     ; [FA         ] Pull X Register
    PLX                     ; [FA         ] Pull X Register
    PEA $20F2               ; [F4 F2 20   ] Push Effective Absolute
    SBC ($90)               ; [F2 90      ] Subtract with Borrow (DP)
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 F4      ] Software interrupt
    BRK                     ; [00 2C      ] Software interrupt
    BRK                     ; [00 4C      ] Software interrupt

;--- Patch at file offset $1ADEC0 (SNES $DADEC0) ---
org $DADEC0

    EOR $4F1A,X             ; [5D 1A 4F   ] XOR A with Absolute,X
    PLP                     ; [28         ] Pull Processor Status
    LDA $63FE73             ; [AF 73 FE 63] Load A from Absolute Long
    ADC $000907             ; [6F 07 09 00] Add with Carry Absolute Long
    ORA $0E1706             ; [0F 06 17 0E] OR A with Absolute Long
    JSR $3418               ; [20 18 34   ] Jump to Subroutine
    TSB $0714               ; [0C 14 07   ] Test and Set Bits Absolute
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1ADEEC (SNES $DADEEC) ---
org $DADEEC

    CPX $18                 ; [E4 18      ] Compare X with DP
    INY                     ; [C8         ] Increment Y
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1ADEFC (SNES $DADEFC) ---
org $DADEFC

    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 30      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    INY                     ; [C8         ] Increment Y
    BRK                     ; [00 D0      ] Software interrupt
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1ADF0A (SNES $DADF0A) ---
org $DADF0A

    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 C0      ] Software interrupt
    BRA $DE8F               ; [80 80      ] Branch Always
    BRK                     ; [00 B0      ] Software interrupt
    BRA $DF33               ; [80 20      ] Branch Always

;--- Patch at file offset $1ADF1A (SNES $DADF1A) ---
org $DADF1A

    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1ADF6A (SNES $DADF6A) ---
org $DADF6A

    TSB $00                 ; [04 00      ] Test and Set Bits in DP

;--- Patch at file offset $1ADF7A (SNES $DADF7A) ---
org $DADF7A

    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    ORA #$06                ; [09 06      ] OR A with Immediate
    ROL $2000,X             ; [3E 00 20   ] Rotate Left Absolute,X
    TRB $1C38               ; [1C 38 1C   ] Test and Reset Bits Absolute
    ORA $000400,X           ; [1F 00 04 00] OR A with Absolute Long,X

;--- Patch at file offset $1ADF92 (SNES $DADF92) ---
org $DADF92

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BRK                     ; [00 00      ] Software interrupt
    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $1ADFA3 (SNES $DADFA3) ---
org $DADFA3

    BRK                     ; [00 60      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPX #$40                ; [E0 40      ] Compare X Immediate
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADFB2 (SNES $DADFB2) ---
org $DADFB2

    BRA $DFB4               ; [80 00      ] Branch Always
    BRA $DFF6               ; [80 40      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 C0      ] Software interrupt
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1ADFC2 (SNES $DADFC2) ---
org $DADFC2

    EOR $274F07             ; [4F 07 4F 27] XOR A with Absolute Long
    LSR $2F23,X             ; [5E 23 2F   ] Shift Right Absolute,X
    ORA [$09]               ; [07 09      ] OR A with [DP]
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1ADFD2 (SNES $DADFD2) ---
org $DADFD2

    BMI $DFDB               ; [30 07      ] Branch if Minus
    BMI $DFDD               ; [30 07      ] Branch if Minus
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1AE017 (SNES $DAE017) ---
org $DAE017

    db $1F                      ; Incomplete/data bytes

;--- Patch at file offset $1AE046 (SNES $DAE046) ---
org $DAE046

    db $37                      ; Incomplete/data bytes

;--- Patch at file offset $1AE04F (SNES $DAE04F) ---
org $DAE04F

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    ASL $1B11               ; [0E 11 1B   ] Shift Left Absolute

;--- Patch at file offset $1AE05E (SNES $DAE05E) ---
org $DAE05E

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE06D (SNES $DAE06D) ---
org $DAE06D

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AE07C (SNES $DAE07C) ---
org $DAE07C

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE0B7 (SNES $DAE0B7) ---
org $DAE0B7

    SED                     ; [F8         ] Set Decimal Flag

;--- Patch at file offset $1AE0CF (SNES $DAE0CF) ---
org $DAE0CF

    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1AE0DE (SNES $DAE0DE) ---
org $DAE0DE

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE0ED (SNES $DAE0ED) ---
org $DAE0ED

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AE0F4 (SNES $DAE0F4) ---
org $DAE0F4

    PHP                     ; [08         ] Push Processor Status
    CLD                     ; [D8         ] Clear Decimal Flag

;--- Patch at file offset $1AE0FC (SNES $DAE0FC) ---
org $DAE0FC

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE12A (SNES $DAE12A) ---
org $DAE12A

    db $94                      ; Incomplete/data bytes

;--- Patch at file offset $1AE13B (SNES $DAE13B) ---
org $DAE13B

    SED                     ; [F8         ] Set Decimal Flag

;--- Patch at file offset $1AE148 (SNES $DAE148) ---
org $DAE148

    db $05                      ; Incomplete/data bytes

;--- Patch at file offset $1AE164 (SNES $DAE164) ---
org $DAE164

    JSR $60C0               ; [20 C0 60   ] Jump to Subroutine

;--- Patch at file offset $1AE16F (SNES $DAE16F) ---
org $DAE16F

    BRA $E171               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt

;--- Patch at file offset $1AE17E (SNES $DAE17E) ---
org $DAE17E

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE1A8 (SNES $DAE1A8) ---
org $DAE1A8

    db $A6                      ; Incomplete/data bytes

;--- Patch at file offset $1AE1B9 (SNES $DAE1B9) ---
org $DAE1B9

    db $FC                      ; Incomplete/data bytes

;--- Patch at file offset $1AE1CF (SNES $DAE1CF) ---
org $DAE1CF

    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1AE1DE (SNES $DAE1DE) ---
org $DAE1DE

    BRK                     ; [00 04      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRA $E205               ; [80 20      ] Branch Always

;--- Patch at file offset $1AE1ED (SNES $DAE1ED) ---
org $DAE1ED

    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $1AE1F4 (SNES $DAE1F4) ---
org $DAE1F4

    BRK                     ; [00 C0      ] Software interrupt

;--- Patch at file offset $1AE1FC (SNES $DAE1FC) ---
org $DAE1FC

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE246 (SNES $DAE246) ---
org $DAE246

    db $37                      ; Incomplete/data bytes

;--- Patch at file offset $1AE24F (SNES $DAE24F) ---
org $DAE24F

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    TSB $0000               ; [0C 00 00   ] Test and Set Bits Absolute
    BRK                     ; [00 0C      ] Software interrupt
    ORA ($1B),Y             ; [11 1B      ] OR A with (DP),Y

;--- Patch at file offset $1AE25E (SNES $DAE25E) ---
org $DAE25E

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE26D (SNES $DAE26D) ---
org $DAE26D

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AE275 (SNES $DAE275) ---
org $DAE275

    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $1AE27C (SNES $DAE27C) ---
org $DAE27C

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE2AA (SNES $DAE2AA) ---
org $DAE2AA

    DEX                     ; [CA         ] Decrement X

;--- Patch at file offset $1AE2BB (SNES $DAE2BB) ---
org $DAE2BB

    db $FC                      ; Incomplete/data bytes

;--- Patch at file offset $1AE2C6 (SNES $DAE2C6) ---
org $DAE2C6

    db $37                      ; Incomplete/data bytes

;--- Patch at file offset $1AE2D5 (SNES $DAE2D5) ---
org $DAE2D5

    ASL $1B11               ; [0E 11 1B   ] Shift Left Absolute

;--- Patch at file offset $1AE2E6 (SNES $DAE2E6) ---
org $DAE2E6

    db $EC                      ; Incomplete/data bytes

;--- Patch at file offset $1AE2F5 (SNES $DAE2F5) ---
org $DAE2F5

    BVS $E27F               ; [70 88      ] Branch if Overflow Set
    CLD                     ; [D8         ] Clear Decimal Flag

;--- Patch at file offset $1AE32E (SNES $DAE32E) ---
org $DAE32E

    ROR                     ; [6A         ] Rotate Right Accumulator

;--- Patch at file offset $1AE33F (SNES $DAE33F) ---
org $DAE33F

    BMI $E375               ; [30 34      ] Branch if Minus

;--- Patch at file offset $1AE34D (SNES $DAE34D) ---
org $DAE34D

    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1AE35C (SNES $DAE35C) ---
org $DAE35C

    COP #$03                ; [02 03      ] Coprocessor interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE3C2 (SNES $DAE3C2) ---
org $DAE3C2

    WAI                     ; [CB         ] Wait for Interrupt

;--- Patch at file offset $1AE3D3 (SNES $DAE3D3) ---
org $DAE3D3

    db $7C                      ; Incomplete/data bytes

;--- Patch at file offset $1AE3E1 (SNES $DAE3E1) ---
org $DAE3E1

    LDX $AC53               ; [AE 53 AC   ] Load X from Absolute
    EOR ($BF),Y             ; [51 BF      ] XOR A with (DP),Y
    db $DF, $AC, $DE            ; Incomplete/data bytes

;--- Patch at file offset $1AE3F0 (SNES $DAE3F0) ---
org $DAE3F0

    BRK                     ; [00 0A      ] Software interrupt
    BPL $E410               ; [10 1C      ] Branch if Plus
    BRK                     ; [00 39      ] Software interrupt
    COP #$22                ; [02 22      ] Coprocessor interrupt
    BRK                     ; [00 20      ] Software interrupt

;--- Patch at file offset $1AE417 (SNES $DAE417) ---
org $DAE417

    db $1F                      ; Incomplete/data bytes

;--- Patch at file offset $1AE442 (SNES $DAE442) ---
org $DAE442

    ORA ($0E,S),Y           ; [13 0E      ] OR A with (SR),Y
    ROL $7901,X             ; [3E 01 79   ] Rotate Left Absolute,X
    AND [$3E]               ; [27 3E      ] AND A with [DP]
    db $17                      ; Incomplete/data bytes

;--- Patch at file offset $1AE451 (SNES $DAE451) ---
org $DAE451

    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 0C      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    db $39, $08                 ; Incomplete/data bytes

;--- Patch at file offset $1AE4E2 (SNES $DAE4E2) ---
org $DAE4E2

    db $1F, $0C, $12            ; Incomplete/data bytes

;--- Patch at file offset $1AE4F2 (SNES $DAE4F2) ---
org $DAE4F2

    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 0D      ] Software interrupt
    ORA ($0B,X)             ; [01 0B      ] OR A with (DP,X)

;--- Patch at file offset $1AE511 (SNES $DAE511) ---
org $DAE511

    CLD                     ; [D8         ] Clear Decimal Flag

;--- Patch at file offset $1AE520 (SNES $DAE520) ---
org $DAE520

    db $35                      ; Incomplete/data bytes

;--- Patch at file offset $1AE531 (SNES $DAE531) ---
org $DAE531

    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1AE540 (SNES $DAE540) ---
org $DAE540

    ROL                     ; [2A         ] Rotate Left Accumulator
    db $15                      ; Incomplete/data bytes

;--- Patch at file offset $1AE577 (SNES $DAE577) ---
org $DAE577

    db $1F                      ; Incomplete/data bytes

;--- Patch at file offset $1AE5B9 (SNES $DAE5B9) ---
org $DAE5B9

    db $1F                      ; Incomplete/data bytes

;--- Patch at file offset $1AE5E4 (SNES $DAE5E4) ---
org $DAE5E4

    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1AE5ED (SNES $DAE5ED) ---
org $DAE5ED

    db $70                      ; Incomplete/data bytes

;--- Patch at file offset $1AE5F4 (SNES $DAE5F4) ---
org $DAE5F4

    TSB $3C                 ; [04 3C      ] Test and Set Bits in DP

;--- Patch at file offset $1AE5FC (SNES $DAE5FC) ---
org $DAE5FC

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE60A (SNES $DAE60A) ---
org $DAE60A

    AND [$00]               ; [27 00      ] AND A with [DP]
    ORA [$04],Y             ; [17 04      ] OR A with [DP],Y
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1AE617 (SNES $DAE617) ---
org $DAE617

    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 FC      ] Software interrupt

;--- Patch at file offset $1AE62A (SNES $DAE62A) ---
org $DAE62A

    AND $00,S               ; [23 00      ] AND A with Stack Relative
    ORA ($04,S),Y           ; [13 04      ] OR A with (SR),Y

;--- Patch at file offset $1AE637 (SNES $DAE637) ---
org $DAE637

    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt

;--- Patch at file offset $1AE697 (SNES $DAE697) ---
org $DAE697

    db $1F                      ; Incomplete/data bytes

;--- Patch at file offset $1AE6C4 (SNES $DAE6C4) ---
org $DAE6C4

    db $24                      ; Incomplete/data bytes

;--- Patch at file offset $1AE6D3 (SNES $DAE6D3) ---
org $DAE6D3

    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1AE700 (SNES $DAE700) ---
org $DAE700

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1AE70F (SNES $DAE70F) ---
org $DAE70F

    BRA $E711               ; [80 00      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1AE71E (SNES $DAE71E) ---
org $DAE71E

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1AE760 (SNES $DAE760) ---
org $DAE760

    ORA ($0E),Y             ; [11 0E      ] OR A with (DP),Y
    ASL                     ; [0A         ] Shift Left Accumulator

;--- Patch at file offset $1AE782 (SNES $DAE782) ---
org $DAE782

    TRB $2403               ; [1C 03 24   ] Test and Reset Bits Absolute

;--- Patch at file offset $1AE793 (SNES $DAE793) ---
org $DAE793

    ORA $04,S               ; [03 04      ] OR A with Stack Relative
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $1AE7AF (SNES $DAE7AF) ---
org $DAE7AF

    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1AE7BE (SNES $DAE7BE) ---
org $DAE7BE

    BRK                     ; [00 80      ] Software interrupt
    ORA $0C1300             ; [0F 00 13 0C] OR A with Absolute Long
    SEC                     ; [38         ] Set Carry Flag
    ORA $1C123F,X           ; [1F 3F 12 1C] OR A with Absolute Long,X
    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $1AE7D4 (SNES $DAE7D4) ---
org $DAE7D4

    PHP                     ; [08         ] Push Processor Status
    ORA $000301             ; [0F 01 03 00] OR A with Absolute Long
    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $1AEFB6 (SNES $DAEFB6) ---
org $DAEFB6

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1AF030 (SNES $DAF030) ---
org $DAF030

    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AF0A4 (SNES $DAF0A4) ---
org $DAF0A4

    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1AF0B1 (SNES $DAF0B1) ---
org $DAF0B1

    BRA $F073               ; [80 C0      ] Branch Always
    CPX #$70                ; [E0 70      ] Compare X Immediate
    BEQ $F127               ; [F0 70      ] Branch if Equal

;--- Patch at file offset $1AF122 (SNES $DAF122) ---
org $DAF122

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1AF133 (SNES $DAF133) ---
org $DAF133

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1AF1A2 (SNES $DAF1A2) ---
org $DAF1A2

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1AF1B3 (SNES $DAF1B3) ---
org $DAF1B3

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1AF226 (SNES $DAF226) ---
org $DAF226

    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1AF233 (SNES $DAF233) ---
org $DAF233

    RTI                     ; [40         ] Return from Interrupt
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BCS $F228               ; [B0 F0      ] Branch if Carry Set

;--- Patch at file offset $1AF2A2 (SNES $DAF2A2) ---
org $DAF2A2

    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1AF2B3 (SNES $DAF2B3) ---
org $DAF2B3

    db $E0                      ; Incomplete/data bytes

;--- Patch at file offset $1AF408 (SNES $DAF408) ---
org $DAF408

    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 92      ] Software interrupt
    BRK                     ; [00 A0      ] Software interrupt

;--- Patch at file offset $1AF419 (SNES $DAF419) ---
org $DAF419

    AND $0B6D25,X           ; [3F 25 6D 0B] AND A with Absolute Long,X
    db $5F                      ; Incomplete/data bytes

;--- Patch at file offset $1AF491 (SNES $DAF491) ---
org $DAF491

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AF4C4 (SNES $DAF4C4) ---
org $DAF4C4

    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1AF4D5 (SNES $DAF4D5) ---
org $DAF4D5

    db $E0                      ; Incomplete/data bytes

;--- Patch at file offset $1AF591 (SNES $DAF591) ---
org $DAF591

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AF5D3 (SNES $DAF5D3) ---
org $DAF5D3

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AF604 (SNES $DAF604) ---
org $DAF604

    db $0C                      ; Incomplete/data bytes

;--- Patch at file offset $1AF611 (SNES $DAF611) ---
org $DAF611

    BRA $F5D3               ; [80 C0      ] Branch Always
    CPX #$70                ; [E0 70      ] Compare X Immediate
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $1AF624 (SNES $DAF624) ---
org $DAF624

    db $0E                      ; Incomplete/data bytes

;--- Patch at file offset $1AF635 (SNES $DAF635) ---
org $DAF635

    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $1AF671 (SNES $DAF671) ---
org $DAF671

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AF6B1 (SNES $DAF6B1) ---
org $DAF6B1

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1AF722 (SNES $DAF722) ---
org $DAF722

    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1AF733 (SNES $DAF733) ---
org $DAF733

    db $0F                      ; Incomplete/data bytes

;--- End of patch ---