;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_dash_gba.ips.commented.asm
;    Disassembled from IPS patch: ff5_dash_gba.ips
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

    BPL $126F               ; [10 1C      ] Branch if Plus
    LDY $06                 ; [A4 06      ] Load Y from DP
    LDA $0500,Y             ; [B9 00 05   ] Load A from Absolute,Y
    AND #$40                ; [29 40      ] AND A with Immediate
    BNE $1263               ; [D0 07      ] Branch if Not Equal
    LDA $0520,Y             ; [B9 20 05   ] Load A from Absolute,Y
    AND #$08                ; [29 08      ] AND A with Immediate
    BNE $126D               ; [D0 0A      ] Branch if Not Equal
    JSR $C19D               ; [20 9D C1   ] Jump to Subroutine
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    ORA ($D0,X)             ; [01 D0      ] OR A with (DP,X)
    NOP                     ; [EA         ] No Operation
    BRA $126F               ; [80 02      ] Branch Always
    ASL $C0                 ; [06 C0      ] Shift Left DP
    CPX #$02                ; [E0 02      ] Compare X Immediate
    BRK                     ; [00 B0      ] Software interrupt
    ASL $A5                 ; [06 A5      ] Shift Left DP
    EOR [$D0],Y             ; [57 D0      ] XOR A with [DP],Y
    db $02                      ; Incomplete/data bytes

;--- End of patch ---