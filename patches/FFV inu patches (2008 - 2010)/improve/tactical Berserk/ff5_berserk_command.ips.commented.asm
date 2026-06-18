;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_berserk_command.ips.commented.asm
;    Disassembled from IPS patch: ff5_berserk_command.ips
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

;--- Patch at file offset $021FA6 (SNES $C21FA6) ---
org $C21FA6

    LSR                     ; [4A         ] Shift Right Accumulator
    PHX                     ; [DA         ] Push X Register
    TXY                     ; [9B         ] Transfer X to Y
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    JSL $C6FEFC             ; [22 FC FE C6] Jump to Subroutine Long
    PLX                     ; [FA         ] Pull X Register

;--- Patch at file offset $06FEFC (SNES $C6FEFC) ---
org $C6FEFC

    BCS $FF1D               ; [B0 1F      ] Branch if Carry Set
    LDA $C6FF20,X           ; [BF 20 FF C6] Load A from Absolute Long,X
    CMP #$05                ; [C9 05      ] Compare A Immediate
    BEQ $FF1F               ; [F0 19      ] Branch if Equal
    CMP $2016,Y             ; [D9 16 20   ] Compare A with Absolute,Y
    BEQ $FF1F               ; [F0 14      ] Branch if Equal
    CMP $2017,Y             ; [D9 17 20   ] Compare A with Absolute,Y
    BEQ $FF1F               ; [F0 0F      ] Branch if Equal
    CMP $2018,Y             ; [D9 18 20   ] Compare A with Absolute,Y
    BEQ $FF1F               ; [F0 0A      ] Branch if Equal
    CMP $2019,Y             ; [D9 19 20   ] Compare A with Absolute,Y
    BEQ $FF1F               ; [F0 05      ] Branch if Equal
    INX                     ; [E8         ] Increment X
    BRA $FEFE               ; [80 E1      ] Branch Always
    LDA #$26                ; [A9 26      ] Load A Immediate
    RTL                     ; [6B         ] Return from Subroutine Long
    ORA [$2A],Y             ; [17 2A      ] OR A with [DP],Y
    ORA $0C16               ; [0D 16 0C   ] OR A with Absolute
    ORA ($05)               ; [12 05      ] OR A with (DP)

;--- End of patch ---