;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_learning.ips.commented.asm
;    Disassembled from IPS patch: ff5_learning.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 1 record(s)

;--- Patch at file offset $024C17 (SNES $C24C17) ---
org $C24C17

    SBC #$04                ; [E9 04      ] Subtract with Borrow Immediate
    JSR $01B5               ; [20 B5 01   ] Jump to Subroutine
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    ADC #$DE                ; [69 DE      ] Add with Carry Immediate
    EOR ($85,X)             ; [41 85      ] XOR A with (DP,X)
    AND $857B,X             ; [3D 7B 85   ] AND A with Absolute,X
    AND $A420E2,X           ; [3F E2 20 A4] AND A with Absolute Long,X
    AND $853DB1,X           ; [3F B1 3D 85] AND A with Absolute Long,X
    PHP                     ; [08         ] Push Processor Status
    BEQ $4C16               ; [F0 E6      ] Branch if Equal
    CMP #$FF                ; [C9 FF      ] Compare A Immediate
    BEQ $4C16               ; [F0 E2      ] Branch if Equal
    CMP #$82                ; [C9 82      ] Compare A Immediate
    BCC $4C3C               ; [90 04      ] Branch if Carry Clear
    CMP #$A0                ; [C9 A0      ] Compare A Immediate
    BCC $4C3F               ; [90 03      ] Branch if Carry Clear
    JMP $4CDA               ; [4C DA 4C   ] Jump Absolute
    TYX                     ; [BB         ] Transfer Y to X
    LDA $D0EE85,X           ; [BF 85 EE D0] Load A from Absolute Long,X
    TAX                     ; [AA         ] Transfer A to X
    LDA $3BCC,X             ; [BD CC 3B   ] Load A from Absolute,X
    AND #$40                ; [29 40      ] AND A with Immediate
    BNE $4C51               ; [D0 05      ] Branch if Not Equal
    LDA $3BCF,X             ; [BD CF 3B   ] Load A from Absolute,X
    BRA $4C54               ; [80 03      ] Branch Always
    LDA $3BD1,X             ; [BD D1 3B   ] Load A from Absolute,X
    STA $11                 ; [85 11      ] Store A to DP
    BEQ $4C3C               ; [F0 E4      ] Branch if Equal
    STZ $10                 ; [64 10      ] Store Zero to DP
    LDA $10                 ; [A5 10      ] Load A from DP
    ASL $11                 ; [06 11      ] Shift Left DP
    INC $10                 ; [E6 10      ] Increment DP
    BCS $4C69               ; [B0 07      ] Branch if Carry Set
    INC                     ; [1A         ] Increment Accumulator
    CMP #$08                ; [C9 08      ] Compare A Immediate
    BNE $4C5C               ; [D0 F5      ] Branch if Not Equal
    BRA $4CDA               ; [80 71      ] Branch Always
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    JSR $01B2               ; [20 B2 01   ] Jump to Subroutine
    TAY                     ; [A8         ] Transfer A to Y
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $2020,Y             ; [B9 20 20   ] Load A from Absolute,Y
    AND #$10                ; [29 10      ] AND A with Immediate
    BEQ $4C5A               ; [F0 E1      ] Branch if Equal
    LDA $08                 ; [A5 08      ] Load A from DP
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    JSR $01B6               ; [20 B6 01   ] Jump to Subroutine
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $D10B82,X           ; [BF 82 0B D1] Load A from Absolute Long,X
    AND #$F0                ; [29 F0      ] AND A with Immediate
    BMI $4CDA               ; [30 4E      ] Branch if Minus
    BEQ $4CDA               ; [F0 4C      ] Branch if Equal
    BIT #$40                ; [89 40      ] Test Bits Immediate
    BEQ $4C96               ; [F0 04      ] Branch if Equal
    LDA #$64                ; [A9 64      ] Load A Immediate
    BRA $4CA0               ; [80 0A      ] Branch Always
    BIT #$20                ; [89 20      ] Test Bits Immediate
    BEQ $4C9E               ; [F0 04      ] Branch if Equal
    LDA #$32                ; [A9 32      ] Load A Immediate
    BRA $4CA0               ; [80 02      ] Branch Always
    LDA #$0A                ; [A9 0A      ] Load A Immediate
    STA $0E                 ; [85 0E      ] Store A to DP
    JSR $02A2               ; [20 A2 02   ] Jump to Subroutine
    CMP $0E                 ; [C5 0E      ] Compare A with DP
    BCS $4C5A               ; [B0 B1      ] Branch if Carry Set
    LDA $08                 ; [A5 08      ] Load A from DP
    TAX                     ; [AA         ] Transfer A to X
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    TAY                     ; [A8         ] Transfer A to Y
    TXA                     ; [8A         ] Transfer X to A
    AND #$07                ; [29 07      ] AND A with Immediate
    TAX                     ; [AA         ] Transfer A to X
    LDA $0950,Y             ; [B9 50 09   ] Load A from Absolute,Y
    JSR $01DB               ; [20 DB 01   ] Jump to Subroutine
    BNE $4CDA               ; [D0 1E      ] Branch if Not Equal
    LDA $7C20               ; [AD 20 7C   ] Load A from Absolute
    CMP #$08                ; [C9 08      ] Compare A Immediate
    BEQ $4CDF               ; [F0 1C      ] Branch if Equal
    TAX                     ; [AA         ] Transfer A to X
    STX $0E                 ; [86 0E      ] Store X to DP
    LDA $08                 ; [A5 08      ] Load A from DP
    DEX                     ; [CA         ] Decrement X
    BMI $4CD2               ; [30 07      ] Branch if Minus
    CMP $7C21,X             ; [DD 21 7C   ] Compare A with Absolute,X
    BEQ $4CDA               ; [F0 0A      ] Branch if Equal
    BRA $4CC8               ; [80 F6      ] Branch Always
    LDX $0E                 ; [A6 0E      ] Load X from DP
    STA $7C21,X             ; [9D 21 7C   ] Store A to Absolute,X
    INC $7C20               ; [EE 20 7C   ] Increment Absolute
    INC $3F                 ; [E6 3F      ] Increment DP
    db $4C, $28                 ; Incomplete/data bytes

;--- End of patch ---