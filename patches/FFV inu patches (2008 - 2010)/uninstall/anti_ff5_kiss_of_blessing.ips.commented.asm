;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_kiss_of_blessing.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_kiss_of_blessing.ips
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

;--- Patch at file offset $02903B (SNES $C2903B) ---
org $C2903B

    LDA $59                 ; [A5 59      ] Load A from DP
    AND #$10                ; [29 10      ] AND A with Immediate
    BNE $905A               ; [D0 19      ] Branch if Not Equal
    LDA $59                 ; [A5 59      ] Load A from DP
    AND #$08                ; [29 08      ] AND A with Immediate
    BEQ $909F               ; [F0 58      ] Branch if Equal
    LDA $201B,X             ; [BD 1B 20   ] Load A from Absolute,X
    ORA $2071,X             ; [1D 71 20   ] OR A with Absolute,X
    AND #$18                ; [29 18      ] AND A with Immediate
    BNE $90C9               ; [D0 78      ] Branch if Not Equal
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    AND #$20                ; [29 20      ] AND A with Immediate
    BNE $90C9               ; [D0 71      ] Branch if Not Equal
    BRA $906B               ; [80 11      ] Branch Always

;--- End of patch ---