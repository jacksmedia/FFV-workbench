;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; _FFV Advanced Items v01.ips.commented.asm
;    Disassembled from IPS patch: _FFV Advanced Items v01.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 40 record(s)

;--- Patch at file offset $00FFDC (SNES $C0FFDC) ---
org $C0FFDC

    TDC                     ; [7B         ] Transfer Direct Page to A
    AND $D284               ; [2D 84 D2   ] AND A with Absolute

;--- Patch at file offset $105240 (SNES $D05240) ---
org $D05240

    CLD                     ; [D8         ] Clear Decimal Flag
    db $B0                      ; Incomplete/data bytes

;--- Patch at file offset $1053F4 (SNES $D053F4) ---
org $D053F4

    db $74                      ; Incomplete/data bytes

;--- Patch at file offset $1054D0 (SNES $D054D0) ---
org $D054D0

    PHX                     ; [DA         ] Push X Register

;--- Patch at file offset $1054D7 (SNES $D054D7) ---
org $D054D7

    PLY                     ; [7A         ] Pull Y Register

;--- Patch at file offset $1054F1 (SNES $D054F1) ---
org $D054F1

    db $89                      ; Incomplete/data bytes

;--- Patch at file offset $105500 (SNES $D05500) ---
org $D05500

    CMP $AF,X               ; [D5 AF      ] Compare A with DP,X

;--- Patch at file offset $105508 (SNES $D05508) ---
org $D05508

    CMP ($E3)               ; [D2 E3      ] Compare A with (DP)
    SBC $00,X               ; [F5 00      ] Subtract with Borrow DP,X
    CMP ($E3,S),Y           ; [D3 E3      ] Compare A with (SR),Y
    SBC ($00,S),Y           ; [F3 00      ] Subtract with Borrow (SR),Y
    DEC $E3,X               ; [D6 E3      ] Decrement DP,X
    SBC ($00)               ; [F2 00      ] Subtract with Borrow (DP)
    CMP $00C5,Y             ; [D9 C5 00   ] Compare A with Absolute,Y
    BRK                     ; [00 D1      ] Software interrupt
    TCD                     ; [5B         ] Transfer A to Direct Page
    BRK                     ; [00 00      ] Software interrupt
    ADC $E3,X               ; [75 E3      ] Add with Carry DP,X
    BRK                     ; [00 CA      ] Software interrupt
    db $72                      ; Incomplete/data bytes

;--- Patch at file offset $105528 (SNES $D05528) ---
org $D05528

    db $71                      ; Incomplete/data bytes

;--- Patch at file offset $105531 (SNES $D05531) ---
org $D05531

    ROR $B2,X               ; [76 B2      ] Rotate Right DP,X
    db $3C                      ; Incomplete/data bytes

;--- Patch at file offset $105558 (SNES $D05558) ---
org $D05558

    SEI                     ; [78         ] Set Interrupt Disable
    DEX                     ; [CA         ] Decrement X
    LDA $00                 ; [A5 00      ] Load A from DP
    ADC ($B1,S),Y           ; [73 B1      ] Add with Carry (SR),Y
    TYA                     ; [98         ] Transfer Y to A
    BRK                     ; [00 D4      ] Software interrupt
    SBC $00,S               ; [E3 00      ] Subtract with Borrow Stack Relative
    CPX $B0D7               ; [EC D7 B0   ] Compare X with Absolute
    PLB                     ; [AB         ] Pull Data Bank
    BRK                     ; [00 77      ] Software interrupt
    db $C4                      ; Incomplete/data bytes

;--- Patch at file offset $10557F (SNES $D0557F) ---
org $D0557F

    LDA ($62,S),Y           ; [B3 62      ] Load A from (SR),Y
    PER $CE84               ; [62 00 79   ] Push Effective Relative

;--- Patch at file offset $11054E (SNES $D1054E) ---
org $D1054E

    WDM #$A1                ; [42 A1      ] Reserved (WDM)
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    SEI                     ; [78         ] Set Interrupt Disable
    ADC ($32,S),Y           ; [73 32      ] Add with Carry (SR),Y
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    BRA $059E               ; [80 43      ] Branch Always
    LDX #$16                ; [A2 16      ] Load X Immediate
    BRK                     ; [00 78      ] Software interrupt
    TDC                     ; [7B         ] Transfer Direct Page to A
    AND ($00)               ; [32 00      ] AND A with (DP)
    BRK                     ; [00 00      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BRA $05AC               ; [80 45      ] Branch Always
    BRA $057E               ; [80 15      ] Branch Always
    BRK                     ; [00 78      ] Software interrupt
    PHB                     ; [8B         ] Push Data Bank

;--- Patch at file offset $110572 (SNES $D10572) ---
org $D10572

    MVP $F1,$15             ; [44 F1 15   ] Block Move Positive
    BRK                     ; [00 78      ] Software interrupt
    LDA ($31),Y             ; [B1 31      ] Load A from (DP),Y
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    BRA $05C8               ; [80 49      ] Branch Always
    BRA $05DA               ; [80 59      ] Branch Always
    BRK                     ; [00 78      ] Software interrupt
    PHB                     ; [8B         ] Push Data Bank
    AND [$00],Y             ; [37 00      ] AND A with [DP],Y
    BRK                     ; [00 00      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BRA $05D1               ; [80 46      ] Branch Always
    CMP ($00,X)             ; [C1 00      ] Compare A with (DP,X)
    BRK                     ; [00 78      ] Software interrupt
    STA ($33,X)             ; [81 33      ] Store A to (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    BRA $05DE               ; [80 47      ] Branch Always
    CMP [$00],Y             ; [D7 00      ] Compare A with [DP],Y
    BRK                     ; [00 78      ] Software interrupt
    BRL $05D2               ; [82 34 00   ] Branch Long
    BRK                     ; [00 00      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BRA $05F0               ; [80 4D      ] Branch Always
    BRA $0540               ; [80 9B      ] Branch Always
    BRK                     ; [00 78      ] Software interrupt
    ADC $215A35,X           ; [7F 35 5A 21] Add with Carry Absolute Long,X
    ORA $38,X               ; [15 38      ] OR A with DP,X
    BRA $05F9               ; [80 4A      ] Branch Always
    TXA                     ; [8A         ] Transfer X to A
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 78      ] Software interrupt
    PHK                     ; [4B         ] Push Program Bank
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    LSR                     ; [4A         ] Shift Right Accumulator
    BIT #$00                ; [89 00      ] Test Bits Immediate
    BRK                     ; [00 78      ] Software interrupt
    BIT $35,X               ; [34 35      ] Test Bits DP,X
    LSR $C2                 ; [46 C2      ] Shift Right DP
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1109CC (SNES $D109CC) ---
org $D109CC

    PHP                     ; [08         ] Push Processor Status
    ORA $00DE00             ; [0F 00 DE 00] OR A with Absolute Long
    BRK                     ; [00 0A      ] Software interrupt
    ORA $020000             ; [0F 00 00 02] OR A with Absolute Long
    BRK                     ; [00 04      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 A8      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $0D                 ; [05 0D      ] OR A with Direct Page
    BRK                     ; [00 0D      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    TSB $06                 ; [04 06      ] Test and Set Bits in DP
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 12      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    COP #$03                ; [02 03      ] Coprocessor interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    COP #$09                ; [02 09      ] Coprocessor interrupt
    BRK                     ; [00 91      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    BRK                     ; [00 05      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    COP #$02                ; [02 02      ] Coprocessor interrupt
    BRK                     ; [00 88      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 12      ] Software interrupt
    BRK                     ; [00 16      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $C7                      ; Incomplete/data bytes

;--- Patch at file offset $110A2C (SNES $D10A2C) ---
org $D10A2C

    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 7F      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 8F      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt

;--- Patch at file offset $111779 (SNES $D11779) ---
org $D11779

    SBC [$66]               ; [E7 66      ] Subtract with Borrow [DP]
    STA $7A                 ; [85 7A      ] Store A to DP
    ADC $8E82,X             ; [7D 82 8E   ] Add with Carry Absolute,X
    STY $E7FF               ; [8C FF E7   ] Store Y to Absolute
    ROR                     ; [6A         ] Rotate Right Accumulator
    PLY                     ; [7A         ] Pull Y Register
    BRA $1805               ; [80 7E      ] Branch Always
    STA [$8E]               ; [87 8E      ] Store A to [DP]
    BRL $FB8B               ; [82 FF E3   ] Branch Long
    RTS                     ; [60         ] Return from Subroutine
    BIT #$88                ; [89 88      ] Test Bits Immediate
    JMP ($9285,X)           ; [7C 85 92   ] Jump Indirect,X
    BIT #$8C                ; [89 8C      ] Test Bits Immediate
    SBC $74,S               ; [E3 74      ] Subtract with Borrow Stack Relative
    STA $A4                 ; [85 A4      ] Store A to DP
    STX $7A                 ; [86 7A      ] Store X to DP
    SBC $EAFFFF,X           ; [FF FF FF EA] Subtract with Borrow Absolute Long,X
    JMP ($8D8E)             ; [6C 8E 8D   ] Jump Indirect
    STY $878E               ; [8C 8E 87   ] Store Y to Absolute
    DEY                     ; [88         ] Decrement Y
    SBC $886BE8,X           ; [FF E8 6B 88] Subtract with Borrow Absolute Long,X
    STA [$80]               ; [87 80      ] Store A to [DP]
    BRL $A635               ; [82 87 8E   ] Branch Long
    STY $64E9               ; [8C E9 64   ] Store Y to Absolute
    PLY                     ; [7A         ] Pull Y Register
    PHB                     ; [8B         ] Push Data Bank
    STA $7B81               ; [8D 81 7B   ] Store A to Absolute
    PHB                     ; [8B         ] Push Data Bank
    STY $ED                 ; [84 ED      ] Store Y to DP
    ADC $7A                 ; [65 7A      ] Add with Carry DP
    LDA $FF8C92             ; [AF 92 8C FF] Load A from Absolute Long
    SBC $79EBFF,X           ; [FF FF EB 79] Subtract with Borrow Absolute Long,X
    ROR $8C8E,X             ; [7E 8E 8C   ] Rotate Right Absolute,X
    SBC $FFFFFF,X           ; [FF FF FF FF] Subtract with Borrow Absolute Long,X
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    ADC $7E,S               ; [63 7E      ] Add with Carry Stack Relative
    STX $88                 ; [86 88      ] Store X to DP
    STA [$8C]               ; [87 8C      ] Store A to [DP]
    db $FF                      ; Incomplete/data bytes

;--- Patch at file offset $111AD9 (SNES $D11AD9) ---
org $D11AD9

    SBC ($65),Y             ; [F1 65      ] Subtract with Borrow (DP),Y
    DEY                     ; [88         ] Decrement Y
    PHB                     ; [8B         ] Push Data Bank
    JMP ($FF7E,X)           ; [7C 7E FF   ] Jump Indirect,X
    SBC $71F2FF,X           ; [FF FF F2 71] Subtract with Borrow Absolute Long,X
    STA ($85)               ; [92 85      ] Store A to (DP)
    PER $A374               ; [62 8B 88   ] Push Effective Relative
    BCC $1A72               ; [90 87      ] Branch if Carry Clear
    SBC ($66)               ; [F2 66      ] Subtract with Borrow (DP)
    PHB                     ; [8B         ] Push Data Bank
    PLY                     ; [7A         ] Pull Y Register
    STA [$7D]               ; [87 7D      ] Store A to [DP]
    SBC $F3FFFF,X           ; [FF FF FF F3] Subtract with Borrow Absolute Long,X
    ADC $82,X               ; [75 82      ] Add with Carry DP,X
    STY $8781               ; [8C 81 87   ] Store Y to Absolute
    STX $FFFF               ; [8E FF FF   ] Store X to Absolute
    SBC ($6C,S),Y           ; [F3 6C      ] Subtract with Borrow (SR),Y
    PLY                     ; [7A         ] Pull Y Register
    STA ($86),Y             ; [91 86      ] Store A to (DP),Y
    STY $85,X               ; [94 85      ] Store Y to DP,X
    STA [$FF]               ; [87 FF      ] Store A to [DP]
    CMP $6B,S               ; [C3 6B      ] Compare A with Stack Relative
    DEY                     ; [88         ] Decrement Y
    PHB                     ; [8B         ] Push Data Bank
    ADC $FF8C,X             ; [7D 8C FF   ] Add with Carry Absolute,X
    SBC $72F4FF,X           ; [FF FF F4 72] Subtract with Borrow Absolute Long,X
    DEY                     ; [88         ] Decrement Y
    PHB                     ; [8B         ] Push Data Bank
    JMP ($8B7E,X)           ; [7C 7E 8B   ] Jump Indirect,X
    DEY                     ; [88         ] Decrement Y
    PHB                     ; [8B         ] Push Data Bank
    CPY $9267               ; [CC 67 92   ] Compare Y with Absolute
    BIT #$7E                ; [89 7E      ] Test Bits Immediate
    PHB                     ; [8B         ] Push Data Bank
    SBC $F4FFFF,X           ; [FF FF FF F4] Subtract with Borrow Absolute Long,X
    PER $95A6               ; [62 81 7A   ] Push Effective Relative
    DEY                     ; [88         ] Decrement Y
    STY $8B6E               ; [8C 6E 8B   ] Store Y to Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    PEA $8B62               ; [F4 62 8B   ] Push Effective Absolute
    STA ($8C)               ; [92 8C      ] Store A to (DP)
    LDA $6E,S               ; [A3 6E      ] Load A from Stack Relative
    PHB                     ; [8B         ] Push Data Bank
    TDC                     ; [7B         ] Transfer Direct Page to A

;--- Patch at file offset $112AE2 (SNES $D12AE2) ---
org $D12AE2

    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($96,X)             ; [41 96      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    db $41                      ; Incomplete/data bytes

;--- Patch at file offset $112B9C (SNES $D12B9C) ---
org $D12B9C

    RTI                     ; [40         ] Return from Interrupt
    COP #$02                ; [02 02      ] Coprocessor interrupt
    DEC                     ; [3A         ] Decrement Accumulator
    COP #$62                ; [02 62      ] Coprocessor interrupt
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    EOR ($0A,X)             ; [41 0A      ] XOR A with (DP,X)
    db $41                      ; Incomplete/data bytes

;--- Patch at file offset $2762F8 (SNES $E762F8) ---
org $E762F8

    ROR $85                 ; [66 85      ] Rotate Right DP
    PLY                     ; [7A         ] Pull Y Register
    ADC $8E82,X             ; [7D 82 8E   ] Add with Carry Absolute,X
    db $8C, $FF                 ; Incomplete/data bytes

;--- Patch at file offset $276310 (SNES $E76310) ---
org $E76310

    ROR                     ; [6A         ] Rotate Right Accumulator
    PLY                     ; [7A         ] Pull Y Register
    BRA $6392               ; [80 7E      ] Branch Always
    STA [$8E]               ; [87 8E      ] Store A to [DP]
    db $82, $FF                 ; Incomplete/data bytes

;--- Patch at file offset $276328 (SNES $E76328) ---
org $E76328

    RTS                     ; [60         ] Return from Subroutine
    BIT #$88                ; [89 88      ] Test Bits Immediate
    JMP ($857A,X)           ; [7C 7A 85   ] Jump Indirect,X
    STA ($89)               ; [92 89      ] Store A to (DP)
    db $8C, $7E                 ; Incomplete/data bytes

;--- Patch at file offset $276340 (SNES $E76340) ---
org $E76340

    STZ $85,X               ; [74 85      ] Store Zero to DP,X
    LDY $86                 ; [A4 86      ] Load Y from DP
    PLY                     ; [7A         ] Pull Y Register
    db $FF, $FF, $FF            ; Incomplete/data bytes

;--- Patch at file offset $276358 (SNES $E76358) ---
org $E76358

    JMP ($8D8E)             ; [6C 8E 8D   ] Jump Indirect
    STY $878E               ; [8C 8E 87   ] Store Y to Absolute
    DEY                     ; [88         ] Decrement Y
    STY $7A                 ; [84 7A      ] Store Y to DP
    STX $82                 ; [86 82      ] Store X to DP

;--- Patch at file offset $276370 (SNES $E76370) ---
org $E76370

    RTL                     ; [6B         ] Return from Subroutine Long
    DEY                     ; [88         ] Decrement Y
    STA [$80]               ; [87 80      ] Store A to [DP]
    BRL $F1FE               ; [82 87 8E   ] Branch Long
    db $8C                      ; Incomplete/data bytes

;--- Patch at file offset $276388 (SNES $E76388) ---
org $E76388

    STZ $7A                 ; [64 7A      ] Store Zero to DP
    PHB                     ; [8B         ] Push Data Bank
    STA $7B81               ; [8D 81 7B   ] Store A to Absolute
    PHB                     ; [8B         ] Push Data Bank
    ROR $847A,X             ; [7E 7A 84   ] Rotate Right Absolute,X
    db $7E, $8B                 ; Incomplete/data bytes

;--- Patch at file offset $2763A0 (SNES $E763A0) ---
org $E763A0

    ADC $7A                 ; [65 7A      ] Add with Carry DP
    LDA $968C92             ; [AF 92 8C 96] Load A from Absolute Long
    ADC ($88,X)             ; [61 88      ] Add with Carry (DP,X)
    db $90                      ; Incomplete/data bytes

;--- Patch at file offset $2763B8 (SNES $E763B8) ---
org $E763B8

    JMP ($7C7A)             ; [6C 7A 7C   ] Jump Indirect
    ROR $8896,X             ; [7E 96 88   ] Rotate Right Absolute,X
    ADC $7E7996,X           ; [7F 96 79 7E] Add with Carry Absolute Long,X
    db $8E, $8C                 ; Incomplete/data bytes

;--- Patch at file offset $2763D0 (SNES $E763D0) ---
org $E763D0

    ADC $7E,S               ; [63 7E      ] Add with Carry Stack Relative
    STX $88                 ; [86 88      ] Store X to DP
    STA [$8C]               ; [87 8C      ] Store A to [DP]
    STX $71,Y               ; [96 71      ] Store X to DP,Y
    DEY                     ; [88         ] Decrement Y
    db $7D                      ; Incomplete/data bytes

;--- Patch at file offset $276BF8 (SNES $E76BF8) ---
org $E76BF8

    ADC $88                 ; [65 88      ] Add with Carry DP
    PHB                     ; [8B         ] Push Data Bank
    JMP ($967E,X)           ; [7C 7E 96   ] Jump Indirect,X
    ADC ($81)               ; [72 81      ] Add with Carry (DP)
    BRL $F181               ; [82 7E 85   ] Branch Long
    db $7D                      ; Incomplete/data bytes

;--- Patch at file offset $276C10 (SNES $E76C10) ---
org $E76C10

    ADC ($88),Y             ; [71 88      ] Add with Carry (DP),Y
    STA ($7A)               ; [92 7A      ] Store A to (DP)
    STA $96                 ; [85 96      ] Store A to DP
    PER $F4A4               ; [62 8B 88   ] Push Effective Relative
    BCC $6BA2               ; [90 87      ] Branch if Carry Clear

;--- Patch at file offset $276C28 (SNES $E76C28) ---
org $E76C28

    ROR $8B                 ; [66 8B      ] Rotate Right DP
    PLY                     ; [7A         ] Pull Y Register
    STA [$7D]               ; [87 7D      ] Store A to [DP]
    STX $67,Y               ; [96 67      ] Store X to DP,Y
    ROR $8685,X             ; [7E 85 86   ] Rotate Right Absolute,X
    db $7E, $8D                 ; Incomplete/data bytes

;--- Patch at file offset $276C40 (SNES $E76C40) ---
org $E76C40

    ADC $82,X               ; [75 82      ] Add with Carry DP,X
    STY $8781               ; [8C 81 87   ] Store Y to Absolute
    STX $7596               ; [8E 96 75   ] Store X to Absolute
    ROR $8D8C,X             ; [7E 8C 8D   ] Rotate Right Absolute,X

;--- Patch at file offset $276C58 (SNES $E76C58) ---
org $E76C58

    JMP ($917A)             ; [6C 7A 91   ] Jump Indirect
    BRL $00E4               ; [82 86 94   ] Branch Long
    STA [$7A],Y             ; [97 7A      ] Store A to [DP],Y
    db $87                      ; Incomplete/data bytes

;--- Patch at file offset $276C70 (SNES $E76C70) ---
org $E76C70

    ADC ($88),Y             ; [71 88      ] Add with Carry (DP),Y
    TDC                     ; [7B         ] Transfer Direct Page to A
    ROR $8896,X             ; [7E 96 88   ] Rotate Right Absolute,X
    ADC $886B96,X           ; [7F 96 6B 88] Add with Carry Absolute Long,X
    PHB                     ; [8B         ] Push Data Bank
    db $7D, $8C                 ; Incomplete/data bytes

;--- Patch at file offset $276C88 (SNES $E76C88) ---
org $E76C88

    ADC ($88)               ; [72 88      ] Add with Carry (DP)
    PHB                     ; [8B         ] Push Data Bank
    JMP ($8B7E,X)           ; [7C 7E 8B   ] Jump Indirect,X
    ROR $8C8B,X             ; [7E 8B 8C   ] Rotate Right Absolute,X
    STX $6C,Y               ; [96 6C      ] Store X to DP,Y
    PLY                     ; [7A         ] Pull Y Register
    STA [$AE]               ; [87 AE      ] Store A to [DP]
    db $7E                      ; Incomplete/data bytes

;--- Patch at file offset $276CA0 (SNES $E76CA0) ---
org $E76CA0

    ADC [$92]               ; [67 92      ] Add with Carry [DP]
    BIT #$7E                ; [89 7E      ] Test Bits Immediate
    PHB                     ; [8B         ] Push Data Bank
    STX $76,Y               ; [96 76      ] Store X to DP,Y
    PHB                     ; [8B         ] Push Data Bank
    BRL $FA37               ; [82 8C 8D   ] Branch Long
    db $96                      ; Incomplete/data bytes

;--- Patch at file offset $276CB8 (SNES $E76CB8) ---
org $E76CB8

    PER $E73C               ; [62 81 7A   ] Push Effective Relative
    DEY                     ; [88         ] Decrement Y
    STY $6E96               ; [8C 96 6E   ] Store Y to Absolute
    PHB                     ; [8B         ] Push Data Bank
    TDC                     ; [7B         ] Transfer Direct Page to A

;--- Patch at file offset $276CD0 (SNES $E76CD0) ---
org $E76CD0

    PER $FF5E               ; [62 8B 92   ] Push Effective Relative
    STY $7A8D               ; [8C 8D 7A   ] Store Y to Absolute
    STA $96                 ; [85 96      ] Store A to DP
    ROR $7B8B               ; [6E 8B 7B   ] Rotate Right Absolute

;--- End of patch ---