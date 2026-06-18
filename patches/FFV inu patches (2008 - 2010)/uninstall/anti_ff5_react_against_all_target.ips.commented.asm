;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_react_against_all_target.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_react_against_all_target.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 2 record(s)

;--- Patch at file offset $029520 (SNES $C29520) ---
org $C29520

    PHD                     ; [0B         ] Push Direct Page Register
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    TXA                     ; [8A         ] Transfer X to A
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$05                ; [69 05      ] Add with Carry Immediate
    BRK                     ; [00 AA      ] Software interrupt
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits

;--- Patch at file offset $029557 (SNES $C29557) ---
org $C29557

    LDA $2058,X             ; [BD 58 20   ] Load A from Absolute,X
    ORA $2059,X             ; [1D 59 20   ] OR A with Absolute,X

;--- End of patch ---