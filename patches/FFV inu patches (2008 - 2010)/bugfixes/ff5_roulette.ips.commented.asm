;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_roulette.ips.commented.asm
;    Disassembled from IPS patch: ff5_roulette.ips
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

;--- Patch at file offset $014C76 (SNES $C14C76) ---
org $C14C76

    JSR $4C7F               ; [20 7F 4C   ] Jump to Subroutine
    BCC $4C73               ; [90 F8      ] Branch if Carry Clear
    STA $D0C4               ; [8D C4 D0   ] Store A to Absolute
    RTS                     ; [60         ] Return from Subroutine
    AND #$0F                ; [29 0F      ] AND A with Immediate
    PHA                     ; [48         ] Push Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    LDA $DE                 ; [A5 DE      ] Load A from DP
    AND $DBE1               ; [2D E1 DB   ] AND A with Absolute
    AND $CEFFD5,X           ; [3F D5 FF CE] AND A with Absolute Long,X
    BEQ $4C92               ; [F0 01      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    PLA                     ; [68         ] Pull Accumulator

;--- Patch at file offset $014C9D (SNES $C14C9D) ---
org $C14C9D

    INC                     ; [1A         ] Increment Accumulator
    JSR $4C7F               ; [20 7F 4C   ] Jump to Subroutine
    BCC $4C9D               ; [90 FA      ] Branch if Carry Clear
    BRA $4C7B               ; [80 D6      ] Branch Always
    LDA $CD40               ; [AD 40 CD   ] Load A from Absolute
    LSR                     ; [4A         ] Shift Right Accumulator
    LDA $D0C2               ; [AD C2 D0   ] Load A from Absolute
    BIT #$04                ; [89 04      ] Test Bits Immediate
    BEQ $4CB4               ; [F0 04      ] Branch if Equal
    BCC $4CB4               ; [90 02      ] Branch if Carry Clear
    LDA #$30                ; [A9 30      ] Load A Immediate
    RTS                     ; [60         ] Return from Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$20                ; [69 20      ] Add with Carry Immediate
    STA $DB47               ; [8D 47 DB   ] Store A to Absolute
    LDA #$13                ; [A9 13      ] Load A Immediate
    STA $CD3A               ; [8D 3A CD   ] Store A to Absolute
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $014D4D (SNES $C14D4D) ---
org $C14D4D

    JSR $4CA5               ; [20 A5 4C   ] Jump to Subroutine

;--- Patch at file offset $014D9E (SNES $C14D9E) ---
org $C14D9E

    LDA $CD40               ; [AD 40 CD   ] Load A from Absolute
    BNE $4DB0               ; [D0 0D      ] Branch if Not Equal
    JSR $5494               ; [20 94 54   ] Jump to Subroutine
    JSR $FC96               ; [20 96 FC   ] Jump to Subroutine
    AND #$3F                ; [29 3F      ] AND A with Immediate
    JSR $4CB5               ; [20 B5 4C   ] Jump to Subroutine
    BRA $4DB6               ; [80 06      ] Branch Always
    JSR $4C73               ; [20 73 4C   ] Jump to Subroutine

;--- Patch at file offset $014DE4 (SNES $C14DE4) ---
org $C14DE4

    JSR $4CA5               ; [20 A5 4C   ] Jump to Subroutine
    AND #$20                ; [29 20      ] AND A with Immediate
    BEQ $4E2D               ; [F0 42      ] Branch if Equal
    JSR $4CA5               ; [20 A5 4C   ] Jump to Subroutine

;--- Patch at file offset $015160 (SNES $C15160) ---
org $C15160

    JSR $4CA5               ; [20 A5 4C   ] Jump to Subroutine

;--- End of patch ---