;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; FFV Clean Krile.ips.commented.asm
;    Disassembled from IPS patch: FFV Clean Krile.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 5 record(s)

;--- Patch at file offset $149700 (SNES $D49700) ---
org $D49700

    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    TSB $03                 ; [04 03      ] Test and Set Bits in DP
    PHD                     ; [0B         ] Push Direct Page Register
    TSB $1F                 ; [04 1F      ] Test and Set Bits in DP
    BRK                     ; [00 1F      ] Software interrupt
    ORA #$38                ; [09 38      ] OR A with Immediate
    ORA [$2A],Y             ; [17 2A      ] OR A with [DP],Y
    ORA [$1E],Y             ; [17 1E      ] OR A with [DP],Y
    ORA $000000             ; [0F 00 00 00] OR A with Absolute Long
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    ORA [$0C]               ; [07 0C      ] OR A with [DP]
    TSB $0A03               ; [0C 03 0A   ] Test and Set Bits Absolute
    BRK                     ; [00 17      ] Software interrupt
    ORA ($05)               ; [12 05      ] OR A with (DP)
    ASL $8001               ; [0E 01 80   ] Shift Left Absolute
    BRK                     ; [00 F0      ] Software interrupt
    BRA $971D               ; [80 F8      ] Branch Always
    JSR $10FE               ; [20 FE 10   ] Jump to Subroutine
    SBC $50FEC8,X           ; [FF C8 FE 50] Subtract with Borrow Absolute Long,X
    JSR ($E480,X)           ; [FC 80 E4   ] Jump to Subroutine Indirect,X
    BRA $9731               ; [80 00      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BNE $974F               ; [D0 18      ] Branch if Not Equal
    PHP                     ; [08         ] Push Processor Status
    NOP                     ; [EA         ] No Operation
    JSR $A5F2               ; [20 F2 A5   ] Jump to Subroutine
    SBC ($76),Y             ; [F1 76      ] Subtract with Borrow (DP),Y
    db $F9                      ; Incomplete/data bytes

;--- Patch at file offset $149746 (SNES $D49746) ---
org $D49746

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    BRK                     ; [00 7C      ] Software interrupt
    BRK                     ; [00 66      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $149758 (SNES $D49758) ---
org $D49758

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BRA $975F               ; [80 00      ] Branch Always
    CLV                     ; [B8         ] Clear Overflow Flag
    ORA $0F,X               ; [15 0F      ] OR A with DP,X
    ORA [$0E],Y             ; [17 0E      ] OR A with [DP],Y
    ASL $1F0C,X             ; [1E 0C 1F   ] Shift Left Absolute,X
    BRK                     ; [00 0F      ] Software interrupt
    ASL $0F                 ; [06 0F      ] Shift Left DP
    COP #$07                ; [02 07      ] Coprocessor interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 05      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA [$09]               ; [07 09      ] OR A with [DP]
    ASL $0F03               ; [0E 03 0F   ] Shift Left Absolute
    ORA $060107             ; [0F 07 01 06] OR A with Absolute Long
    TSB $03                 ; [04 03      ] Test and Set Bits in DP
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 C3      ] Software interrupt

;--- Patch at file offset $14978B (SNES $D4978B) ---
org $D4978B

    BRA $976D               ; [80 E0      ] Branch Always
    BRK                     ; [00 40      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    CMP ($B5,X)             ; [C1 B5      ] Compare A with (DP,X)
    CPY #$64                ; [C0 64      ] Compare Y Immediate
    STA ($01)               ; [92 01      ] Store A to (DP)
    JSR ($F580,X)           ; [FC 80 F5   ] Jump to Subroutine Indirect,X
    CPX #$60                ; [E0 60      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    CMP $82,S               ; [C3 82      ] Compare A with Stack Relative
    ADC $02,S               ; [63 02      ] Add with Carry Stack Relative
    SBC $046600,X           ; [FF 00 66 04] Subtract with Borrow Absolute Long,X
    db $7F, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1497B4 (SNES $D497B4) ---
org $D497B4

    db $20, $40                 ; Incomplete/data bytes

;--- End of patch ---