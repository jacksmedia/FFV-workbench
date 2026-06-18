;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_player_name.ips.commented.asm
;    Disassembled from IPS patch: ff5_player_name.ips
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

;--- Patch at file offset $02BE36 (SNES $C2BE36) ---
org $C2BE36

    BNE $BE3E               ; [D0 06      ] Branch if Not Equal
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 F0      ] Software interrupt
    ASL $CA                 ; [06 CA      ] Shift Left DP
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    STA $0990,X             ; [9D 90 09   ] Store A to Absolute,X
    STX $2B92               ; [8E 92 2B   ] Store X to Absolute
    JMP $BE17               ; [4C 17 BE   ] Jump Absolute
    LDA $D15500,X           ; [BF 00 55 D1] Load A from Absolute Long,X
    STA $0990,X             ; [9D 90 09   ] Store A to Absolute,X
    CMP #$FF                ; [C9 FF      ] Compare A Immediate
    BEQ $BE5C               ; [F0 08      ] Branch if Equal
    CPX #$05                ; [E0 05      ] Compare X Immediate
    BRK                     ; [00 10      ] Software interrupt
    ORA $EE,S               ; [03 EE      ] OR A with Stack Relative
    STA ($2B)               ; [92 2B      ] Store A to (DP)
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02C472 (SNES $C2C472) ---
org $C2C472

    LDX #$00                ; [A2 00      ] Load X Immediate
    BRK                     ; [00 8E      ] Software interrupt
    STA ($2B)               ; [92 2B      ] Store A to (DP)
    JSR $BE49               ; [20 49 BE   ] Jump to Subroutine
    INX                     ; [E8         ] Increment X
    CPX #$06                ; [E0 06      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    SBC [$20],Y             ; [F7 20      ] Subtract with Borrow [DP],Y
    EOR ($C5),Y             ; [51 C5      ] XOR A with (DP),Y
    REP #$20                ; [C2 20      ] Reset Processor Status Bits

;--- End of patch ---