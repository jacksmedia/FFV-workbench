;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_stuck_bug.ips.commented.asm
;    Disassembled from IPS patch: ff5_stuck_bug.ips
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

    LDY $169C               ; [AC 9C 16   ] Load Y from Absolute
    LDA $0ADD,Y             ; [B9 DD 0A   ] Load A from Absolute,Y
    AND #$1C                ; [29 1C      ] AND A with Immediate
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    TAX                     ; [AA         ] Transfer A to X
    LDA $10FB               ; [AD FB 10   ] Load A from Absolute
    AND $C00890,X           ; [3F 90 08 C0] AND A with Absolute Long,X
    ORA $10B8               ; [0D B8 10   ] OR A with Absolute
    BNE $07ED               ; [D0 E8      ] Branch if Not Equal
    LDA $02                 ; [A5 02      ] Load A from DP
    BPL $07ED               ; [10 E4      ] Branch if Plus
    LDA $0AD6               ; [AD D6 0A   ] Load A from Absolute
    CMP #$02                ; [C9 02      ] Compare A Immediate
    BNE $0824               ; [D0 14      ] Branch if Not Equal
    SEC                     ; [38         ] Set Carry Flag
    LDA $0AD8               ; [AD D8 0A   ] Load A from Absolute
    SBC #$37                ; [E9 37      ] Subtract with Borrow Immediate
    CMP #$03                ; [C9 03      ] Compare A Immediate
    BCS $0824               ; [B0 0A      ] Branch if Carry Set
    SEC                     ; [38         ] Set Carry Flag
    LDA $0AD9               ; [AD D9 0A   ] Load A from Absolute
    SBC #$78                ; [E9 78      ] Subtract with Borrow Immediate
    CMP #$03                ; [C9 03      ] Compare A Immediate
    BCC $07ED               ; [90 C9      ] Branch if Carry Clear
    INC $10B8               ; [EE B8 10   ] Increment Absolute
    LDY $06                 ; [A4 06      ] Load Y from DP
    CPY $169C               ; [CC 9C 16   ] Compare Y with Absolute
    BEQ $083B               ; [F0 0D      ] Branch if Equal
    LDA $0ADE,Y             ; [B9 DE 0A   ] Load A from Absolute,Y
    BMI $083B               ; [30 08      ] Branch if Minus
    LDX $0ADF,Y             ; [BE DF 0A   ] Load X from Absolute,Y
    CPX $0AD8               ; [EC D8 0A   ] Compare X with Absolute
    BEQ $088F               ; [F0 54      ] Branch if Equal
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    CPY #$18                ; [C0 18      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    SBC $AD                 ; [E5 AD      ] Subtract with Borrow DP
    STZ $4A16               ; [9C 16 4A   ] Store Zero to Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $58                 ; [85 58      ] Store A to DP
    JMP ($08A7,X)           ; [7C A7 08   ] Jump Indirect,X

;--- Patch at file offset $0FEBFC (SNES $CFEBFC) ---
org $CFEBFC

    db $EF                      ; Incomplete/data bytes

;--- End of patch ---