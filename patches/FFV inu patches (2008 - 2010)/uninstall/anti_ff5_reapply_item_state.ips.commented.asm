;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_reapply_item_state.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_reapply_item_state.ips
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

;--- Patch at file offset $029CA5 (SNES $C29CA5) ---
org $C29CA5

    STZ $0E                 ; [64 0E      ] Store Zero to DP
    LDX $0A                 ; [A6 0A      ] Load X from DP
    STX $10                 ; [86 10      ] Store X to DP
    LDY $10                 ; [A4 10      ] Load Y from DP
    LDA $4054,Y             ; [B9 54 40   ] Load A from Absolute,Y
    STA $24                 ; [85 24      ] Store A to DP
    LDA #$07                ; [A9 07      ] Load A Immediate
    STA $25                 ; [85 25      ] Store A to DP
    JSR $00F1               ; [20 F1 00   ] Jump to Subroutine
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAY                     ; [A8         ] Transfer A to Y
    LDX $26                 ; [A6 26      ] Load X from DP
    LDA $D126C4,X           ; [BF C4 26 D1] Load A from Absolute Long,X
    ORA $2620,Y             ; [19 20 26   ] OR A with Absolute,Y
    STA $2620,Y             ; [99 20 26   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    CPY #$03                ; [C0 03      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    SBC $480EA5             ; [EF A5 0E 48] Subtract with Borrow Absolute Long
    JSR $9D01               ; [20 01 9D   ] Jump to Subroutine
    PLA                     ; [68         ] Pull Accumulator
    STA $0E                 ; [85 0E      ] Store A to DP
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $10                 ; [A5 10      ] Load A from DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$0C                ; [69 0C      ] Add with Carry Immediate
    BRK                     ; [00 85      ] Software interrupt
    BPL $9D5D               ; [10 7B      ] Branch if Plus
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    INC $0E                 ; [E6 0E      ] Increment DP
    LDA $0E                 ; [A5 0E      ] Load A from DP
    CMP #$05                ; [C9 05      ] Compare A Immediate
    BNE $9CAB               ; [D0 BF      ] Branch if Not Equal

;--- End of patch ---