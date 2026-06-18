;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_reapply_item_element.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_reapply_item_element.ips
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

;--- Patch at file offset $020750 (SNES $C20750) ---
org $C20750

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

;--- Patch at file offset $029C4B (SNES $C29C4B) ---
org $C29C4B

    STX $0E                 ; [86 0E      ] Store X to DP
    LDY $0A                 ; [A4 0A      ] Load Y from DP
    STY $10                 ; [84 10      ] Store Y to DP
    LDY $10                 ; [A4 10      ] Load Y from DP
    LDA $4053,Y             ; [B9 53 40   ] Load A from Absolute,Y
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    STA $12                 ; [85 12      ] Store A to DP
    JSR $01B7               ; [20 B7 01   ] Jump to Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    ADC $12                 ; [65 12      ] Add with Carry DP
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    TAY                     ; [A8         ] Transfer A to Y
    LDA $D12580,X           ; [BF 80 25 D1] Load A from Absolute Long,X
    ORA $2620,Y             ; [19 20 26   ] OR A with Absolute,Y
    STA $2620,Y             ; [99 20 26   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    CPY #$05                ; [C0 05      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    SBC $A520C2             ; [EF C2 20 A5] Subtract with Borrow Absolute Long
    BPL $9C93               ; [10 18      ] Branch if Plus
    ADC #$0C                ; [69 0C      ] Add with Carry Immediate
    BRK                     ; [00 85      ] Software interrupt
    BPL $9CFC               ; [10 7B      ] Branch if Plus
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    INC $0E                 ; [E6 0E      ] Increment DP
    LDA $0E                 ; [A5 0E      ] Load A from DP
    CMP #$05                ; [C9 05      ] Compare A Immediate
    BNE $9C51               ; [D0 C6      ] Branch if Not Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAY                     ; [A8         ] Transfer A to Y
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2620,Y             ; [B9 20 26   ] Load A from Absolute,Y
    STA $2030,X             ; [9D 30 20   ] Store A to Absolute,X
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    CPY #$05                ; [C0 05      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    db $F3                      ; Incomplete/data bytes

;--- End of patch ---