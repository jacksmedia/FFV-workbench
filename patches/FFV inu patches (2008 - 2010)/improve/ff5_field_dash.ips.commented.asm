;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_field_dash.ips.commented.asm
;    Disassembled from IPS patch: ff5_field_dash.ips
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

;--- Patch at file offset $000FA7 (SNES $C00FA7) ---
org $C00FA7

    LDA $57                 ; [A5 57      ] Load A from DP
    BNE $0FC8               ; [D0 1D      ] Branch if Not Equal
    LDA $0ADC               ; [AD DC 0A   ] Load A from Absolute
    BEQ $0FBB               ; [F0 0B      ] Branch if Equal
    DEC                     ; [3A         ] Decrement Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    TAY                     ; [A8         ] Transfer A to Y
    LDA $0ADD,Y             ; [B9 DD 0A   ] Load A from Absolute,Y
    AND #$1C                ; [29 1C      ] AND A with Immediate
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    TAX                     ; [AA         ] Transfer A to X
    LDA $C008B3,X           ; [BF B3 08 C0] Load A from Absolute Long,X
    STA $C0                 ; [85 C0      ] Store A to DP
    LDA $03                 ; [A5 03      ] Load A from DP
    BPL $0FC8               ; [10 02      ] Branch if Plus
    ASL $C0                 ; [06 C0      ] Shift Left DP
    JSR $104A               ; [20 4A 10   ] Jump to Subroutine
    LDA $03                 ; [A5 03      ] Load A from DP
    AND #$0F                ; [29 0F      ] AND A with Immediate
    BEQ $1003               ; [F0 32      ] Branch if Equal
    BIT #$08                ; [89 08      ] Test Bits Immediate
    BEQ $0FD9               ; [F0 04      ] Branch if Equal
    LDA #$01                ; [A9 01      ] Load A Immediate
    BRA $0FF7               ; [80 1E      ] Branch Always
    BIT #$01                ; [89 01      ] Test Bits Immediate
    BEQ $0FE1               ; [F0 04      ] Branch if Equal
    LDA #$02                ; [A9 02      ] Load A Immediate
    BRA $0FF7               ; [80 16      ] Branch Always
    BIT #$04                ; [89 04      ] Test Bits Immediate
    BEQ $0FE9               ; [F0 04      ] Branch if Equal
    LDA #$03                ; [A9 03      ] Load A Immediate
    BRA $0FF7               ; [80 0E      ] Branch Always
    BIT #$02                ; [89 02      ] Test Bits Immediate
    BEQ $1006               ; [F0 19      ] Branch if Equal
    LDA #$04                ; [A9 04      ] Load A Immediate
    BRA $0FF7               ; [80 06      ] Branch Always

;--- End of patch ---