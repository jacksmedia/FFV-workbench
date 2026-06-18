;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_hp_color.ips.commented.asm
;    Disassembled from IPS patch: ff5_hp_color.ips
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

;--- Patch at file offset $0130AE (SNES $C130AE) ---
org $C130AE

    db $FF, $30                 ; Incomplete/data bytes

;--- Patch at file offset $0130F7 (SNES $C130F7) ---
org $C130F7

    LDX $74                 ; [A6 74      ] Load X from DP
    STX $70                 ; [86 70      ] Store X to DP
    PLY                     ; [7A         ] Pull Y Register
    JMP $2EAB               ; [4C AB 2E   ] Jump Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    JSR $32A5               ; [20 A5 32   ] Jump to Subroutine
    JSL $C6FF2C             ; [22 2C FF C6] Jump to Subroutine Long
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $06FF2C (SNES $C6FF2C) ---
org $C6FF2C

    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA ($78)               ; [B2 78      ] Load A from (DP)
    BNE $FF37               ; [D0 05      ] Branch if Not Equal
    LDA #$04                ; [A9 04      ] Load A Immediate
    BRK                     ; [00 80      ] Software interrupt
    ORA ($5A)               ; [12 5A      ] OR A with (DP)
    LDY #$02                ; [A0 02      ] Load Y Immediate
    BRK                     ; [00 B1      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    PLY                     ; [7A         ] Pull Y Register
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    CMP ($78)               ; [D2 78      ] Compare A with (DP)
    TDC                     ; [7B         ] Transfer Direct Page to A
    BCC $FF49               ; [90 03      ] Branch if Carry Clear
    LDA #$08                ; [A9 08      ] Load A Immediate
    BRK                     ; [00 E2      ] Software interrupt
    JSR $7485               ; [20 85 74   ] Jump to Subroutine
    LDA $C4,X               ; [B5 C4      ] Load A from DP,X
    STA ($BC),Y             ; [91 BC      ] Store A to (DP),Y
    INY                     ; [C8         ] Increment Y
    LDA $74                 ; [A5 74      ] Load A from DP
    STA ($BC),Y             ; [91 BC      ] Store A to (DP),Y
    INY                     ; [C8         ] Increment Y
    INX                     ; [E8         ] Increment X
    CPX #$04                ; [E0 04      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    BEQ $FFC9               ; [F0 6B      ] Branch if Equal

;--- End of patch ---