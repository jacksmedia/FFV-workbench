;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_three_images.ips.commented.asm
;    Disassembled from IPS patch: ff5_three_images.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 2 record(s)

;--- Patch at file offset $016EF8 (SNES $C16EF8) ---
org $C16EF8

    LDA $96                 ; [A5 96      ] Load A from DP
    TAY                     ; [A8         ] Transfer A to Y
    LDA $D1CB,Y             ; [B9 CB D1   ] Load A from Absolute,Y
    BNE $6F7D               ; [D0 7D      ] Branch if Not Equal
    JSR $6ED4               ; [20 D4 6E   ] Jump to Subroutine
    LDA $CF5A,X             ; [BD 5A CF   ] Load A from Absolute,X
    BEQ $6F7D               ; [F0 75      ] Branch if Equal
    TAY                     ; [A8         ] Transfer A to Y
    LDA $CF50,X             ; [BD 50 CF   ] Load A from Absolute,X
    LSR                     ; [4A         ] Shift Right Accumulator
    DEY                     ; [88         ] Decrement Y
    BEQ $6F1E               ; [F0 0E      ] Branch if Equal
    DEY                     ; [88         ] Decrement Y
    BEQ $6F18               ; [F0 05      ] Branch if Equal
    BCS $6F22               ; [B0 0D      ] Branch if Carry Set
    LSR                     ; [4A         ] Shift Right Accumulator
    BCS $6F2C               ; [B0 14      ] Branch if Carry Set
    BCC $6F27               ; [90 0D      ] Branch if Carry Clear
    ASL $88                 ; [06 88      ] Shift Left DP
    BRA $6F33               ; [80 15      ] Branch Always
    BCC $6F7D               ; [90 5D      ] Branch if Carry Clear
    BRA $6F27               ; [80 05      ] Branch Always
    ASL $88                 ; [06 88      ] Shift Left DP
    LSR                     ; [4A         ] Shift Right Accumulator
    BCS $6F33               ; [B0 0C      ] Branch if Carry Set
    LDX #$00                ; [A2 00      ] Load X Immediate
    BRK                     ; [00 80      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    LDA $88                 ; [A5 88      ] Load A from DP
    ASL                     ; [0A         ] Shift Left Accumulator
    ADC $88                 ; [65 88      ] Add with Carry DP
    STA $88                 ; [85 88      ] Store A to DP
    LDX #$60                ; [A2 60      ] Load X Immediate
    BRK                     ; [00 86      ] Software interrupt
    STY $A5,X               ; [94 A5      ] Store Y to DP,X
    STX $0A,Y               ; [96 0A      ] Store X to DP,Y
    TAX                     ; [AA         ] Transfer A to X
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    LDA $D0E1D8,X           ; [BF D8 E1 D0] Load A from Absolute Long,X
    TAY                     ; [A8         ] Transfer A to Y
    LDA $D0E1E0,X           ; [BF E0 E1 D0] Load A from Absolute Long,X
    ADC $94                 ; [65 94      ] Add with Carry DP
    TAX                     ; [AA         ] Transfer A to X
    LDA #$06                ; [A9 06      ] Load A Immediate
    BRK                     ; [00 E2      ] Software interrupt
    JSR $8985               ; [20 85 89   ] Jump to Subroutine
    LDA $88                 ; [A5 88      ] Load A from DP
    EOR $F6                 ; [45 F6      ] XOR A with Direct Page
    SEC                     ; [38         ] Set Carry Flag
    SBC $F6                 ; [E5 F6      ] Subtract with Borrow DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC $F789,X             ; [7D 89 F7   ] Add with Carry Absolute,X
    STA $0200,Y             ; [99 00 02   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    LDA $F789,X             ; [BD 89 F7   ] Load A from Absolute,X
    STA $0200,Y             ; [99 00 02   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    LDA $F789,X             ; [BD 89 F7   ] Load A from Absolute,X
    STA $0200,Y             ; [99 00 02   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    LDA $F789,X             ; [BD 89 F7   ] Load A from Absolute,X
    STA $0200,Y             ; [99 00 02   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    DEC $89                 ; [C6 89      ] Decrement DP
    BNE $6F51               ; [D0 D4      ] Branch if Not Equal
    PLY                     ; [7A         ] Pull Y Register
    PLX                     ; [FA         ] Pull X Register
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $016F80 (SNES $C16F80) ---
org $C16F80

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

;--- End of patch ---