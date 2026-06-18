;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_mimic_weapon.ips.commented.asm
;    Disassembled from IPS patch: ff5_mimic_weapon.ips
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

;--- Patch at file offset $020642 (SNES $C20642) ---
org $C20642

    db $14                      ; Incomplete/data bytes

;--- Patch at file offset $020657 (SNES $C20657) ---
org $C20657

    BPL $064C               ; [10 F3      ] Branch if Plus
    LDA $7C63               ; [AD 63 7C   ] Load A from Absolute
    TAY                     ; [A8         ] Transfer A to Y
    LDA $7C62               ; [AD 62 7C   ] Load A from Absolute

;--- Patch at file offset $020666 (SNES $C20666) ---
org $C20666

    LDA #$80                ; [A9 80      ] Load A Immediate
    STA $41D8               ; [8D D8 41   ] Store A to Absolute

;--- Patch at file offset $020670 (SNES $C20670) ---
org $C20670

    STA $7C63               ; [8D 63 7C   ] Store A to Absolute

;--- End of patch ---