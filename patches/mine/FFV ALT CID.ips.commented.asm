;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; FFV ALT CID.ips.commented.asm
;    Disassembled from IPS patch: FFV ALT CID.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 34 record(s)

;--- Patch at file offset $1A2504 (SNES $DA2504) ---
org $DA2504

    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    MVP $00,$FF             ; [44 00 FF   ] Block Move Positive
    ORA ($C7,X)             ; [01 C7      ] OR A with (DP,X)
    BRK                     ; [00 F3      ] Software interrupt
    TSB $E5                 ; [04 E5      ] Test and Set Bits in DP
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1A2516 (SNES $DA2516) ---
org $DA2516

    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    MVP $7A,$04             ; [44 7A 04   ] Block Move Positive
    ASL                     ; [0A         ] Shift Left Accumulator
    LSR $78                 ; [46 78      ] Shift Right DP
    BRK                     ; [00 00      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    PLX                     ; [FA         ] Pull X Register
    BRK                     ; [00 13      ] Software interrupt
    JMP ($9869,X)           ; [7C 69 98   ] Jump Indirect,X
    LDA $D8,S               ; [A3 D8      ] Load A from Stack Relative
    ORA $78,S               ; [03 78      ] OR A with Stack Relative
    STA ($78,X)             ; [81 78      ] Store A to (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    STX $10,Y               ; [96 10      ] Store X to DP,Y
    ASL $1E18,X             ; [1E 18 1E   ] Shift Left Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    INC $1E18,X             ; [FE 18 1E   ] Increment Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    DEC $00                 ; [C6 00      ] Decrement DP
    CMP $04CF00             ; [CF 00 CF 04] Compare A with Absolute Long
    db $F1                      ; Incomplete/data bytes

;--- Patch at file offset $1A2550 (SNES $DA2550) ---
org $DA2550

    EOR ($7B,X)             ; [41 7B      ] XOR A with (DP,X)
    BVC $25CB               ; [50 77      ] Branch if Overflow Clear
    BVS $25CD               ; [70 77      ] Branch if Overflow Set
    db $02                      ; Incomplete/data bytes

;--- Patch at file offset $1A2560 (SNES $DA2560) ---
org $DA2560

    STA $78,S               ; [83 78      ] Store A to Stack Relative
    STA $1A                 ; [85 1A      ] Store A to DP
    LDX #$1C                ; [A2 1C      ] Load X Immediate
    DEC $B8                 ; [C6 B8      ] Decrement DP
    db $FF, $78                 ; Incomplete/data bytes

;--- Patch at file offset $1A2570 (SNES $DA2570) ---
org $DA2570

    ROR $7E18,X             ; [7E 18 7E   ] Rotate Right Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    JMP ($F818,X)           ; [7C 18 F8   ] Jump Indirect,X
    CLC                     ; [18         ] Clear Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $1AB802 (SNES $DAB802) ---
org $DAB802

    TSB $1900               ; [0C 00 19   ] Test and Set Bits Absolute
    BRK                     ; [00 18      ] Software interrupt
    TSB $0F1A               ; [0C 1A 0F   ] Test and Set Bits Absolute
    BIT $07                 ; [24 07      ] Test Bits DP
    ROL $09                 ; [26 09      ] Rotate Left DP
    ROL                     ; [2A         ] Rotate Left Accumulator
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1AB816 (SNES $DAB816) ---
org $DAB816

    ORA $0E0E0C             ; [0F 0C 0E 0E] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 98      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BMI $B881               ; [30 58      ] Branch if Minus
    BEQ $B84F               ; [F0 24      ] Branch if Equal
    CPX #$E4                ; [E0 E4      ] Compare X Immediate
    BPL $B883               ; [10 54      ] Branch if Plus
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1AB836 (SNES $DAB836) ---
org $DAB836

    BEQ $B868               ; [F0 30      ] Branch if Equal
    BVS $B8AA               ; [70 70      ] Branch if Overflow Set
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 28      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 6D      ] Software interrupt
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1AB850 (SNES $DAB850) ---
org $DAB850

    ORA $18,S               ; [03 18      ] OR A with Stack Relative
    db $12                      ; Incomplete/data bytes

;--- Patch at file offset $1AB860 (SNES $DAB860) ---
org $DAB860

    BIT $BE00               ; [2C 00 BE   ] Test Bits Absolute
    db $8C                      ; Incomplete/data bytes

;--- Patch at file offset $1AB870 (SNES $DAB870) ---
org $DAB870

    BNE $B88A               ; [D0 18      ] Branch if Not Equal
    RTI                     ; [40         ] Return from Interrupt
    BIT $4020,X             ; [3C 20 40   ] Test Bits Absolute,X
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRA $B85A               ; [80 E0      ] Branch Always
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1AB882 (SNES $DAB882) ---
org $DAB882

    ORA $1800               ; [0D 00 18   ] OR A with Absolute
    BRK                     ; [00 18      ] Software interrupt
    ORA $300F18             ; [0F 18 0F 30] OR A with Absolute Long
    ORA ($25),Y             ; [11 25      ] OR A with (DP),Y
    ORA ($21),Y             ; [11 21      ] OR A with (DP),Y
    db $14                      ; Incomplete/data bytes

;--- Patch at file offset $1AB897 (SNES $DAB897) ---
org $DAB897

    ORA $1F0F0F             ; [0F 0F 0F 1F] OR A with Absolute Long
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 1E      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BRA $B8BF               ; [80 18      ] Branch Always
    BEQ $B8C1               ; [F0 18      ] Branch if Equal
    BEQ $B8D7               ; [F0 2C      ] Branch if Equal
    PHP                     ; [08         ] Push Processor Status
    STZ $08                 ; [64 08      ] Store Zero to DP
    db $44, $28                 ; Incomplete/data bytes

;--- Patch at file offset $1AB8B7 (SNES $DAB8B7) ---
org $DAB8B7

    BEQ $B8A9               ; [F0 F0      ] Branch if Equal
    BEQ $B8B3               ; [F0 F8      ] Branch if Equal
    BRK                     ; [00 B8      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    COP #$37                ; [02 37      ] Coprocessor interrupt
    BRK                     ; [00 1D      ] Software interrupt
    COP #$0D                ; [02 0D      ] Coprocessor interrupt
    COP #$06                ; [02 06      ] Coprocessor interrupt
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    TSB $1F08               ; [0C 08 1F   ] Test and Set Bits Absolute
    COP #$09                ; [02 09      ] Coprocessor interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    INC $00,X               ; [F6 00      ] Increment DP,X
    AND $16EB06,X           ; [3F 06 EB 16] AND A with Absolute Long,X
    SBC $1E16               ; [ED 16 1E   ] Subtract with Borrow Absolute
    BRK                     ; [00 48      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    TRB $FEC0               ; [1C C0 FE   ] Test and Reset Bits Absolute
    BPL $B8D6               ; [10 E0      ] Branch if Plus
    BEQ $B8F8               ; [F0 00      ] Branch if Equal
    RTI                     ; [40         ] Return from Interrupt
    BEQ $B90B               ; [F0 10      ] Branch if Equal
    BCS $B91D               ; [B0 20      ] Branch if Carry Set
    LDY #$80                ; [A0 80      ] Load Y Immediate
    BRA $B910               ; [80 0F      ] Branch Always
    BRK                     ; [00 13      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TRB $0F                 ; [14 0F      ] Test and Reset Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    ORA $140916             ; [0F 16 09 14] OR A with Absolute Long
    ORA #$12                ; [09 12      ] OR A with Immediate
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1AB916 (SNES $DAB916) ---
org $DAB916

    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA $00010F             ; [0F 0F 01 00] OR A with Absolute Long
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA #$00                ; [09 00      ] OR A with Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    CPX #$30                ; [E0 30      ] Compare X Immediate
    CPX #$08                ; [E0 08      ] Compare X Immediate
    CPY #$08                ; [C0 08      ] Compare Y Immediate
    CPY #$C4                ; [C0 C4      ] Compare Y Immediate
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1AB937 (SNES $DAB937) ---
org $DAB937

    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    CPX #$70                ; [E0 70      ] Compare X Immediate
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 17      ] Software interrupt
    TSB $15                 ; [04 15      ] Test and Set Bits in DP
    COP #$0F                ; [02 0F      ] Coprocessor interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)

;--- Patch at file offset $1AB950 (SNES $DAB950) ---
org $DAB950

    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1AB960 (SNES $DAB960) ---
org $DAB960

    INX                     ; [E8         ] Increment X
    BRK                     ; [00 E8      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    JSR $E038               ; [20 38 E0   ] Jump to Subroutine
    BVS $B92A               ; [70 C0      ] Branch if Overflow Set
    BNE $B96C               ; [D0 00      ] Branch if Not Equal
    BPL $B96E               ; [10 00      ] Branch if Plus
    CPX #$40                ; [E0 40      ] Compare X Immediate
    BVC $B9A2               ; [50 30      ] Branch if Overflow Clear
    BPL $B964               ; [10 F0      ] Branch if Plus
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    JSR $2020               ; [20 20 20   ] Jump to Subroutine
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CPY #$0F                ; [C0 0F      ] Compare Y Immediate
    BRK                     ; [00 13      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TRB $0F                 ; [14 0F      ] Test and Reset Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    ORA $140916             ; [0F 16 09 14] OR A with Absolute Long
    ORA #$12                ; [09 12      ] OR A with Immediate
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1AB996 (SNES $DAB996) ---
org $DAB996

    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA $00010F             ; [0F 0F 01 00] OR A with Absolute Long
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA #$00                ; [09 00      ] OR A with Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 10      ] Software interrupt
    JSR $E030               ; [20 30 E0   ] Jump to Subroutine
    BMI $B98A               ; [30 E0      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    BNE $B9B5               ; [D0 08      ] Branch if Not Equal
    CPY #$C4                ; [C0 C4      ] Compare Y Immediate

;--- Patch at file offset $1AB9B7 (SNES $DAB9B7) ---
org $DAB9B7

    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    CPX #$70                ; [E0 70      ] Compare X Immediate
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 17      ] Software interrupt
    TSB $15                 ; [04 15      ] Test and Set Bits in DP
    COP #$2E                ; [02 2E      ] Coprocessor interrupt
    ORA ($3C),Y             ; [11 3C      ] OR A with (DP),Y
    db $13                      ; Incomplete/data bytes

;--- Patch at file offset $1AB9D0 (SNES $DAB9D0) ---
org $DAB9D0

    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 0B      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    ASL $07                 ; [06 07      ] Shift Left DP
    BRK                     ; [00 00      ] Software interrupt
    ORA $180E02             ; [0F 02 0E 18] OR A with Absolute Long
    TRB $0404               ; [1C 04 04   ] Test and Reset Bits Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    BRA $B99B               ; [80 B8      ] Branch Always

;--- Patch at file offset $1AB9F2 (SNES $DAB9F2) ---
org $DAB9F2

    RTI                     ; [40         ] Return from Interrupt
    BEQ $B9F5               ; [F0 00      ] Branch if Equal
    BVS $B977               ; [70 80      ] Branch if Overflow Set
    BRK                     ; [00 80      ] Software interrupt
    BRA $BA3B               ; [80 40      ] Branch Always

;--- Patch at file offset $1ABA04 (SNES $DABA04) ---
org $DABA04

    TSB $1000               ; [0C 00 10   ] Test and Set Bits Absolute
    BRK                     ; [00 11      ] Software interrupt
    BPL $BA3F               ; [10 34      ] Branch if Plus
    TRB $1F22               ; [1C 22 1F   ] Test and Reset Bits Absolute
    db $2F, $09                 ; Incomplete/data bytes

;--- Patch at file offset $1ABA18 (SNES $DABA18) ---
org $DABA18

    ORA $1C1F10,X           ; [1F 10 1F 1C] OR A with Absolute Long,X
    ASL $100E,X             ; [1E 0E 10   ] Shift Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 88      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BIT $4438               ; [2C 38 44   ] Test Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    db $F4, $10                 ; Incomplete/data bytes

;--- Patch at file offset $1ABA38 (SNES $DABA38) ---
org $DABA38

    SED                     ; [F8         ] Set Decimal Flag
    PHP                     ; [08         ] Push Processor Status
    SED                     ; [F8         ] Set Decimal Flag
    SEC                     ; [38         ] Set Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    BVS $BA47               ; [70 08      ] Branch if Overflow Set
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 0D      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    ORA $300F18             ; [0F 18 0F 30] OR A with Absolute Long
    ORA ($25),Y             ; [11 25      ] OR A with (DP),Y
    ORA ($21),Y             ; [11 21      ] OR A with (DP),Y
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    ORA $1F0F0F             ; [0F 0F 0F 1F] OR A with Absolute Long
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 1E      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BRA $BA7F               ; [80 18      ] Branch Always
    BEQ $BA81               ; [F0 18      ] Branch if Equal
    BEQ $BA97               ; [F0 2C      ] Branch if Equal
    PHP                     ; [08         ] Push Processor Status
    STZ $08                 ; [64 08      ] Store Zero to DP
    MVP $28,$00             ; [44 28 00   ] Block Move Positive
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BEQ $BA69               ; [F0 F0      ] Branch if Equal
    BEQ $BA73               ; [F0 F8      ] Branch if Equal
    BRK                     ; [00 B8      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 33      ] Software interrupt
    ORA $60,S               ; [03 60      ] OR A with Stack Relative
    ASL $1C40               ; [0E 40 1C   ] Shift Left Absolute
    BRA $BAC3               ; [80 39      ] Branch Always
    CPY #$7E                ; [C0 7E      ] Compare Y Immediate
    INX                     ; [E8         ] Increment X
    ADC [$7D],Y             ; [77 7D      ] Add with Carry [DP],Y
    BIT $00                 ; [24 00      ] Test Bits DP
    BRK                     ; [00 1F      ] Software interrupt
    ORA $3F,S               ; [03 3F      ] OR A with Stack Relative
    ASL $1C3F               ; [0E 3F 1C   ] Shift Left Absolute
    ADC $707538,X           ; [7F 38 75 70] Add with Carry Absolute Long,X
    JSL $202220             ; [22 20 22 20] Jump to Subroutine Long
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRA $BB05               ; [80 60      ] Branch Always
    BRK                     ; [00 10      ] Software interrupt
    JSR $0030               ; [20 30 00   ] Jump to Subroutine
    PHA                     ; [48         ] Push Accumulator
    BCC $BA85               ; [90 D8      ] Branch if Carry Clear
    RTS                     ; [60         ] Return from Subroutine
    SED                     ; [F8         ] Set Decimal Flag
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $1ABABC (SNES $DABABC) ---
org $DABABC

    BVS $BABE               ; [70 00      ] Branch if Overflow Set
    BMI $BAC0               ; [30 00      ] Branch if Minus
    ORA [$05],Y             ; [17 05      ] OR A with [DP],Y
    ORA [$02],Y             ; [17 02      ] OR A with [DP],Y
    ORA $000700             ; [0F 00 07 00] OR A with Absolute Long
    ORA [$00]               ; [07 00      ] OR A with [DP]
    COP #$00                ; [02 00      ] Coprocessor interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA #$00                ; [09 00      ] OR A with Immediate
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $02,S               ; [03 02      ] OR A with Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    BRK                     ; [00 0C      ] Software interrupt
    BRK                     ; [00 79      ] Software interrupt
    BRK                     ; [00 98      ] Software interrupt
    JMP ($6FFA)             ; [6C FA 6F   ] Jump Indirect
    PEA $7667               ; [F4 67 76   ] Push Effective Absolute
    ORA #$7A                ; [09 7A      ] OR A with Immediate

;--- Patch at file offset $1ABAF6 (SNES $DABAF6) ---
org $DABAF6

    ORA $0E0E0C             ; [0F 0C 0E 0E] OR A with Absolute Long
    PHP                     ; [08         ] Push Processor Status
    RTS                     ; [60         ] Return from Subroutine
    PHP                     ; [08         ] Push Processor Status
    BMI $BB03               ; [30 04      ] Branch if Minus
    BMI $BB08               ; [30 07      ] Branch if Minus
    BRK                     ; [00 0C      ] Software interrupt
    BRK                     ; [00 39      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BIT $7A,X               ; [34 7A      ] Test Bits DP,X
    AND [$78],Y             ; [37 78      ] AND A with [DP],Y
    AND [$7E],Y             ; [37 7E      ] AND A with [DP],Y
    ORA ($32,X)             ; [01 32      ] OR A with (DP,X)

;--- Patch at file offset $1ABB16 (SNES $DABB16) ---
org $DABB16

    ORA [$04]               ; [07 04      ] OR A with [DP]
    ASL $06                 ; [06 06      ] Shift Left DP
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    TSB $E018               ; [0C 18 E0   ] Test and Set Bits Absolute
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 9E      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    ROL $5F,X               ; [36 5F      ] Rotate Left DP,X
    INC $3F,X               ; [F6 3F      ] Increment DP,X
    INC $FE                 ; [E6 FE      ] Increment DP
    BRK                     ; [00 5E      ] Software interrupt

;--- Patch at file offset $1ABB36 (SNES $DABB36) ---
org $DABB36

    BEQ $BB68               ; [F0 30      ] Branch if Equal
    BVS $BBAA               ; [70 70      ] Branch if Overflow Set
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    JSR $3C0C               ; [20 0C 3C   ] Jump to Subroutine
    BRK                     ; [00 1D      ] Software interrupt
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1ABB50 (SNES $DABB50) ---
org $DABB50

    ORA $18,S               ; [03 18      ] OR A with Stack Relative
    db $02                      ; Incomplete/data bytes

;--- Patch at file offset $1ABB60 (SNES $DABB60) ---
org $DABB60

    BIT $B800,X             ; [3C 00 B8   ] Test Bits Absolute,X
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1ABB70 (SNES $DABB70) ---
org $DABB70

    CPY #$18                ; [C0 18      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    BMI $BB95               ; [30 20      ] Branch if Minus
    RTI                     ; [40         ] Return from Interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRA $BB5A               ; [80 E0      ] Branch Always
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1ABB82 (SNES $DABB82) ---
org $DABB82

    TSB $1900               ; [0C 00 19   ] Test and Set Bits Absolute
    BRK                     ; [00 18      ] Software interrupt
    TSB $1D33               ; [0C 33 1D   ] Test and Set Bits Absolute
    LSR $2019               ; [4E 19 20   ] Shift Right Absolute
    ORA #$7A                ; [09 7A      ] OR A with Immediate
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 47      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    TSB $1C1C               ; [0C 1C 1C   ] Test and Set Bits Absolute
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 1E      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 98      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BMI $BB75               ; [30 CC      ] Branch if Minus
    CLV                     ; [B8         ] Clear Overflow Flag
    SBC ($18)               ; [F2 18      ] Subtract with Borrow (DP)
    TSB $90                 ; [04 90      ] Test and Set Bits in DP
    LSR $0080,X             ; [5E 80 00   ] Shift Right Absolute,X
    BRK                     ; [00 E2      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BMI $BBF1               ; [30 38      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    TRB $7800               ; [1C 00 78   ] Test and Reset Bits Absolute
    BRK                     ; [00 24      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    TSB $4D                 ; [04 4D      ] Test and Set Bits in DP
    BMI $BC44               ; [30 7F      ] Branch if Minus
    AND ($3B),Y             ; [31 3B      ] AND A with (DP),Y
    TSB $08                 ; [04 08      ] Test and Set Bits in DP

;--- Patch at file offset $1ABBD0 (SNES $DABBD0) ---
org $DABBD0

    ORA $10,S               ; [03 10      ] OR A with Stack Relative
    COP #$08                ; [02 08      ] Coprocessor interrupt
    BRK                     ; [00 04      ] Software interrupt
    ASL $00                 ; [06 00      ] Shift Left DP
    TSB $07                 ; [04 07      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    ASL $0E00               ; [0E 00 0E   ] Shift Left Absolute
    TSB $2C0E               ; [0C 0E 2C   ] Test and Set Bits Absolute
    JSR $0CBE               ; [20 BE 0C   ] Jump to Subroutine
    INC $D28C,X             ; [FE 8C D2   ] Increment Absolute,X
    BIT $001C               ; [2C 1C 00   ] Test Bits Absolute
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 88      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BNE $BC0A               ; [D0 18      ] Branch if Not Equal
    RTI                     ; [40         ] Return from Interrupt
    TRB $2000               ; [1C 00 20   ] Test and Reset Bits Absolute
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 20      ] Software interrupt
    CPX #$90                ; [E0 90      ] Compare X Immediate

;--- End of patch ---