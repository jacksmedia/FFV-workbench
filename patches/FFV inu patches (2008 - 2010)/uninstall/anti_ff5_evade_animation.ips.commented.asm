;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_evade_animation.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_evade_animation.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 6 record(s)

;--- Patch at file offset $0181BE (SNES $C181BE) ---
org $C181BE

    DEC                     ; [3A         ] Decrement Accumulator

;--- Patch at file offset $0181C4 (SNES $C181C4) ---
org $C181C4

    db $BF                      ; Incomplete/data bytes

;--- Patch at file offset $0181C7 (SNES $C181C7) ---
org $C181C7

    CMP ($85,X)             ; [C1 85      ] Compare A with (DP,X)
    BVS $818A               ; [70 BF      ] Branch if Overflow Set
    ORA $C182,Y             ; [19 82 C1   ] OR A with Absolute,Y
    STA $71                 ; [85 71      ] Store A to DP
    JSR $8209               ; [20 09 82   ] Jump to Subroutine
    JSR $8D59               ; [20 59 8D   ] Jump to Subroutine
    CMP #$FC                ; [C9 FC      ] Compare A Immediate
    BNE $81F9               ; [D0 1F      ] Branch if Not Equal
    INY                     ; [C8         ] Increment Y
    LDA ($E7),Y             ; [B1 E7      ] Load A from (DP),Y
    CMP #$03                ; [C9 03      ] Compare A Immediate
    BCC $81E5               ; [90 04      ] Branch if Carry Clear
    CMP #$07                ; [C9 07      ] Compare A Immediate
    BNE $81F9               ; [D0 14      ] Branch if Not Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $EB                 ; [A5 EB      ] Load A from DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$07                ; [69 07      ] Add with Carry Immediate
    BRK                     ; [00 85      ] Software interrupt
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $ED                 ; [A5 ED      ] Load A from DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$08                ; [69 08      ] Add with Carry Immediate
    STA $ED                 ; [85 ED      ] Store A to DP
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $E7                 ; [A5 E7      ] Load A from DP
    CLC                     ; [18         ] Clear Carry Flag
    db $69                      ; Incomplete/data bytes

;--- Patch at file offset $019FE5 (SNES $C19FE5) ---
org $C19FE5

    PHX                     ; [DA         ] Push X Register

;--- Patch at file offset $01C209 (SNES $C1C209) ---
org $C1C209

    db $EE                      ; Incomplete/data bytes

;--- Patch at file offset $026557 (SNES $C26557) ---
org $C26557

    LDA $5D                 ; [A5 5D      ] Load A from DP
    CMP #$07                ; [C9 07      ] Compare A Immediate
    BNE $656F               ; [D0 12      ] Branch if Not Equal
    LDA $48                 ; [A5 48      ] Load A from DP
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    JSR $01D6               ; [20 D6 01   ] Jump to Subroutine
    PHA                     ; [48         ] Push Accumulator
    LDA $7B2C               ; [AD 2C 7B   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    PLA                     ; [68         ] Pull Accumulator
    STA $3C4C,X             ; [9D 4C 3C   ] Store A to Absolute,X
    BRA $6580               ; [80 11      ] Branch Always
    LDA $7B2C               ; [AD 2C 7B   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X

;--- End of patch ---