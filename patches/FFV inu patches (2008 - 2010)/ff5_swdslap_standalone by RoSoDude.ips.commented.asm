;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_swdslap_standalone by RoSoDude.ips.commented.asm
;    Disassembled from IPS patch: ff5_swdslap_standalone by RoSoDude.ips
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

;--- Patch at file offset $027019 (SNES $C27019) ---
org $C27019

    db $0D, $84                 ; Incomplete/data bytes

;--- Patch at file offset $0283C2 (SNES $C283C2) ---
org $C283C2

    BIT #$40                ; [89 40      ] Test Bits Immediate
    BEQ $83CA               ; [F0 04      ] Branch if Equal
    ASL $50                 ; [06 50      ] Shift Left DP
    ROL $51                 ; [26 51      ] Rotate Left DP
    BIT #$20                ; [89 20      ] Test Bits Immediate
    BEQ $83D2               ; [F0 04      ] Branch if Equal
    LSR $51                 ; [46 51      ] Shift Right DP
    ROR $50                 ; [66 50      ] Rotate Right DP
    BIT #$10                ; [89 10      ] Test Bits Immediate
    BEQ $83DA               ; [F0 04      ] Branch if Equal
    ASL $52                 ; [06 52      ] Shift Left DP
    ROL $53                 ; [26 53      ] Rotate Left DP
    BIT #$08                ; [89 08      ] Test Bits Immediate
    BEQ $83E2               ; [F0 04      ] Branch if Equal
    LSR $53                 ; [46 53      ] Shift Right DP
    ROR $52                 ; [66 52      ] Rotate Right DP
    BIT #$04                ; [89 04      ] Test Bits Immediate
    BEQ $83EA               ; [F0 04      ] Branch if Equal
    STZ $54                 ; [64 54      ] Store Zero to DP
    STZ $55                 ; [64 55      ] Store Zero to DP
    BIT #$01                ; [89 01      ] Test Bits Immediate
    BEQ $83F9               ; [F0 0B      ] Branch if Equal
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $2065,X             ; [BD 65 20   ] Load A from Absolute,X
    BPL $83F9               ; [10 04      ] Branch if Plus
    ASL $50                 ; [06 50      ] Shift Left DP
    ROL $51                 ; [26 51      ] Rotate Left DP
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $201E,X             ; [BD 1E 20   ] Load A from Absolute,X
    BPL $8404               ; [10 04      ] Branch if Plus
    LSR $53                 ; [46 53      ] Shift Right DP
    ROR $52                 ; [66 52      ] Rotate Right DP
    BIT #$40                ; [89 40      ] Test Bits Immediate
    BEQ $840C               ; [F0 04      ] Branch if Equal
    STZ $50                 ; [64 50      ] Store Zero to DP
    STZ $51                 ; [64 51      ] Store Zero to DP
    RTS                     ; [60         ] Return from Subroutine
    JSR $8A05               ; [20 05 8A   ] Jump to Subroutine
    LDX $7B6D               ; [AE 6D 7B   ] Load X from Absolute
    BEQ $842B               ; [F0 16      ] Branch if Equal
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $201F,X             ; [BD 1F 20   ] Load A from Absolute,X
    BIT #$02                ; [89 02      ] Test Bits Immediate
    BEQ $842B               ; [F0 0D      ] Branch if Equal
    LDX #$3C                ; [A2 3C      ] Load X Immediate
    JSR $5886               ; [20 86 58   ] Jump to Subroutine
    JSR $8B7D               ; [20 7D 8B   ] Jump to Subroutine
    JSR $8D2E               ; [20 2E 8D   ] Jump to Subroutine
    STZ $56                 ; [64 56      ] Store Zero to DP
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- End of patch ---