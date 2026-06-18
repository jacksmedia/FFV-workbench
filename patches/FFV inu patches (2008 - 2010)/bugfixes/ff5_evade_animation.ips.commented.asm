;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_evade_animation.ips.commented.asm
;    Disassembled from IPS patch: ff5_evade_animation.ips
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

    db $32                      ; Incomplete/data bytes

;--- Patch at file offset $0181C4 (SNES $C181C4) ---
org $C181C4

    db $FC                      ; Incomplete/data bytes

;--- Patch at file offset $0181C7 (SNES $C181C7) ---
org $C181C7

    JSR $8D59               ; [20 59 8D   ] Jump to Subroutine
    CMP #$FC                ; [C9 FC      ] Compare A Immediate
    BNE $81F1               ; [D0 23      ] Branch if Not Equal
    INY                     ; [C8         ] Increment Y
    LDA ($E7),Y             ; [B1 E7      ] Load A from (DP),Y
    CMP #$03                ; [C9 03      ] Compare A Immediate
    BCC $81D9               ; [90 04      ] Branch if Carry Clear
    CMP #$07                ; [C9 07      ] Compare A Immediate
    BNE $81F1               ; [D0 18      ] Branch if Not Equal
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    LDA $EB                 ; [A5 EB      ] Load A from DP
    ADC #$07                ; [69 07      ] Add with Carry Immediate
    BRK                     ; [00 85      ] Software interrupt
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    INC $F0                 ; [E6 F0      ] Increment DP
    INC $DB76               ; [EE 76 DB   ] Increment Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $ED                 ; [A5 ED      ] Load A from DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$08                ; [69 08      ] Add with Carry Immediate
    STA $ED                 ; [85 ED      ] Store A to DP
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    LDA $E7                 ; [A5 E7      ] Load A from DP
    ADC #$05                ; [69 05      ] Add with Carry Immediate
    BRK                     ; [00 85      ] Software interrupt
    SBC [$7B]               ; [E7 7B      ] Subtract with Borrow [DP]
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    BRA $81B2               ; [80 B3      ] Branch Always

;--- Patch at file offset $019FE5 (SNES $C19FE5) ---
org $C19FE5

    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $01C209 (SNES $C1C209) ---
org $C1C209

    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $026557 (SNES $C26557) ---
org $C26557

    LDA $7B2C               ; [AD 2C 7B   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA $5D                 ; [A5 5D      ] Load A from DP
    CMP #$07                ; [C9 07      ] Compare A Immediate
    BNE $6573               ; [D0 12      ] Branch if Not Equal
    PHX                     ; [DA         ] Push X Register
    LDA $48                 ; [A5 48      ] Load A from DP
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    JSR $01D6               ; [20 D6 01   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    ORA $3C4C,X             ; [1D 4C 3C   ] OR A with Absolute,X
    STA $3C4C,X             ; [9D 4C 3C   ] Store A to Absolute,X
    BRA $6580               ; [80 0E      ] Branch Always
    NOP                     ; [EA         ] No Operation

;--- End of patch ---