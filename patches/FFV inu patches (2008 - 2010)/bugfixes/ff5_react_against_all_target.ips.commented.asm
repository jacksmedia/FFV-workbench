;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_react_against_all_target.ips.commented.asm
;    Disassembled from IPS patch: ff5_react_against_all_target.ips
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

    ORA $E8                 ; [05 E8      ] OR A with Direct Page
    INX                     ; [E8         ] Increment X
    INX                     ; [E8         ] Increment X
    INX                     ; [E8         ] Increment X
    INX                     ; [E8         ] Increment X
    TAY                     ; [A8         ] Transfer A to Y
    LDA $7ACC,Y             ; [B9 CC 7A   ] Load A from Absolute,Y
    STA $0E                 ; [85 0E      ] Store A to DP

;--- Patch at file offset $029557 (SNES $C29557) ---
org $C29557

    LDA $0E                 ; [A5 0E      ] Load A from DP
    AND #$80                ; [29 80      ] AND A with Immediate
    ORA #$01                ; [09 01      ] OR A with Immediate

;--- End of patch ---