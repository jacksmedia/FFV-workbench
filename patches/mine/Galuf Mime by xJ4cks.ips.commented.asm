;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; Galuf Mime by xJ4cks.ips.commented.asm
;    Disassembled from IPS patch: Galuf Mime by xJ4cks.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 9 record(s)

;--- Patch at file offset $00FFDC (SNES $C0FFDC) ---
org $C0FFDC

    ASL $F16F               ; [0E 6F F1   ] Shift Left Absolute
    db $90                      ; Incomplete/data bytes

;--- Patch at file offset $138000 (SNES $D38000) ---
org $D38000

    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    PLD                     ; [2B         ] Pull Direct Page Register
    TRB $57                 ; [14 57      ] Test and Reset Bits DP
    PLP                     ; [28         ] Pull Processor Status
    EOR $003920,X           ; [5F 20 39 00] XOR A with Absolute Long,X
    BPL $800C               ; [10 00      ] Branch if Plus
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BRK                     ; [00 00      ] Software interrupt
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    ORA $2C,S               ; [03 2C      ] OR A with Stack Relative
    ASL $29,X               ; [16 29      ] Shift Left DP,X
    TRB $0B                 ; [14 0B      ] Test and Reset Bits DP
    ASL $0801               ; [0E 01 08   ] Shift Left Absolute
    ORA [$08]               ; [07 08      ] OR A with [DP]
    ORA ($F0,X)             ; [01 F0      ] OR A with (DP,X)
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRA $804A               ; [80 1F      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    ADC $003F00,X           ; [7F 00 3F 00] Add with Carry Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRA $80A4               ; [80 70      ] Branch Always
    CPX #$18                ; [E0 18      ] Compare X Immediate
    BCS $8080               ; [B0 48      ] Branch if Carry Set
    CLC                     ; [18         ] Clear Carry Flag
    CPX $04                 ; [E4 04      ] Compare X with DP
    PLX                     ; [FA         ] Pull X Register
    BMI $7FCC               ; [30 8E      ] Branch if Minus
    BVC $7FCA               ; [50 8A      ] Branch if Overflow Clear
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $8044               ; [10 00      ] Branch if Plus
    AND [$18]               ; [27 18      ] AND A with [DP]
    AND $007F10             ; [2F 10 7F 00] AND A with Absolute Long
    STA $048D00,X           ; [9F 00 8D 04] Store A to Absolute Long,X
    STA $010806             ; [8F 06 08 01] Store A to Absolute Long
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 1E      ] Software interrupt
    ORA $0E12               ; [0D 12 0E   ] OR A with Absolute
    BPL $80BB               ; [10 60      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    PER $8675               ; [62 16 06   ] Push Effective Relative
    ROR $3E,X               ; [76 3E      ] Rotate Right DP,X
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 F2      ] Software interrupt
    BVC $8060               ; [50 F9      ] Branch if Overflow Clear
    SEC                     ; [38         ] Set Carry Flag
    AND ($C0,S),Y           ; [33 C0      ] AND A with (SR),Y
    EOR #$86                ; [49 86      ] XOR A with Immediate
    BIT #$06                ; [89 06      ] Test Bits Immediate
    BIT #$06                ; [89 06      ] Test Bits Immediate
    BVC $7FFE               ; [50 8C      ] Branch if Overflow Clear
    BRK                     ; [00 A0      ] Software interrupt
    JMP $061C               ; [4C 1C 06   ] Jump Absolute
    ROL $0CCC,X             ; [3E CC 0C   ] Rotate Left Absolute,X
    LDX $16                 ; [A6 16      ] Load X from DP
    ROR $16                 ; [66 16      ] Rotate Right DP
    ASL $76                 ; [06 76      ] Shift Left DP
    SBC $BD04,X             ; [FD 04 BD   ] Subtract with Borrow Absolute,X
    MVN $AD,$54             ; [54 AD 54   ] Block Move Negative
    LDA $BE54               ; [AD 54 BE   ] Load A from Absolute
    WDM #$A3                ; [42 A3      ] Reserved (WDM)
    EOR $40BF,X             ; [5D BF 40   ] XOR A with Absolute,X
    EOR $00,S               ; [43 00      ] XOR A with Stack Relative
    COP #$06                ; [02 06      ] Coprocessor interrupt
    EOR ($46)               ; [52 46      ] XOR A with (DP)
    EOR ($46)               ; [52 46      ] XOR A with (DP)
    EOR ($46)               ; [52 46      ] XOR A with (DP)
    EOR ($43,X)             ; [41 43      ] XOR A with (DP,X)
    EOR ($41,X)             ; [41 41      ] XOR A with (DP,X)
    EOR $43,S               ; [43 43      ] XOR A with Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    ADC $7986,Y             ; [79 86 79   ] Add with Carry Absolute,Y
    INC $79,X               ; [F6 79      ] Increment DP,X
    INC $19,X               ; [F6 19      ] Increment DP,X
    INC $F9,X               ; [F6 F9      ] Increment DP,X
    ASL $F5                 ; [06 F5      ] Shift Left DP
    NOP                     ; [EA         ] No Operation
    SBC $F262,X             ; [FD 62 F2   ] Subtract with Borrow Absolute,X
    BRK                     ; [00 86      ] Software interrupt
    ASL $F6                 ; [06 F6      ] Shift Left DP
    ASL $F6                 ; [06 F6      ] Shift Left DP
    ASL $F6                 ; [06 F6      ] Shift Left DP
    ASL $06                 ; [06 06      ] Shift Left DP
    ASL $E2                 ; [06 E2      ] Shift Left DP
    SEP #$E2                ; [E2 E2      ] Set Processor Status Bits
    SEP #$00                ; [E2 00      ] Set Processor Status Bits
    BRK                     ; [00 17      ] Software interrupt
    BRK                     ; [00 2B      ] Software interrupt
    TRB $57                 ; [14 57      ] Test and Reset Bits DP
    PLP                     ; [28         ] Pull Processor Status
    EOR $003920,X           ; [5F 20 39 00] XOR A with Absolute Long,X
    BPL $80CC               ; [10 00      ] Branch if Plus
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    TRB $02                 ; [14 02      ] Test and Reset Bits DP
    BRK                     ; [00 00      ] Software interrupt
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    ORA $2C,S               ; [03 2C      ] OR A with Stack Relative
    ASL $29,X               ; [16 29      ] Shift Left DP,X
    TRB $0B                 ; [14 0B      ] Test and Reset Bits DP
    ASL $0C01               ; [0E 01 0C   ] Shift Left Absolute
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    ORA $F0                 ; [05 F0      ] OR A with Direct Page
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRA $810A               ; [80 1F      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    ADC $003F00,X           ; [7F 00 3F 00] Add with Carry Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRA $8164               ; [80 70      ] Branch Always
    CPX #$18                ; [E0 18      ] Compare X Immediate
    BCS $8140               ; [B0 48      ] Branch if Carry Set
    CLC                     ; [18         ] Clear Carry Flag
    CPX $04                 ; [E4 04      ] Compare X with DP
    PLX                     ; [FA         ] Pull X Register
    BMI $808C               ; [30 8E      ] Branch if Minus
    BVC $808A               ; [50 8A      ] Branch if Overflow Clear
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $8104               ; [10 00      ] Branch if Plus
    ADC [$18]               ; [67 18      ] Add with Carry [DP]
    SBC $00BF50             ; [EF 50 BF 00] Subtract with Borrow Absolute Long
    LDX $BE50,Y             ; [BE 50 BE   ] Load X from Absolute,Y
    CLI                     ; [58         ] Clear Interrupt Disable
    LDX $0848,Y             ; [BE 48 08   ] Load X from Absolute,Y
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $0D1E00             ; [0F 00 1E 0D] OR A with Absolute Long
    EOR ($4E)               ; [52 4E      ] XOR A with (DP)
    RTI                     ; [40         ] Return from Interrupt
    EOR ($50),Y             ; [51 50      ] XOR A with (DP),Y
    EOR $4C5C,X             ; [5D 5C 4C   ] XOR A with Absolute,X
    EOR $003E               ; [4D 3E 00   ] XOR A with Absolute
    ROR $00,X               ; [76 00      ] Rotate Right DP,X
    SEP #$40                ; [E2 40      ] Set Processor Status Bits
    LDA $40,S               ; [A3 40      ] Load A from Stack Relative
    SBC $02                 ; [E5 02      ] Subtract with Borrow DP
    AND $3906,Y             ; [39 06 39   ] AND A with Absolute,Y
    ASL $79                 ; [06 79      ] Shift Left DP
    ASL $50                 ; [06 50      ] Shift Left DP
    STY $08                 ; [84 08      ] Store Y to DP
    LDY #$5C                ; [A0 5C      ] Load Y Immediate
    BRK                     ; [00 58      ] Software interrupt
    TSB $02                 ; [04 02      ] Test and Set Bits in DP
    INC                     ; [1A         ] Increment Accumulator
    STX $46                 ; [86 46      ] Store X to DP
    STX $56,Y               ; [96 56      ] Store X to DP,Y
    ASL $86                 ; [06 86      ] Shift Left DP
    LDA $56AE50,X           ; [BF 50 AE 56] Load A from Absolute Long,X
    LDY $AC4C,X             ; [BC 4C AC   ] Load Y from Absolute,X
    JMP $48A8               ; [4C A8 48   ] Jump Absolute
    LDA $FF5C,X             ; [BD 5C FF   ] Load A from Absolute,X
    TSB $007E               ; [0C 7E 00   ] Test and Set Bits Absolute
    BVC $8192               ; [50 40      ] Branch if Overflow Clear
    EOR ($47),Y             ; [51 47      ] XOR A with (DP),Y
    EOR $4F,S               ; [43 4F      ] XOR A with Stack Relative
    EOR ($5F,S),Y           ; [53 5F      ] XOR A with (SR),Y
    EOR [$5F],Y             ; [57 5F      ] XOR A with [DP],Y
    PHY                     ; [5A         ] Push Y Register
    LSR $3C3C,X             ; [5E 3C 3C   ] Shift Right Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BIT #$06                ; [89 06      ] Test Bits Immediate
    ORA #$06                ; [09 06      ] OR A with Immediate
    CMP #$C6                ; [C9 C6      ] Compare A Immediate
    SBC #$66                ; [E9 66      ] Subtract with Borrow Immediate
    SBC $3D36,Y             ; [F9 36 3D   ] Subtract with Borrow Absolute,Y
    PHX                     ; [DA         ] Push X Register
    SBC $001F18,X           ; [FF 18 1F 00] Subtract with Borrow Absolute Long,X
    ROR $76,X               ; [76 76      ] Rotate Right DP,X
    INC $F6,X               ; [F6 F6      ] Increment DP,X
    ROL $F6,X               ; [36 F6      ] Rotate Left DP,X
    ASL $76,X               ; [16 76      ] Shift Left DP,X
    ASL $36                 ; [06 36      ] Shift Left DP
    COP #$1A                ; [02 1A      ] Coprocessor interrupt
    TRB $001C               ; [1C 1C 00   ] Test and Reset Bits Absolute
    BRK                     ; [00 7C      ] Software interrupt
    TSB $5C                 ; [04 5C      ] Test and Set Bits in DP
    BIT $1979               ; [2C 79 19   ] Test Bits Absolute
    SBC $7D38,Y             ; [F9 38 7D   ] Subtract with Borrow Absolute,Y
    TRB $193E               ; [1C 3E 19   ] Test and Reset Bits Absolute
    ORA $000808,X           ; [1F 08 08 00] OR A with Absolute Long,X
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    ORA $0F,S               ; [03 0F      ] OR A with Stack Relative
    ASL $1F                 ; [06 1F      ] Shift Left DP
    ROR $7E,X               ; [76 7E      ] Rotate Right DP,X
    DEC                     ; [3A         ] Decrement Accumulator
    ROL $1818,X             ; [3E 18 18   ] Rotate Left Absolute,X
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    SBC ($0E),Y             ; [F1 0E      ] Subtract with Borrow (DP),Y
    LDA ($6E),Y             ; [B1 6E      ] Load A from (DP),Y
    EOR ($2E),Y             ; [51 2E      ] XOR A with (DP),Y
    LDA ($8E),Y             ; [B1 8E      ] Load A from (DP),Y
    CMP ($4E),Y             ; [D1 4E      ] Compare A with (DP),Y
    PLY                     ; [7A         ] Pull Y Register
    STY $FC                 ; [84 FC      ] Store Y to DP
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ASL $0E6E               ; [0E 6E 0E   ] Shift Left Absolute
    LDX $4E8E               ; [AE 8E 4E   ] Load X from Absolute
    DEC $6E2E               ; [CE 2E 6E   ] Decrement Absolute
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $1381C8 (SNES $D381C8) ---
org $D381C8

    AND $285700             ; [2F 00 57 28] AND A with Absolute Long
    LDA $40BF50             ; [AF 50 BF 40] Load A from Absolute Long

;--- Patch at file offset $1381DA (SNES $D381DA) ---
org $D381DA

    ORA $2C,S               ; [03 2C      ] OR A with Stack Relative
    ORA [$58]               ; [07 58      ] OR A with [DP]
    db $2D, $52                 ; Incomplete/data bytes

;--- Patch at file offset $1381E8 (SNES $D381E8) ---
org $D381E8

    CPX #$00                ; [E0 00      ] Compare X Immediate
    BEQ $81EC               ; [F0 00      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 F8      ] Software interrupt

;--- Patch at file offset $1381FB (SNES $D381FB) ---
org $D381FB

    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    BMI $825F               ; [30 60      ] Branch if Minus
    BCC $8273               ; [90 72      ] Branch if Carry Clear
    ORA ($20,X)             ; [01 20      ] OR A with (DP,X)
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 2E      ] Software interrupt
    BRK                     ; [00 28      ] Software interrupt
    TSB $0071               ; [0C 71 00   ] Test and Set Bits Absolute
    ADC $069F01,X           ; [7F 01 9F 06] Add with Carry Absolute Long,X
    PLP                     ; [28         ] Pull Processor Status
    ORA [$1C],Y             ; [17 1C      ] OR A with [DP],Y
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $100F10,X           ; [1F 10 0F 10] OR A with Absolute Long,X
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    ROL $00,X               ; [36 00      ] Rotate Left DP,X
    AND $4E2E,Y             ; [39 2E 4E   ] AND A with Absolute,Y
    JSR ($3E00,X)           ; [FC 00 3E   ] Jump to Subroutine Indirect,X
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 DC      ] Software interrupt
    CPY #$8C                ; [C0 8C      ] Compare Y Immediate
    BRA $826B               ; [80 3C      ] Branch Always
    BPL $8261               ; [10 30      ] Branch if Plus
    INY                     ; [C8         ] Increment Y
    PHP                     ; [08         ] Push Processor Status
    PEA $1C60               ; [F4 60 1C   ] Push Effective Absolute
    LDY #$14                ; [A0 14      ] Load Y Immediate
    BRK                     ; [00 18      ] Software interrupt
    JSR $70E8               ; [20 E8 70   ] Jump to Subroutine
    BEQ $820F               ; [F0 D0      ] Branch if Equal
    CPY #$BF                ; [C0 BF      ] Compare Y Immediate
    ORA $7F0FBF             ; [0F BF 0F 7F] OR A with Absolute Long
    ROL $41CF               ; [2E CF 41   ] Rotate Left Absolute
    CMP $40,S               ; [C3 40      ] Compare A with Stack Relative
    EOR ($00,X)             ; [41 00      ] XOR A with (DP,X)
    INC $FF1D,X             ; [FE 1D FF   ] Increment Absolute,X
    BRK                     ; [00 5F      ] Software interrupt
    ORA $0E1F5F,X           ; [1F 5F 1F 0E] OR A with Absolute Long,X
    ROL $7031               ; [2E 31 70   ] Rotate Left Absolute
    BIT $3E7C,X             ; [3C 7C 3E   ] Test Bits Absolute,X
    ROL $7C7C,X             ; [3E 7C 7C   ] Rotate Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    STY $78                 ; [84 78      ] Store Y to DP
    STY $78                 ; [84 78      ] Store Y to DP
    BRL $44E3               ; [82 7C C2   ] Branch Long
    LDY $BC42,X             ; [BC 42 BC   ] Load Y from Absolute,X
    WDM #$BC                ; [42 BC      ] Reserved (WDM)
    REP #$3C                ; [C2 3C      ] Reset Processor Status Bits
    SBC $787800,X           ; [FF 00 78 78] Subtract with Borrow Absolute Long,X
    SEI                     ; [78         ] Set Interrupt Disable
    SEI                     ; [78         ] Set Interrupt Disable
    JMP ($BC7C,X)           ; [7C 7C BC   ] Jump Indirect,X
    BIT $3CBC,X             ; [3C BC 3C   ] Test Bits Absolute,X
    LDY $3C3C,X             ; [BC 3C 3C   ] Load Y from Absolute,X
    BIT $0000,X             ; [3C 00 00   ] Test Bits Absolute,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $8284               ; [10 00      ] Branch if Plus
    AND [$18]               ; [27 18      ] AND A with [DP]
    AND $003F10             ; [2F 10 3F 00] AND A with Absolute Long
    ORA $040D00,X           ; [1F 00 0D 04] OR A with Absolute Long,X
    ORA $010806             ; [0F 06 08 01] OR A with Absolute Long
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 1E      ] Software interrupt
    ORA $0E12               ; [0D 12 0E   ] OR A with Absolute
    BPL $829B               ; [10 00      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    COP #$06                ; [02 06      ] Coprocessor interrupt
    ASL $06                 ; [06 06      ] Shift Left DP
    TSB $1C04               ; [0C 04 1C   ] Test and Set Bits Absolute
    TSB $1979               ; [0C 79 19   ] Test and Set Bits Absolute
    SBC $7D38,Y             ; [F9 38 7D   ] Subtract with Borrow Absolute,Y
    TRB $193E               ; [1C 3E 19   ] Test and Reset Bits Absolute
    ORA $000808,X           ; [1F 08 08 00] OR A with Absolute Long,X
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    ORA $0F,S               ; [03 0F      ] OR A with Stack Relative
    ASL $1F                 ; [06 1F      ] Shift Left DP
    ROR $7E,X               ; [76 7E      ] Rotate Right DP,X
    DEC                     ; [3A         ] Decrement Accumulator
    ROL $1818,X             ; [3E 18 18   ] Rotate Left Absolute,X
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $82C4               ; [10 00      ] Branch if Plus
    ROL $18                 ; [26 18      ] Rotate Left DP
    AND $037F10             ; [2F 10 7F 03] AND A with Absolute Long
    STA $038F03             ; [8F 03 8F 03] Store A to Absolute Long
    STA $010803             ; [8F 03 08 01] Store A to Absolute Long
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    TSB $0310               ; [0C 10 03   ] Test and Set Bits Absolute
    ORA ($77,S),Y           ; [13 77      ] OR A with (SR),Y
    ORA [$77]               ; [07 77      ] OR A with [DP]
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ADC [$3E],Y             ; [77 3E      ] Add with Carry [DP],Y
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 E8      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY $D2C8               ; [CC C8 D2   ] Compare Y with Absolute
    STY $DCE2               ; [8C E2 DC   ] Store Y to Absolute
    SBC ($DE,X)             ; [E1 DE      ] Subtract with Borrow (DP,X)
    SBC ($DE,X)             ; [E1 DE      ] Subtract with Borrow (DP,X)
    BVC $827E               ; [50 8C      ] Branch if Overflow Clear
    BRK                     ; [00 84      ] Software interrupt
    BPL $8366               ; [10 70      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    BEQ $82A5               ; [F0 AC      ] Branch if Equal
    LDY $DCDC               ; [AC DC DC   ] Load Y from Absolute
    DEC $DEDE,X             ; [DE DE DE   ] Decrement Absolute,X
    DEC $037F,X             ; [DE 7F 03   ] Decrement Absolute,X
    ASL $7900,X             ; [1E 00 79   ] Shift Left Absolute,X
    ORA $38F9,Y             ; [19 F9 38   ] OR A with Absolute,Y
    ADC $3E1C,X             ; [7D 1C 3E   ] Add with Carry Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    TRB $0808               ; [1C 08 08   ] Test and Reset Bits Absolute
    BRK                     ; [00 0F      ] Software interrupt
    ORA $060101             ; [0F 01 01 06] OR A with Absolute Long
    ORA $3A7E76,X           ; [1F 76 7E 3A] OR A with Absolute Long,X
    ROL $1818,X             ; [3E 18 18   ] Rotate Left Absolute,X
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    SBC ($5E,X)             ; [E1 5E      ] Subtract with Borrow (DP,X)
    LDA ($5E,X)             ; [A1 5E      ] Load A from (DP,X)
    EOR ($2E),Y             ; [51 2E      ] XOR A with (DP),Y
    LDA ($8E),Y             ; [B1 8E      ] Load A from (DP),Y
    CMP ($4E),Y             ; [D1 4E      ] Compare A with (DP),Y
    PLY                     ; [7A         ] Pull Y Register
    TRB $3C                 ; [14 3C      ] Test and Reset Bits DP
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 5E      ] Software interrupt
    ASL $1E5E,X             ; [1E 5E 1E   ] Shift Left Absolute,X
    LDX $4E8E               ; [AE 8E 4E   ] Load X from Absolute
    DEC $6E2E               ; [CE 2E 6E   ] Decrement Absolute
    TRB $14                 ; [14 14      ] Test and Reset Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BEQ $8342               ; [F0 00      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 F2      ] Software interrupt
    BRK                     ; [00 61      ] Software interrupt
    BRA $836C               ; [80 21      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    ADC ($00,X)             ; [61 00      ] Add with Carry (DP,X)
    AND ($00,S),Y           ; [33 00      ] AND A with (SR),Y
    BRK                     ; [00 00      ] Software interrupt
    BRA $83C4               ; [80 70      ] Branch Always
    CPX #$18                ; [E0 18      ] Compare X Immediate
    LDY #$4C                ; [A0 4C      ] Load Y Immediate
    TSB $1ED2               ; [0C D2 1E   ] Test and Set Bits Absolute
    CPY #$0C                ; [C0 0C      ] Compare Y Immediate
    STA ($40)               ; [92 40      ] Store A to (DP)
    STY $003F               ; [8C 3F 00   ] Store Y to Absolute
    ADC $5EFF12,X           ; [7F 12 FF 5E] Add with Carry Absolute Long,X
    ROR $7FBC,X             ; [7E BC 7F   ] Rotate Right Absolute,X
    LDY $BA7D,X             ; [BC 7D BA   ] Load Y from Absolute,X
    ADC $7DC2,X             ; [7D C2 7D   ] Add with Carry Absolute,X
    PLX                     ; [FA         ] Pull X Register
    EOR ($92)               ; [52 92      ] XOR A with (DP)
    ASL $1E9E,X             ; [1E 9E 1E   ] Shift Left Absolute,X
    LSR $3CBC,X             ; [5E BC 3C   ] Shift Right Absolute,X
    LDY $BA3C,X             ; [BC 3C BA   ] Load Y from Absolute,X
    DEC                     ; [3A         ] Decrement Accumulator
    REP #$02                ; [C2 02      ] Reset Processor Status Bits
    PLX                     ; [FA         ] Pull X Register
    COP #$7C                ; [02 7C      ] Coprocessor interrupt
    TSB $9C                 ; [04 9C      ] Test and Set Bits in DP
    JMP ($1979)             ; [6C 79 19   ] Jump Indirect
    SBC $7D38,Y             ; [F9 38 7D   ] Subtract with Borrow Absolute,Y
    TRB $193E               ; [1C 3E 19   ] Test and Reset Bits Absolute
    ORA $000808,X           ; [1F 08 08 00] OR A with Absolute Long,X
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    EOR $4F,S               ; [43 4F      ] XOR A with Stack Relative
    ASL $1F                 ; [06 1F      ] Shift Left DP
    ROR $7E,X               ; [76 7E      ] Rotate Right DP,X
    DEC                     ; [3A         ] Decrement Accumulator
    ROL $1818,X             ; [3E 18 18   ] Rotate Left Absolute,X
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    LDA $BD7A,X             ; [BD 7A BD   ] Load A from Absolute,X
    PLY                     ; [7A         ] Pull Y Register
    EOR $A53A,X             ; [5D 3A A5   ] XOR A with Absolute,X
    TXS                     ; [9A         ] Transfer X to Stack Pointer
    CMP $7E46,X             ; [DD 46 7E   ] Compare A with Absolute,X
    TYA                     ; [98         ] Transfer Y to A
    JSR ($1800,X)           ; [FC 00 18   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 7A      ] Software interrupt
    COP #$7A                ; [02 7A      ] Coprocessor interrupt
    COP #$BA                ; [02 BA      ] Coprocessor interrupt
    BRL $4612               ; [82 5A C2   ] Branch Long
    ROL $66                 ; [26 66      ] Rotate Left DP
    TRB $181C               ; [1C 1C 18   ] Test and Reset Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    PLD                     ; [2B         ] Pull Direct Page Register
    TRB $57                 ; [14 57      ] Test and Reset Bits DP
    PLP                     ; [28         ] Pull Processor Status
    EOR $007920,X           ; [5F 20 79 00] XOR A with Absolute Long,X
    BCC $83CC               ; [90 00      ] Branch if Carry Clear
    STA [$00],Y             ; [97 00      ] Store A to [DP],Y
    STY $06,X               ; [94 06      ] Store Y to DP,X
    BRK                     ; [00 00      ] Software interrupt
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    ORA $2C,S               ; [03 2C      ] OR A with Stack Relative
    ASL $29,X               ; [16 29      ] Shift Left DP,X
    TRB $0B                 ; [14 0B      ] Test and Reset Bits DP
    LSR $4821               ; [4E 21 48   ] Shift Right Absolute
    AND [$08]               ; [27 08      ] AND A with [DP]
    ADC ($F0,X)             ; [61 F0      ] Add with Carry (DP,X)
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 F2      ] Software interrupt
    BRK                     ; [00 61      ] Software interrupt
    BRA $840C               ; [80 21      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    ADC ($00,X)             ; [61 00      ] Add with Carry (DP,X)
    AND ($00,S),Y           ; [33 00      ] AND A with (SR),Y
    BRK                     ; [00 00      ] Software interrupt
    BRA $8464               ; [80 70      ] Branch Always
    CPX #$18                ; [E0 18      ] Compare X Immediate
    LDY #$4C                ; [A0 4C      ] Load Y Immediate
    TSB $1ED2               ; [0C D2 1E   ] Test and Set Bits Absolute
    CPY #$0C                ; [C0 0C      ] Compare Y Immediate
    STA ($40)               ; [92 40      ] Store A to (DP)
    STY $0674               ; [8C 74 06   ] Store Y to Absolute
    BVS $8424               ; [70 20      ] Branch if Overflow Set
    AND [$18]               ; [27 18      ] AND A with [DP]
    AND $003F10             ; [2F 10 3F 00] AND A with Absolute Long
    EOR $344D20,X           ; [5F 20 4D 34] XOR A with Absolute Long,X
    EOR $010836             ; [4F 36 08 01] XOR A with Absolute Long
    JSR $002F               ; [20 2F 00   ] Jump to Subroutine
    ASL $120C,X             ; [1E 0C 12   ] Shift Left Absolute,X
    ASL $2010               ; [0E 10 20   ] Shift Left Absolute
    PLP                     ; [28         ] Pull Processor Status
    JSL $262626             ; [22 26 26 26] Jump to Subroutine Long
    AND $127F00,X           ; [3F 00 7F 12] AND A with Absolute Long,X
    SBC $BC7E5E,X           ; [FF 5E 7E BC] Subtract with Borrow Absolute Long,X
    ROR $7DBC,X             ; [7E BC 7D   ] Rotate Right Absolute,X
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    ADC $79C2,X             ; [7D C2 79   ] Add with Carry Absolute,X
    INC $52,X               ; [F6 52      ] Increment DP,X
    STA ($1E)               ; [92 1E      ] Store A to (DP)
    STZ $5E1E,X             ; [9E 1E 5E   ] Store Zero to Absolute,X
    LDY $BC3C,X             ; [BC 3C BC   ] Load Y from Absolute,X
    BIT $3ABA,X             ; [3C BA 3A   ] Test Bits Absolute,X
    REP #$02                ; [C2 02      ] Reset Processor Status Bits
    INC $06,X               ; [F6 06      ] Increment DP,X
    EOR $4C34               ; [4D 34 4C   ] XOR A with Absolute
    BIT $4C,X               ; [34 4C      ] Test Bits DP,X
    BIT $46,X               ; [34 46      ] Test Bits DP,X
    DEC                     ; [3A         ] Decrement Accumulator
    LSR $3A                 ; [46 3A      ] Shift Right DP
    EOR $3D,S               ; [43 3D      ] XOR A with Stack Relative
    AND $000700,X           ; [3F 00 07 00] AND A with Absolute Long,X
    JSL $272326             ; [22 26 23 27] Jump to Subroutine Long
    AND $27,S               ; [23 27      ] AND A with Stack Relative
    AND ($23,X)             ; [21 23      ] AND A with (DP,X)
    AND ($33),Y             ; [31 33      ] AND A with (DP),Y
    AND ($31),Y             ; [31 31      ] AND A with (DP),Y
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    ADC $B1F6,Y             ; [79 F6 B1   ] Add with Carry Absolute,Y
    ROR $6EB1               ; [6E B1 6E   ] Rotate Right Absolute
    EOR ($2E),Y             ; [51 2E      ] XOR A with (DP),Y
    AND ($0E),Y             ; [31 0E      ] AND A with (DP),Y
    SBC ($EE),Y             ; [F1 EE      ] Subtract with Borrow (DP),Y
    INC $E0E0,X             ; [FE E0 E0   ] Increment Absolute,X
    BRK                     ; [00 F6      ] Software interrupt
    ASL $6E                 ; [06 6E      ] Shift Left DP
    ASL $0E6E               ; [0E 6E 0E   ] Shift Left Absolute
    LDX $CE8E               ; [AE 8E CE   ] Load X from Absolute
    DEC $EEEE               ; [CE EE EE   ] Decrement Absolute
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BRA $8400               ; [80 80      ] Branch Always
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    BIT $1303,X             ; [3C 03 13   ] Test Bits Absolute,X
    TSB $003F               ; [0C 3F 00   ] Test and Set Bits Absolute
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    AND ($00,S),Y           ; [33 00      ] AND A with (SR),Y
    BRK                     ; [00 00      ] Software interrupt
    BPL $8497               ; [10 03      ] Branch if Plus
    ORA $0C,S               ; [03 0C      ] OR A with Stack Relative
    ORA ($02),Y             ; [11 02      ] OR A with (DP),Y
    PHP                     ; [08         ] Push Processor Status
    ORA $0C                 ; [05 0C      ] OR A with Direct Page
    ORA ($0C)               ; [12 0C      ] OR A with (DP)
    ORA ($00)               ; [12 00      ] OR A with (DP)
    TSB $00F8               ; [0C F8 00   ] Test and Set Bits Absolute
    INC $FF00,X             ; [FE 00 FF   ] Increment Absolute,X
    BRK                     ; [00 FF      ] Software interrupt
    BRK                     ; [00 A7      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    COP #$80                ; [02 80      ] Coprocessor interrupt
    LDA ($00)               ; [B2 00      ] Load A from (DP)
    INC                     ; [1A         ] Increment Accumulator
    BPL $84B1               ; [10 00      ] Branch if Plus
    BRK                     ; [00 60      ] Software interrupt
    TYA                     ; [98         ] Transfer Y to A
    SED                     ; [F8         ] Set Decimal Flag
    TSB $5A                 ; [04 5A      ] Test and Set Bits in DP
    LDY $0A                 ; [A4 0A      ] Load Y from DP
    PEA $E01C               ; [F4 1C E0   ] Push Effective Absolute
    TSB $8470               ; [0C 70 84   ] Test and Set Bits Absolute
    PLA                     ; [68         ] Pull Accumulator
    ADC $217F20,X           ; [7F 20 7F 21] Add with Carry Absolute Long,X
    ADC $BE3B,X             ; [7D 3B BE   ] Add with Carry Absolute,X
    EOR $C33D,X             ; [5D 3D C3   ] XOR A with Absolute,X
    EOR $60B9BE             ; [4F BE B9 60] XOR A with Absolute Long
    SEI                     ; [78         ] Set Interrupt Disable
    CLC                     ; [18         ] Clear Carry Flag
    AND ($32)               ; [32 32      ] AND A with (DP)
    AND $3B3C,X             ; [3D 3C 3B   ] AND A with Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    EOR $835C,X             ; [5D 5C 83   ] XOR A with Absolute,X
    BRA $8519               ; [80 3E      ] Branch Always
    BRK                     ; [00 66      ] Software interrupt
    ASL $07                 ; [06 07      ] Shift Left DP
    ORA $82080A,X           ; [1F 0A 08 82] OR A with Absolute Long,X
    BRK                     ; [00 E7      ] Software interrupt
    TYA                     ; [98         ] Transfer Y to A
    CMP $00FEA0,X           ; [DF A0 FE 00] Compare A with Absolute Long,X
    AND $9D02,X             ; [3D 02 9D   ] AND A with Absolute,X
    ASL $C2E1               ; [0E E1 C2   ] Shift Left Absolute
    STY $60,X               ; [94 60      ] Store Y to DP,X
    BRK                     ; [00 7C      ] Software interrupt
    STY $1A                 ; [84 1A      ] Store Y to DP
    STY $2832               ; [8C 32 28   ] Store Y to Absolute
    TRB $C2                 ; [14 C2      ] Test and Reset Bits DP
    REP #$6E                ; [C2 6E      ] Reset Processor Status Bits
    ROR $D6CA               ; [6E CA D6   ] Rotate Right Absolute
    CPX #$40                ; [E0 40      ] Compare X Immediate
    SBC ($60),Y             ; [F1 60      ] Subtract with Borrow (DP),Y
    SBC ($61,S),Y           ; [F3 61      ] Subtract with Borrow (SR),Y
    ADC $032720,X           ; [7F 20 27 03] Add with Carry Absolute Long,X
    ORA [$03]               ; [07 03      ] OR A with [DP]
    ORA [$03]               ; [07 03      ] OR A with [DP]
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    EOR $6E6E5F,X           ; [5F 5F 6E 6E] XOR A with Absolute Long,X
    JMP ($206D)             ; [6C 6D 20   ] Jump Indirect
    JSR $0303               ; [20 03 03   ] Jump to Subroutine
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    JSL $C0E200             ; [22 00 E2 C0] Jump to Subroutine Long
    STA $82,X               ; [95 82      ] Store A to DP,X
    ORA $8902               ; [0D 02 89   ] OR A with Absolute
    ASL $92                 ; [06 92      ] Shift Left DP
    TSB $08B4               ; [0C B4 08   ] Test and Set Bits Absolute
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 DC      ] Software interrupt
    CPY #$1C                ; [C0 1C      ] Compare Y Immediate
    CPY #$62                ; [C0 62      ] Compare Y Immediate
    NOP                     ; [EA         ] No Operation
    SBC ($F2)               ; [F2 F2      ] Subtract with Borrow (DP)
    ADC ($72)               ; [72 72      ] Add with Carry (DP)
    STZ $64                 ; [64 64      ] Store Zero to DP
    PHA                     ; [48         ] Push Accumulator
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    PLD                     ; [2B         ] Pull Direct Page Register
    TRB $57                 ; [14 57      ] Test and Reset Bits DP
    PLP                     ; [28         ] Pull Processor Status
    EOR $003920,X           ; [5F 20 39 00] XOR A with Absolute Long,X
    BPL $854C               ; [10 00      ] Branch if Plus
    BPL $854E               ; [10 00      ] Branch if Plus
    ORA ($01),Y             ; [11 01      ] OR A with (DP),Y
    BRK                     ; [00 00      ] Software interrupt
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    ORA $2C,S               ; [03 2C      ] OR A with Stack Relative
    ASL $29,X               ; [16 29      ] Shift Left DP,X
    TRB $0B                 ; [14 0B      ] Test and Reset Bits DP
    ASL $0E01               ; [0E 01 0E   ] Shift Left Absolute
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ASL $F0                 ; [06 F0      ] Shift Left DP
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRA $858A               ; [80 1F      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    ADC $003F00,X           ; [7F 00 3F 00] Add with Carry Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRA $85E4               ; [80 70      ] Branch Always
    CPX #$18                ; [E0 18      ] Compare X Immediate
    BCS $85C0               ; [B0 48      ] Branch if Carry Set
    CLC                     ; [18         ] Clear Carry Flag
    CPX $04                 ; [E4 04      ] Compare X with DP
    PLX                     ; [FA         ] Pull X Register
    BMI $850C               ; [30 8E      ] Branch if Minus
    BVC $850A               ; [50 8A      ] Branch if Overflow Clear
    ASL $06,X               ; [16 06      ] Shift Left DP,X
    BPL $8584               ; [10 00      ] Branch if Plus
    AND $005710             ; [2F 10 57 00] AND A with Absolute Long
    STA ($00,S),Y           ; [93 00      ] Store A to (SR),Y
    LDA $9100,Y             ; [B9 00 91   ] Load A from Absolute,Y
    BRK                     ; [00 53      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $2B1608             ; [0F 08 16 2B] OR A with Absolute Long
    ORA ($44,X)             ; [01 44      ] OR A with (DP,X)
    PLP                     ; [28         ] Pull Processor Status
    MVP $02,$2D             ; [44 02 2D   ] Block Move Positive
    EOR $01,S               ; [43 01      ] XOR A with Stack Relative
    AND $003F               ; [2D 3F 00   ] AND A with Absolute
    ROR $20                 ; [66 20      ] Rotate Right DP
    SBC ($70)               ; [F2 70      ] Subtract with Borrow (DP)
    SBC [$C2]               ; [E7 C2      ] Subtract with Borrow [DP]
    SBC ($6E),Y             ; [F1 6E      ] Subtract with Borrow (DP),Y
    SBC ($6E),Y             ; [F1 6E      ] Subtract with Borrow (DP),Y
    SBC ($EE),Y             ; [F1 EE      ] Subtract with Borrow (DP),Y
    SBC ($8E),Y             ; [F1 8E      ] Subtract with Borrow (DP),Y
    RTI                     ; [40         ] Return from Interrupt
    BRL $3DCC               ; [82 18 B8   ] Branch Long
    TSB $DA7C               ; [0C 7C DA   ] Test and Set Bits Absolute
    CLD                     ; [D8         ] Clear Decimal Flag
    INC $EEEE               ; [EE EE EE   ] Increment Absolute
    INC $EEEE               ; [EE EE EE   ] Increment Absolute
    STX $168E               ; [8E 8E 16   ] Store X to Absolute
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 2F      ] Software interrupt
    BPL $861E               ; [10 57      ] Branch if Plus
    BRK                     ; [00 93      ] Software interrupt
    BRK                     ; [00 B9      ] Software interrupt
    BRK                     ; [00 91      ] Software interrupt
    BRK                     ; [00 D3      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $2B1208             ; [0F 08 12 2B] OR A with Absolute Long
    ORA ($44,X)             ; [01 44      ] OR A with (DP,X)
    PLP                     ; [28         ] Pull Processor Status
    MVP $02,$2D             ; [44 02 2D   ] Block Move Positive
    EOR $01,S               ; [43 01      ] XOR A with Stack Relative
    AND $003F               ; [2D 3F 00   ] AND A with Absolute
    ROR $20                 ; [66 20      ] Rotate Right DP
    SBC ($70)               ; [F2 70      ] Subtract with Borrow (DP)
    SBC [$C2]               ; [E7 C2      ] Subtract with Borrow [DP]
    SBC ($6E),Y             ; [F1 6E      ] Subtract with Borrow (DP),Y
    SBC ($6E),Y             ; [F1 6E      ] Subtract with Borrow (DP),Y
    SBC ($EE),Y             ; [F1 EE      ] Subtract with Borrow (DP),Y
    SBC ($8E),Y             ; [F1 8E      ] Subtract with Borrow (DP),Y
    RTI                     ; [40         ] Return from Interrupt
    BRL $3E0C               ; [82 18 B8   ] Branch Long
    TSB $DA7C               ; [0C 7C DA   ] Test and Set Bits Absolute
    CLD                     ; [D8         ] Clear Decimal Flag
    INC $EEEE               ; [EE EE EE   ] Increment Absolute
    INC $EEEE               ; [EE EE EE   ] Increment Absolute
    db $8E, $8E                 ; Incomplete/data bytes

;--- Patch at file offset $14ABC0 (SNES $D4ABC0) ---
org $D4ABC0

    db $0C, $00                 ; Incomplete/data bytes

;--- Patch at file offset $14ABCC (SNES $D4ABCC) ---
org $D4ABCC

    RTI                     ; [40         ] Return from Interrupt
    EOR ($20,S),Y           ; [53 20      ] XOR A with (SR),Y
    db $3E                      ; Incomplete/data bytes

;--- Patch at file offset $14ABD6 (SNES $D4ABD6) ---
org $D4ABD6

    EOR $0E9F03,X           ; [5F 03 9F 0E] XOR A with Absolute Long,X
    TCD                     ; [5B         ] Transfer A to Direct Page
    PER $295E               ; [62 80 7D   ] Push Effective Relative
    EOR $35,X               ; [55 35      ] XOR A with DP,X

;--- End of patch ---