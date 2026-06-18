;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_learning.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_learning.ips
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

    SEC                     ; [38         ] Set Carry Flag
    SBC #$04                ; [E9 04      ] Subtract with Borrow Immediate
    JSR $01B5               ; [20 B5 01   ] Jump to Subroutine
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$DE                ; [69 DE      ] Add with Carry Immediate
    EOR ($85,X)             ; [41 85      ] XOR A with (DP,X)
    AND $E27B,X             ; [3D 7B E2   ] AND A with Absolute,X
    JSR $A87B               ; [20 7B A8   ] Jump to Subroutine
    STY $3F                 ; [84 3F      ] Store Y to DP
    LDY $3F                 ; [A4 3F      ] Load Y from DP
    LDA ($3D),Y             ; [B1 3D      ] Load A from (DP),Y
    STA $08                 ; [85 08      ] Store A to DP
    BEQ $4C43               ; [F0 0F      ] Branch if Equal
    CMP #$FF                ; [C9 FF      ] Compare A Immediate
    BEQ $4C43               ; [F0 0B      ] Branch if Equal
    CMP #$82                ; [C9 82      ] Compare A Immediate
    BCC $4C40               ; [90 04      ] Branch if Carry Clear
    CMP #$A0                ; [C9 A0      ] Compare A Immediate
    BCC $4C44               ; [90 04      ] Branch if Carry Clear
    JMP $4CDA               ; [4C DA 4C   ] Jump Absolute
    RTS                     ; [60         ] Return from Subroutine
    STZ $0E                 ; [64 0E      ] Store Zero to DP
    LDA $3F                 ; [A5 3F      ] Load A from DP
    TAX                     ; [AA         ] Transfer A to X
    LDA $D0EE85,X           ; [BF 85 EE D0] Load A from Absolute Long,X
    TAX                     ; [AA         ] Transfer A to X
    LDA $3BCF,X             ; [BD CF 3B   ] Load A from Absolute,X
    STA $0F                 ; [85 0F      ] Store A to DP
    LDA $3BCC,X             ; [BD CC 3B   ] Load A from Absolute,X
    AND #$40                ; [29 40      ] AND A with Immediate
    BEQ $4C61               ; [F0 07      ] Branch if Equal
    LDA $3BD1,X             ; [BD D1 3B   ] Load A from Absolute,X
    STA $0E                 ; [85 0E      ] Store A to DP
    STZ $0F                 ; [64 0F      ] Store Zero to DP
    LDA $0F                 ; [A5 0F      ] Load A from DP
    ORA $0E                 ; [05 0E      ] OR A with Direct Page
    STA $0E                 ; [85 0E      ] Store A to DP
    BEQ $4CDA               ; [F0 71      ] Branch if Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    STX $10                 ; [86 10      ] Store X to DP
    LDX $10                 ; [A6 10      ] Load X from DP
    ASL $0E                 ; [06 0E      ] Shift Left DP
    INC $10                 ; [E6 10      ] Increment DP
    BCS $4C7D               ; [B0 08      ] Branch if Carry Set
    INX                     ; [E8         ] Increment X
    CPX #$08                ; [E0 08      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    PEA $5D80               ; [F4 80 5D   ] Push Effective Absolute
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    TXA                     ; [8A         ] Transfer X to A
    JSR $01B2               ; [20 B2 01   ] Jump to Subroutine
    TAY                     ; [A8         ] Transfer A to Y
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $2020,Y             ; [B9 20 20   ] Load A from Absolute,Y
    AND #$10                ; [29 10      ] AND A with Immediate
    BEQ $4C6D               ; [F0 DF      ] Branch if Equal
    LDA $08                 ; [A5 08      ] Load A from DP
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    JSR $01B6               ; [20 B6 01   ] Jump to Subroutine
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $D10B82,X           ; [BF 82 0B D1] Load A from Absolute Long,X
    AND #$F0                ; [29 F0      ] AND A with Immediate
    STA $10                 ; [85 10      ] Store A to DP
    BMI $4CDA               ; [30 37      ] Branch if Minus
    AND #$40                ; [29 40      ] AND A with Immediate
    BEQ $4CAB               ; [F0 04      ] Branch if Equal
    LDA #$64                ; [A9 64      ] Load A Immediate
    BRA $4CBD               ; [80 12      ] Branch Always
    LDA $10                 ; [A5 10      ] Load A from DP
    AND #$20                ; [29 20      ] AND A with Immediate
    BEQ $4CB5               ; [F0 04      ] Branch if Equal
    LDA #$32                ; [A9 32      ] Load A Immediate
    BRA $4CBD               ; [80 08      ] Branch Always
    LDA $10                 ; [A5 10      ] Load A from DP
    AND #$10                ; [29 10      ] AND A with Immediate
    BEQ $4CDA               ; [F0 1F      ] Branch if Equal
    LDA #$0A                ; [A9 0A      ] Load A Immediate
    STA $0E                 ; [85 0E      ] Store A to DP
    JSR $02A2               ; [20 A2 02   ] Jump to Subroutine
    CMP $0E                 ; [C5 0E      ] Compare A with DP
    BCS $4CD8               ; [B0 12      ] Branch if Carry Set
    LDA $7C20               ; [AD 20 7C   ] Load A from Absolute
    CMP #$08                ; [C9 08      ] Compare A Immediate
    BEQ $4CDF               ; [F0 12      ] Branch if Equal
    TAX                     ; [AA         ] Transfer A to X
    LDA $08                 ; [A5 08      ] Load A from DP
    STA $7C21,X             ; [9D 21 7C   ] Store A to Absolute,X
    INC $7C20               ; [EE 20 7C   ] Increment Absolute
    BRA $4CDA               ; [80 02      ] Branch Always
    BRA $4C6D               ; [80 93      ] Branch Always
    INC $3F                 ; [E6 3F      ] Increment DP
    db $4C, $2C                 ; Incomplete/data bytes

;--- End of patch ---