;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_hide_escape.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_hide_escape.ips
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

    LDA $3EC2,Y             ; [B9 C2 3E   ] Load A from Absolute,Y
    BEQ $5AE1               ; [F0 0A      ] Branch if Equal
    LDA $201A,X             ; [BD 1A 20   ] Load A from Absolute,X
    ORA $2070,X             ; [1D 70 20   ] OR A with Absolute,X
    AND #$02                ; [29 02      ] AND A with Immediate
    BEQ $5AF0               ; [F0 0F      ] Branch if Equal
    JSR $01E0               ; [20 E0 01   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    CPY #$04                ; [C0 04      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    INX                     ; [E8         ] Increment X
    LDA #$40                ; [A9 40      ] Load A Immediate
    STA $7BDE               ; [8D DE 7B   ] Store A to Absolute
    RTS                     ; [60         ] Return from Subroutine
    LDA $3EC2,Y             ; [B9 C2 3E   ] Load A from Absolute,Y
    BEQ $5AFC               ; [F0 07      ] Branch if Equal
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    AND #$01                ; [29 01      ] AND A with Immediate
    BEQ $5B0A               ; [F0 0E      ] Branch if Equal
    JSR $01E0               ; [20 E0 01   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    CPY #$04                ; [C0 04      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)

;--- End of patch ---