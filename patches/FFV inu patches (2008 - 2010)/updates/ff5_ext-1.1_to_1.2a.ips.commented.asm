;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_ext-1.1_to_1.2a.ips.commented.asm
;    Disassembled from IPS patch: ff5_ext-1.1_to_1.2a.ips
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

;--- Patch at file offset $020570 (SNES $C20570) ---
org $C20570

    JSR $9923               ; [20 23 99   ] Jump to Subroutine
    JSR $175F               ; [20 5F 17   ] Jump to Subroutine
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2056,X             ; [BD 56 20   ] Load A from Absolute,X
    AND #$10                ; [29 10      ] AND A with Immediate
    BEQ $0582               ; [F0 03      ] Branch if Equal
    JMP $0632               ; [4C 32 06   ] Jump Absolute
    STZ $7C62               ; [9C 62 7C   ] Store Zero to Absolute

;--- Patch at file offset $020632 (SNES $C20632) ---
org $C20632

    STZ $45                 ; [64 45      ] Store Zero to DP
    LDA $47                 ; [A5 47      ] Load A from DP
    TAX                     ; [AA         ] Transfer A to X
    LDA $D0ED85,X           ; [BF 85 ED D0] Load A from Absolute Long,X
    TAY                     ; [A8         ] Transfer A to Y
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $205A,X             ; [BD 5A 20   ] Load A from Absolute,X
    BNE $064C               ; [D0 09      ] Branch if Not Equal
    LDA $408B,Y             ; [B9 8B 40   ] Load A from Absolute,Y
    TAY                     ; [A8         ] Transfer A to Y
    LDA $2013,X             ; [BD 13 20   ] Load A from Absolute,X
    BRA $0660               ; [80 14      ] Branch Always
    INC $45                 ; [E6 45      ] Increment DP
    LDA $4097,Y             ; [B9 97 40   ] Load A from Absolute,Y
    TAY                     ; [A8         ] Transfer A to Y
    LDA $2014,X             ; [BD 14 20   ] Load A from Absolute,X
    BRA $0660               ; [80 09      ] Branch Always
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    STA $205A,X             ; [9D 5A 20   ] Store A to Absolute,X
    STA $7C62               ; [8D 62 7C   ] Store A to Absolute
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    TYA                     ; [98         ] Transfer Y to A
    STA $46                 ; [85 46      ] Store A to DP
    AND #$7F                ; [29 7F      ] AND A with Immediate
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    PHA                     ; [48         ] Push Accumulator
    LDY $0C                 ; [A4 0C      ] Load Y from DP
    JSR $0324               ; [20 24 03   ] Jump to Subroutine
    JSR $02C2               ; [20 C2 02   ] Jump to Subroutine
    BNE $0691               ; [D0 13      ] Branch if Not Equal
    LDY $0C                 ; [A4 0C      ] Load Y from DP
    LDA $7A00,Y             ; [B9 00 7A   ] Load A from Absolute,Y
    BPL $068E               ; [10 09      ] Branch if Plus
    LDA $79FA               ; [AD FA 79   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    INC $7BEB,X             ; [FE EB 7B   ] Increment Absolute,X
    BRA $0691               ; [80 03      ] Branch Always
    JSR $4AFE               ; [20 FE 4A   ] Jump to Subroutine
    JSR $02A9               ; [20 A9 02   ] Jump to Subroutine
    LDA $7C62               ; [AD 62 7C   ] Load A from Absolute
    STA $2621               ; [8D 21 26   ] Store A to Absolute
    LDA #$04                ; [A9 04      ] Load A Immediate
    STA $2620               ; [8D 20 26   ] Store A to Absolute
    JSR $992F               ; [20 2F 99   ] Jump to Subroutine
    JSR $98FA               ; [20 FA 98   ] Jump to Subroutine
    STZ $384C,X             ; [9E 4C 38   ] Store Zero to Absolute,X
    LDA #$FC                ; [A9 FC      ] Load A Immediate
    STA $384D,X             ; [9D 4D 38   ] Store A to Absolute,X
    LDA #$0A                ; [A9 0A      ] Load A Immediate
    STA $384E,X             ; [9D 4E 38   ] Store A to Absolute,X
    PLA                     ; [68         ] Pull Accumulator
    STA $384F,X             ; [9D 4F 38   ] Store A to Absolute,X
    STZ $3850,X             ; [9E 50 38   ] Store Zero to Absolute,X
    LDY $0C                 ; [A4 0C      ] Load Y from DP
    LDA $79FA               ; [AD FA 79   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA $7A00,Y             ; [B9 00 7A   ] Load A from Absolute,Y
    AND #$7F                ; [29 7F      ] AND A with Immediate
    STA $7B2D,X             ; [9D 2D 7B   ] Store A to Absolute,X
    LDA $26A0               ; [AD A0 26   ] Load A from Absolute
    STA $7B1C,X             ; [9D 1C 7B   ] Store A to Absolute,X
    BEQ $06D4               ; [F0 05      ] Branch if Equal
    INC $7B1C,X             ; [FE 1C 7B   ] Increment Absolute,X
    LDA #$80                ; [A9 80      ] Load A Immediate
    STA $7ACC,X             ; [9D CC 7A   ] Store A to Absolute,X
    JSR $1735               ; [20 35 17   ] Jump to Subroutine
    JSR $98E3               ; [20 E3 98   ] Jump to Subroutine
    LDA $46                 ; [A5 46      ] Load A from DP
    BPL $073D               ; [10 5C      ] Branch if Plus
    LDA $47                 ; [A5 47      ] Load A from DP
    TAX                     ; [AA         ] Transfer A to X
    LDA $CEFF84,X           ; [BF 84 FF CE] Load A from Absolute Long,X
    CLC                     ; [18         ] Clear Carry Flag
    ADC $45                 ; [65 45      ] Add with Carry DP
    TAY                     ; [A8         ] Transfer A to Y
    TDC                     ; [7B         ] Transfer Direct Page to A
    STA $37AC,Y             ; [99 AC 37   ] Store A to Absolute,Y
    STA $37AE,Y             ; [99 AE 37   ] Store A to Absolute,Y
    STA $37B0,Y             ; [99 B0 37   ] Store A to Absolute,Y
    LDA #$38                ; [A9 38      ] Load A Immediate
    STA $37B2,Y             ; [99 B2 37   ] Store A to Absolute,Y
    LDA #$5A                ; [A9 5A      ] Load A Immediate
    STA $37B4,Y             ; [99 B4 37   ] Store A to Absolute,Y
    LDA #$AA                ; [A9 AA      ] Load A Immediate
    STA $37B6,Y             ; [99 B6 37   ] Store A to Absolute,Y
    LDA $3CEF               ; [AD EF 3C   ] Load A from Absolute
    TAY                     ; [A8         ] Transfer A to Y
    LDA #$50                ; [A9 50      ] Load A Immediate
    STA $3C5F,Y             ; [99 5F 3C   ] Store A to Absolute,Y
    LDA $3CF0               ; [AD F0 3C   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA $7C62               ; [AD 62 7C   ] Load A from Absolute
    STA $3CBF,X             ; [9D BF 3C   ] Store A to Absolute,X
    STZ $3CC0,X             ; [9E C0 3C   ] Store Zero to Absolute,X
    STZ $3CC1,X             ; [9E C1 3C   ] Store Zero to Absolute,X
    JSR $994C               ; [20 4C 99   ] Jump to Subroutine
    LDA $41CC               ; [AD CC 41   ] Load A from Absolute
    PHA                     ; [48         ] Push Accumulator
    LDA $47                 ; [A5 47      ] Load A from DP
    STA $41CC               ; [8D CC 41   ] Store A to Absolute
    STA $7B7B               ; [8D 7B 7B   ] Store A to Absolute
    JSR $9F3A               ; [20 3A 9F   ] Jump to Subroutine
    PLA                     ; [68         ] Pull Accumulator
    STA $41CC               ; [8D CC 41   ] Store A to Absolute
    INC $7B7D               ; [EE 7D 7B   ] Increment Absolute
    JSR $9A6F               ; [20 6F 9A   ] Jump to Subroutine
    STZ $7B7D               ; [9C 7D 7B   ] Store Zero to Absolute
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02073E (SNES $C2073E) ---
org $C2073E

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

;--- End of patch ---