;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_player_name.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_player_name.ips
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

    BEQ $BE3F               ; [F0 07      ] Branch if Equal
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    STA $0990,X             ; [9D 90 09   ] Store A to Absolute,X
    BRA $BE4A               ; [80 0B      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 F0      ] Software interrupt
    ASL $CA                 ; [06 CA      ] Shift Left DP
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    STA $0990,X             ; [9D 90 09   ] Store A to Absolute,X
    STX $2B92               ; [8E 92 2B   ] Store X to Absolute
    JSR $C551               ; [20 51 C5   ] Jump to Subroutine
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDX #$C4                ; [A2 C4      ] Load X Immediate
    EOR ($A0),Y             ; [51 A0      ] XOR A with (DP),Y
    BCC $BE61               ; [90 09      ] Branch if Carry Clear
    LDA #$06                ; [A9 06      ] Load A Immediate
    BRK                     ; [00 20      ] Software interrupt
    STA $20E5,X             ; [9D E5 20   ] Store A to Absolute,X
    TYA                     ; [98         ] Transfer Y to A
    LDX $4C                 ; [A6 4C      ] Load X from DP
    BEQ $BE08               ; [F0 A4      ] Branch if Equal

;--- Patch at file offset $02C472 (SNES $C2C472) ---
org $C2C472

    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    STZ $2B92               ; [9C 92 2B   ] Store Zero to Absolute
    JSR $C551               ; [20 51 C5   ] Jump to Subroutine
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    SBC $09908D,X           ; [FF 8D 90 09] Subtract with Borrow Absolute Long,X
    STA $0992               ; [8D 92 09   ] Store A to Absolute
    STA $0994               ; [8D 94 09   ] Store A to Absolute

;--- End of patch ---