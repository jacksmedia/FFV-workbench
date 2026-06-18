;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_kiss_of_blessing.ips.commented.asm
;    Disassembled from IPS patch: ff5_kiss_of_blessing.ips
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

    LDA $2066,X             ; [BD 66 20   ] Load A from Absolute,X
    AND #$40                ; [29 40      ] AND A with Immediate
    BEQ $9048               ; [F0 06      ] Branch if Equal
    LDA $59                 ; [A5 59      ] Load A from DP
    AND #$83                ; [29 83      ] AND A with Immediate
    STA $59                 ; [85 59      ] Store A to DP
    LDA $59                 ; [A5 59      ] Load A from DP
    AND #$10                ; [29 10      ] AND A with Immediate
    BNE $905A               ; [D0 0C      ] Branch if Not Equal
    LDA $59                 ; [A5 59      ] Load A from DP
    AND #$08                ; [29 08      ] AND A with Immediate
    BNE $905A               ; [D0 06      ] Branch if Not Equal
    BRA $909F               ; [80 49      ] Branch Always
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- End of patch ---