;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_zombie_freeze.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_zombie_freeze.ips
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

    LDA #$05                ; [A9 05      ] Load A Immediate
    STA $2057,X             ; [9D 57 20   ] Store A to Absolute,X
    STZ $2058,X             ; [9E 58 20   ] Store Zero to Absolute,X
    STZ $205A,X             ; [9E 5A 20   ] Store Zero to Absolute,X
    STZ $205B,X             ; [9E 5B 20   ] Store Zero to Absolute,X
    STZ $205C,X             ; [9E 5C 20   ] Store Zero to Absolute,X
    STZ $205D,X             ; [9E 5D 20   ] Store Zero to Absolute,X
    STZ $205E,X             ; [9E 5E 20   ] Store Zero to Absolute,X
    STZ $205F,X             ; [9E 5F 20   ] Store Zero to Absolute,X
    PHX                     ; [DA         ] Push X Register

;--- Patch at file offset $026337 (SNES $C26337) ---
org $C26337

    LDA $04F0               ; [AD F0 04   ] Load A from Absolute
    CMP #$F7                ; [C9 F7      ] Compare A Immediate
    BNE $6345               ; [D0 07      ] Branch if Not Equal
    LDA $04F1               ; [AD F1 04   ] Load A from Absolute
    CMP #$01                ; [C9 01      ] Compare A Immediate
    BEQ $6350               ; [F0 0B      ] Branch if Equal
    LDA $2006,X             ; [BD 06 20   ] Load A from Absolute,X
    ORA $2007,X             ; [1D 07 20   ] OR A with Absolute,X
    BNE $6350               ; [D0 03      ] Branch if Not Equal
    JMP $63D1               ; [4C D1 63   ] Jump Absolute
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $2008,X             ; [BD 08 20   ] Load A from Absolute,X
    JSR $01BF               ; [20 BF 01   ] Jump to Subroutine
    CMP $2006,X             ; [DD 06 20   ] Compare A with Absolute,X
    BCC $636A               ; [90 0D      ] Branch if Carry Clear
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    ORA #$02                ; [09 02      ] OR A with Immediate
    STA $201D,X             ; [9D 1D 20   ] Store A to Absolute,X
    BRA $6383               ; [80 19      ] Branch Always
    LDA $2006,X             ; [BD 06 20   ] Load A from Absolute,X
    CMP $2008,X             ; [DD 08 20   ] Compare A with Absolute,X
    BCC $6378               ; [90 06      ] Branch if Carry Clear
    LDA $2008,X             ; [BD 08 20   ] Load A from Absolute,X
    STA $2006,X             ; [9D 06 20   ] Store A to Absolute,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    AND #$FD                ; [29 FD      ] AND A with Immediate
    STA $201D,X             ; [9D 1D 20   ] Store A to Absolute,X
    LDA $201A,X             ; [BD 1A 20   ] Load A from Absolute,X
    AND #$80                ; [29 80      ] AND A with Immediate
    BNE $63CA               ; [D0 40      ] Branch if Not Equal
    LDA $201A,X             ; [BD 1A 20   ] Load A from Absolute,X
    AND #$40                ; [29 40      ] AND A with Immediate
    BNE $63A2               ; [D0 11      ] Branch if Not Equal
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    BPL $63F8               ; [10 62      ] Branch if Plus
    LDA $7C4C               ; [AD 4C 7C   ] Load A from Absolute
    db $D0                      ; Incomplete/data bytes

;--- Patch at file offset $0263AC (SNES $C263AC) ---
org $C263AC

    db $74                      ; Incomplete/data bytes

;--- End of patch ---