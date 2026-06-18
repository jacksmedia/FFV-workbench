;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_twinlance.ips.commented.asm
;    Disassembled from IPS patch: ff5_twinlance.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 4 record(s)

;--- Patch at file offset $021535 (SNES $C21535) ---
org $C21535

    LDA $79FA               ; [AD FA 79   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    ASL                     ; [0A         ] Shift Left Accumulator
    TAY                     ; [A8         ] Transfer A to Y
    LDA $2720               ; [AD 20 27   ] Load A from Absolute
    STA $7ADC,Y             ; [99 DC 7A   ] Store A to Absolute,Y
    LDA $2721               ; [AD 21 27   ] Load A from Absolute
    STA $7ADD,Y             ; [99 DD 7A   ] Store A to Absolute,Y
    LDY $0E                 ; [A4 0E      ] Load Y from DP
    LDA $408D,Y             ; [B9 8D 40   ] Load A from Absolute,Y
    STA $7B2D,X             ; [9D 2D 7B   ] Store A to Absolute,X
    STZ $7B1C,X             ; [9E 1C 7B   ] Store Zero to Absolute,X
    STZ $7ACC,X             ; [9E CC 7A   ] Store Zero to Absolute,X
    INC $79FA               ; [EE FA 79   ] Increment Absolute
    JSR $98E3               ; [20 E3 98   ] Jump to Subroutine
    JSR $9923               ; [20 23 99   ] Jump to Subroutine
    STY $14                 ; [84 14      ] Store Y to DP
    STZ $12                 ; [64 12      ] Store Zero to DP
    LDX $0E                 ; [A6 0E      ] Load X from DP
    LDA $408A,X             ; [BD 8A 40   ] Load A from Absolute,X
    AND #$02                ; [29 02      ] AND A with Immediate
    BEQ $1572               ; [F0 07      ] Branch if Equal
    LDA $4090,X             ; [BD 90 40   ] Load A from Absolute,X
    CMP #$55                ; [C9 55      ] Compare A Immediate
    BEQ $1577               ; [F0 05      ] Branch if Equal
    INC $7C9B               ; [EE 9B 7C   ] Increment Absolute
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $021589 (SNES $C21589) ---
org $C21589

    db $0C                      ; Incomplete/data bytes

;--- Patch at file offset $024926 (SNES $C24926) ---
org $C24926

    AND #$0F                ; [29 0F      ] AND A with Immediate
    TAX                     ; [AA         ] Transfer A to X
    LDA $7C9B               ; [AD 9B 7C   ] Load A from Absolute
    BPL $4931               ; [10 03      ] Branch if Plus
    JSR $494A               ; [20 4A 49   ] Jump to Subroutine
    LDA $7C9B               ; [AD 9B 7C   ] Load A from Absolute
    AND #$40                ; [29 40      ] AND A with Immediate
    BEQ $493B               ; [F0 03      ] Branch if Equal
    JSR $494A               ; [20 4A 49   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02494A (SNES $C2494A) ---
org $C2494A

    LDA $D0EE85,X           ; [BF 85 EE D0] Load A from Absolute Long,X
    INX                     ; [E8         ] Increment X
    TAY                     ; [A8         ] Transfer A to Y
    LDA $3BCF,Y             ; [B9 CF 3B   ] Load A from Absolute,Y
    ORA $3BD6,Y             ; [19 D6 3B   ] OR A with Absolute,Y
    BEQ $495B               ; [F0 03      ] Branch if Equal
    STA $3BCF,Y             ; [99 CF 3B   ] Store A to Absolute,Y
    LDA $3BDA,Y             ; [B9 DA 3B   ] Load A from Absolute,Y
    STA $3BD3,Y             ; [99 D3 3B   ] Store A to Absolute,Y
    INY                     ; [C8         ] Increment Y
    db $C0                      ; Incomplete/data bytes

;--- End of patch ---