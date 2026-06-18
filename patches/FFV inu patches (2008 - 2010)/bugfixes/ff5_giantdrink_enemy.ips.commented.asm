;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_giantdrink_enemy.ips.commented.asm
;    Disassembled from IPS patch: ff5_giantdrink_enemy.ips
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

;--- Patch at file offset $0273F5 (SNES $C273F5) ---
org $C273F5

    PHD                     ; [0B         ] Push Direct Page Register

;--- Patch at file offset $029163 (SNES $C29163) ---
org $C29163

    LDX #$FF                ; [A2 FF      ] Load X Immediate
    SBC $C948A5,X           ; [FF A5 48 C9] Subtract with Borrow Absolute Long,X
    TSB $B0                 ; [04 B0      ] Test and Set Bits in DP
    ORA $A2,S               ; [03 A2      ] OR A with Stack Relative
    ORA $0E8627             ; [0F 27 86 0E] OR A with Absolute Long
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $2008,X             ; [BD 08 20   ] Load A from Absolute,X
    ASL                     ; [0A         ] Shift Left Accumulator
    BCS $917F               ; [B0 04      ] Branch if Carry Set
    CMP $0E                 ; [C5 0E      ] Compare A with DP
    BCC $9181               ; [90 02      ] Branch if Carry Clear
    LDA $0E                 ; [A5 0E      ] Load A from DP

;--- Patch at file offset $029188 (SNES $C29188) ---
org $C29188

    BCS $918E               ; [B0 04      ] Branch if Carry Set
    CMP $0E                 ; [C5 0E      ] Compare A with DP
    BCC $9190               ; [90 02      ] Branch if Carry Clear
    LDA $0E                 ; [A5 0E      ] Load A from DP

;--- End of patch ---