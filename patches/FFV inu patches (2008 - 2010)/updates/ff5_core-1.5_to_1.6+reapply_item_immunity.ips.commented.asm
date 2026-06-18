;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_core-1.5_to_1.6+reapply_item_immunity.ips.commented.asm
;    Disassembled from IPS patch: ff5_core-1.5_to_1.6+reapply_item_immunity.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 8 record(s)

;--- Patch at file offset $023FE0 (SNES $C23FE0) ---
org $C23FE0

    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $3F09,X             ; [BD 09 3F   ] Load A from Absolute,X
    CMP $220C,Y             ; [D9 0C 22   ] Compare A with Absolute,Y
    BCC $3FED               ; [90 03      ] Branch if Carry Clear
    STA $220C,Y             ; [99 0C 22   ] Store A to Absolute,Y
    BIT $3F18,X             ; [3C 18 3F   ] Test Bits Absolute,X
    BPL $3FF8               ; [10 06      ] Branch if Plus
    TYA                     ; [98         ] Transfer Y to A
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$56                ; [69 56      ] Add with Carry Immediate
    BRK                     ; [00 A8      ] Software interrupt
    LDA $3F19,X             ; [BD 19 3F   ] Load A from Absolute,X
    AND #$7F                ; [29 7F      ] AND A with Immediate
    SBC $221A99,X           ; [FF 99 1A 22] Subtract with Borrow Absolute Long,X
    LDA $3F1B,X             ; [BD 1B 3F   ] Load A from Absolute,X
    STA $221C,Y             ; [99 1C 22   ] Store A to Absolute,Y
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits

;--- Patch at file offset $024246 (SNES $C24246) ---
org $C24246

    JSR $51AB               ; [20 AB 51   ] Jump to Subroutine
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02511C (SNES $C2511C) ---
org $C2511C

    JSR $51AB               ; [20 AB 51   ] Jump to Subroutine
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02515F (SNES $C2515F) ---
org $C2515F

    LDA $0502,Y             ; [B9 02 05   ] Load A from Absolute,Y
    STA $2002,X             ; [9D 02 20   ] Store A to Absolute,X
    STZ $2022,X             ; [9E 22 20   ] Store Zero to Absolute,X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $0524,Y             ; [B9 24 05   ] Load A from Absolute,Y
    STA $2024,X             ; [9D 24 20   ] Store A to Absolute,X
    LDA $0526,Y             ; [B9 26 05   ] Load A from Absolute,Y
    STA $2026,X             ; [9D 26 20   ] Store A to Absolute,X
    LDA $0508,Y             ; [B9 08 05   ] Load A from Absolute,Y
    STA $2008,X             ; [9D 08 20   ] Store A to Absolute,X
    CMP $2006,X             ; [DD 06 20   ] Compare A with Absolute,X
    BCS $5184               ; [B0 03      ] Branch if Carry Set
    STA $2006,X             ; [9D 06 20   ] Store A to Absolute,X
    STZ $201E,X             ; [9E 1E 20   ] Store Zero to Absolute,X
    STZ $2030,X             ; [9E 30 20   ] Store Zero to Absolute,X
    STZ $2032,X             ; [9E 32 20   ] Store Zero to Absolute,X
    STZ $2034,X             ; [9E 34 20   ] Store Zero to Absolute,X
    STZ $2036,X             ; [9E 36 20   ] Store Zero to Absolute,X
    STZ $2038,X             ; [9E 38 20   ] Store Zero to Absolute,X
    TYA                     ; [98         ] Transfer Y to A
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$50                ; [69 50      ] Add with Carry Immediate
    BRK                     ; [00 A8      ] Software interrupt
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    JSR $01E0               ; [20 E0 01   ] Jump to Subroutine
    CPX #$00                ; [E0 00      ] Compare X Immediate
    COP #$D0                ; [02 D0      ] Coprocessor interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    LDX #$FF                ; [A2 FF      ] Load X Immediate
    BRK                     ; [00 BD      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    ASL $F0                 ; [06 F0      ] Shift Left DP
    PHP                     ; [08         ] Push Processor Status
    LDA $0740,X             ; [BD 40 07   ] Load A from Absolute,X
    BNE $51BE               ; [D0 06      ] Branch if Not Equal
    STZ $0640,X             ; [9E 40 06   ] Store Zero to Absolute,X
    STZ $0740,X             ; [9E 40 07   ] Store Zero to Absolute,X
    DEX                     ; [CA         ] Decrement X
    BPL $51AE               ; [10 ED      ] Branch if Plus

;--- Patch at file offset $0251F5 (SNES $C251F5) ---
org $C251F5

    TAX                     ; [AA         ] Transfer A to X
    LDY #$1A                ; [A0 1A      ] Load Y Immediate
    JMP ($1084,X)           ; [7C 84 10   ] Jump Indirect,X
    TAY                     ; [A8         ] Transfer A to Y
    STZ $201B,X             ; [9E 1B 20   ] Store Zero to Absolute,X
    STZ $201C,X             ; [9E 1C 20   ] Store Zero to Absolute,X
    STZ $201D,X             ; [9E 1D 20   ] Store Zero to Absolute,X
    STZ $201E,X             ; [9E 1E 20   ] Store Zero to Absolute,X
    STZ $2035,X             ; [9E 35 20   ] Store Zero to Absolute,X
    STZ $2036,X             ; [9E 36 20   ] Store Zero to Absolute,X
    STZ $2037,X             ; [9E 37 20   ] Store Zero to Absolute,X
    LDA ($10)               ; [B2 10      ] Load A from (DP)
    STA $2000,X             ; [9D 00 20   ] Store A to Absolute,X
    LDA #$46                ; [A9 46      ] Load A Immediate
    STA $0E                 ; [85 0E      ] Store A to DP
    LDA $2000,X             ; [BD 00 20   ] Load A from Absolute,X
    STA $0500,Y             ; [99 00 05   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    DEC $0E                 ; [C6 0E      ] Decrement DP
    BNE $521A               ; [D0 F4      ] Branch if Not Equal
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    TYA                     ; [98         ] Transfer Y to A
    ADC #$0A                ; [69 0A      ] Add with Carry Immediate
    BRK                     ; [00 A8      ] Software interrupt
    TXA                     ; [8A         ] Transfer X to A
    ADC #$3A                ; [69 3A      ] Add with Carry Immediate
    BRK                     ; [00 AA      ] Software interrupt
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    INC $10                 ; [E6 10      ] Increment DP
    CPX #$00                ; [E0 00      ] Compare X Immediate
    COP #$D0                ; [02 D0      ] Coprocessor interrupt
    CPY #$A2                ; [C0 A2      ] Compare Y Immediate
    SBC $34BD00,X           ; [FF 00 BD 34] Subtract with Borrow Absolute Long,X
    AND [$9D]               ; [27 9D      ] AND A with [DP]
    RTI                     ; [40         ] Return from Interrupt
    ASL $F0                 ; [06 F0      ] Shift Left DP
    ORA $BD,S               ; [03 BD      ] OR A with Stack Relative
    BIT $28,X               ; [34 28      ] Test Bits DP,X
    STA $0740,X             ; [9D 40 07   ] Store A to Absolute,X
    BNE $5252               ; [D0 03      ] Branch if Not Equal
    STA $0640,X             ; [9D 40 06   ] Store A to Absolute,X
    DEX                     ; [CA         ] Decrement X
    BPL $523F               ; [10 EA      ] Branch if Plus
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    LDA $094A               ; [AD 4A 09   ] Load A from Absolute
    ADC $DB6E               ; [6D 6E DB   ] Add with Carry Absolute
    STA $094A               ; [8D 4A 09   ] Store A to Absolute
    LDA $094C               ; [AD 4C 09   ] Load A from Absolute
    ADC $DB70               ; [6D 70 DB   ] Add with Carry Absolute
    STA $094C               ; [8D 4C 09   ] Store A to Absolute
    BCC $5274               ; [90 09      ] Branch if Carry Clear
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    SBC $094A8D,X           ; [FF 8D 4A 09] Subtract with Borrow Absolute Long,X
    STA $094C               ; [8D 4C 09   ] Store A to Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $025278 (SNES $C25278) ---
org $C25278

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

;--- Patch at file offset $026770 (SNES $C26770) ---
org $C26770

    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    LDA $7B73               ; [AD 73 7B   ] Load A from Absolute
    ORA #$00                ; [09 00      ] OR A with Immediate
    BRA $6716               ; [80 9D      ] Branch Always
    JMP $EA3A               ; [4C 3A EA   ] Jump Absolute
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    LDA $7B73               ; [AD 73 7B   ] Load A from Absolute
    AND #$FF                ; [29 FF      ] AND A with Immediate
    AND $A60E85,X           ; [3F 85 0E A6] AND A with Absolute Long,X
    AND ($BD)               ; [32 BD      ] AND A with (DP)
    ASL                     ; [0A         ] Shift Left Accumulator
    JSR $0E65               ; [20 65 0E   ] Jump to Subroutine
    BCS $6795               ; [B0 05      ] Branch if Carry Set

;--- Patch at file offset $0267B2 (SNES $C267B2) ---
org $C267B2

    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    LDA $7B75               ; [AD 75 7B   ] Load A from Absolute
    ORA #$00                ; [09 00      ] OR A with Immediate
    BRA $6758               ; [80 9D      ] Branch Always
    JMP $EA3A               ; [4C 3A EA   ] Jump Absolute
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    LDA $7B75               ; [AD 75 7B   ] Load A from Absolute
    AND #$FF                ; [29 FF      ] AND A with Immediate
    AND $A60E85,X           ; [3F 85 0E A6] AND A with Absolute Long,X
    EOR #$BD                ; [49 BD      ] XOR A with Immediate
    ASL                     ; [0A         ] Shift Left Accumulator
    JSR $0E65               ; [20 65 0E   ] Jump to Subroutine
    BCS $67D7               ; [B0 05      ] Branch if Carry Set

;--- End of patch ---