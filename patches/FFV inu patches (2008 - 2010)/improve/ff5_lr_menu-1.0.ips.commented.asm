;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_lr_menu-1.0.ips.commented.asm
;    Disassembled from IPS patch: ff5_lr_menu-1.0.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 75 record(s)

;--- Patch at file offset $00E628 (SNES $C0E628) ---
org $C0E628

    BRK                     ; [00 30      ] Software interrupt
    ORA ($18,X)             ; [01 18      ] OR A with (DP,X)
    BRK                     ; [00 B0      ] Software interrupt
    ROR $1180,X             ; [7E 80 11   ] Rotate Right Absolute,X

;--- Patch at file offset $00E631 (SNES $C0E631) ---
org $C0E631

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $00E686 (SNES $C0E686) ---
org $C0E686

    db $F9                      ; Incomplete/data bytes

;--- Patch at file offset $00E6CB (SNES $C0E6CB) ---
org $C0E6CB

    db $D0                      ; Incomplete/data bytes

;--- Patch at file offset $00E70F (SNES $C0E70F) ---
org $C0E70F

    ORA [$31],Y             ; [17 31      ] OR A with [DP],Y
    LDX $4B19               ; [AE 19 4B   ] Load X from Absolute
    LDX $B21D               ; [AE 1D B2   ] Load X from Absolute
    LDA $AFB21E             ; [AF 1E B2 AF] Load A from Absolute Long
    AND ($6E,X)             ; [21 6E      ] AND A with (DP,X)
    LDA ($00),Y             ; [B1 00      ] Load A from (DP),Y
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $00E7C6 (SNES $C0E7C6) ---
org $C0E7C6

    BEQ $E76C               ; [F0 A4      ] Branch if Equal
    ROR                     ; [6A         ] Rotate Right Accumulator
    LDA $78,S               ; [A3 78      ] Load A from Stack Relative
    LDA $5E,S               ; [A3 5E      ] Load A from Stack Relative
    LDY $66                 ; [A4 66      ] Load Y from DP
    LDY $6E                 ; [A4 6E      ] Load Y from DP
    LDY $76                 ; [A4 76      ] Load Y from DP
    LDY $58                 ; [A4 58      ] Load Y from DP
    LDA $41,S               ; [A3 41      ] Load A from Stack Relative
    LDY $A8                 ; [A4 A8      ] Load Y from DP
    db $AC                      ; Incomplete/data bytes

;--- Patch at file offset $00E9F8 (SNES $C0E9F8) ---
org $C0E9F8

    BRK                     ; [00 5F      ] Software interrupt
    db $5E, $5E                 ; Incomplete/data bytes

;--- Patch at file offset $00EA08 (SNES $C0EA08) ---
org $C0EA08

    db $05                      ; Incomplete/data bytes

;--- Patch at file offset $014AF5 (SNES $C14AF5) ---
org $C14AF5

    SEC                     ; [38         ] Set Carry Flag
    JMP $4B98               ; [4C 98 4B   ] Jump Absolute
    LDY #$7B                ; [A0 7B      ] Load Y Immediate
    CMP $BF84               ; [CD 84 BF   ] Compare A with Absolute
    LDY #$BB                ; [A0 BB      ] Load Y Immediate
    CMP $C184               ; [CD 84 C1   ] Compare A with Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAY                     ; [A8         ] Transfer A to Y
    RTS                     ; [60         ] Return from Subroutine
    LDA $CDFA               ; [AD FA CD   ] Load A from Absolute
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $CEFFF5,X           ; [BF F5 FF CE] Load A from Absolute Long,X
    STA $CD75               ; [8D 75 CD   ] Store A to Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    INC $CD74               ; [EE 74 CD   ] Increment Absolute
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $014B8F (SNES $C14B8F) ---
org $C14B8F

    CLC                     ; [18         ] Clear Carry Flag
    JMP $4B98               ; [4C 98 4B   ] Jump Absolute
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    LDX #$BC                ; [A2 BC      ] Load X Immediate
    BRK                     ; [00 BD      ] Software interrupt
    AND [$BA],Y             ; [37 BA      ] AND A with [DP],Y
    STA $B2D5,X             ; [9D D5 B2   ] Store A to Absolute,X
    DEX                     ; [CA         ] Decrement X
    DEX                     ; [CA         ] Decrement X
    DEX                     ; [CA         ] Decrement X
    DEX                     ; [CA         ] Decrement X
    BPL $4B9B               ; [10 F4      ] Branch if Plus
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    JSR $5E23               ; [20 23 5E   ] Jump to Subroutine

;--- Patch at file offset $015574 (SNES $C15574) ---
org $C15574

    JSR $57E7               ; [20 E7 57   ] Jump to Subroutine
    LDA $2E38,X             ; [BD 38 2E   ] Load A from Absolute,X
    TAX                     ; [AA         ] Transfer A to X
    CMP #$64                ; [C9 64      ] Compare A Immediate
    TDC                     ; [7B         ] Transfer Direct Page to A
    ADC #$68                ; [69 68      ] Add with Carry Immediate
    STA $C363               ; [8D 63 C3   ] Store A to Absolute
    CPX #$0A                ; [E0 0A      ] Compare X Immediate
    BRK                     ; [00 7B      ] Software interrupt
    ADC #$68                ; [69 68      ] Add with Carry Immediate
    STA $C365               ; [8D 65 C3   ] Store A to Absolute
    TXA                     ; [8A         ] Transfer X to A
    CMP #$64                ; [C9 64      ] Compare A Immediate
    BCC $5598               ; [90 07      ] Branch if Carry Clear
    SBC #$64                ; [E9 64      ] Subtract with Borrow Immediate
    INC $C363               ; [EE 63 C3   ] Increment Absolute
    BRA $558D               ; [80 F5      ] Branch Always
    CMP #$0A                ; [C9 0A      ] Compare A Immediate
    BCC $55A3               ; [90 07      ] Branch if Carry Clear
    SBC #$0A                ; [E9 0A      ] Subtract with Borrow Immediate
    INC $C365               ; [EE 65 C3   ] Increment Absolute
    BRA $5598               ; [80 F5      ] Branch Always
    ADC #$69                ; [69 69      ] Add with Carry Immediate
    STA $C367               ; [8D 67 C3   ] Store A to Absolute
    INC $CD44               ; [EE 44 CD   ] Increment Absolute
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    LDA #$04                ; [A9 04      ] Load A Immediate
    BRA $55BF               ; [80 02      ] Branch Always
    LDA #$03                ; [A9 03      ] Load A Immediate
    PHA                     ; [48         ] Push Accumulator
    LDA $CD3A               ; [AD 3A CD   ] Load A from Absolute
    STA $CD3B               ; [8D 3B CD   ] Store A to Absolute
    PLA                     ; [68         ] Pull Accumulator
    STA $CD3A               ; [8D 3A CD   ] Store A to Absolute
    LDA #$03                ; [A9 03      ] Load A Immediate
    db $8D, $37                 ; Incomplete/data bytes

;--- Patch at file offset $0155E0 (SNES $C155E0) ---
org $C155E0

    EOR #$A9                ; [49 A9      ] XOR A with Immediate
    AND ($8D,S),Y           ; [33 8D      ] AND A with (SR),Y
    ADC $B3A9CD             ; [6F CD A9 B3] Add with Carry Absolute Long
    STA $CD73               ; [8D 73 CD   ] Store A to Absolute
    LDA ($D9),Y             ; [B1 D9      ] Load A from (DP),Y
    BEQ $55F2               ; [F0 03      ] Branch if Equal
    INC $CD6C               ; [EE 6C CD   ] Increment Absolute
    CMP $DD                 ; [C5 DD      ] Compare A with DP
    BEQ $55F9               ; [F0 03      ] Branch if Equal
    INC $CD70               ; [EE 70 CD   ] Increment Absolute
    LDA $00                 ; [A5 00      ] Load A from DP
    BPL $5623               ; [10 26      ] Branch if Plus
    JSR $FBB8               ; [20 B8 FB   ] Jump to Subroutine
    JSR $57E7               ; [20 E7 57   ] Jump to Subroutine
    LDA $2F3C,X             ; [BD 3C 2F   ] Load A from Absolute,X
    BPL $560B               ; [10 03      ] Branch if Plus
    JMP $FBCE               ; [4C CE FB   ] Jump Absolute
    STZ $CD48               ; [9C 48 CD   ] Store Zero to Absolute
    PHX                     ; [DA         ] Push X Register
    LDA $F890               ; [AD 90 F8   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA ($D3),Y             ; [B1 D3      ] Load A from (DP),Y
    JSR $57F7               ; [20 F7 57   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    LDA #$0B                ; [A9 0B      ] Load A Immediate
    STA $88                 ; [85 88      ] Store A to DP
    LDA $2EBA,X             ; [BD BA 2E   ] Load A from Absolute,X
    JMP $510E               ; [4C 0E 51   ] Jump Absolute
    LDA $01                 ; [A5 01      ] Load A from DP
    BPL $5630               ; [10 09      ] Branch if Plus
    JSR $FBC3               ; [20 C3 FB   ] Jump to Subroutine
    STZ $CD48               ; [9C 48 CD   ] Store Zero to Absolute
    JMP $4773               ; [4C 73 47   ] Jump Absolute
    JSR $5574               ; [20 74 55   ] Jump to Subroutine
    JSR $5536               ; [20 36 55   ] Jump to Subroutine
    LDA $01                 ; [A5 01      ] Load A from DP
    BIT #$02                ; [89 02      ] Test Bits Immediate
    BNE $5686               ; [D0 4A      ] Branch if Not Equal
    BIT #$01                ; [89 01      ] Test Bits Immediate
    BNE $5655               ; [D0 15      ] Branch if Not Equal
    BIT #$04                ; [89 04      ] Test Bits Immediate
    BNE $56B1               ; [D0 6D      ] Branch if Not Equal
    BIT #$08                ; [89 08      ] Test Bits Immediate
    BEQ $564B               ; [F0 03      ] Branch if Equal
    JMP $56DD               ; [4C DD 56   ] Jump Absolute
    LDA $00                 ; [A5 00      ] Load A from DP
    AND #$30                ; [29 30      ] AND A with Immediate
    BEQ $5654               ; [F0 03      ] Branch if Equal
    JMP $5705               ; [4C 05 57   ] Jump Absolute
    RTS                     ; [60         ] Return from Subroutine
    LDA ($D5),Y             ; [B1 D5      ] Load A from (DP),Y
    CMP $D1                 ; [C5 D1      ] Compare A with DP
    BEQ $566A               ; [F0 0F      ] Branch if Equal
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    LDA ($D3),Y             ; [B1 D3      ] Load A from (DP),Y
    INC                     ; [1A         ] Increment Accumulator
    STA ($D3),Y             ; [91 D3      ] Store A to (DP),Y
    LDA ($D5),Y             ; [B1 D5      ] Load A from (DP),Y
    INC                     ; [1A         ] Increment Accumulator
    STA ($D5),Y             ; [91 D5      ] Store A to (DP),Y
    BRA $5683               ; [80 19      ] Branch Always
    LDA $DC                 ; [A5 DC      ] Load A from DP
    SEC                     ; [38         ] Set Carry Flag
    SBC $DB                 ; [E5 DB      ] Subtract with Borrow DP
    CMP ($D3),Y             ; [D1 D3      ] Compare A with (DP),Y
    BEQ $5683               ; [F0 10      ] Branch if Equal
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    LDA ($D3),Y             ; [B1 D3      ] Load A from (DP),Y
    SEC                     ; [38         ] Set Carry Flag
    SBC $D1                 ; [E5 D1      ] Subtract with Borrow DP
    STA ($D3),Y             ; [91 D3      ] Store A to (DP),Y
    TDC                     ; [7B         ] Transfer Direct Page to A
    STA ($D5),Y             ; [91 D5      ] Store A to (DP),Y
    JSR $56B1               ; [20 B1 56   ] Jump to Subroutine
    JMP $5536               ; [4C 36 55   ] Jump Absolute
    LDA ($D5),Y             ; [B1 D5      ] Load A from (DP),Y

;--- Patch at file offset $01568E (SNES $C1568E) ---
org $C1568E

    CMP $3A,X               ; [D5 3A      ] Compare A with DP,X
    STA ($D5),Y             ; [91 D5      ] Store A to (DP),Y
    LDA ($D3),Y             ; [B1 D3      ] Load A from (DP),Y
    DEC                     ; [3A         ] Decrement Accumulator
    STA ($D3),Y             ; [91 D3      ] Store A to (DP),Y
    BRA $56AE               ; [80 15      ] Branch Always
    LDA ($D3),Y             ; [B1 D3      ] Load A from (DP),Y
    BEQ $56AE               ; [F0 11      ] Branch if Equal
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    LDA ($D3),Y             ; [B1 D3      ] Load A from (DP),Y
    CLC                     ; [18         ] Clear Carry Flag
    ADC $D1                 ; [65 D1      ] Add with Carry DP
    STA ($D3),Y             ; [91 D3      ] Store A to (DP),Y
    LDA $D1                 ; [A5 D1      ] Load A from DP
    STA ($D5),Y             ; [91 D5      ] Store A to (DP),Y
    JSR $56DD               ; [20 DD 56   ] Jump to Subroutine
    JMP $5536               ; [4C 36 55   ] Jump Absolute
    LDA ($D7),Y             ; [B1 D7      ] Load A from (DP),Y
    CMP #$03                ; [C9 03      ] Compare A Immediate
    BEQ $56C7               ; [F0 10      ] Branch if Equal
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    LDA ($D3),Y             ; [B1 D3      ] Load A from (DP),Y
    CLC                     ; [18         ] Clear Carry Flag
    ADC $D2                 ; [65 D2      ] Add with Carry DP
    STA ($D3),Y             ; [91 D3      ] Store A to (DP),Y
    LDA ($D7),Y             ; [B1 D7      ] Load A from (DP),Y
    INC                     ; [1A         ] Increment Accumulator
    STA ($D7),Y             ; [91 D7      ] Store A to (DP),Y
    RTS                     ; [60         ] Return from Subroutine
    LDA ($D9),Y             ; [B1 D9      ] Load A from (DP),Y
    CMP $DD                 ; [C5 DD      ] Compare A with DP
    BEQ $56C6               ; [F0 F9      ] Branch if Equal
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    LDA ($D3),Y             ; [B1 D3      ] Load A from (DP),Y
    CLC                     ; [18         ] Clear Carry Flag
    ADC $D2                 ; [65 D2      ] Add with Carry DP
    STA ($D3),Y             ; [91 D3      ] Store A to (DP),Y
    JSR $5750               ; [20 50 57   ] Jump to Subroutine
    JMP $55BD               ; [4C BD 55   ] Jump Absolute
    LDA ($D7),Y             ; [B1 D7      ] Load A from (DP),Y
    BEQ $56F1               ; [F0 10      ] Branch if Equal
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    LDA ($D3),Y             ; [B1 D3      ] Load A from (DP),Y
    SEC                     ; [38         ] Set Carry Flag
    SBC $D2                 ; [E5 D2      ] Subtract with Borrow DP
    STA ($D3),Y             ; [91 D3      ] Store A to (DP),Y
    LDA ($D7),Y             ; [B1 D7      ] Load A from (DP),Y
    DEC                     ; [3A         ] Decrement Accumulator
    STA ($D7),Y             ; [91 D7      ] Store A to (DP),Y
    RTS                     ; [60         ] Return from Subroutine
    LDA ($D9),Y             ; [B1 D9      ] Load A from (DP),Y
    BEQ $56F0               ; [F0 FB      ] Branch if Equal
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    LDA ($D3),Y             ; [B1 D3      ] Load A from (DP),Y
    SEC                     ; [38         ] Set Carry Flag
    SBC $D2                 ; [E5 D2      ] Subtract with Borrow DP
    STA ($D3),Y             ; [91 D3      ] Store A to (DP),Y
    JSR $576C               ; [20 6C 57   ] Jump to Subroutine
    JMP $55B9               ; [4C B9 55   ] Jump Absolute
    LDX #$04                ; [A2 04      ] Load X Immediate
    BRK                     ; [00 29      ] Software interrupt
    JSR $0AF0               ; [20 F0 0A   ] Jump to Subroutine
    JSR $572A               ; [20 2A 57   ] Jump to Subroutine
    CPX #$04                ; [E0 04      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    BRA $5729               ; [80 13      ] Branch Always
    JSR $573C               ; [20 3C 57   ] Jump to Subroutine
    CPX #$04                ; [E0 04      ] Compare X Immediate
    BRK                     ; [00 F0      ] Software interrupt
    PHD                     ; [0B         ] Push Direct Page Register
    CLC                     ; [18         ] Clear Carry Flag
    LDA #$1B                ; [A9 1B      ] Load A Immediate
    ADC $CF                 ; [65 CF      ] Add with Carry DP
    STA $CD39               ; [8D 39 CD   ] Store A to Absolute
    JMP $FBAD               ; [4C AD FB   ] Jump Absolute
    RTS                     ; [60         ] Return from Subroutine
    LDA ($D9),Y             ; [B1 D9      ] Load A from (DP),Y
    BEQ $573B               ; [F0 0D      ] Branch if Equal
    DEC                     ; [3A         ] Decrement Accumulator
    STA ($D9),Y             ; [91 D9      ] Store A to (DP),Y
    LDA ($D3),Y             ; [B1 D3      ] Load A from (DP),Y
    SEC                     ; [38         ] Set Carry Flag
    SBC $D2                 ; [E5 D2      ] Subtract with Borrow DP
    STA ($D3),Y             ; [91 D3      ] Store A to (DP),Y
    DEX                     ; [CA         ] Decrement X
    BNE $572A               ; [D0 EF      ] Branch if Not Equal
    RTS                     ; [60         ] Return from Subroutine
    LDA ($D9),Y             ; [B1 D9      ] Load A from (DP),Y
    CMP $DD                 ; [C5 DD      ] Compare A with DP
    BEQ $574F               ; [F0 0D      ] Branch if Equal
    INC                     ; [1A         ] Increment Accumulator
    STA ($D9),Y             ; [91 D9      ] Store A to (DP),Y
    LDA ($D3),Y             ; [B1 D3      ] Load A from (DP),Y
    CLC                     ; [18         ] Clear Carry Flag
    ADC $D2                 ; [65 D2      ] Add with Carry DP
    STA ($D3),Y             ; [91 D3      ] Store A to (DP),Y
    DEX                     ; [CA         ] Decrement X
    BNE $573C               ; [D0 ED      ] Branch if Not Equal

;--- Patch at file offset $0157B2 (SNES $C157B2) ---
org $C157B2

    TYA                     ; [98         ] Transfer Y to A
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    JSR $5784               ; [20 84 57   ] Jump to Subroutine
    JSR $4AF9               ; [20 F9 4A   ] Jump to Subroutine
    LDA $CF                 ; [A5 CF      ] Load A from DP
    BEQ $57CB               ; [F0 0C      ] Branch if Equal
    JSR $584B               ; [20 4B 58   ] Jump to Subroutine
    INX                     ; [E8         ] Increment X
    JSR $584B               ; [20 4B 58   ] Jump to Subroutine
    LDX #$08                ; [A2 08      ] Load X Immediate
    BRK                     ; [00 80      ] Software interrupt
    ASL $0620               ; [0E 20 06   ] Shift Left Absolute
    CLI                     ; [58         ] Clear Interrupt Disable
    INX                     ; [E8         ] Increment X
    JSR $5806               ; [20 06 58   ] Jump to Subroutine
    INX                     ; [E8         ] Increment X
    JSR $5806               ; [20 06 58   ] Jump to Subroutine
    LDX #$07                ; [A2 07      ] Load X Immediate
    BRK                     ; [00 A9      ] Software interrupt
    SBC $5F6B20,X           ; [FF 20 6B 5F] Subtract with Borrow Absolute Long,X
    DEX                     ; [CA         ] Decrement X
    BNE $57D9               ; [D0 F8      ] Branch if Not Equal
    JSR $4B06               ; [20 06 4B   ] Jump to Subroutine
    PLY                     ; [7A         ] Pull Y Register
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    LDA ($D3),Y             ; [B1 D3      ] Load A from (DP),Y
    CLC                     ; [18         ] Clear Carry Flag
    ADC $DB                 ; [65 DB      ] Add with Carry DP
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    ADC $CEFF8D,X           ; [7F 8D FF CE] Add with Carry Absolute Long,X
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    RTS                     ; [60         ] Return from Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    ADC $DB                 ; [65 DB      ] Add with Carry DP
    STA $41B6,X             ; [9D B6 41   ] Store A to Absolute,X
    LDA #$20                ; [A9 20      ] Load A Immediate
    ORA $F891               ; [0D 91 F8   ] OR A with Absolute
    STA $41B1,X             ; [9D B1 41   ] Store A to Absolute,X

;--- Patch at file offset $015BB0 (SNES $C15BB0) ---
org $C15BB0

    db $42                      ; Incomplete/data bytes

;--- Patch at file offset $015BB9 (SNES $C15BB9) ---
org $C15BB9

    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $015BC4 (SNES $C15BC4) ---
org $C15BC4

    EOR ($A9)               ; [52 A9      ] XOR A with (DP)
    BPL $5C14               ; [10 4C      ] Branch if Plus
    REP #$5D                ; [C2 5D      ] Reset Processor Status Bits
    LDA $01                 ; [A5 01      ] Load A from DP
    BPL $5BE0               ; [10 12      ] Branch if Plus
    JSR $FBC3               ; [20 C3 FB   ] Jump to Subroutine
    LDA $F88C               ; [AD 8C F8   ] Load A from Absolute
    BPL $5BDB               ; [10 05      ] Branch if Plus
    JSR $5B93               ; [20 93 5B   ] Jump to Subroutine
    BRA $5C17               ; [80 3C      ] Branch Always
    INC $0439,X             ; [FE 39 04   ] Increment Absolute,X
    BRA $5BF3               ; [80 13      ] Branch Always
    BIT #$04                ; [89 04      ] Test Bits Immediate
    BEQ $5BF9               ; [F0 15      ] Branch if Equal
    LDA $0435,X             ; [BD 35 04   ] Load A from Absolute,X
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    STA $0445,X             ; [9D 45 04   ] Store A to Absolute,X
    STA $0441,X             ; [9D 41 04   ] Store A to Absolute,X
    STZ $043D,X             ; [9E 3D 04   ] Store Zero to Absolute,X
    STZ $CD48               ; [9C 48 CD   ] Store Zero to Absolute
    JMP $47A3               ; [4C A3 47   ] Jump Absolute
    BIT #$02                ; [89 02      ] Test Bits Immediate
    BEQ $5C05               ; [F0 08      ] Branch if Equal
    LDA $0435,X             ; [BD 35 04   ] Load A from Absolute,X
    BEQ $5C17               ; [F0 15      ] Branch if Equal
    DEC                     ; [3A         ] Decrement Accumulator
    BRA $5C11               ; [80 0C      ] Branch Always
    BIT #$01                ; [89 01      ] Test Bits Immediate
    BEQ $5C17               ; [F0 0E      ] Branch if Equal
    LDA $0435,X             ; [BD 35 04   ] Load A from Absolute,X
    DEC                     ; [3A         ] Decrement Accumulator
    BEQ $5BE7               ; [F0 D8      ] Branch if Equal
    INC                     ; [1A         ] Increment Accumulator
    INC                     ; [1A         ] Increment Accumulator
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    STA $0435,X             ; [9D 35 04   ] Store A to Absolute,X
    LDA $0435,X             ; [BD 35 04   ] Load A from Absolute,X
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    LDA $C1525B,X           ; [BF 5B 52 C1] Load A from Absolute Long,X
    STA $CD49               ; [8D 49 CD   ] Store A to Absolute
    LDA $C1525C,X           ; [BF 5C 52 C1] Load A from Absolute Long,X
    STA $CD4A               ; [8D 4A CD   ] Store A to Absolute
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $CD48               ; [8D 48 CD   ] Store A to Absolute
    LDA #$33                ; [A9 33      ] Load A Immediate
    STA $CD4B               ; [8D 4B CD   ] Store A to Absolute
    STA $CD53               ; [8D 53 CD   ] Store A to Absolute
    STZ $CD50               ; [9C 50 CD   ] Store Zero to Absolute
    LDA $F88C               ; [AD 8C F8   ] Load A from Absolute
    AND #$40                ; [29 40      ] AND A with Immediate
    BEQ $5C59               ; [F0 18      ] Branch if Equal
    LDA $F88D               ; [AD 8D F8   ] Load A from Absolute
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    LDA $C1525B,X           ; [BF 5B 52 C1] Load A from Absolute Long,X
    ADC #$04                ; [69 04      ] Add with Carry Immediate
    STA $CD51               ; [8D 51 CD   ] Store A to Absolute
    LDA $C1525C,X           ; [BF 5C 52 C1] Load A from Absolute Long,X
    STA $CD52               ; [8D 52 CD   ] Store A to Absolute
    INC $CD50               ; [EE 50 CD   ] Increment Absolute
    RTS                     ; [60         ] Return from Subroutine
    LDA $044D,X             ; [BD 4D 04   ] Load A from Absolute,X
    BEQ $5C6F               ; [F0 10      ] Branch if Equal
    DEC $0441,X             ; [DE 41 04   ] Decrement Absolute,X
    DEC $0441,X             ; [DE 41 04   ] Decrement Absolute,X
    DEC $044D,X             ; [DE 4D 04   ] Decrement Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    JSR $5E1F               ; [20 1F 5E   ] Jump to Subroutine
    DEY                     ; [88         ] Decrement Y
    BNE $5C5A               ; [D0 EB      ] Branch if Not Equal
    RTS                     ; [60         ] Return from Subroutine
    LDA $044D,X             ; [BD 4D 04   ] Load A from Absolute,X
    CMP #$7C                ; [C9 7C      ] Compare A Immediate
    BEQ $5C87               ; [F0 10      ] Branch if Equal
    INC $0441,X             ; [FE 41 04   ] Increment Absolute,X
    INC $0441,X             ; [FE 41 04   ] Increment Absolute,X
    INC $044D,X             ; [FE 4D 04   ] Increment Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    JSR $5E1F               ; [20 1F 5E   ] Jump to Subroutine
    DEY                     ; [88         ] Decrement Y
    BNE $5C70               ; [D0 E9      ] Branch if Not Equal

;--- Patch at file offset $015C96 (SNES $C15C96) ---
org $C15C96

    EOR $0439BD             ; [4F BD 39 04] XOR A with Absolute Long
    BNE $5CE6               ; [D0 4A      ] Branch if Not Equal
    INC $CD6C               ; [EE 6C CD   ] Increment Absolute
    LDA #$03                ; [A9 03      ] Load A Immediate
    STA $CD6F               ; [8D 6F CD   ] Store A to Absolute
    LDA #$83                ; [A9 83      ] Load A Immediate
    STA $CD73               ; [8D 73 CD   ] Store A to Absolute
    LDA $044D,X             ; [BD 4D 04   ] Load A from Absolute,X
    CMP #$7C                ; [C9 7C      ] Compare A Immediate
    BEQ $5CB3               ; [F0 03      ] Branch if Equal
    INC $CD70               ; [EE 70 CD   ] Increment Absolute
    LDA $CFC3               ; [AD C3 CF   ] Load A from Absolute
    BEQ $5CBB               ; [F0 03      ] Branch if Equal
    STZ $043D,X             ; [9E 3D 04   ] Store Zero to Absolute,X
    LDA $043D,X             ; [BD 3D 04   ] Load A from Absolute,X
    BNE $5D12               ; [D0 52      ] Branch if Not Equal
    JSR $5511               ; [20 11 55   ] Jump to Subroutine
    LDA $00                 ; [A5 00      ] Load A from DP
    BPL $5CD7               ; [10 10      ] Branch if Plus
    JSR $FBB8               ; [20 B8 FB   ] Jump to Subroutine
    LDA $0441,X             ; [BD 41 04   ] Load A from Absolute,X
    JSR $594E               ; [20 4E 59   ] Jump to Subroutine
    BCC $5D0B               ; [90 39      ] Branch if Carry Clear
    LDA #$40                ; [A9 40      ] Load A Immediate
    JMP $5DC2               ; [4C C2 5D   ] Jump Absolute
    LDA $01                 ; [A5 01      ] Load A from DP
    BPL $5CEF               ; [10 14      ] Branch if Plus
    JSR $FBC3               ; [20 C3 FB   ] Jump to Subroutine
    LDA $F88C               ; [AD 8C F8   ] Load A from Absolute
    BPL $5CE6               ; [10 03      ] Branch if Plus
    JMP $5B93               ; [4C 93 5B   ] Jump Absolute
    STZ $CD48               ; [9C 48 CD   ] Store Zero to Absolute
    STZ $0439,X             ; [9E 39 04   ] Store Zero to Absolute,X
    JMP $47FE               ; [4C FE 47   ] Jump Absolute
    BIT #$02                ; [89 02      ] Test Bits Immediate
    BNE $5D18               ; [D0 25      ] Branch if Not Equal
    BIT #$01                ; [89 01      ] Test Bits Immediate
    BNE $5D42               ; [D0 4B      ] Branch if Not Equal
    BIT #$04                ; [89 04      ] Test Bits Immediate
    BEQ $5CFE               ; [F0 03      ] Branch if Equal
    JMP $5D98               ; [4C 98 5D   ] Jump Absolute
    BIT #$08                ; [89 08      ] Test Bits Immediate
    BNE $5D68               ; [D0 66      ] Branch if Not Equal
    LDA $00                 ; [A5 00      ] Load A from DP
    AND #$30                ; [29 30      ] AND A with Immediate
    BEQ $5D0B               ; [F0 03      ] Branch if Equal
    JMP $5EE0               ; [4C E0 5E   ] Jump Absolute
    RTS                     ; [60         ] Return from Subroutine
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    STA $0435,X             ; [9D 35 04   ] Store A to Absolute,X
    STZ $CD48               ; [9C 48 CD   ] Store Zero to Absolute
    JMP $4789               ; [4C 89 47   ] Jump Absolute
    LDA $0445,X             ; [BD 45 04   ] Load A from Absolute,X
    BEQ $5D28               ; [F0 0B      ] Branch if Equal
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    DEC $0441,X             ; [DE 41 04   ] Decrement Absolute,X
    DEC $0445,X             ; [DE 45 04   ] Decrement Absolute,X
    BRA $5D3F               ; [80 17      ] Branch Always
    LDA $0441,X             ; [BD 41 04   ] Load A from Absolute,X
    BNE $5D36               ; [D0 09      ] Branch if Not Equal
    LDA $CFC3               ; [AD C3 CF   ] Load A from Absolute
    BNE $5D3F               ; [D0 0D      ] Branch if Not Equal
    LDA #$01                ; [A9 01      ] Load A Immediate
    BRA $5D0C               ; [80 D6      ] Branch Always
    INC $0441,X             ; [FE 41 04   ] Increment Absolute,X
    INC $0445,X             ; [FE 45 04   ] Increment Absolute,X
    JSR $5D68               ; [20 68 5D   ] Jump to Subroutine
    JMP $5511               ; [4C 11 55   ] Jump Absolute
    LDA $0445,X             ; [BD 45 04   ] Load A from Absolute,X
    BNE $5D52               ; [D0 0B      ] Branch if Not Equal
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    INC $0441,X             ; [FE 41 04   ] Increment Absolute,X
    INC $0445,X             ; [FE 45 04   ] Increment Absolute,X
    BRA $5D65               ; [80 13      ] Branch Always
    LDA $0441,X             ; [BD 41 04   ] Load A from Absolute,X
    CMP #$FF                ; [C9 FF      ] Compare A Immediate
    BEQ $5D65               ; [F0 0C      ] Branch if Equal
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    DEC $0441,X             ; [DE 41 04   ] Decrement Absolute,X
    STZ $0445,X             ; [9E 45 04   ] Store Zero to Absolute,X
    JSR $5D98               ; [20 98 5D   ] Jump to Subroutine
    JMP $5511               ; [4C 11 55   ] Jump Absolute
    LDA $0449,X             ; [BD 49 04   ] Load A from Absolute,X
    BEQ $5D7A               ; [F0 0D      ] Branch if Equal
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    DEC $0449,X             ; [DE 49 04   ] Decrement Absolute,X
    DEC $0441,X             ; [DE 41 04   ] Decrement Absolute,X
    DEC $0441,X             ; [DE 41 04   ] Decrement Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    LDA $044D,X             ; [BD 4D 04   ] Load A from Absolute,X
    BNE $5D89               ; [D0 0A      ] Branch if Not Equal
    LDA $CFC3               ; [AD C3 CF   ] Load A from Absolute
    BNE $5D79               ; [D0 F5      ] Branch if Not Equal
    LDA $0445,X             ; [BD 45 04   ] Load A from Absolute,X
    BRA $5D0C               ; [80 83      ] Branch Always
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    DEC $0441,X             ; [DE 41 04   ] Decrement Absolute,X
    DEC $0441,X             ; [DE 41 04   ] Decrement Absolute,X
    JSR $5DD4               ; [20 D4 5D   ] Jump to Subroutine
    JMP $55B9               ; [4C B9 55   ] Jump Absolute
    LDA $0449,X             ; [BD 49 04   ] Load A from Absolute,X
    CMP #$03                ; [C9 03      ] Compare A Immediate
    BEQ $5DAC               ; [F0 0D      ] Branch if Equal
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    INC $0441,X             ; [FE 41 04   ] Increment Absolute,X
    INC $0441,X             ; [FE 41 04   ] Increment Absolute,X
    INC $0449,X             ; [FE 49 04   ] Increment Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    LDA $044D,X             ; [BD 4D 04   ] Load A from Absolute,X
    CMP #$7C                ; [C9 7C      ] Compare A Immediate
    BEQ $5DAB               ; [F0 F8      ] Branch if Equal
    JSR $FBAD               ; [20 AD FB   ] Jump to Subroutine
    INC $0441,X             ; [FE 41 04   ] Increment Absolute,X
    INC $0441,X             ; [FE 41 04   ] Increment Absolute,X
    JSR $5DEA               ; [20 EA 5D   ] Jump to Subroutine
    JMP $55BD               ; [4C BD 55   ] Jump Absolute
    PHA                     ; [48         ] Push Accumulator
    LDA $F890               ; [AD 90 F8   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    PLA                     ; [68         ] Pull Accumulator
    ORA $F891               ; [0D 91 F8   ] OR A with Absolute
    STA $41B1,X             ; [9D B1 41   ] Store A to Absolute,X
    STZ $CD48               ; [9C 48 CD   ] Store Zero to Absolute
    JMP $5B93               ; [4C 93 5B   ] Jump Absolute

;--- Patch at file offset $015E08 (SNES $C15E08) ---
org $C15E08

    JSR $4AF9               ; [20 F9 4A   ] Jump to Subroutine
    LDA $044D,X             ; [BD 4D 04   ] Load A from Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    ADC $88                 ; [65 88      ] Add with Carry DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    JSR $5E3B               ; [20 3B 5E   ] Jump to Subroutine
    INX                     ; [E8         ] Increment X
    JSR $5E3B               ; [20 3B 5E   ] Jump to Subroutine
    JSR $4B06               ; [20 06 4B   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    RTS                     ; [60         ] Return from Subroutine
    LDA #$0C                ; [A9 0C      ] Load A Immediate
    BRA $5E25               ; [80 02      ] Branch Always
    LDA #$04                ; [A9 04      ] Load A Immediate
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    BCC $5E2C               ; [90 03      ] Branch if Carry Clear
    EOR #$FF                ; [49 FF      ] XOR A with Immediate
    SBC $CF3E6D,X           ; [FF 6D 3E CF] Subtract with Borrow Absolute Long,X
    STA $CF3E               ; [8D 3E CF   ] Store A to Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $015EE0 (SNES $C15EE0) ---
org $C15EE0

    LDY #$04                ; [A0 04      ] Load Y Immediate
    BRK                     ; [00 29      ] Software interrupt
    JSR $19F0               ; [20 F0 19   ] Jump to Subroutine
    JSR $5C5A               ; [20 5A 5C   ] Jump to Subroutine
    CPY #$04                ; [C0 04      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    ORA $C3AD,Y             ; [19 AD C3   ] OR A with Absolute,Y
    CMP $9E1CD0             ; [CF D0 1C 9E] Compare A with Absolute Long
    EOR #$04                ; [49 04      ] XOR A with Immediate
    LDA $0445,X             ; [BD 45 04   ] Load A from Absolute,X
    STA $0441,X             ; [9D 41 04   ] Store A to Absolute,X
    JMP $5D0C               ; [4C 0C 5D   ] Jump Absolute
    JSR $5C70               ; [20 70 5C   ] Jump to Subroutine
    CPY #$04                ; [C0 04      ] Compare Y Immediate
    BRK                     ; [00 F0      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    LDA #$19                ; [A9 19      ] Load A Immediate
    STA $CD39               ; [8D 39 CD   ] Store A to Absolute
    JMP $FBAD               ; [4C AD FB   ] Jump Absolute
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $027964 (SNES $C27964) ---
org $C27964

    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $0A                 ; [A5 0A      ] Load A from DP
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    TXA                     ; [8A         ] Transfer X to A
    BCC $7973               ; [90 03      ] Branch if Carry Clear
    EOR #$FF                ; [49 FF      ] XOR A with Immediate
    SBC $106B65,X           ; [FF 65 6B 10] Subtract with Borrow Absolute Long,X
    COP #$A5                ; [02 A5      ] Coprocessor interrupt
    STX $6DC5               ; [8E C5 6D   ] Store X to Absolute
    BMI $797F               ; [30 02      ] Branch if Minus
    LDA $6D                 ; [A5 6D      ] Load A from DP
    STA $6B                 ; [85 6B      ] Store A to DP
    RTS                     ; [60         ] Return from Subroutine
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $0A                 ; [A5 0A      ] Load A from DP
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    LDA $71                 ; [A5 71      ] Load A from DP
    BCC $798F               ; [90 02      ] Branch if Carry Clear
    DEC                     ; [3A         ] Decrement Accumulator
    DEC                     ; [3A         ] Decrement Accumulator
    INC                     ; [1A         ] Increment Accumulator
    AND #$03                ; [29 03      ] AND A with Immediate
    STA $71                 ; [85 71      ] Store A to DP
    STA $7E                 ; [85 7E      ] Store A to DP
    STZ $7F                 ; [64 7F      ] Store Zero to DP
    JSR $D4C5               ; [20 C5 D4   ] Jump to Subroutine
    LDX $7E                 ; [A6 7E      ] Load X from DP
    LDY $80                 ; [A4 80      ] Load Y from DP
    LDA $0500,Y             ; [B9 00 05   ] Load A from Absolute,Y
    AND #$40                ; [29 40      ] AND A with Immediate
    BNE $7984               ; [D0 DE      ] Branch if Not Equal
    LDA $54                 ; [A5 54      ] Load A from DP
    CMP #$0A                ; [C9 0A      ] Compare A Immediate
    BEQ $79C5               ; [F0 19      ] Branch if Equal
    LDA $051A,Y             ; [B9 1A 05   ] Load A from Absolute,Y
    AND #$C2                ; [29 C2      ] AND A with Immediate
    BNE $7984               ; [D0 D1      ] Branch if Not Equal
    LDA $54                 ; [A5 54      ] Load A from DP
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BNE $79C5               ; [D0 0C      ] Branch if Not Equal
    LDA $0501,Y             ; [B9 01 05   ] Load A from Absolute,Y
    CMP #$14                ; [C9 14      ] Compare A Immediate
    BEQ $79C5               ; [F0 05      ] Branch if Equal
    LDA $08F3,X             ; [BD F3 08   ] Load A from Absolute,X
    BEQ $7984               ; [F0 BF      ] Branch if Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    RTS                     ; [60         ] Return from Subroutine
    LDA $2D12               ; [AD 12 2D   ] Load A from Absolute
    ORA $2D11               ; [0D 11 2D   ] OR A with Absolute
    BNE $79EB               ; [D0 1B      ] Branch if Not Equal
    JSR $7982               ; [20 82 79   ] Jump to Subroutine
    LDA #$F4                ; [A9 F4      ] Load A Immediate
    LDA $B820               ; [AD 20 B8   ] Load A from Absolute
    CMP ($20,X)             ; [C1 20      ] Compare A with (DP,X)
    CPX $20CE               ; [EC CE 20   ] Compare X with Absolute
    PEI ($FA)               ; [D4 FA      ] Push Effective Indirect
    JSR $A693               ; [20 93 A6   ] Jump to Subroutine
    JSR $A698               ; [20 98 A6   ] Jump to Subroutine
    JSR $A69D               ; [20 9D A6   ] Jump to Subroutine
    JMP $A230               ; [4C 30 A2   ] Jump Absolute
    JMP $A4F0               ; [4C F0 A4   ] Jump Absolute
    LDX #$0E                ; [A2 0E      ] Load X Immediate
    BRK                     ; [00 20      ] Software interrupt
    STZ $79                 ; [64 79      ] Store Zero to DP
    JSR $D837               ; [20 37 D8   ] Jump to Subroutine
    JSR $E367               ; [20 67 E3   ] Jump to Subroutine
    JSR $A69D               ; [20 9D A6   ] Jump to Subroutine
    JMP $A236               ; [4C 36 A2   ] Jump Absolute
    LDA $6F                 ; [A5 6F      ] Load A from DP
    BNE $7A23               ; [D0 1F      ] Branch if Not Equal
    LDA $53                 ; [A5 53      ] Load A from DP
    STA $5F                 ; [85 5F      ] Store A to DP
    JSR $7982               ; [20 82 79   ] Jump to Subroutine
    JSR $A16E               ; [20 6E A1   ] Jump to Subroutine
    JSR $CCCB               ; [20 CB CC   ] Jump to Subroutine
    JSR $CDBA               ; [20 BA CD   ] Jump to Subroutine
    JSR $CDC0               ; [20 C0 CD   ] Jump to Subroutine
    JSR $FAD4               ; [20 D4 FA   ] Jump to Subroutine
    JSR $FAF0               ; [20 F0 FA   ] Jump to Subroutine
    JSR $A698               ; [20 98 A6   ] Jump to Subroutine
    JMP $A236               ; [4C 36 A2   ] Jump Absolute
    JMP $A4F0               ; [4C F0 A4   ] Jump Absolute
    LDA $53                 ; [A5 53      ] Load A from DP
    STA $5E                 ; [85 5E      ] Store A to DP
    JSR $7982               ; [20 82 79   ] Jump to Subroutine
    LDA #$00                ; [A9 00      ] Load A Immediate
    BVC $79B6               ; [50 85      ] Branch if Overflow Clear
    INC $A9                 ; [E6 A9      ] Increment DP
    EOR $20AF               ; [4D AF 20   ] XOR A with Absolute
    CLV                     ; [B8         ] Clear Overflow Flag
    CMP ($20,X)             ; [C1 20      ] Compare A with (DP,X)
    AND [$CA],Y             ; [37 CA      ] AND A with [DP],Y
    JSR $A693               ; [20 93 A6   ] Jump to Subroutine
    JSR $A698               ; [20 98 A6   ] Jump to Subroutine
    JMP $A230               ; [4C 30 A2   ] Jump Absolute
    LDX #$09                ; [A2 09      ] Load X Immediate
    BRK                     ; [00 20      ] Software interrupt
    STZ $79                 ; [64 79      ] Store Zero to DP
    JSR $CAA5               ; [20 A5 CA   ] Jump to Subroutine
    JSR $E367               ; [20 67 E3   ] Jump to Subroutine
    JSR $A69D               ; [20 9D A6   ] Jump to Subroutine
    JMP $A236               ; [4C 36 A2   ] Jump Absolute
    JSR $7982               ; [20 82 79   ] Jump to Subroutine
    JSR $E0A8               ; [20 A8 E0   ] Jump to Subroutine
    JMP $B828               ; [4C 28 B8   ] Jump Absolute
    JSR $C0E2               ; [20 E2 C0   ] Jump to Subroutine
    LDX #$16                ; [A2 16      ] Load X Immediate
    BRK                     ; [00 20      ] Software interrupt
    STZ $79                 ; [64 79      ] Store Zero to DP
    JSR $AC0E               ; [20 0E AC   ] Jump to Subroutine
    JMP $A236               ; [4C 36 A2   ] Jump Absolute
    JSR $7982               ; [20 82 79   ] Jump to Subroutine
    JSR $CDA4               ; [20 A4 CD   ] Jump to Subroutine
    JSR $C5C8               ; [20 C8 C5   ] Jump to Subroutine
    JSR $FAD4               ; [20 D4 FA   ] Jump to Subroutine
    JSR $A698               ; [20 98 A6   ] Jump to Subroutine
    JMP $A230               ; [4C 30 A2   ] Jump Absolute
    LDA $0A                 ; [A5 0A      ] Load A from DP
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    LDX $7E                 ; [A6 7E      ] Load X from DP
    LDA $63,X               ; [B5 63      ] Load A from DP,X
    BCC $7A8D               ; [90 02      ] Branch if Carry Clear
    DEC                     ; [3A         ] Decrement Accumulator
    DEC                     ; [3A         ] Decrement Accumulator
    INC                     ; [1A         ] Increment Accumulator
    BPL $7A92               ; [10 02      ] Branch if Plus
    LDA #$06                ; [A9 06      ] Load A Immediate
    CMP #$07                ; [C9 07      ] Compare A Immediate
    BCC $7A98               ; [90 02      ] Branch if Carry Clear
    LDA #$00                ; [A9 00      ] Load A Immediate
    STA $53                 ; [85 53      ] Store A to DP
    STA $63,X               ; [95 63      ] Store A to DP,X
    LDA #$07                ; [A9 07      ] Load A Immediate
    STA $67,X               ; [95 67      ] Store A to DP,X
    LDA #$12                ; [A9 12      ] Load A Immediate
    STA $54                 ; [85 54      ] Store A to DP
    JSR $E4DF               ; [20 DF E4   ] Jump to Subroutine
    LDA $7601,X             ; [BD 01 76   ] Load A from Absolute,X
    JMP $BC35               ; [4C 35 BC   ] Jump Absolute
    LDA $2B65               ; [AD 65 2B   ] Load A from Absolute
    EOR #$01                ; [49 01      ] XOR A with Immediate
    STA $2B65               ; [8D 65 2B   ] Store A to Absolute
    JSR $C4DA               ; [20 DA C4   ] Jump to Subroutine
    JSR $A69D               ; [20 9D A6   ] Jump to Subroutine
    JMP $A230               ; [4C 30 A2   ] Jump Absolute

;--- Patch at file offset $027ABE (SNES $C27ABE) ---
org $C27ABE

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02A06F (SNES $C2A06F) ---
org $C2A06F

    JSR $A0A5               ; [20 A5 A0   ] Jump to Subroutine
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $43                 ; [A5 43      ] Load A from DP
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 C9      ] Software interrupt
    TSB $D000               ; [0C 00 D0   ] Test and Set Bits Absolute
    TSB $A5                 ; [04 A5      ] Test and Set Bits in DP
    AND $AEF0,Y             ; [39 F0 AE   ] AND A with Absolute,Y
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA #$00                ; [A9 00      ] Load A Immediate
    PHA                     ; [48         ] Push Accumulator
    PLB                     ; [AB         ] Pull Data Bank
    JSR $B0B0               ; [20 B0 B0   ] Jump to Subroutine
    LDA #$04                ; [A9 04      ] Load A Immediate
    STA $CA                 ; [85 CA      ] Store A to DP
    LDA #$00                ; [A9 00      ] Load A Immediate
    STA $7E7511             ; [8F 11 75 7E] Store A to Absolute Long
    JSR $A106               ; [20 06 A1   ] Jump to Subroutine
    LDA $7E750E             ; [AF 0E 75 7E] Load A from Absolute Long
    STA $420C               ; [8D 0C 42   ] Store A to Absolute
    JSR $A0D9               ; [20 D9 A0   ] Jump to Subroutine
    JMP $A2E9               ; [4C E9 A2   ] Jump Absolute
    LDA #$7E                ; [A9 7E      ] Load A Immediate
    PHA                     ; [48         ] Push Accumulator
    PLB                     ; [AB         ] Pull Data Bank
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    JSR $C16A               ; [20 6A C1   ] Jump to Subroutine
    JSR $A16E               ; [20 6E A1   ] Jump to Subroutine
    LDA $43                 ; [A5 43      ] Load A from DP
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 3A      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    LDA $C0E60E,X           ; [BF 0E E6 C0] Load A from Absolute Long,X
    STA $C7                 ; [85 C7      ] Store A to DP
    JMP ($01C7)             ; [6C C7 01   ] Jump Indirect

;--- Patch at file offset $02A0C2 (SNES $C2A0C2) ---
org $C2A0C2

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02A0D9 (SNES $C2A0D9) ---
org $C2A0D9

    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $004210             ; [AF 10 42 00] Load A from Absolute Long
    LDA #$81                ; [A9 81      ] Load A Immediate
    STA $004200             ; [8F 00 42 00] Store A to Absolute Long
    LDA #$00                ; [A9 00      ] Load A Immediate
    STA $7E7522             ; [8F 22 75 7E] Store A to Absolute Long
    STA $7E7525             ; [8F 25 75 7E] Store A to Absolute Long
    LDA #$03                ; [A9 03      ] Load A Immediate
    STA $7E7513             ; [8F 13 75 7E] Store A to Absolute Long
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02A20C (SNES $C2A20C) ---
org $C2A20C

    LDX #$1E                ; [A2 1E      ] Load X Immediate
    LDX #$A0                ; [A2 A0      ] Load X Immediate
    EOR $A901,Y             ; [59 01 A9   ] XOR A with Absolute,Y
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    MVN $00,$C2             ; [54 00 C2   ] Block Move Negative
    PLP                     ; [28         ] Pull Processor Status
    PLB                     ; [AB         ] Pull Data Bank
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 05      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$07]               ; [07 07      ] OR A with [DP]
    JSR $E0A8               ; [20 A8 E0   ] Jump to Subroutine
    JMP $A4F0               ; [4C F0 A4   ] Jump Absolute
    LDA $53                 ; [A5 53      ] Load A from DP
    JMP $A47C               ; [4C 7C A4   ] Jump Absolute

;--- Patch at file offset $02A330 (SNES $C2A330) ---
org $C2A330

    DEC $E7                 ; [C6 E7      ] Decrement DP

;--- Patch at file offset $02A342 (SNES $C2A342) ---
org $C2A342

    BCC $A2F0               ; [90 AC      ] Branch if Carry Clear
    db $C2                      ; Incomplete/data bytes

;--- Patch at file offset $02A34B (SNES $C2A34B) ---
org $C2A34B

    ORA $00,X               ; [15 00      ] OR A with DP,X
    BNE $A33F               ; [D0 F0      ] Branch if Not Equal
    LDA $C2AC92,X           ; [BF 92 AC C2] Load A from Absolute Long,X

;--- Patch at file offset $02A425 (SNES $C2A425) ---
org $C2A425

    JSR $D987               ; [20 87 D9   ] Jump to Subroutine
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    PHP                     ; [08         ] Push Processor Status
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA #$03                ; [A9 03      ] Load A Immediate
    STA $7E                 ; [85 7E      ] Store A to DP
    JSR $D4C5               ; [20 C5 D4   ] Jump to Subroutine
    JSR $DAA4               ; [20 A4 DA   ] Jump to Subroutine
    JSR $E6D6               ; [20 D6 E6   ] Jump to Subroutine
    DEC $7E                 ; [C6 7E      ] Decrement DP
    BPL $A432               ; [10 F3      ] Branch if Plus

;--- Patch at file offset $02A6FC (SNES $C2A6FC) ---
org $C2A6FC

    LDA $58                 ; [A5 58      ] Load A from DP
    DEC                     ; [3A         ] Decrement Accumulator
    AND #$03                ; [29 03      ] AND A with Immediate
    BRK                     ; [00 0A      ] Software interrupt
    TAX                     ; [AA         ] Transfer A to X
    LDA $C0F3AB,X           ; [BF AB F3 C0] Load A from Absolute Long,X
    STZ $2B6E               ; [9C 6E 2B   ] Store Zero to Absolute
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDX $8E                 ; [A6 8E      ] Load X from DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC $2B66,X             ; [7D 66 2B   ] Add with Carry Absolute,X
    JSR $A780               ; [20 80 A7   ] Jump to Subroutine
    STA $2B66,X             ; [9D 66 2B   ] Store A to Absolute,X
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    INX                     ; [E8         ] Increment X
    CPX #$02                ; [E0 02      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    SBC $2B67AD             ; [EF AD 67 2B] Subtract with Borrow Absolute Long
    STA $004202             ; [8F 02 42 00] Store A to Absolute Long
    LDA $2B68               ; [AD 68 2B   ] Load A from Absolute
    STA $004203             ; [8F 03 42 00] Store A to Absolute Long
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    CLC                     ; [18         ] Clear Carry Flag
    LDA $004216             ; [AF 16 42 00] Load A from Absolute Long
    ADC $2B66               ; [6D 66 2B   ] Add with Carry Absolute
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 AA      ] Software interrupt
    LDA $7A00,X             ; [BD 00 7A   ] Load A from Absolute,X
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 C9      ] Software interrupt
    SBC $B2F000,X           ; [FF 00 F0 B2] Subtract with Borrow Absolute Long,X
    TXA                     ; [8A         ] Transfer X to A
    INC                     ; [1A         ] Increment Accumulator
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    JSR $A75E               ; [20 5E A7   ] Jump to Subroutine
    JMP $E6AB               ; [4C AB E6   ] Jump Absolute
    STZ $2B66               ; [9C 66 2B   ] Store Zero to Absolute
    STZ $2B67               ; [9C 67 2B   ] Store Zero to Absolute
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $55                 ; [85 55      ] Store A to DP
    LDX $2B6A               ; [AE 6A 2B   ] Load X from Absolute
    STA $7601,X             ; [9D 01 76   ] Store A to Absolute,X
    LDA #$00                ; [A9 00      ] Load A Immediate
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    LDA $2B66               ; [AD 66 2B   ] Load A from Absolute
    AND #$0F                ; [29 0F      ] AND A with Immediate
    TAY                     ; [A8         ] Transfer A to Y
    LDA $2B70,Y             ; [B9 70 2B   ] Load A from Absolute,Y
    STA $7602,X             ; [9D 02 76   ] Store A to Absolute,X
    LDA $2B67               ; [AD 67 2B   ] Load A from Absolute
    AND #$0F                ; [29 0F      ] AND A with Immediate
    TAY                     ; [A8         ] Transfer A to Y
    LDA $2B80,Y             ; [B9 80 2B   ] Load A from Absolute,Y
    STA $7603,X             ; [9D 03 76   ] Store A to Absolute,X

;--- Patch at file offset $02A995 (SNES $C2A995) ---
org $C2A995

    LDA $52                 ; [A5 52      ] Load A from DP
    LDX #$0C                ; [A2 0C      ] Load X Immediate
    TSB $B220               ; [0C 20 B2   ] Test and Set Bits Absolute
    LDA #$20                ; [A9 20      ] Load A Immediate
    EOR [$CD],Y             ; [57 CD      ] XOR A with [DP],Y
    JSR $FAD4               ; [20 D4 FA   ] Jump to Subroutine
    JSR $FAF0               ; [20 F0 FA   ] Jump to Subroutine
    JSR $CDC0               ; [20 C0 CD   ] Jump to Subroutine
    JSR $A9D9               ; [20 D9 A9   ] Jump to Subroutine
    JSR $CD08               ; [20 08 CD   ] Jump to Subroutine
    JMP $A69D               ; [4C 9D A6   ] Jump Absolute
    STX $EA                 ; [86 EA      ] Store X to DP
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 3A      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    TAY                     ; [A8         ] Transfer A to Y
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $0293,X             ; [BD 93 02   ] Load A from Absolute,X
    AND #$F1                ; [29 F1      ] AND A with Immediate
    ORA $EA                 ; [05 EA      ] OR A with Direct Page
    STA $0293,X             ; [9D 93 02   ] Store A to Absolute,X
    STA $0297,X             ; [9D 97 02   ] Store A to Absolute,X
    LDA $0363,Y             ; [B9 63 03   ] Load A from Absolute,Y
    AND #$F1                ; [29 F1      ] AND A with Immediate
    ORA $EB                 ; [05 EB      ] OR A with Direct Page
    STA $0363,Y             ; [99 63 03   ] Store A to Absolute,Y

;--- Patch at file offset $02AA1F (SNES $C2AA1F) ---
org $C2AA1F

    JSR $AA27               ; [20 27 AA   ] Jump to Subroutine
    JSR $A8F0               ; [20 F0 A8   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    LDA $74                 ; [A5 74      ] Load A from DP
    CMP #$03                ; [C9 03      ] Compare A Immediate
    BEQ $AA31               ; [F0 04      ] Branch if Equal
    LDX #$65                ; [A2 65      ] Load X Immediate
    BCS $AA91               ; [B0 60      ] Branch if Carry Set
    LDX #$7D                ; [A2 7D      ] Load X Immediate
    db $B0                      ; Incomplete/data bytes

;--- Patch at file offset $02AC1E (SNES $C2AC1E) ---
org $C2AC1E

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02AC90 (SNES $C2AC90) ---
org $C2AC90

    BRA $AC92               ; [80 00      ] Branch Always
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRA $AC98               ; [80 02      ] Branch Always
    BRK                     ; [00 08      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 02      ] Software interrupt
    ORA $00                 ; [05 00      ] OR A with Direct Page
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BMI $ACA4               ; [30 00      ] Branch if Minus
    ORA #$00                ; [09 00      ] OR A with Immediate
    BRK                     ; [00 00      ] Software interrupt
    LDA $54                 ; [A5 54      ] Load A from DP
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 C9      ] Software interrupt
    ORA $029000,X           ; [1F 00 90 02] OR A with Absolute Long,X
    LDA $8E                 ; [A5 8E      ] Load A from DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    LDA $D0FFA0,X           ; [BF A0 FF D0] Load A from Absolute Long,X
    STA $C7                 ; [85 C7      ] Store A to DP
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    JMP ($01C7)             ; [6C C7 01   ] Jump Indirect

;--- Patch at file offset $02ACCF (SNES $C2ACCF) ---
org $C2ACCF

    RTS                     ; [60         ] Return from Subroutine
    LDA #$29                ; [A9 29      ] Load A Immediate
    LDY $20,X               ; [B4 20      ] Load Y from DP,X
    CLV                     ; [B8         ] Clear Overflow Flag
    db $C1                      ; Incomplete/data bytes

;--- Patch at file offset $02ACF8 (SNES $C2ACF8) ---
org $C2ACF8

    RTS                     ; [60         ] Return from Subroutine
    LDA #$8E                ; [A9 8E      ] Load A Immediate
    LDY $20,X               ; [B4 20      ] Load Y from DP,X
    CLV                     ; [B8         ] Clear Overflow Flag
    db $C1                      ; Incomplete/data bytes

;--- Patch at file offset $02AD0C (SNES $C2AD0C) ---
org $C2AD0C

    CMP ($AD)               ; [D2 AD      ] Compare A with (DP)

;--- Patch at file offset $02ADBC (SNES $C2ADBC) ---
org $C2ADBC

    JSR $A69D               ; [20 9D A6   ] Jump to Subroutine
    LDX #$EC                ; [A2 EC      ] Load X Immediate
    CLV                     ; [B8         ] Clear Overflow Flag
    LDY #$80                ; [A0 80      ] Load Y Immediate
    ADC ($20),Y             ; [71 20      ] Add with Carry (DP),Y
    SBC $20C1,X             ; [FD C1 20   ] Subtract with Borrow Absolute,X
    db $54, $A7                 ; Incomplete/data bytes

;--- Patch at file offset $02ADD2 (SNES $C2ADD2) ---
org $C2ADD2

    JSR $A69D               ; [20 9D A6   ] Jump to Subroutine
    LDX #$E6                ; [A2 E6      ] Load X Immediate
    CLV                     ; [B8         ] Clear Overflow Flag
    LDY #$80                ; [A0 80      ] Load Y Immediate
    ADC ($20),Y             ; [71 20      ] Add with Carry (DP),Y
    db $FD, $C1                 ; Incomplete/data bytes

;--- Patch at file offset $02AEE6 (SNES $C2AEE6) ---
org $C2AEE6

    JSR $A0D9               ; [20 D9 A0   ] Jump to Subroutine
    JSR $A698               ; [20 98 A6   ] Jump to Subroutine
    JSR $FAD4               ; [20 D4 FA   ] Jump to Subroutine
    JSR $FAF0               ; [20 F0 FA   ] Jump to Subroutine
    LDA #$0C                ; [A9 0C      ] Load A Immediate
    TSB $7500               ; [0C 00 75   ] Test and Set Bits Absolute
    TSB $7502               ; [0C 02 75   ] Test and Set Bits Absolute
    LDA #$02                ; [A9 02      ] Load A Immediate
    TRB $7500               ; [1C 00 75   ] Test and Reset Bits Absolute
    LDA #$04                ; [A9 04      ] Load A Immediate
    TSB $CA                 ; [04 CA      ] Test and Set Bits in DP
    JSR $A69D               ; [20 9D A6   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02AF07 (SNES $C2AF07) ---
org $C2AF07

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02B0A0 (SNES $C2B0A0) ---
org $C2B0A0

    JSR $EF9F               ; [20 9F EF   ] Jump to Subroutine
    STZ $6F                 ; [64 6F      ] Store Zero to DP
    JSR $C0E2               ; [20 E2 C0   ] Jump to Subroutine
    STZ $71                 ; [64 71      ] Store Zero to DP
    LDA #$20                ; [A9 20      ] Load A Immediate
    BRK                     ; [00 4C      ] Software interrupt
    MVN $B1,$08             ; [54 B1 08   ] Block Move Negative
    STZ $2121               ; [9C 21 21   ] Store Zero to Absolute
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    STZ $2102               ; [9C 02 21   ] Store Zero to Absolute
    STZ $2116               ; [9C 16 21   ] Store Zero to Absolute
    LDX #$B2                ; [A2 B2      ] Load X Immediate
    SBC $20,X               ; [F5 20      ] Subtract with Borrow DP,X
    INC $A0,X               ; [F6 A0      ] Increment DP,X
    LDX #$B9                ; [A2 B9      ] Load X Immediate
    SBC $20,X               ; [F5 20      ] Subtract with Borrow DP,X
    INC $A0,X               ; [F6 A0      ] Increment DP,X
    LDX #$8B                ; [A2 8B      ] Load X Immediate
    SBC $20,X               ; [F5 20      ] Subtract with Borrow DP,X
    INC $A0,X               ; [F6 A0      ] Increment DP,X
    LDX #$D9                ; [A2 D9      ] Load X Immediate
    SBC $D9FB20             ; [EF 20 FB D9] Subtract with Borrow Absolute Long
    PLP                     ; [28         ] Pull Processor Status

;--- Patch at file offset $02B7FC (SNES $C2B7FC) ---
org $C2B7FC

    JSR $AAAF               ; [20 AF AA   ] Jump to Subroutine
    STZ $70                 ; [64 70      ] Store Zero to DP
    JMP $B7EE               ; [4C EE B7   ] Jump Absolute
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    STY $99                 ; [84 99      ] Store Y to DP
    LDY $8E                 ; [A4 8E      ] Load Y from DP
    LDX $6B                 ; [A6 6B      ] Load X from DP
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02B8E4 (SNES $C2B8E4) ---
org $C2B8E4

    LDA #$00                ; [A9 00      ] Load A Immediate
    BRA $B8F2               ; [80 0A      ] Branch Always
    JSR $E0C0               ; [20 C0 E0   ] Jump to Subroutine
    LDA #$06                ; [A9 06      ] Load A Immediate
    JSR $EEE7               ; [20 E7 EE   ] Jump to Subroutine
    LDA #$01                ; [A9 01      ] Load A Immediate
    JSR $B981               ; [20 81 B9   ] Jump to Subroutine

;--- Patch at file offset $02B97E (SNES $C2B97E) ---
org $C2B97E

    JMP $B8DC               ; [4C DC B8   ] Jump Absolute
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    LDA $2801               ; [AD 01 28   ] Load A from Absolute
    AND #$03                ; [29 03      ] AND A with Immediate
    CMP #$03                ; [C9 03      ] Compare A Immediate
    BNE $B98F               ; [D0 04      ] Branch if Not Equal
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    JMP $E658               ; [4C 58 E6   ] Jump Absolute
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    JMP $EEFD               ; [4C FD EE   ] Jump Absolute

;--- Patch at file offset $02BB66 (SNES $C2BB66) ---
org $C2BB66

    PHA                     ; [48         ] Push Accumulator
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA ($20,X)             ; [01 20      ] OR A with (DP,X)
    PLP                     ; [28         ] Pull Processor Status
    SBC $FA,S               ; [E3 FA      ] Subtract with Borrow Stack Relative
    LDA $C0EDB6,X           ; [BF B6 ED C0] Load A from Absolute Long,X
    JSR $F00B               ; [20 0B F0   ] Jump to Subroutine
    LDA $C0EDBA,X           ; [BF BA ED C0] Load A from Absolute Long,X
    JSR $E0D9               ; [20 D9 E0   ] Jump to Subroutine
    JSR $C7BD               ; [20 BD C7   ] Jump to Subroutine
    JSR $AC5E               ; [20 5E AC   ] Jump to Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    JSR $A698               ; [20 98 A6   ] Jump to Subroutine
    JSR $A69D               ; [20 9D A6   ] Jump to Subroutine
    BRA $BBEB               ; [80 5B      ] Branch Always
    BIT $44                 ; [24 44      ] Test Bits DP
    BPL $BBEB               ; [10 57      ] Branch if Plus
    STA $39                 ; [85 39      ] Store A to DP
    STZ $3A                 ; [64 3A      ] Store Zero to DP
    LDA #$01                ; [A9 01      ] Load A Immediate
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    LDA $29E7               ; [AD E7 29   ] Load A from Absolute
    JSR $E328               ; [20 28 E3   ] Jump to Subroutine
    JSR $BC1D               ; [20 1D BC   ] Jump to Subroutine
    JMP $A02D               ; [4C 2D A0   ] Jump Absolute
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02BBFA (SNES $C2BBFA) ---
org $C2BBFA

    STZ $6F                 ; [64 6F      ] Store Zero to DP
    STZ $70                 ; [64 70      ] Store Zero to DP
    LDA $2889               ; [AD 89 28   ] Load A from Absolute
    BNE $BC0E               ; [D0 0B      ] Branch if Not Equal
    STZ $2889               ; [9C 89 28   ] Store Zero to Absolute
    JSR $BC1D               ; [20 1D BC   ] Jump to Subroutine
    LDA #$00                ; [A9 00      ] Load A Immediate
    JMP $A47C               ; [4C 7C A4   ] Jump Absolute
    STZ $2889               ; [9C 89 28   ] Store Zero to Absolute
    STZ $7510               ; [9C 10 75   ] Store Zero to Absolute
    JSR $C0E2               ; [20 E2 C0   ] Jump to Subroutine
    JSR $FAD4               ; [20 D4 FA   ] Jump to Subroutine
    JMP $A4F0               ; [4C F0 A4   ] Jump Absolute
    LDA $55                 ; [A5 55      ] Load A from DP
    DEC                     ; [3A         ] Decrement Accumulator
    STA $5B                 ; [85 5B      ] Store A to DP
    LDA $6B                 ; [A5 6B      ] Load A from DP
    STA $5C                 ; [85 5C      ] Store A to DP
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02BC3F (SNES $C2BC3F) ---
org $C2BC3F

    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $C0F3A4,X           ; [BF A4 F3 C0] Load A from Absolute Long,X

;--- Patch at file offset $02BC4B (SNES $C2BC4B) ---
org $C2BC4B

    JSR $CDA4               ; [20 A4 CD   ] Jump to Subroutine
    LDA $71                 ; [A5 71      ] Load A from DP
    STA $5D                 ; [85 5D      ] Store A to DP
    LDA #$01                ; [A9 01      ] Load A Immediate
    JMP $A06B               ; [4C 6B A0   ] Jump Absolute
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02C015 (SNES $C2C015) ---
org $C2C015

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $02C0BE (SNES $C2C0BE) ---
org $C2C0BE

    PLY                     ; [7A         ] Pull Y Register
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $02C111 (SNES $C2C111) ---
org $C2C111

    db $43                      ; Incomplete/data bytes

;--- Patch at file offset $02C34D (SNES $C2C34D) ---
org $C2C34D

    STZ $2C94               ; [9C 94 2C   ] Store Zero to Absolute
    JSR $F7A6               ; [20 A6 F7   ] Jump to Subroutine
    INC $2C94               ; [EE 94 2C   ] Increment Absolute
    LDA $2C94               ; [AD 94 2C   ] Load A from Absolute
    CMP #$0A                ; [C9 0A      ] Compare A Immediate
    BRK                     ; [00 D0      ] Software interrupt
    SBC ($EA)               ; [F2 EA      ] Subtract with Borrow (DP)
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    JSR $C881               ; [20 81 C8   ] Jump to Subroutine

;--- Patch at file offset $02C7C6 (SNES $C2C7C6) ---
org $C2C7C6

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02C864 (SNES $C2C864) ---
org $C2C864

    CLC                     ; [18         ] Clear Carry Flag
    STA $2806               ; [8D 06 28   ] Store A to Absolute
    LDA #$0B                ; [A9 0B      ] Load A Immediate
    JSR $CFBD               ; [20 BD CF   ] Jump to Subroutine
    STZ $6B                 ; [64 6B      ] Store Zero to DP
    STZ $6F                 ; [64 6F      ] Store Zero to DP
    LDA #$03                ; [A9 03      ] Load A Immediate
    BRK                     ; [00 8D      ] Software interrupt
    LDX $29,Y               ; [B6 29      ] Load X from DP,Y
    LDX #$54                ; [A2 54      ] Load X Immediate
    SBC #$20                ; [E9 20      ] Subtract with Borrow Immediate
    SBC #$C6                ; [E9 C6      ] Subtract with Borrow Immediate
    JSR $C881               ; [20 81 C8   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    PHP                     ; [08         ] Push Processor Status
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDY $8E                 ; [A4 8E      ] Load Y from DP
    STY $7E                 ; [84 7E      ] Store Y to DP
    JSR $D4C5               ; [20 C5 D4   ] Jump to Subroutine
    LDX $80                 ; [A6 80      ] Load X from DP
    LDA $0500,X             ; [BD 00 05   ] Load A from Absolute,X
    AND #$07                ; [29 07      ] AND A with Immediate
    ORA $92205A,X           ; [1F 5A 20 92] OR A with Absolute Long,X
    PEI ($7A)               ; [D4 7A      ] Push Effective Indirect
    INY                     ; [C8         ] Increment Y
    CPY #$04                ; [C0 04      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    INX                     ; [E8         ] Increment X
    PLP                     ; [28         ] Pull Processor Status

;--- Patch at file offset $02C922 (SNES $C2C922) ---
org $C2C922

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $02CA37 (SNES $C2CA37) ---
org $C2CA37

    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA #$08                ; [A9 08      ] Load A Immediate
    JSR $CFBD               ; [20 BD CF   ] Jump to Subroutine

;--- Patch at file offset $02CA44 (SNES $C2CA44) ---
org $C2CA44

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02CA4E (SNES $C2CA4E) ---
org $C2CA4E

    JSR $E6AB               ; [20 AB E6   ] Jump to Subroutine
    LDX #$36                ; [A2 36      ] Load X Immediate
    BCS $C9FE               ; [B0 A9      ] Branch if Carry Set
    ORA $85                 ; [05 85      ] OR A with Direct Page
    LSR $C53A,X             ; [5E 3A C5   ] Shift Right Absolute,X
    EOR ($30,S),Y           ; [53 30      ] XOR A with (SR),Y
    ORA $20,S               ; [03 20      ] OR A with Stack Relative
    AND [$AA]               ; [27 AA      ] AND A with [DP]
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    TXA                     ; [8A         ] Transfer X to A

;--- Patch at file offset $02CAAC (SNES $C2CAAC) ---
org $C2CAAC

    LDY #$C4                ; [A0 C4      ] Load Y Immediate
    ADC $20,S               ; [63 20      ] Add with Carry Stack Relative
    TSB $B8                 ; [04 B8      ] Test and Set Bits in DP
    PHX                     ; [DA         ] Push X Register
    PHY                     ; [5A         ] Push Y Register
    LDY $99                 ; [A4 99      ] Load Y from DP
    JSR $CB8C               ; [20 8C CB   ] Jump to Subroutine
    JSR $E3E3               ; [20 E3 E3   ] Jump to Subroutine
    PLY                     ; [7A         ] Pull Y Register
    PLX                     ; [FA         ] Pull X Register
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    CPY #$0A                ; [C0 0A      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    db $ED                      ; Incomplete/data bytes

;--- Patch at file offset $02CCD3 (SNES $C2CCD3) ---
org $C2CCD3

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02CCEF (SNES $C2CCEF) ---
org $C2CCEF

    PHP                     ; [08         ] Push Processor Status
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA #$00                ; [A9 00      ] Load A Immediate
    STA $5F                 ; [85 5F      ] Store A to DP
    STZ $2D11               ; [9C 11 2D   ] Store Zero to Absolute
    PLP                     ; [28         ] Pull Processor Status

;--- Patch at file offset $02CD84 (SNES $C2CD84) ---
org $C2CD84

    LDA $EA                 ; [A5 EA      ] Load A from DP
    AND #$07                ; [29 07      ] AND A with Immediate
    ORA $0005A0,X           ; [1F A0 05 00] OR A with Absolute Long,X
    JSR $D492               ; [20 92 D4   ] Jump to Subroutine
    LDA $55                 ; [A5 55      ] Load A from DP
    LDX #$0A                ; [A2 0A      ] Load X Immediate
    PHP                     ; [08         ] Push Processor Status
    JSR $A9B2               ; [20 B2 A9   ] Jump to Subroutine
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    PHP                     ; [08         ] Push Processor Status
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    JSR $D503               ; [20 03 D5   ] Jump to Subroutine
    JSR $E464               ; [20 64 E4   ] Jump to Subroutine
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    PHP                     ; [08         ] Push Processor Status
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDX $7E                 ; [A6 7E      ] Load X from DP
    LDA $53                 ; [A5 53      ] Load A from DP
    STA $63,X               ; [95 63      ] Store A to DP,X
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    LDX #$28                ; [A2 28      ] Load X Immediate
    INC $4C                 ; [E6 4C      ] Increment DP
    LDY #$A6                ; [A0 A6      ] Load Y Immediate
    LDX #$53                ; [A2 53      ] Load X Immediate
    INC $A04C               ; [EE 4C A0   ] Increment Absolute
    db $A6                      ; Incomplete/data bytes

;--- Patch at file offset $02D3A0 (SNES $C2D3A0) ---
org $C2D3A0

    LDA $EB                 ; [A5 EB      ] Load A from DP
    AND #$18                ; [29 18      ] AND A with Immediate
    BRK                     ; [00 0A      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA $EB                 ; [05 EB      ] OR A with Direct Page
    AND #$67                ; [29 67      ] AND A with Immediate
    BRK                     ; [00 0A      ] Software interrupt
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    ADC #$00                ; [69 00      ] Add with Carry Immediate
    BCS $D33A               ; [B0 85      ] Branch if Carry Set
    CPX $20                 ; [E4 20      ] Compare X with DP
    STP                     ; [DB         ] Stop Processor
    CMP ($A9)               ; [D2 A9      ] Compare A with (DP)
    ASL $00                 ; [06 00      ] Shift Left DP
    LDX #$31                ; [A2 31      ] Load X Immediate
    SBC $0420               ; [ED 20 04   ] Subtract with Borrow Absolute
    CMP ($E2,S),Y           ; [D3 E2      ] Compare A with (SR),Y
    JSR $EBE6               ; [20 E6 EB   ] Jump to Subroutine
    LDA $EB                 ; [A5 EB      ] Load A from DP
    CMP #$16                ; [C9 16      ] Compare A Immediate
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    BNE $D3A0               ; [D0 D2      ] Branch if Not Equal
    PLP                     ; [28         ] Pull Processor Status
    PLB                     ; [AB         ] Pull Data Bank
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02D3D1 (SNES $C2D3D1) ---
org $C2D3D1

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02D970 (SNES $C2D970) ---
org $C2D970

    BNE $D95C               ; [D0 EA      ] Branch if Not Equal
    BRA $D984               ; [80 10      ] Branch Always
    JSR $CD99               ; [20 99 CD   ] Jump to Subroutine
    JSR $DAA4               ; [20 A4 DA   ] Jump to Subroutine
    LDX $7E                 ; [A6 7E      ] Load X from DP
    INC $0420,X             ; [FE 20 04   ] Increment Absolute,X
    LDA #$15                ; [A9 15      ] Load A Immediate
    JSR $D987               ; [20 87 D9   ] Jump to Subroutine
    PLB                     ; [AB         ] Pull Data Bank
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    PHP                     ; [08         ] Push Processor Status
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    STA $D8                 ; [85 D8      ] Store A to DP
    JSR $E47D               ; [20 7D E4   ] Jump to Subroutine
    LDX $80                 ; [A6 80      ] Load X from DP
    LDA $DA                 ; [A5 DA      ] Load A from DP
    STA $053A,X             ; [9D 3A 05   ] Store A to Absolute,X
    LDA $D8                 ; [A5 D8      ] Load A from DP
    STA $0501,X             ; [9D 01 05   ] Store A to Absolute,X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $DC                 ; [A5 DC      ] Load A from DP
    STA $053B,X             ; [9D 3B 05   ] Store A to Absolute,X

;--- Patch at file offset $02D9A8 (SNES $C2D9A8) ---
org $C2D9A8

    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02F4CB (SNES $C2F4CB) ---
org $C2F4CB

    PLP                     ; [28         ] Pull Processor Status
    PLB                     ; [AB         ] Pull Data Bank
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02FF05 (SNES $C2FF05) ---
org $C2FF05

    ORA ($0A)               ; [12 0A      ] OR A with (DP)
    TAX                     ; [AA         ] Transfer A to X
    LDA $08                 ; [A5 08      ] Load A from DP
    STA $0E                 ; [85 0E      ] Store A to DP
    BIT $0B                 ; [24 0B      ] Test Bits DP
    BMI $FF13               ; [30 03      ] Branch if Minus
    AND #$7F                ; [29 7F      ] AND A with Immediate
    ADC $8FB029,X           ; [7F 29 B0 8F] Add with Carry Absolute Long,X
    STA $10                 ; [85 10      ] Store A to DP
    BEQ $FF35               ; [F0 1B      ] Branch if Equal
    CMP $22,X               ; [D5 22      ] Compare A with DP,X
    BNE $FF2D               ; [D0 0F      ] Branch if Not Equal
    LDA $1A,X               ; [B5 1A      ] Load A from DP,X
    DEC                     ; [3A         ] Decrement Accumulator
    BEQ $FF25               ; [F0 02      ] Branch if Equal
    BPL $FF43               ; [10 1E      ] Branch if Plus
    LDA $1E,X               ; [B5 1E      ] Load A from DP,X
    TSB $0A                 ; [04 0A      ] Test and Set Bits in DP
    LDA $19                 ; [A5 19      ] Load A from DP
    BRA $FF43               ; [80 16      ] Branch Always
    EOR $1E,X               ; [55 1E      ] XOR A with DP,X
    AND $10                 ; [25 10      ] AND A with Direct Page
    BNE $FF35               ; [D0 02      ] Branch if Not Equal
    LDA $10                 ; [A5 10      ] Load A from DP
    STA $1E,X               ; [95 1E      ] Store A to DP,X
    BIT #$80                ; [89 80      ] Test Bits Immediate
    BRK                     ; [00 F0      ] Software interrupt
    ORA $A9                 ; [05 A9      ] OR A with Direct Page
    JSR $8000               ; [20 00 80   ] Jump to Subroutine
    COP #$A5                ; [02 A5      ] Coprocessor interrupt
    CLC                     ; [18         ] Clear Carry Flag
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 95      ] Software interrupt
    INC                     ; [1A         ] Increment Accumulator
    LDA $10                 ; [A5 10      ] Load A from DP
    STA $22,X               ; [95 22      ] Store A to DP,X
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02FF4D (SNES $C2FF4D) ---
org $C2FF4D

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02FFB0 (SNES $C2FFB0) ---
org $C2FFB0

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $03AB2F (SNES $C3AB2F) ---
org $C3AB2F

    db $1F                      ; Incomplete/data bytes

;--- Patch at file offset $03AB36 (SNES $C3AB36) ---
org $C3AB36

    db $1E                      ; Incomplete/data bytes

;--- Patch at file offset $10FFA0 (SNES $D0FFA0) ---
org $D0FFA0

    BEQ $FF46               ; [F0 A4      ] Branch if Equal
    BEQ $FF48               ; [F0 A4      ] Branch if Equal
    BEQ $FF4A               ; [F0 A4      ] Branch if Equal
    BEQ $FF4C               ; [F0 A4      ] Branch if Equal
    INY                     ; [C8         ] Increment Y
    ADC $79EE,Y             ; [79 EE 79   ] Add with Carry Absolute,Y
    BRK                     ; [00 7A      ] Software interrupt
    ROL $7A                 ; [26 7A      ] Rotate Left DP
    ROL $7A                 ; [26 7A      ] Rotate Left DP
    MVP $7A,$56             ; [44 7A 56   ] Block Move Positive
    PLY                     ; [7A         ] Pull Y Register
    BEQ $FF5C               ; [F0 A4      ] Branch if Equal
    BEQ $FF5E               ; [F0 A4      ] Branch if Equal
    BEQ $FF60               ; [F0 A4      ] Branch if Equal
    BEQ $FF62               ; [F0 A4      ] Branch if Equal
    BEQ $FF64               ; [F0 A4      ] Branch if Equal
    EOR $A4F07A,X           ; [5F 7A F0 A4] XOR A with Absolute Long,X
    ROR $807A               ; [6E 7A 80   ] Rotate Right Absolute
    PLY                     ; [7A         ] Pull Y Register
    BRA $0044               ; [80 7A      ] Branch Always
    BRA $0046               ; [80 7A      ] Branch Always
    PER $F049               ; [62 7A F0   ] Push Effective Relative
    LDY $AD                 ; [A4 AD      ] Load Y from DP
    PLY                     ; [7A         ] Pull Y Register
    LDA $F07A               ; [AD 7A F0   ] Load A from Absolute
    LDY $F0                 ; [A4 F0      ] Load Y from DP
    LDY $F0                 ; [A4 F0      ] Load Y from DP
    LDY $F0                 ; [A4 F0      ] Load Y from DP
    LDY $F0                 ; [A4 F0      ] Load Y from DP
    db $A4                      ; Incomplete/data bytes

;--- End of patch ---