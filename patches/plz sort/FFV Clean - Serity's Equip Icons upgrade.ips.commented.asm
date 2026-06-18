;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; FFV Clean - Serity's Equip Icons upgrade.ips.commented.asm
;    Disassembled from IPS patch: FFV Clean - Serity's Equip Icons upgrade.ips
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

;--- Patch at file offset $00FFDC (SNES $C0FFDC) ---
org $C0FFDC

    db $BF, $3E, $40            ; Incomplete/data bytes

;--- Patch at file offset $02D7F7 (SNES $C2D7F7) ---
org $C2D7F7

    ASL                     ; [0A         ] Shift Left Accumulator
    BRK                     ; [00 5C      ] Software interrupt
    ASL $EFA5,X             ; [1E A5 EF   ] Shift Left Absolute,X
    NOP                     ; [EA         ] No Operation
    JSR $D80D               ; [20 0D D8   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    LDA #$10                ; [A9 10      ] Load A Immediate
    BRK                     ; [00 5C      ] Software interrupt
    BRK                     ; [00 A5      ] Software interrupt
    db $EF                      ; Incomplete/data bytes

;--- Patch at file offset $02D810 (SNES $C2D810) ---
org $C2D810

    BRK                     ; [00 A6      ] Software interrupt
    SBC $A5FD85             ; [EF 85 FD A5] Subtract with Borrow Absolute Long
    XCE                     ; [FB         ] Exchange Carry and Emulation
    AND $EFA602,X           ; [3F 02 A6 EF] AND A with Absolute Long,X
    ORA $FD                 ; [05 FD      ] OR A with Direct Page
    BEQ $D82D               ; [F0 0E      ] Branch if Equal
    LDA $EFA604,X           ; [BF 04 A6 EF] Load A from Absolute Long,X

;--- Patch at file offset $06FF99 (SNES $C6FF99) ---
org $C6FF99

    DEC $E7                 ; [C6 E7      ] Decrement DP
    SBC $B6,S               ; [E3 B6      ] Subtract with Borrow Stack Relative
    LDA [$E8],Y             ; [B7 E8      ] Load A from [DP],Y
    SBC #$BF                ; [E9 BF      ] Subtract with Borrow Immediate
    NOP                     ; [EA         ] No Operation
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    CPX $EEED               ; [EC ED EE   ] Compare X with Absolute
    SBC $F1BEF0             ; [EF F0 BE F1] Subtract with Borrow Absolute Long
    LDA $F2,X               ; [B5 F2      ] Load A from DP,X
    LDY $C1,X               ; [B4 C1      ] Load Y from DP,X
    SBC ($B3,S),Y           ; [F3 B3      ] Subtract with Borrow (SR),Y
    CMP $BD,S               ; [C3 BD      ] Compare A with Stack Relative
    CPY $F4CA               ; [CC CA F4   ] Compare Y with Absolute
    db $BC, $CF                 ; Incomplete/data bytes

;--- Patch at file offset $115711 (SNES $D15711) ---
org $D15711

    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $115719 (SNES $D15719) ---
org $D15719

    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $2FA500 (SNES $EFA500) ---
org $EFA500

    STA $85                 ; [85 85      ] Store A to DP
    LDA $01D8               ; [AD D8 01   ] Load A from Absolute
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 C9      ] Software interrupt
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BCS $A513               ; [B0 06      ] Branch if Carry Set
    LDX $8E                 ; [A6 8E      ] Load X from DP
    JML $C2D809             ; [5C 09 D8 C2] Jump Long
    LDA #$0C                ; [A9 0C      ] Load A Immediate
    BRK                     ; [00 85      ] Software interrupt
    STA $A6                 ; [85 A6      ] Store A to DP
    STX $095C               ; [8E 5C 09   ] Store X to Absolute
    CLD                     ; [D8         ] Clear Decimal Flag
    REP #$85                ; [C2 85      ] Reset Processor Status Bits
    STA $AD                 ; [85 AD      ] Store A to DP
    CLD                     ; [D8         ] Clear Decimal Flag
    ORA ($29,X)             ; [01 29      ] OR A with (DP,X)
    SBC $14C900,X           ; [FF 00 C9 14] Subtract with Borrow Absolute Long,X
    BRK                     ; [00 B0      ] Software interrupt
    ORA [$A2]               ; [07 A2      ] OR A with [DP]
    EOR $00,X               ; [55 00      ] XOR A with DP,X
    JML $C2D7FE             ; [5C FE D7 C2] Jump Long
    LDX #$3C                ; [A2 3C      ] Load X Immediate
    BRK                     ; [00 A9      ] Software interrupt
    ASL $8500               ; [0E 00 85   ] Shift Left Absolute
    STA $5C                 ; [85 5C      ] Store A to DP
    INC $C2D7,X             ; [FE D7 C2   ] Increment Absolute,X

;--- Patch at file offset $2FA600 (SNES $EFA600) ---
org $EFA600

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    SBC [$02]               ; [E7 02      ] Subtract with Borrow [DP]
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 B7      ] Software interrupt
    BRA $A60C               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    NOP                     ; [EA         ] No Operation
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    SBC $08,S               ; [E3 08      ] Subtract with Borrow Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 B6      ] Software interrupt
    BPL $A61B               ; [10 00      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    INX                     ; [E8         ] Increment X
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRK                     ; [00 E9      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 BF      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPX $1000               ; [EC 00 10   ] Compare X with Absolute
    BRK                     ; [00 00      ] Software interrupt
    INC $4000               ; [EE 00 40   ] Increment Absolute
    BRK                     ; [00 00      ] Software interrupt
    BEQ $A63D               ; [F0 00      ] Branch if Equal
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    SBC $2000               ; [ED 00 20   ] Subtract with Borrow Absolute
    BRK                     ; [00 00      ] Software interrupt
    SBC $008000             ; [EF 00 80 00] Subtract with Borrow Absolute Long
    BRK                     ; [00 C8      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 F1      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    LDA $00,X               ; [B5 00      ] Load A from DP,X
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 F2      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    LDY $00,X               ; [B4 00      ] Load Y from DP,X
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 C1      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BPL $A66D               ; [10 00      ] Branch if Plus
    SBC ($00,S),Y           ; [F3 00      ] Subtract with Borrow (SR),Y
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 B3      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 C3      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $A67C               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $F4,S               ; [03 F4      ] OR A with Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 04      ] Software interrupt

;--- End of patch ---