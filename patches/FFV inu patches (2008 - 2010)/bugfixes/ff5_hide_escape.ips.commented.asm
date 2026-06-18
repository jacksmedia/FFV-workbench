;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_hide_escape.ips.commented.asm
;    Disassembled from IPS patch: ff5_hide_escape.ips
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

;--- Patch at file offset $025AD2 (SNES $C25AD2) ---
org $C25AD2

    STZ $0E                 ; [64 0E      ] Store Zero to DP
    STZ $0F                 ; [64 0F      ] Store Zero to DP
    LDA $3EC2,Y             ; [B9 C2 3E   ] Load A from Absolute,Y
    BEQ $5AF0               ; [F0 15      ] Branch if Equal
    LDA $201A,X             ; [BD 1A 20   ] Load A from Absolute,X
    ORA $2070,X             ; [1D 70 20   ] OR A with Absolute,X
    AND #$02                ; [29 02      ] AND A with Immediate
    BNE $5AF0               ; [D0 0B      ] Branch if Not Equal
    INC $0E                 ; [E6 0E      ] Increment DP
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    AND #$01                ; [29 01      ] AND A with Immediate
    BNE $5AF0               ; [D0 02      ] Branch if Not Equal
    INC $0F                 ; [E6 0F      ] Increment DP
    JSR $01E0               ; [20 E0 01   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    CPY #$04                ; [C0 04      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    CMP $0EA5,X             ; [DD A5 0E   ] Compare A with Absolute,X
    BNE $5B01               ; [D0 04      ] Branch if Not Equal
    LDA #$40                ; [A9 40      ] Load A Immediate
    BRA $5ACE               ; [80 CD      ] Branch Always
    LDA $0F                 ; [A5 0F      ] Load A from DP
    BNE $5B0A               ; [D0 05      ] Branch if Not Equal

;--- End of patch ---