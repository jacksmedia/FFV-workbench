;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_old_timer.ips.commented.asm
;    Disassembled from IPS patch: ff5_old_timer.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 6 record(s)

;--- Patch at file offset $02932B (SNES $C2932B) ---
org $C2932B

    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $02932F (SNES $C2932F) ---
org $C2932F

    ORA #$20                ; [09 20      ] OR A with Immediate
    PLY                     ; [7A         ] Pull Y Register
    db $93                      ; Incomplete/data bytes

;--- Patch at file offset $029336 (SNES $C29336) ---
org $C29336

    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $02933A (SNES $C2933A) ---
org $C2933A

    TSB $20                 ; [04 20      ] Test and Set Bits in DP
    PLY                     ; [7A         ] Pull Y Register
    db $93                      ; Incomplete/data bytes

;--- Patch at file offset $029341 (SNES $C29341) ---
org $C29341

    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $029345 (SNES $C29345) ---
org $C29345

    db $06                      ; Incomplete/data bytes

;--- End of patch ---