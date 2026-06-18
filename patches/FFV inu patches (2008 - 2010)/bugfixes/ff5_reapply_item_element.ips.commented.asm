;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_reapply_item_element.ips.commented.asm
;    Disassembled from IPS patch: ff5_reapply_item_element.ips
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

    LDA $7B7B               ; [AD 7B 7B   ] Load A from Absolute
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    LDA $C0EA64,X           ; [BF 64 EA C0] Load A from Absolute Long,X
    ADC #$30                ; [69 30      ] Add with Carry Immediate
    ORA $85                 ; [05 85      ] OR A with Direct Page
    ASL $E27B               ; [0E 7B E2   ] Shift Left Absolute
    JSR $A6A8               ; [20 A8 A6   ] Jump to Subroutine
    AND ($60)               ; [32 60      ] AND A with (DP)

;--- Patch at file offset $029C4B (SNES $C29C4B) ---
org $C29C4B

    LDA #$05                ; [A9 05      ] Load A Immediate
    STA $10                 ; [85 10      ] Store A to DP
    LDA $4053,Y             ; [B9 53 40   ] Load A from Absolute,Y
    PHY                     ; [5A         ] Push Y Register
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    STA $12                 ; [85 12      ] Store A to DP
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
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
    SBC $6821C2             ; [EF C2 21 68] Subtract with Borrow Absolute Long
    ADC #$0C                ; [69 0C      ] Add with Carry Immediate
    BRK                     ; [00 A8      ] Software interrupt
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    DEC $10                 ; [C6 10      ] Decrement DP
    BNE $9C4F               ; [D0 CF      ] Branch if Not Equal
    JSR $0750               ; [20 50 07   ] Jump to Subroutine
    LDA ($0E),Y             ; [B1 0E      ] Load A from (DP),Y
    EOR #$FF                ; [49 FF      ] XOR A with Immediate
    AND $2030,X             ; [3D 30 20   ] AND A with Absolute,X
    ORA $2620,Y             ; [19 20 26   ] OR A with Absolute,Y
    STA $2030,X             ; [9D 30 20   ] Store A to Absolute,X
    LDA $2620,Y             ; [B9 20 26   ] Load A from Absolute,Y
    STA ($0E),Y             ; [91 0E      ] Store A to (DP),Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    CPY #$05                ; [C0 05      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    db $E7                      ; Incomplete/data bytes

;--- End of patch ---