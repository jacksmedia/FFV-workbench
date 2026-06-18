;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_equip_change.ips.commented.asm
;    Disassembled from IPS patch: ff5_equip_change.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 3 record(s)

;--- Patch at file offset $013AC2 (SNES $C13AC2) ---
org $C13AC2

    db $C9                      ; Incomplete/data bytes

;--- Patch at file offset $01608C (SNES $C1608C) ---
org $C1608C

    LDY $61,X               ; [B4 61      ] Load Y from DP,X
    LDA $CD42               ; [AD 42 CD   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA $CEFF84,X           ; [BF 84 FF CE] Load A from Absolute Long,X
    TAX                     ; [AA         ] Transfer A to X
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $0160B9 (SNES $C160B9) ---
org $C160B9

    LDY $61,X               ; [B4 61      ] Load Y from DP,X
    JSR $608E               ; [20 8E 60   ] Jump to Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    ADC $CFD4               ; [6D D4 CF   ] Add with Carry Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA $CFD3               ; [AD D3 CF   ] Load A from Absolute
    TAY                     ; [A8         ] Transfer A to Y
    BRA $60D7               ; [80 0E      ] Branch Always
    JSR $608E               ; [20 8E 60   ] Jump to Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    ADC $CFD3               ; [6D D3 CF   ] Add with Carry Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA $CFD4               ; [AD D4 CF   ] Load A from Absolute
    TAY                     ; [A8         ] Transfer A to Y
    BRA $60D7               ; [80 00      ] Branch Always
    LDA $37AC,X             ; [BD AC 37   ] Load A from Absolute,X
    BEQ $613D               ; [F0 61      ] Branch if Equal
    CMP $2734,Y             ; [D9 34 27   ] Compare A with Absolute,Y
    BEQ $6134               ; [F0 53      ] Branch if Equal
    PHY                     ; [5A         ] Push Y Register
    LDY #$FF                ; [A0 FF      ] Load Y Immediate
    BRK                     ; [00 D9      ] Software interrupt
    BIT $27,X               ; [34 27      ] Test Bits DP,X
    BEQ $6139               ; [F0 4F      ] Branch if Equal
    DEY                     ; [88         ] Decrement Y
    BPL $60E5               ; [10 F8      ] Branch if Plus
    PLY                     ; [7A         ] Pull Y Register
    LDA $2834,Y             ; [B9 34 28   ] Load A from Absolute,Y
    CMP #$02                ; [C9 02      ] Compare A Immediate
    BCC $616F               ; [90 7A      ] Branch if Carry Clear
    LDA $2734,Y             ; [B9 34 27   ] Load A from Absolute,Y
    BEQ $616F               ; [F0 75      ] Branch if Equal
    PHY                     ; [5A         ] Push Y Register
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BRK                     ; [00 B9      ] Software interrupt
    BIT $27,X               ; [34 27      ] Test Bits DP,X
    BEQ $610D               ; [F0 0A      ] Branch if Equal
    INY                     ; [C8         ] Increment Y
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    ORA ($D0,X)             ; [01 D0      ] OR A with (DP,X)
    SBC $7A,X               ; [F5 7A      ] Subtract with Borrow DP,X
    JMP $61B9               ; [4C B9 61   ] Jump Absolute
    LDA $37AC,X             ; [BD AC 37   ] Load A from Absolute,X
    STA $2734,Y             ; [99 34 27   ] Store A to Absolute,Y
    LDA $37AE,X             ; [BD AE 37   ] Load A from Absolute,X
    STA $2834,Y             ; [99 34 28   ] Store A to Absolute,Y
    LDA $37B0,X             ; [BD B0 37   ] Load A from Absolute,X
    STA $2934,Y             ; [99 34 29   ] Store A to Absolute,Y
    LDA $37B2,X             ; [BD B2 37   ] Load A from Absolute,X
    STA $2A34,Y             ; [99 34 2A   ] Store A to Absolute,Y
    LDA $37B4,X             ; [BD B4 37   ] Load A from Absolute,X
    STA $2B34,Y             ; [99 34 2B   ] Store A to Absolute,Y
    LDA $37B6,X             ; [BD B6 37   ] Load A from Absolute,X
    STA $2C34,Y             ; [99 34 2C   ] Store A to Absolute,Y
    PLY                     ; [7A         ] Pull Y Register
    BRA $6144               ; [80 10      ] Branch Always
    JSR $6193               ; [20 93 61   ] Jump to Subroutine
    BRA $61B4               ; [80 7B      ] Branch Always
    JSR $6193               ; [20 93 61   ] Jump to Subroutine
    PLY                     ; [7A         ] Pull Y Register
    LDA $2834,Y             ; [B9 34 28   ] Load A from Absolute,Y
    CMP #$02                ; [C9 02      ] Compare A Immediate
    BCC $616F               ; [90 2B      ] Branch if Carry Clear
    LDA $2734,Y             ; [B9 34 27   ] Load A from Absolute,Y
    BEQ $616F               ; [F0 26      ] Branch if Equal
    STA $37AC,X             ; [9D AC 37   ] Store A to Absolute,X
    LDA $2934,Y             ; [B9 34 29   ] Load A from Absolute,Y
    STA $37B0,X             ; [9D B0 37   ] Store A to Absolute,X
    LDA $2A34,Y             ; [B9 34 2A   ] Load A from Absolute,Y
    STA $37B2,X             ; [9D B2 37   ] Store A to Absolute,X
    LDA $2B34,Y             ; [B9 34 2B   ] Load A from Absolute,Y
    STA $37B4,X             ; [9D B4 37   ] Store A to Absolute,X
    LDA $2C34,Y             ; [B9 34 2C   ] Load A from Absolute,Y
    STA $37B6,X             ; [9D B6 37   ] Store A to Absolute,X
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $37AE,X             ; [9D AE 37   ] Store A to Absolute,X
    TYX                     ; [BB         ] Transfer Y to X
    DEC $2834,X             ; [DE 34 28   ] Decrement Absolute,X
    BRA $61B4               ; [80 45      ] Branch Always
    LDA #$06                ; [A9 06      ] Load A Immediate
    STA $70                 ; [85 70      ] Store A to DP
    LDA $2734,Y             ; [B9 34 27   ] Load A from Absolute,Y
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    LDA $37AC,X             ; [BD AC 37   ] Load A from Absolute,X
    STA $2734,Y             ; [99 34 27   ] Store A to Absolute,Y
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    STA $37AC,X             ; [9D AC 37   ] Store A to Absolute,X
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    TYA                     ; [98         ] Transfer Y to A
    ADC #$00                ; [69 00      ] Add with Carry Immediate
    ORA ($A8,X)             ; [01 A8      ] OR A with (DP,X)
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    INX                     ; [E8         ] Increment X
    INX                     ; [E8         ] Increment X
    DEC $70                 ; [C6 70      ] Decrement DP
    BNE $6173               ; [D0 E3      ] Branch if Not Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    BRA $61B4               ; [80 21      ] Branch Always
    LDA $2834,Y             ; [B9 34 28   ] Load A from Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    ADC $37AE,X             ; [7D AE 37   ] Add with Carry Absolute,X
    CMP #$64                ; [C9 64      ] Compare A Immediate
    BCC $61A0               ; [90 02      ] Branch if Carry Clear
    LDA #$63                ; [A9 63      ] Load A Immediate
    STA $2834,Y             ; [99 34 28   ] Store A to Absolute,Y
    STZ $37AC,X             ; [9E AC 37   ] Store Zero to Absolute,X
    STZ $37AE,X             ; [9E AE 37   ] Store Zero to Absolute,X
    LDA #$5A                ; [A9 5A      ] Load A Immediate
    STA $37B4,X             ; [9D B4 37   ] Store A to Absolute,X
    LDA #$AA                ; [A9 AA      ] Load A Immediate
    STA $37B6,X             ; [9D B6 37   ] Store A to Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $7B7D               ; [8D 7D 7B   ] Store A to Absolute
    JSR $39E2               ; [20 E2 39   ] Jump to Subroutine
    JSR $3CCD               ; [20 CD 3C   ] Jump to Subroutine
    STZ $CD38               ; [9C 38 CD   ] Store Zero to Absolute

;--- End of patch ---