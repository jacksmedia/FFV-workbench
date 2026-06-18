;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_reequip.ips.commented.asm
;    Disassembled from IPS patch: ff5_reequip.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 12 record(s)

;--- Patch at file offset $00FA95 (SNES $C0FA95) ---
org $C0FA95

    db $76                      ; Incomplete/data bytes

;--- Patch at file offset $00FE67 (SNES $C0FE67) ---
org $C0FE67

    ADC $2389,X             ; [7D 89 23   ] Add with Carry Absolute,X
    PLD                     ; [2B         ] Pull Direct Page Register
    SBC $73B967,X           ; [FF 67 B9 73] Subtract with Borrow Absolute Long,X
    BIT #$75                ; [89 75      ] Test Bits Immediate
    LDA $779D               ; [AD 9D 77   ] Load A from Absolute
    ADC $9B7D00,X           ; [7F 00 7D 9B] Add with Carry Absolute Long,X
    STA $009D,X             ; [9D 9D 00   ] Store A to Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $02B5DD (SNES $C2B5DD) ---
org $C2B5DD

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02B679 (SNES $C2B679) ---
org $C2B679

    JSR $E6D6               ; [20 D6 E6   ] Jump to Subroutine
    LDA $2D11               ; [AD 11 2D   ] Load A from Absolute
    BEQ $B693               ; [F0 12      ] Branch if Equal
    LDA $0973               ; [AD 73 09   ] Load A from Absolute
    AND #$01                ; [29 01      ] AND A with Immediate
    BNE $B693               ; [D0 0B      ] Branch if Not Equal
    JSR $DAA4               ; [20 A4 DA   ] Jump to Subroutine
    JSR $FAAD               ; [20 AD FA   ] Jump to Subroutine
    JSR $F869               ; [20 69 F8   ] Jump to Subroutine
    BRA $B69A               ; [80 07      ] Branch Always
    JSR $F9F0               ; [20 F0 F9   ] Jump to Subroutine
    LDA $74                 ; [A5 74      ] Load A from DP
    BEQ $B6B4               ; [F0 1A      ] Branch if Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA #$C8                ; [A9 C8      ] Load A Immediate
    LDX $B820               ; [AE 20 B8   ] Load X from Absolute
    CMP ($20,X)             ; [C1 20      ] Compare A with (DP,X)
    STA ($A6,S),Y           ; [93 A6      ] Store A to (SR),Y
    LDA #$02                ; [A9 02      ] Load A Immediate
    TSB $7500               ; [0C 00 75   ] Test and Set Bits Absolute
    LDA #$04                ; [A9 04      ] Load A Immediate
    TSB $CA                 ; [04 CA      ] Test and Set Bits in DP
    LDX #$28                ; [A2 28      ] Load X Immediate
    BRK                     ; [00 20      ] Software interrupt
    TCD                     ; [5B         ] Transfer A to Direct Page
    INC $20                 ; [E6 20      ] Increment DP
    db $BD, $B2                 ; Incomplete/data bytes

;--- Patch at file offset $02E1A6 (SNES $C2E1A6) ---
org $C2E1A6

    PHP                     ; [08         ] Push Processor Status
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    JSR $E26B               ; [20 6B E2   ] Jump to Subroutine
    CMP #$03                ; [C9 03      ] Compare A Immediate
    BMI $E1B6               ; [30 06      ] Branch if Minus
    LDA $72                 ; [A5 72      ] Load A from DP
    STA $E0,X               ; [95 E0      ] Store A to DP,X
    BRA $E1E0               ; [80 2A      ] Branch Always
    LDA $72                 ; [A5 72      ] Load A from DP
    BMI $E1C0               ; [30 06      ] Branch if Minus
    STA $E5,X               ; [95 E5      ] Store A to DP,X
    STZ $E3,X               ; [74 E3      ] Store Zero to DP,X
    BRA $E1C4               ; [80 04      ] Branch Always
    STA $E3,X               ; [95 E3      ] Store A to DP,X
    STZ $E5,X               ; [74 E5      ] Store Zero to DP,X
    LDA $E5,X               ; [B5 E5      ] Load A from DP,X
    BEQ $E1D3               ; [F0 0B      ] Branch if Equal
    TYX                     ; [BB         ] Transfer Y to X
    LDA $E5,X               ; [B5 E5      ] Load A from DP,X
    CMP #$01                ; [C9 01      ] Compare A Immediate
    BNE $E1E0               ; [D0 11      ] Branch if Not Equal
    STZ $E5,X               ; [74 E5      ] Store Zero to DP,X
    BRA $E1E0               ; [80 0D      ] Branch Always
    TYX                     ; [BB         ] Transfer Y to X
    LDA $E5,X               ; [B5 E5      ] Load A from DP,X
    ORA $E3,X               ; [15 E3      ] OR A with DP,X
    BNE $E1E0               ; [D0 06      ] Branch if Not Equal
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $E5,X               ; [95 E5      ] Store A to DP,X
    STZ $E3,X               ; [74 E3      ] Store Zero to DP,X
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    PHP                     ; [08         ] Push Processor Status
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    JSR $E26B               ; [20 6B E2   ] Jump to Subroutine
    CMP #$03                ; [C9 03      ] Compare A Immediate
    BPL $E1F4               ; [10 08      ] Branch if Plus
    LDA $E5,X               ; [B5 E5      ] Load A from DP,X
    BNE $E1F9               ; [D0 09      ] Branch if Not Equal
    LDA $E3,X               ; [B5 E3      ] Load A from DP,X
    BRA $E1F9               ; [80 05      ] Branch Always
    LDA $E0,X               ; [B5 E0      ] Load A from DP,X
    JSR $CBF1               ; [20 F1 CB   ] Jump to Subroutine
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02E1FB (SNES $C2E1FB) ---
org $C2E1FB

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

;--- Patch at file offset $02E211 (SNES $C2E211) ---
org $C2E211

    PHP                     ; [08         ] Push Processor Status
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    STZ $73                 ; [64 73      ] Store Zero to DP
    JSR $E26B               ; [20 6B E2   ] Jump to Subroutine
    CMP #$03                ; [C9 03      ] Compare A Immediate
    BMI $E22D               ; [30 10      ] Branch if Minus
    LDA $E0,X               ; [B5 E0      ] Load A from DP,X
    BEQ $E257               ; [F0 36      ] Branch if Equal
    CMP #$80                ; [C9 80      ] Compare A Immediate
    BEQ $E257               ; [F0 32      ] Branch if Equal
    STA $73                 ; [85 73      ] Store A to DP
    LDA #$80                ; [A9 80      ] Load A Immediate
    STA $E0,X               ; [95 E0      ] Store A to DP,X
    BRA $E257               ; [80 2A      ] Branch Always
    LDA $E5,X               ; [B5 E5      ] Load A from DP,X
    BNE $E235               ; [D0 04      ] Branch if Not Equal
    LDA $E3,X               ; [B5 E3      ] Load A from DP,X
    BEQ $E23D               ; [F0 08      ] Branch if Equal
    CMP #$01                ; [C9 01      ] Compare A Immediate
    BEQ $E241               ; [F0 08      ] Branch if Equal
    STA $73                 ; [85 73      ] Store A to DP
    STZ $E3,X               ; [74 E3      ] Store Zero to DP,X
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $E5,X               ; [95 E5      ] Store A to DP,X
    PHX                     ; [DA         ] Push X Register
    TYX                     ; [BB         ] Transfer Y to X
    LDA $E5,X               ; [B5 E5      ] Load A from DP,X
    CMP #$02                ; [C9 02      ] Compare A Immediate
    BCC $E24E               ; [90 05      ] Branch if Carry Clear
    PLX                     ; [FA         ] Pull X Register
    STZ $E5,X               ; [74 E5      ] Store Zero to DP,X
    BRA $E257               ; [80 09      ] Branch Always
    PLY                     ; [7A         ] Pull Y Register
    LDA $E3,X               ; [B5 E3      ] Load A from DP,X
    BNE $E257               ; [D0 04      ] Branch if Not Equal
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $E5,X               ; [95 E5      ] Store A to DP,X
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02E259 (SNES $C2E259) ---
org $C2E259

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

;--- Patch at file offset $02E26B (SNES $C2E26B) ---
org $C2E26B

    LDA #$00                ; [A9 00      ] Load A Immediate
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    LDA $6F                 ; [A5 6F      ] Load A from DP
    CMP #$01                ; [C9 01      ] Compare A Immediate
    BEQ $E27D               ; [F0 09      ] Branch if Equal
    CMP #$02                ; [C9 02      ] Compare A Immediate
    BEQ $E27D               ; [F0 05      ] Branch if Equal
    INC                     ; [1A         ] Increment Accumulator
    AND #$03                ; [29 03      ] AND A with Immediate
    BRA $E282               ; [80 05      ] Branch Always
    AND #$01                ; [29 01      ] AND A with Immediate
    TAY                     ; [A8         ] Transfer A to Y
    EOR #$01                ; [49 01      ] XOR A with Immediate
    TAX                     ; [AA         ] Transfer A to X
    LDA $6F                 ; [A5 6F      ] Load A from DP

;--- Patch at file offset $02F9F0 (SNES $C2F9F0) ---
org $C2F9F0

    PHB                     ; [8B         ] Push Data Bank
    PHP                     ; [08         ] Push Processor Status
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA #$7E                ; [A9 7E      ] Load A Immediate
    PHA                     ; [48         ] Push Accumulator
    PLB                     ; [AB         ] Pull Data Bank
    STZ $74                 ; [64 74      ] Store Zero to DP
    JSR $E178               ; [20 78 E1   ] Jump to Subroutine
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $6F                 ; [85 6F      ] Store A to DP
    JSR $E1E2               ; [20 E2 E1   ] Jump to Subroutine
    CMP #$02                ; [C9 02      ] Compare A Immediate
    BCC $FA58               ; [90 50      ] Branch if Carry Clear
    LDY $80                 ; [A4 80      ] Load Y from DP
    CMP #$80                ; [C9 80      ] Compare A Immediate
    BCS $FA21               ; [B0 13      ] Branch if Carry Set
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    LDA $6F                 ; [A5 6F      ] Load A from DP
    CMP #$02                ; [C9 02      ] Compare A Immediate
    BNE $FA20               ; [D0 0B      ] Branch if Not Equal
    LDA $E5                 ; [A5 E5      ] Load A from DP
    BEQ $FA20               ; [F0 07      ] Branch if Equal
    LDA $0521,Y             ; [B9 21 05   ] Load A from Absolute,Y
    AND #$01                ; [29 01      ] AND A with Immediate
    BEQ $FA42               ; [F0 22      ] Branch if Equal
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    JSR $D9AB               ; [20 AB D9   ] Jump to Subroutine
    LDA $9D                 ; [A5 9D      ] Load A from DP
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    AND #$3F                ; [29 3F      ] AND A with Immediate
    BRK                     ; [00 0A      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    LDA $D12480,X           ; [BF 80 24 D1] Load A from Absolute Long,X
    AND $0540,Y             ; [39 40 05   ] AND A with Absolute,Y
    BNE $FA3E               ; [D0 07      ] Branch if Not Equal
    LDA $D12482,X           ; [BF 82 24 D1] Load A from Absolute Long,X
    AND $0542,Y             ; [39 42 05   ] AND A with Absolute,Y
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    BNE $FA58               ; [D0 16      ] Branch if Not Equal
    INC $74                 ; [E6 74      ] Increment DP
    JSR $E211               ; [20 11 E2   ] Jump to Subroutine
    LDA $73                 ; [A5 73      ] Load A from DP
    JSR $E286               ; [20 86 E2   ] Jump to Subroutine
    LDA $90                 ; [A5 90      ] Load A from DP
    BNE $FA58               ; [D0 08      ] Branch if Not Equal
    LDA #$01                ; [A9 01      ] Load A Immediate
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    LDA $73                 ; [A5 73      ] Load A from DP
    JSR $E2CE               ; [20 CE E2   ] Jump to Subroutine
    LDA $6F                 ; [A5 6F      ] Load A from DP
    INC                     ; [1A         ] Increment Accumulator
    CMP #$06                ; [C9 06      ] Compare A Immediate
    BNE $F9FF               ; [D0 A0      ] Branch if Not Equal
    JSR $E18F               ; [20 8F E1   ] Jump to Subroutine
    PLP                     ; [28         ] Pull Processor Status
    PLB                     ; [AB         ] Pull Data Bank
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $03AED5 (SNES $C3AED5) ---
org $C3AED5

    db $09                      ; Incomplete/data bytes

;--- Patch at file offset $03B6CE (SNES $C3B6CE) ---
org $C3B6CE

    STA [$00]               ; [87 00      ] Store A to [DP]
    ASL $14,X               ; [16 14      ] Shift Left DP,X
    BRK                     ; [00 04      ] Software interrupt
    ADC #$00                ; [69 00      ] Add with Carry Immediate
    TSB $16                 ; [04 16      ] Test and Set Bits in DP
    BRK                     ; [00 04      ] Software interrupt
    RTL                     ; [6B         ] Return from Subroutine Long
    BRK                     ; [00 0F      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 04      ] Software interrupt
    JMP ($0400)             ; [6C 00 04   ] Jump Indirect
    INC                     ; [1A         ] Increment Accumulator
    BRK                     ; [00 04      ] Software interrupt
    ADC $0F00               ; [6D 00 0F   ] Add with Carry Absolute
    INC                     ; [1A         ] Increment Accumulator
    BRA $B6F0               ; [80 04      ] Branch Always
    ROR $0F00               ; [6E 00 0F   ] Rotate Right Absolute
    TRB $0480               ; [1C 80 04   ] Test and Reset Bits Absolute
    ADC $1E0F00             ; [6F 00 0F 1E] Add with Carry Absolute Long
    BRA $B6FC               ; [80 04      ] Branch Always
    BVS $B6FA               ; [70 00      ] Branch if Overflow Set
    ORA ($1A),Y             ; [11 1A      ] OR A with (DP),Y
    BRA $B702               ; [80 04      ] Branch Always
    BVS $B700               ; [70 00      ] Branch if Overflow Set
    ORA ($1C),Y             ; [11 1C      ] OR A with (DP),Y
    BRA $B708               ; [80 04      ] Branch Always
    BVS $B706               ; [70 00      ] Branch if Overflow Set
    ORA ($1E),Y             ; [11 1E      ] OR A with (DP),Y
    BRA $B70A               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- End of patch ---