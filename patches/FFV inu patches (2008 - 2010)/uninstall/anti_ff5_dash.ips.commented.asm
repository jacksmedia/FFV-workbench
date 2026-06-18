;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_dash.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_dash.ips
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

;--- Patch at file offset $001247 (SNES $C01247) ---
org $C01247

    BEQ $124F               ; [F0 06      ] Branch if Equal
    BPL $1278               ; [10 2D      ] Branch if Plus
    LSR $C0                 ; [46 C0      ] Shift Right DP
    BRA $127A               ; [80 2B      ] Branch Always
    LDA $03                 ; [A5 03      ] Load A from DP
    AND #$80                ; [29 80      ] AND A with Immediate
    BEQ $127A               ; [F0 25      ] Branch if Equal
    LDX $06                 ; [A6 06      ] Load X from DP
    LDA $0500,X             ; [BD 00 05   ] Load A from Absolute,X
    AND #$40                ; [29 40      ] AND A with Immediate
    BNE $1265               ; [D0 07      ] Branch if Not Equal
    LDA $0520,X             ; [BD 20 05   ] Load A from Absolute,X
    AND #$08                ; [29 08      ] AND A with Immediate
    BNE $1278               ; [D0 13      ] Branch if Not Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    TXA                     ; [8A         ] Transfer X to A
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$50                ; [69 50      ] Add with Carry Immediate
    BRK                     ; [00 AA      ] Software interrupt
    LDA $06                 ; [A5 06      ] Load A from DP
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    CPX #$40                ; [E0 40      ] Compare X Immediate
    ORA ($D0,X)             ; [01 D0      ] OR A with (DP,X)
    SBC ($80,X)             ; [E1 80      ] Subtract with Borrow (DP,X)
    db $02                      ; Incomplete/data bytes

;--- End of patch ---