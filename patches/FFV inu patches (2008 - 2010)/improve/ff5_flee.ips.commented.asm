;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_flee.ips.commented.asm
;    Disassembled from IPS patch: ff5_flee.ips
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

;--- Patch at file offset $021D6F (SNES $C21D6F) ---
org $C21D6F

    TAX                     ; [AA         ] Transfer A to X
    LDA $D0EEDB,X           ; [BF DB EE D0] Load A from Absolute Long,X
    TAY                     ; [A8         ] Transfer A to Y
    LDA #$04                ; [A9 04      ] Load A Immediate
    STA $0E                 ; [85 0E      ] Store A to DP
    LDA $375C,Y             ; [B9 5C 37   ] Load A from Absolute,Y
    STA $12                 ; [85 12      ] Store A to DP
    BEQ $1DAB               ; [F0 2B      ] Branch if Equal
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    LDA $D15CE0,X           ; [BF E0 5C D1] Load A from Absolute Long,X
    AND $10                 ; [25 10      ] AND A with Direct Page
    BNE $1DAB               ; [D0 21      ] Branch if Not Equal
    LDA $D15CE1,X           ; [BF E1 5C D1] Load A from Absolute Long,X
    AND $11                 ; [25 11      ] AND A with Direct Page
    BNE $1DAB               ; [D0 19      ] Branch if Not Equal
    LDA $12                 ; [A5 12      ] Load A from DP
    CMP #$26                ; [C9 26      ] Compare A Immediate
    BEQ $1DB2               ; [F0 1A      ] Branch if Equal
    BIT $3EF0               ; [2C F0 3E   ] Test Bits Absolute
    BPL $1DA5               ; [10 08      ] Branch if Plus
    CMP #$0A                ; [C9 0A      ] Compare A Immediate
    BEQ $1DAB               ; [F0 0A      ] Branch if Equal
    CMP #$0F                ; [C9 0F      ] Compare A Immediate
    BEQ $1DAB               ; [F0 06      ] Branch if Equal
    LDA $23                 ; [A5 23      ] Load A from DP
    AND #$01                ; [29 01      ] AND A with Immediate
    BEQ $1DB2               ; [F0 07      ] Branch if Equal
    LDA $376C,Y             ; [B9 6C 37   ] Load A from Absolute,Y
    ORA #$80                ; [09 80      ] OR A with Immediate
    BRA $1DB7               ; [80 05      ] Branch Always
    LDA $376C,Y             ; [B9 6C 37   ] Load A from Absolute,Y
    AND #$7F                ; [29 7F      ] AND A with Immediate
    STA $376C,Y             ; [99 6C 37   ] Store A to Absolute,Y
    INY                     ; [C8         ] Increment Y
    DEC $0E                 ; [C6 0E      ] Decrement DP
    BNE $1D79               ; [D0 BA      ] Branch if Not Equal
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- End of patch ---