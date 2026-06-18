;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_song.ips.commented.asm
;    Disassembled from IPS patch: ff5_song.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 4 record(s)

;--- Patch at file offset $0237CC (SNES $C237CC) ---
org $C237CC

    BIT #$04                ; [89 04      ] Test Bits Immediate
    BEQ $37E1               ; [F0 11      ] Branch if Equal
    AND #$FB                ; [29 FB      ] AND A with Immediate
    STA $201D,X             ; [9D 1D 20   ] Store A to Absolute,X
    JMP $3872               ; [4C 72 38   ] Jump Absolute

;--- Patch at file offset $026CFD (SNES $C26CFD) ---
org $C26CFD

    LDA #$40                ; [A9 40      ] Load A Immediate
    TSB $7BE6               ; [0C E6 7B   ] Test and Set Bits Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    STA $0E                 ; [85 0E      ] Store A to DP
    JSR $01EC               ; [20 EC 01   ] Jump to Subroutine
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    BIT #$04                ; [89 04      ] Test Bits Immediate
    BEQ $6D22               ; [F0 13      ] Branch if Equal
    AND #$FB                ; [29 FB      ] AND A with Immediate
    STA $201D,X             ; [9D 1D 20   ] Store A to Absolute,X
    LDA $0E                 ; [A5 0E      ] Load A from DP
    JSR $0207               ; [20 07 02   ] Jump to Subroutine
    TDC                     ; [7B         ] Transfer Direct Page to A
    STA $3CF9,Y             ; [99 F9 3C   ] Store A to Absolute,Y
    LDA $0E                 ; [A5 0E      ] Load A from DP
    JSR $2482               ; [20 82 24   ] Jump to Subroutine

;--- Patch at file offset $026D29 (SNES $C26D29) ---
org $C26D29

    STP                     ; [DB         ] Stop Processor

;--- Patch at file offset $027457 (SNES $C27457) ---
org $C27457

    db $47                      ; Incomplete/data bytes

;--- End of patch ---