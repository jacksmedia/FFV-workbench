;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_zombie_freeze.ips.commented.asm
;    Disassembled from IPS patch: ff5_zombie_freeze.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 3 record(s)

;--- Patch at file offset $021E34 (SNES $C21E34) ---
org $C21E34

    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    AND #$01                ; [29 01      ] AND A with Immediate
    BEQ $1E3F               ; [F0 04      ] Branch if Equal
    LDA #$26                ; [A9 26      ] Load A Immediate
    BRA $1E4C               ; [80 0D      ] Branch Always
    LDA $201E,X             ; [BD 1E 20   ] Load A from Absolute,X
    AND #$10                ; [29 10      ] AND A with Immediate
    BEQ $1E4A               ; [F0 04      ] Branch if Equal
    LDA #$50                ; [A9 50      ] Load A Immediate
    BRA $1E4C               ; [80 02      ] Branch Always
    LDA #$05                ; [A9 05      ] Load A Immediate
    JMP $1E7C               ; [4C 7C 1E   ] Jump Absolute

;--- Patch at file offset $026337 (SNES $C26337) ---
org $C26337

    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    BPL $6341               ; [10 05      ] Branch if Plus
    LDA $7C4C               ; [AD 4C 7C   ] Load A from Absolute
    BEQ $639B               ; [F0 5A      ] Branch if Equal
    LDA $04F0               ; [AD F0 04   ] Load A from Absolute
    CMP #$F7                ; [C9 F7      ] Compare A Immediate
    BNE $634F               ; [D0 07      ] Branch if Not Equal
    LDA $04F1               ; [AD F1 04   ] Load A from Absolute
    CMP #$01                ; [C9 01      ] Compare A Immediate
    BEQ $635A               ; [F0 0B      ] Branch if Equal
    LDA $2006,X             ; [BD 06 20   ] Load A from Absolute,X
    ORA $2007,X             ; [1D 07 20   ] OR A with Absolute,X
    BNE $635A               ; [D0 03      ] Branch if Not Equal
    JMP $63D1               ; [4C D1 63   ] Jump Absolute
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $2008,X             ; [BD 08 20   ] Load A from Absolute,X
    JSR $01BF               ; [20 BF 01   ] Jump to Subroutine
    CMP $2006,X             ; [DD 06 20   ] Compare A with Absolute,X
    BCC $6374               ; [90 0D      ] Branch if Carry Clear
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    ORA #$02                ; [09 02      ] OR A with Immediate
    STA $201D,X             ; [9D 1D 20   ] Store A to Absolute,X
    BRA $638D               ; [80 19      ] Branch Always
    LDA $2006,X             ; [BD 06 20   ] Load A from Absolute,X
    CMP $2008,X             ; [DD 08 20   ] Compare A with Absolute,X
    BCC $6382               ; [90 06      ] Branch if Carry Clear
    LDA $2008,X             ; [BD 08 20   ] Load A from Absolute,X
    STA $2006,X             ; [9D 06 20   ] Store A to Absolute,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    AND #$FD                ; [29 FD      ] AND A with Immediate
    STA $201D,X             ; [9D 1D 20   ] Store A to Absolute,X
    LDA $201A,X             ; [BD 1A 20   ] Load A from Absolute,X
    BMI $63CA               ; [30 38      ] Branch if Minus
    LDA $201A,X             ; [BD 1A 20   ] Load A from Absolute,X
    AND #$40                ; [29 40      ] AND A with Immediate
    BNE $63A2               ; [D0 09      ] Branch if Not Equal
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $0263AC (SNES $C263AC) ---
org $C263AC

    db $76                      ; Incomplete/data bytes

;--- End of patch ---