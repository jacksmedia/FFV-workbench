;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_stuck_bug.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_stuck_bug.ips
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

;--- Patch at file offset $0007EE (SNES $C007EE) ---
org $C007EE

    DEC                     ; [3A         ] Decrement Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    TAY                     ; [A8         ] Transfer A to Y
    LDA $0ADD,Y             ; [B9 DD 0A   ] Load A from Absolute,Y
    AND #$1C                ; [29 1C      ] AND A with Immediate
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    TAX                     ; [AA         ] Transfer A to X
    LDA $10FB               ; [AD FB 10   ] Load A from Absolute
    AND $C00890,X           ; [3F 90 08 C0] AND A with Absolute Long,X
    BNE $07ED               ; [D0 EA      ] Branch if Not Equal
    TYX                     ; [BB         ] Transfer Y to X
    LDA $02                 ; [A5 02      ] Load A from DP
    AND #$80                ; [29 80      ] AND A with Immediate
    BEQ $07ED               ; [F0 E3      ] Branch if Equal
    LDA $10B8               ; [AD B8 10   ] Load A from Absolute
    BNE $07ED               ; [D0 DE      ] Branch if Not Equal
    INC $10B8               ; [EE B8 10   ] Increment Absolute
    LDY $06                 ; [A4 06      ] Load Y from DP
    TYA                     ; [98         ] Transfer Y to A
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    INC                     ; [1A         ] Increment Accumulator
    CMP $0ADC               ; [CD DC 0A   ] Compare A with Absolute
    BEQ $0832               ; [F0 15      ] Branch if Equal
    LDA $0ADE,Y             ; [B9 DE 0A   ] Load A from Absolute,Y
    BMI $0832               ; [30 10      ] Branch if Minus
    LDA $0ADF,Y             ; [B9 DF 0A   ] Load A from Absolute,Y
    CMP $0AD8               ; [CD D8 0A   ] Compare A with Absolute
    BNE $0832               ; [D0 08      ] Branch if Not Equal
    LDA $0AE0,Y             ; [B9 E0 0A   ] Load A from Absolute,Y
    CMP $0AD9               ; [CD D9 0A   ] Compare A with Absolute
    BEQ $088F               ; [F0 5D      ] Branch if Equal
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    CPY #$18                ; [C0 18      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    CMP $4A8A,Y             ; [D9 8A 4A   ] Compare A with Absolute,Y
    INC                     ; [1A         ] Increment Accumulator
    INC                     ; [1A         ] Increment Accumulator
    TAX                     ; [AA         ] Transfer A to X
    LDA $C008A5,X           ; [BF A5 08 C0] Load A from Absolute Long,X
    STA $26                 ; [85 26      ] Store A to DP
    LDA $C008A6,X           ; [BF A6 08 C0] Load A from Absolute Long,X
    STA $27                 ; [85 27      ] Store A to DP
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $58                 ; [85 58      ] Store A to DP

;--- Patch at file offset $0FEBFC (SNES $CFEBFC) ---
org $CFEBFC

    db $2F                      ; Incomplete/data bytes

;--- End of patch ---