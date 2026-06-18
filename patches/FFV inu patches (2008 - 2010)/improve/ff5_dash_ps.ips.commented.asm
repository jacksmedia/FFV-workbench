;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_dash_ps.ips.commented.asm
;    Disassembled from IPS patch: ff5_dash_ps.ips
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

;--- Patch at file offset $001251 (SNES $C01251) ---
org $C01251

    BPL $127A               ; [10 27      ] Branch if Plus
    ASL $C0                 ; [06 C0      ] Shift Left DP
    CPX #$02                ; [E0 02      ] Compare X Immediate
    BRK                     ; [00 B0      ] Software interrupt
    JSR $06A4               ; [20 A4 06   ] Jump to Subroutine
    LDA $0500,Y             ; [B9 00 05   ] Load A from Absolute,Y
    AND #$40                ; [29 40      ] AND A with Immediate
    BNE $126A               ; [D0 07      ] Branch if Not Equal
    LDA $0520,Y             ; [B9 20 05   ] Load A from Absolute,Y
    AND #$08                ; [29 08      ] AND A with Immediate
    BNE $1278               ; [D0 0E      ] Branch if Not Equal
    JSR $C19D               ; [20 9D C1   ] Jump to Subroutine
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    ORA ($D0,X)             ; [01 D0      ] OR A with (DP,X)
    NOP                     ; [EA         ] No Operation
    BRA $127A               ; [80 06      ] Branch Always
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- End of patch ---