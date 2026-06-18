;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_song.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_song.ips
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

    AND #$04                ; [29 04      ] AND A with Immediate
    BEQ $37E1               ; [F0 11      ] Branch if Equal
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    AND #$FB                ; [29 FB      ] AND A with Immediate
    STA $201D,X             ; [9D 1D 20   ] Store A to Absolute,X

;--- Patch at file offset $026CFD (SNES $C26CFD) ---
org $C26CFD

    LDA $7BE6               ; [AD E6 7B   ] Load A from Absolute
    ORA #$40                ; [09 40      ] OR A with Immediate
    STA $7BE6               ; [8D E6 7B   ] Store A to Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    TAY                     ; [A8         ] Transfer A to Y
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    AND #$FB                ; [29 FB      ] AND A with Immediate
    STA $201D,X             ; [9D 1D 20   ] Store A to Absolute,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    STA $3CF9,Y             ; [99 F9 3C   ] Store A to Absolute,Y
    STA $3D7D,Y             ; [99 7D 3D   ] Store A to Absolute,Y
    STA $3E01,Y             ; [99 01 3E   ] Store A to Absolute,Y
    JSR $01E0               ; [20 E0 01   ] Jump to Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    TYA                     ; [98         ] Transfer Y to A
    ADC #$0B                ; [69 0B      ] Add with Carry Immediate
    TAY                     ; [A8         ] Transfer A to Y

;--- Patch at file offset $026D29 (SNES $C26D29) ---
org $C26D29

    db $DE                      ; Incomplete/data bytes

;--- Patch at file offset $027457 (SNES $C27457) ---
org $C27457

    PHA                     ; [48         ] Push Accumulator

;--- End of patch ---