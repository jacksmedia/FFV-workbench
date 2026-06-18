;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_item_menu.ips.commented.asm
;    Disassembled from IPS patch: ff5_item_menu.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 2 record(s)

;--- Patch at file offset $02DED0 (SNES $C2DED0) ---
org $C2DED0

    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    CMP #$48                ; [C9 48      ] Compare A Immediate
    BPL $DF3E               ; [10 68      ] Branch if Plus
    CMP #$12                ; [C9 12      ] Compare A Immediate
    BMI $DF3E               ; [30 64      ] Branch if Minus
    LDX $8E                 ; [A6 8E      ] Load X from DP
    LDA $C0EEF4,X           ; [BF F4 EE C0] Load A from Absolute Long,X
    CMP #$FF                ; [C9 FF      ] Compare A Immediate
    BEQ $DF3E               ; [F0 5A      ] Branch if Equal
    CMP $29E4               ; [CD E4 29   ] Compare A with Absolute
    BEQ $DEEE               ; [F0 05      ] Branch if Equal
    INX                     ; [E8         ] Increment X
    INX                     ; [E8         ] Increment X
    INX                     ; [E8         ] Increment X
    BRA $DEDC               ; [80 EE      ] Branch Always
    LDA $C0EEF5,X           ; [BF F5 EE C0] Load A from Absolute Long,X
    AND #$0F                ; [29 0F      ] AND A with Immediate
    TAY                     ; [A8         ] Transfer A to Y
    LDA $C0EEF6,X           ; [BF F6 EE C0] Load A from Absolute Long,X
    CMP $29D8,Y             ; [D9 D8 29   ] Compare A with Absolute,Y
    BEQ $DF00               ; [F0 02      ] Branch if Equal
    BPL $DF3E               ; [10 3E      ] Branch if Plus
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDX $29E4               ; [AE E4 29   ] Load X from Absolute
    LDA $2A9D,X             ; [BD 9D 2A   ] Load A from Absolute,X
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 CD      ] Software interrupt
    CMP $20E229,X           ; [DF 29 E2 20] Compare A with Absolute Long,X
    BEQ $DF14               ; [F0 02      ] Branch if Equal
    BPL $DF3E               ; [10 2A      ] Branch if Plus
    LDA $29E1               ; [AD E1 29   ] Load A from Absolute
    BIT #$C2                ; [89 C2      ] Test Bits Immediate
    BNE $DF3E               ; [D0 23      ] Branch if Not Equal
    BIT #$20                ; [89 20      ] Test Bits Immediate
    BEQ $DF24               ; [F0 05      ] Branch if Equal
    CPX #$29                ; [E0 29      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    INC                     ; [1A         ] Increment Accumulator
    CPX #$3E                ; [E0 3E      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    ASL $A5                 ; [06 A5      ] Shift Left DP
    MVP $29,$02             ; [44 29 02   ] Block Move Positive
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $02E3F9 (SNES $C2E3F9) ---
org $C2E3F9

    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $54                 ; [A5 54      ] Load A from DP
    CMP #$16                ; [C9 16      ] Compare A Immediate
    BEQ $E42A               ; [F0 29      ] Branch if Equal
    LDA $91                 ; [A5 91      ] Load A from DP
    CMP #$E0                ; [C9 E0      ] Compare A Immediate
    BMI $E421               ; [30 1A      ] Branch if Minus
    AND #$FE                ; [29 FE      ] AND A with Immediate
    CMP #$F0                ; [C9 F0      ] Compare A Immediate
    BNE $E411               ; [D0 04      ] Branch if Not Equal
    LDA $44                 ; [A5 44      ] Load A from DP
    BPL $E421               ; [10 10      ] Branch if Plus

;--- End of patch ---