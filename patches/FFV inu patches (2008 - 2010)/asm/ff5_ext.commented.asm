;===============================================================================
; ff5_ext.commented.asm
;    Extended program for ff5_bugfixes revision 1.2
;    COMMENTED VERSION - Opcode explanations for 65c816 learners
;
; Original Author: inu (2008-2010)
; Comments added for archival/educational purposes
;
; ARCHITECTURE NOTES:
;   - 65c816 runs in 8-bit or 16-bit accumulator/index modes (toggled via REP/SEP)
;   - Direct Page (DP) addressing uses $00-$FF as fast-access working memory
;   - Bank $C2 is battle engine code in FFV
;   - WRAM addresses like $7xxx are battle state variables
;===============================================================================

; ROM SPACE USAGE (patches these regions):
;    $C20570-$C20584:   21 bytes
;    $C20632-$C2073D:  268 bytes
;    $C20713-$C20766:   84 bytes
;    $C217DB-$C217E3:    9 bytes
;    $C21939-$C21941:    9 bytes
;    $C221B5-$C221CC:   24 bytes
;    $C2221D-$C22229:   13 bytes
;    $C222DD-$C2222E:    2 bytes
;    $C2230B-$C22318:   14 bytes
;    $C22521-$C2253E:   30 bytes
;    $C283BD-$C2842F:  115 bytes
;    $C29AEB-$C2A9ED:    3 bytes
;    $C29B56-$C29C3F:  234 bytes

; ADDITIONAL SPACE (for optional patches):
;    $C20666-$C2066A:    5 bytes - ff5_mimic_blank.ips
;    $C20641-$C20672:   50 bytes - ff5_mimic_weapon.ips
;    $C22220-$C22229:    9 bytes - ff5_condemned.ips
;    $C29BC2-$C29BCC:   11 bytes - ff5_item_evade.ips
;    $C29BAF-$C29BC1:   19 bytes - ff5_item_weight.ips
;    $C20750-$C20766:   23 bytes - ff5_reapply_item_element.ips
;    $C2840D-$C2842B:   31 bytes - ff5_swdslap.ips

; FREE SPACE (available for expansion):
;    $C2073E-$C2074F:   18 bytes
;    $C221CA-$C221CC:    3 bytes
;    $C2230F-$C22138:   10 bytes
;    $C2252F-$C2253E:   16 bytes
;    $C2842C-$C2842F:    4 bytes

incsrc ff5_labels.inc           ; Include label definitions for FFV addresses

;===============================================================================
; ITEM COMMAND HANDLER
; Handles when a character uses the "Item" command in battle
; Entry point for weapon-as-item usage
;-------------------------------------------------------------------------------
; Changes location where $7C62 is cleared
;===============================================================================
org $C20570                     ; ORG directive: assemble following code at ROM address $C20570
COMMAND_ITEM:                   ; Label for this routine - can be referenced by other code
    JSR $9923                   ; JSR (Jump to SubRoutine): Call routine at $C29923
                                ;   - Pushes return address to stack, jumps to target
                                ;   - This routine: A,Y registers = ($0C) = ($79FA) * 12
                                ;   - Sets up index based on attacker data

    JSR $175F                   ; Call target selection routine at $C2175F
                                ;   - Copies action target to $65 (enemy target) and $66 (ally target)
                                ;   - Determines who the item/attack will affect

    LDX $32                     ; LDX (Load X register): Load from Direct Page address $32
                                ;   - $32 contains index to attacker's address block
                                ;   - X register now points to current actor's data

    LDA $2056,X                 ; LDA (Load Accumulator) with absolute,X addressing
                                ;   - Loads from $2056 + X (action type flags)
                                ;   - Bit flags: 01=MP cost, 08=combo/throw, 10=equip use,
                                ;     20=magic, 40=item, 80=command

    AND #$10                    ; AND (bitwise AND): Mask with $10 (binary 00010000)
                                ;   - Isolates bit 4: "equipment use" flag
                                ;   - Result is $10 if using equipped weapon, $00 otherwise

    BEQ .not_equip              ; BEQ (Branch if Equal/Zero): Jump if A == 0
                                ;   - If equipment flag not set, branch to .not_equip
                                ;   - Otherwise fall through to use weapon logic

    JMP USE_WEAPON              ; JMP (Jump): Unconditional jump to USE_WEAPON routine
                                ;   - Unlike JSR, does not push return address
                                ;   - Transfers control to weapon usage handler

.not_equip                      ; Local label (prefixed with .)
    STZ $7C62                   ; STZ (Store Zero): Write $00 to address $7C62
                                ;   - $7C62 = item number being used
                                ;   - Clears the "weapon item number" variable

;===============================================================================
; USE WEAPON AS ITEM
; Handles using an equipped weapon as a consumable attack
; Called when equipment use flag is set
;===============================================================================
org $C20632                     ; Continue assembling at $C20632
USE_WEAPON:
    STZ $45                     ; STZ: Clear $45 to 0
                                ;   - $45 = which hand's weapon (0=right, 1=left)
                                ;   - Default to right hand weapon

    LDA $47                     ; LDA: Load from DP $47
                                ;   - $47 = actor number (0-3=party, 4+=enemy)
                                ;   - Identifies which character is acting

    TAX                         ; TAX (Transfer A to X): Copy accumulator to X register
                                ;   - Now X = actor number for indexing

    LDA $D0ED85,X               ; LDA with long absolute,X addressing (24-bit address)
                                ;   - Reads from ROM bank $D0, address $ED85+X
                                ;   - Gets index to character data ($4049): 0, 84, 168, 252
                                ;   - Each character's data block is 84 bytes apart

    TAY                         ; TAY (Transfer A to Y): Copy accumulator to Y register
                                ;   - Y now indexes into character equipment/stats

    LDX $32                     ; LDX: Reload attacker index from $32
                                ;   - Restore X for accessing attacker data

    LDA $205A,X                 ; LDA: Load item/spell number being used
                                ;   - At $205A+X, value indicates: 0=right hand, 1=left hand

    BNE .use_left_weapon        ; BNE (Branch if Not Equal/Not Zero): Branch if A != 0
                                ;   - If using left hand weapon, branch
                                ;   - Otherwise continue with right hand

.use_right_weapon
    LDA $408B,Y                 ; LDA: Load right hand weapon's spell effect
                                ;   - $408B+Y = weapon data byte 6 (spell number, $80=none)
                                ;   - Gets the magic spell this weapon casts

    TAY                         ; TAY: Transfer spell number to Y

    LDA $2013,X                 ; LDA: Load equipped right-hand weapon ID
                                ;   - $2013+X = current character's right weapon

    BRA .set_equip_data         ; BRA (Branch Always): Unconditional relative branch
                                ;   - Unlike JMP, BRA uses 8-bit signed offset
                                ;   - Shorter instruction, but limited range (-128 to +127)

.use_left_weapon
    INC $45                     ; INC (Increment): Add 1 to memory at $45
                                ;   - $45 becomes 1, indicating left hand weapon

    LDA $4097,Y                 ; LDA: Load left hand weapon's spell effect
                                ;   - $4097+Y = left weapon data byte 6 (spell number)

    TAY                         ; TAY: Transfer spell number to Y

    LDA $2014,X                 ; LDA: Load equipped left-hand weapon ID
                                ;   - $2014+X = current character's left weapon

    BRA .set_equip_data         ; BRA: Jump to common setup code

.check_mimic                    ; Hook point for Mimic weapon patches
    NOP : NOP                   ; NOP (No Operation): Do nothing, consume 1 byte each
                                ;   - Reserved space for: BPL .use_left_weapon
                                ;   - Patches can overwrite these NOPs

.mimic_weapon                   ; More reserved patch space
    NOP : NOP : NOP             ; Reserved for: LDA $7C63 (3 bytes)
    NOP                         ; Reserved for: TAY (1 byte)
    NOP : NOP : NOP             ; Reserved for: LDA $7C62 (3 bytes)

.set_equip_data
    STA $205A,X                 ; STA (Store Accumulator): Write A to $205A+X
                                ;   - Stores weapon/spell ID for action processing

    STA $7C62                   ; STA: Store to WRAM $7C62
                                ;   - $7C62 = item number being used (for Mimic)

    NOP : NOP                   ; Reserved for: LDA #$80 (2 bytes)
    NOP : NOP : NOP             ; Reserved for: STA $41D8 (3 bytes)

    TYA                         ; TYA (Transfer Y to A): Copy Y to accumulator
                                ;   - A now contains the spell number

    STA $46                     ; STA: Store spell flags to $46
                                ;   - $46 = post-use flag ($80 = weapon breaks)

    AND #$7F                    ; AND: Mask off high bit
                                ;   - Isolates spell number (0-127)
                                ;   - Removes "weapon breaks" flag for processing

    NOP : NOP : NOP             ; Reserved for: STA $7C63 (3 bytes)

    PHA                         ; PHA (Push Accumulator): Push A onto stack
                                ;   - Saves spell number for later use
                                ;   - Stack grows downward in 65816

    LDY $0C                     ; LDY: Load index from DP $0C
                                ;   - $0C = attack data index

    JSR $0324                   ; JSR: Call spell data setup routine at $C20324
                                ;   - Sets up attack data based on spell number in A
                                ;   - Configures damage formulas, elements, etc.

    JSR $02C2                   ; JSR: Call target count routine at $C202C2
                                ;   - Returns (number of targets - 1) in A
                                ;   - Also stores to $26A0

    BNE .set_target             ; BNE: Branch if multiple targets
                                ;   - Skip auto-target logic if targeting group

    LDY $0C                     ; LDY: Reload attack data index

    LDA $7A00,Y                 ; LDA: Load attack data byte 4
                                ;   - Contains targeting flags

    BPL .do_auto_target         ; BPL (Branch if Plus): Branch if bit 7 clear
                                ;   - If not forcing target, do auto-targeting

    LDA $79FA                   ; LDA: Load attacker ID
                                ;   - $79FA = which character is acting

    TAX                         ; TAX: Transfer to X for indexing

    INC $7BEB,X                 ; INC: Increment auto-target flag
                                ;   - $7BEB+X: 0=enabled, 1=disabled
                                ;   - Disables auto-target for this action

    BRA .set_target             ; BRA: Skip to target setup

.do_auto_target
    JSR $4AFE                   ; JSR: Call auto-target routine at $C24AFE
                                ;   - If current target invalid, selects new target

.set_target
    JSR $02A9                   ; JSR: Call target conversion routine at $C202A9
                                ;   - Converts $65-$66 (target flags) to attack target ($2720-$2721)

    LDA $7C62                   ; LDA: Load item number being used

    STA $2621                   ; STA: Store as display parameter
                                ;   - $2621 = item/spell number for name display

    LDA #$04                    ; LDA immediate: Load constant $04
                                ;   - #$04 = "Item Name" display type

    STA $2620                   ; STA: Store display type
                                ;   - $2620 = what type of name to show

    JSR $992F                   ; JSR: Call name display routine at $C2992F
                                ;   - Shows item/spell/command name
                                ;   - Uses $2620 (type) and $2621 (ID)

    JSR $98FA                   ; JSR: Call script advance routine at $C298FA
                                ;   - Advances action script pointer in X register

    STZ $384C,X                 ; STZ: Clear action script byte 0
                                ;   - $384C+X = action script data

    LDA #$FC                    ; LDA: Load $FC
                                ;   - $FC = attack type identifier

    STA $384D,X                 ; STA: Store to script byte 1
                                ;   - Sets attack type flag

    LDA #$0A                    ; LDA: Load $0A
                                ;   - #$0A = "Equipment Use" action type

    STA $384E,X                 ; STA: Store to script byte 2
                                ;   - Sets action type

    PLA                         ; PLA (Pull Accumulator): Pop value from stack
                                ;   - Retrieves spell number saved earlier with PHA

    STA $384F,X                 ; STA: Store spell number to script byte 3
                                ;   - Spell/command number for action

    STZ $3850,X                 ; STZ: Clear script byte 4
                                ;   - Effect/animation ID (0 = default)

    LDY $0C                     ; LDY: Load attack data index

    LDA $79FA                   ; LDA: Load attacker ID

    TAX                         ; TAX: Transfer to X for indexing

    LDA $7A00,Y                 ; LDA: Load attack data byte 4
                                ;   - Target/effect type flags

    AND #$7F                    ; AND: Mask off high bit
                                ;   - Isolate effect type (0-127)

    STA $7B2D,X                 ; STA: Store effect type
                                ;   - $7B2D+X = action effect type

    LDA $26A0                   ; LDA: Load target count
                                ;   - Number of targets - 1

    STA $7B1C,X                 ; STA: Store target count
                                ;   - $7B1C+X = number of attack targets

    BEQ .not_all_target         ; BEQ: Branch if single target
                                ;   - Skip multi-target setup if only one target

    INC $7B1C,X                 ; INC: Increment target count
                                ;   - Adjust for actual number

    LDA #$80                    ; LDA: Load $80
                                ;   - #$80 = "All Targets" flag

.not_all_target
    STA $7ACC,X                 ; STA: Store action flags
                                ;   - $7ACC+X: $10=additional effect, $80=all targets

    JSR $1735                   ; JSR: Call target setup routine at $C21735
                                ;   - Sets ($2720, $2721) as attack targets

    JSR $98E3                   ; JSR: Call damage display routine at $C298E3
                                ;   - Shows damage/heal values

    LDA $46                     ; LDA: Load weapon break flag
                                ;   - $46 bit 7: weapon breaks after use

    BPL .ret                    ; BPL: Branch if weapon doesn't break
                                ;   - Bit 7 clear = weapon survives

;-------------------------------------------------------------------------------
; WEAPON BREAK HANDLER
; Unequips and destroys weapon after use
;-------------------------------------------------------------------------------
.weapon_break
    LDA $47                     ; LDA: Load actor number

    TAX                         ; TAX: Transfer to X

    LDA $CEFF84,X               ; LDA: Load from equipment index table (ROM bank $CE)
                                ;   - Gets offset to character's equipment: 0, 12, 24, 36

    CLC                         ; CLC (Clear Carry): Prepare for addition
                                ;   - Must clear carry before ADC

    ADC $45                     ; ADC (Add with Carry): Add hand offset
                                ;   - $45 = 0 for right, 1 for left hand

    TAY                         ; TAY: Transfer result to Y
                                ;   - Y now indexes exact equipment slot

    TDC                         ; TDC (Transfer Direct Page to Accumulator)
                                ;   - On SNES, DP is usually $0000, so A = 0
                                ;   - Efficient way to zero the accumulator

    STA $37AC,Y                 ; STA: Clear equipment slot
                                ;   - $37AC+Y = character's right/left weapon

    STA $37AE,Y                 ; STA: Clear weapon count
                                ;   - Removes weapon from inventory

    STA $37B0,Y                 ; STA: Clear additional slot

    LDA #$38                    ; LDA: Load $38
                                ;   - #$38 = "Enemy/Ally Single" target type

    STA $37B2,Y                 ; STA: Store target type
                                ;   - Updates equipment target flags

    LDA #$5A                    ; LDA: Load $5A
                                ;   - #$5A = "No Element | No Effect | Any Level | No Equip"
                                ;   - Combination of restriction flags

    STA $37B4,Y                 ; STA: Store usage flags
                                ;   - Equipment use restrictions

    LDA #$AA                    ; LDA: Load $AA
                                ;   - #$AA = "Empty" equipment state

    STA $37B6,Y                 ; STA: Store validity flag
                                ;   - 0=valid, $AA=empty

    LDA $3CEF                   ; LDA: Load message index

    TAY                         ; TAY: Transfer to Y

    LDA #$50                    ; LDA: Load $50
                                ;   - Message ID: "%s shattered!"

    STA $3C5F,Y                 ; STA: Store message ID
                                ;   - Queue weapon break message

    LDA $3CF0                   ; LDA: Load message parameter index

    TAX                         ; TAX: Transfer to X

    LDA $7C62                   ; LDA: Load weapon item number

    STA $3CBF,X                 ; STA: Store as message parameter 0
                                ;   - Item name for "%s shattered!" message

    STZ $3CC0,X                 ; STZ: Clear message parameter 1

    STZ $3CC1,X                 ; STZ: Clear message parameter 2

    JSR $994C                   ; JSR: Call message display routine at $C2994C
                                ;   - Shows the weapon break message

    LDA $41CC                   ; LDA: Load current acting character
                                ;   - $41CC = character number in action

    PHA                         ; PHA: Save current actor
                                ;   - Preserve for restoration after equipment update

    LDA $47                     ; LDA: Load actor number

    STA $41CC                   ; STA: Set as current actor
                                ;   - Temporarily switch context

    STA $7B7B                   ; STA: Store to update target
                                ;   - $7B7B = target for equipment recalc

    JSR $9F3A                   ; JSR: Call equipment recalc routine at $C29F3A
                                ;   - Recalculates attack/defense stats

    PLA                         ; PLA: Restore saved actor number

    STA $41CC                   ; STA: Restore current actor
                                ;   - Return to original context

    INC $7B7D                   ; INC: Set item change flag
                                ;   - $7B7D = 0 unchanged, >0 changed

    JSR $9A6F                   ; JSR: Call status update routine at $C29A6F
                                ;   - Refreshes status based on new equipment
                                ;   - Uses $7B7B as target number

    STZ $7B7D                   ; STZ: Clear item change flag

.ret
    RTS                         ; RTS (Return from Subroutine)
                                ;   - Pops return address from stack, jumps back
                                ;   - Ends this routine

;-------------------------------------------------------------------------------
; RESERVED/PADDING SPACE
; NOPs reserve space for future patches
;-------------------------------------------------------------------------------
                                ; /* org $C2073E */
    NOP : NOP : NOP : NOP       ; 4 bytes reserved
    NOP : NOP : NOP : NOP       ; 4 bytes reserved
    NOP : NOP : NOP : NOP       ; 4 bytes reserved
    NOP : NOP : NOP : NOP       ; 4 bytes reserved
    NOP : NOP                   ; 2 bytes reserved (18 total)

                                ; /* org $C20750 */
    NOP : NOP : NOP : NOP       ; 4 bytes reserved
    NOP : NOP : NOP : NOP       ; 4 bytes reserved
    NOP : NOP : NOP : NOP       ; 4 bytes reserved
    NOP : NOP : NOP : NOP       ; 4 bytes reserved
    NOP : NOP : NOP : NOP       ; 4 bytes reserved
    NOP : NOP : NOP             ; 3 bytes reserved (23 total)

;===============================================================================
; FIX $9A6F EXECUTION
; Modifies routine to clear $7B7D properly after execution
;===============================================================================
org $C217DB
    JSR $9F3A                   ; JSR: Call equipment/stats recalc
                                ;   - Updates attack/defense values

    JSR $9A6F                   ; JSR: Call item data load and status update
                                ;   - Refreshes based on current equipment

    STZ $7B7D                   ; STZ: Clear item change flag
                                ;   - Reset flag after processing

org $C21939
    JSR $9F3A                   ; JSR: Call equipment/stats recalc

    JSR $9A6F                   ; JSR: Call item data load and status update

    STZ $7B7D                   ; STZ: Clear item change flag

;===============================================================================
; TIMER TYPE HANDLER
; Processes different timer-based effects (poison, regen, etc.)
;===============================================================================
org $C221B5
ENABLE_TIMER:
    LDA $3ECE                   ; LDA: Load timer type
                                ;   - $3ECE = which timer effect to process

    ASL                         ; ASL (Arithmetic Shift Left): Multiply A by 2
                                ;   - Shifts all bits left, bit 7 goes to Carry
                                ;   - Doubles value for 16-bit jump table index

    TAX                         ; TAX: Transfer to X for indexing

    JMP ($21CD,X)               ; JMP indirect indexed: Jump through table
                                ;   - Reads 16-bit address from $21CD+X
                                ;   - Jumps to handler for this timer type
                                ;   - Indexed indirect allows dynamic dispatch

;-------------------------------------------------------------------------------
; DISPLAY DAMAGE/HEAL POINTS
; Shows numerical damage or healing values on screen
;-------------------------------------------------------------------------------
DISPLAY_DAMAGE_POINTS:
    LDX $0E                     ; LDX: Load damage value index

    STX $3C5D                   ; STX: Store to display parameter
                                ;   - $3C5D = value to display

    JSR $0276                   ; JSR: Call display setup routine at $C20276
                                ;   - Prepares damage/heal display
                                ;   - A = target, $3C5D = value

    LDA #$09                    ; LDA: Load $09
                                ;   - #$09 = "Damage Value" display type

    JMP $0069                   ; JMP: Jump to screen update at $C20069
                                ;   - Updates display with damage numbers
                                ;   - A register specifies update type

                                ; /* org $C221CA */
    NOP : NOP : NOP             ; 3 bytes reserved space

;===============================================================================
; TIMER TYPE 001: POISON DAMAGE
; Handles HP drain from poison status
;===============================================================================
org $C2221D
    JMP DISPLAY_DAMAGE_POINTS   ; JMP: Jump to damage display routine
                                ;   - Shows poison damage numbers

                                ; /* org $C22220 */
    NOP : NOP : NOP : NOP       ; Reserved space
    NOP : NOP : NOP : NOP
    NOP : NOP                   ; 10 bytes total

;===============================================================================
; TIMER TYPE 007: REGEN
; Handles HP recovery from regen status
;===============================================================================
org $C222DD
    BNE $230E                   ; BNE: Branch if regen still active
                                ;   - Jump to regen processing if flag set

org $C2230B
    JSR DISPLAY_DAMAGE_POINTS   ; JSR: Call damage display
                                ;   - Shows regen heal numbers

    RTS                         ; RTS: Return from subroutine

                                ; /* org $C2230F */
    NOP : NOP : NOP : NOP       ; Reserved space
    NOP : NOP : NOP : NOP
    NOP : NOP                   ; 10 bytes total

;===============================================================================
; TIMER CYCLE LOADER
; Sets up timer duration/frequency
;===============================================================================
org $C22521
LOAD_TIMER_CYCLE:
    JSR $253F                   ; JSR: Call index calculation at $C2253F
                                ;   - Y = X + ($36: ATB address index)

    TXA                         ; TXA (Transfer X to A): Copy X to accumulator

    ASL                         ; ASL: Multiply by 2
                                ;   - Double for 16-bit indexing

    CLC                         ; CLC: Clear carry for addition

    ADC $3ED7                   ; ADC: Add timer cycle selector
                                ;   - $3ED7: 0=normal, 1=alternate timing

    ASL                         ; ASL: Multiply by 2 again
                                ;   - Now A = (X*2 + $3ED7) * 2

    TAX                         ; TAX: Transfer to X for table lookup

    JMP ($254A,X)               ; JMP indirect: Jump through cycle table
                                ;   - Selects appropriate timer cycle routine

                                ; /* org $C2252F */
    NOP : NOP : NOP : NOP       ; Reserved space (16 bytes)
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP

;===============================================================================
; PHYSICAL ATTACK DAMAGE CALCULATION
; Applies modifiers to physical damage formula
; Handles: attack power, defense, critical hits, guard, etc.
;===============================================================================
org $C283BD
    LDX $32                     ; LDX: Load attacker index

    LDA $201F,X                 ; LDA: Load attack influence flags
                                ;   - Bit flags:
                                ;     04: Ignore defense
                                ;     08: Multiplier halved
                                ;     10: Multiplier doubled
                                ;     20: Attack power halved
                                ;     40: Attack power doubled
                                ;     80: Always hit

.atk_double
    BIT #$40                    ; BIT (Test Bits): AND A with $40, set flags only
                                ;   - Tests bit 6 without changing A
                                ;   - Z flag set if bit 6 is 0

    BEQ .atk_half               ; BEQ: Skip if attack double flag not set

    ASL $50                     ; ASL: Shift attack power low byte left (x2)
                                ;   - $50 = attack power (low byte)
                                ;   - Carry receives bit 7 for multi-byte multiply

    ROL $51                     ; ROL (Rotate Left): Shift high byte, include carry
                                ;   - $51 = attack power (high byte)
                                ;   - Completes 16-bit multiply by 2

.atk_half
    BIT #$20                    ; BIT: Test bit 5 (attack halved)

    BEQ .mult_double            ; BEQ: Skip if not halving attack

    LSR $51                     ; LSR (Logical Shift Right): Divide high byte by 2
                                ;   - Bit 0 goes to Carry

    ROR $50                     ; ROR (Rotate Right): Divide low byte, include carry
                                ;   - Completes 16-bit divide by 2

.mult_double
    BIT #$10                    ; BIT: Test bit 4 (multiplier doubled)

    BEQ .mult_half              ; BEQ: Skip if not doubling multiplier

    ASL $52                     ; ASL: Shift multiplier low byte left
                                ;   - $52 = damage multiplier (low byte)

    ROL $53                     ; ROL: Shift multiplier high byte
                                ;   - $53 = damage multiplier (high byte)

.mult_half
    BIT #$08                    ; BIT: Test bit 3 (multiplier halved)

    BEQ .ignore_defense         ; BEQ: Skip if not halving multiplier

    LSR $53                     ; LSR: Divide multiplier high byte

    ROR $52                     ; ROR: Divide multiplier low byte

.ignore_defense
    BIT #$04                    ; BIT: Test bit 2 (ignore defense)

    BEQ .human_attack           ; BEQ: Skip if not ignoring defense

    STZ $54                     ; STZ: Zero defense low byte
                                ;   - $54 = target defense (low byte)

    STZ $55                     ; STZ: Zero defense high byte
                                ;   - Effectively makes defense 0

.human_attack
    BIT #$01                    ; BIT: Test bit 0 (human killer)

    BEQ .defense                ; BEQ: Skip if not human killer weapon

    LDX $49                     ; LDX: Load target index

    LDA $2065,X                 ; LDA: Load target monster type
                                ;   - Bit flags:
                                ;     01: Undead    04: Heavy
                                ;     08: Aevis     10: Dragon
                                ;     20: Boss      40: Magic Beast
                                ;     80: Human

    BPL .defense                ; BPL: Skip if bit 7 (Human) clear
                                ;   - Only double damage against humans

    ASL $50                     ; ASL: Double attack power (low)

    ROL $51                     ; ROL: Double attack power (high)

.defense
    LDX $49                     ; LDX: Load target index

    LDA $201E,X                 ; LDA: Load target status flags
                                ;   - Bit flags:
                                ;     08: Berserk   10: Jump
                                ;     40: Image    80: Defend

    BPL .guard                  ; BPL: Skip if not defending
                                ;   - Bit 7 = Defend command active

    LSR $53                     ; LSR: Halve multiplier (defending)

    ROR $52                     ; ROR: Complete 16-bit halve

.guard
    BIT #$40                    ; BIT: Test bit 6 (Image status)

    BEQ .ret                    ; BEQ: Skip if no Image

    STZ $50                     ; STZ: Zero attack power
                                ;   - Image causes attack to miss

    STZ $51                     ; STZ: Complete zeroing attack

.ret
    RTS                         ; RTS: Return from subroutine

;-------------------------------------------------------------------------------
; RESERVED SPACE FOR SWORDSLAP PATCH
;-------------------------------------------------------------------------------
                                ; /* org $C2840D */
    NOP : NOP : NOP : NOP       ; Reserved space (35 bytes)
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP

;===============================================================================
; ITEM PARAMETER LOADER
; Loads equipment stats and updates character parameters
; $7B7B contains target character number
;===============================================================================
org $C29A6F
org $C29AEB
    ADC #$0000                  ; ADC: Add 0 with carry
                                ;   - Effectively just adds carry flag
                                ;   - May be placeholder or alignment

org $C29B56
LOAD_ITEM_PARAM:
    TDC                         ; TDC: Transfer DP to A (A = 0)
                                ;   - Efficient zero-loading

    TAY                         ; TAY: Y = 0
                                ;   - Initialize loop index

    LDX $32                     ; LDX: Load attacker index

.begin                          ; Main parameter loading loop
    LDA $2623,Y                 ; LDA: Load stat modifier (high byte)
                                ;   - $2622-$2623 = stat modifiers

    BPL .nrange_stat            ; BPL: Branch if positive (valid stat)
                                ;   - Negative values indicate no stat change

    TDC                         ; TDC: Zero the accumulator
                                ;   - Use 0 if stat is negative/invalid

    BRA .assign_stat            ; BRA: Skip to assignment

.nrange_stat
    LDA $2622,Y                 ; LDA: Load stat modifier (low byte)
                                ;   - Use actual value if valid

.assign_stat
    STA $2028,X                 ; STA: Store to character stat slot
                                ;   - $2028+X = stat with equipment bonus

    STZ $2050,X                 ; STZ: Clear elemental modifier
                                ;   - $2050+X = element attack boost flags
                                ;   - Bits: 01=Fire 02=Ice 04=Thunder 08=Poison
                                ;          10=Holy 20=Earth 40=Wind 80=Water

    INX                         ; INX (Increment X): X = X + 1
                                ;   - Move to next stat slot

    INY                         ; INY (Increment Y): Y = Y + 1

    INY                         ; INY: Y = Y + 1 (skip 2 bytes per stat)

    CPY #$0008                  ; CPY (Compare Y): Compare Y with 8
                                ;   - Check if processed all 4 stats (4*2=8)

    BNE .begin                  ; BNE: Loop if not done

    STZ $2050,X                 ; STZ: Clear additional flag slot
                                ;   - $2054: temporary status modifier

    STZ $2051,X                 ; STZ: Clear another flag slot
                                ;   - $2055: special effect flags

    NOP                         ; Reserved space (8 NOPs)
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP

.load_begin
    LDY $0A                     ; LDY: Load equipment data index

    LDX $32                     ; LDX: Load attacker index

    STZ $207A,X                 ; STZ: Clear attack effect type
                                ;   - $207A+X = special attack effect

    LDA $2620                   ; LDA: Load equipment flags

    STA $2022,X                 ; STA: Store power-up flags
                                ;   - $2022+X = equipment power bonuses

.set_category                   ; Set weapon attack categories
    LDA $4086,Y                 ; LDA: Load right weapon attack category
                                ;   - Weapon type for damage formula

    STA $206C,X                 ; STA: Store right hand category

    LDA $4092,Y                 ; LDA: Load left weapon attack category

    STA $206D,X                 ; STA: Store left hand category

.set_weapon_flag                ; Set weapon special properties
    LDA $408A,Y                 ; LDA: Load right weapon special flags
                                ;   - Flags: 02=status change, 04=spellcast
                                ;     08=add effect, 20=may break
                                ;     40=MP damage, 80=Two-Handed/Defender

    ORA $4096,Y                 ; ORA (OR Accumulator): Combine with left weapon
                                ;   - Merge both weapons' flags

    STA $2038,X                 ; STA: Store combined weapon flags

.set_power                      ; Set attack power values
    LDA $408C,Y                 ; LDA: Load right weapon attack power

    STA $2044,X                 ; STA: Store right attack power
                                ;   - $2044+X = right hand damage base

    LDA $4098,Y                 ; LDA: Load left weapon attack power

    STA $2045,X                 ; STA: Store left attack power
                                ;   - $2045+X = left hand damage base

.set_weight                     ; /* org $C29BAF - Weight calculation hook */
    NOP                         ; /* item_weight: CLC */
    NOP : NOP : NOP             ; /* item_weight: LDA $404A,Y - helmet weight */
    NOP : NOP : NOP             ; /* item_weight: ADC $4056,Y - armor weight */
    NOP : NOP : NOP             ; /* item_weight: ADC $4062,Y - accessory weight */
    NOP : NOP : NOP             ; /* item_weight: ADC $406E,Y - right shield weight */
    NOP : NOP : NOP             ; /* item_weight: ADC $407A,Y - left shield weight */
    NOP : NOP : NOP             ; /* item_weight: STA $2023,X - total weight */

.set_evade                      ; /* org $C29BC2 - Evade calculation hook */
    NOP                         ; /* item_evade: CLC */
    NOP : NOP : NOP             ; /* item_evade: LDA $404F,Y - helmet evade */
    NOP : NOP : NOP             ; /* item_evade: ADC $405B,Y - armor evade */
    NOP : NOP : NOP             ; /* item_evade: ADC $4067,Y - accessory evade */
                                ; /* item_evade: ADC $4073,Y */

    LDA $4073,Y                 ; LDA: Load right shield physical evade

    ADC $407F,Y                 ; ADC: Add left shield physical evade
                                ;   - Combine both shields' evade

    CMP #$63                    ; CMP (Compare): Compare with 99
                                ;   - Check if evade exceeds maximum

    BCC .set_evade_nrange       ; BCC (Branch if Carry Clear): Branch if A < 99
                                ;   - Carry clear means no overflow

    LDA #$63                    ; LDA: Cap at 99
                                ;   - Maximum evade value

.set_evade_nrange
    STA $202C,X                 ; STA: Store physical evade
                                ;   - $202C+X = character's evade stat

.set_defense                    ; Calculate total physical defense
    CLC                         ; CLC: Prepare for addition chain

    LDA $4050,Y                 ; LDA: Load helmet defense

    ADC $405C,Y                 ; ADC: Add armor defense

    BCS .set_defense_max        ; BCS (Branch if Carry Set): Overflow check
                                ;   - If carry set, result > 255

    ADC $4068,Y                 ; ADC: Add accessory defense

    BCS .set_defense_max        ; BCS: Overflow check

    ADC $4074,Y                 ; ADC: Add right shield defense

    BCS .set_defense_max        ; BCS: Overflow check

    ADC $4080,Y                 ; ADC: Add left shield defense

    BCC .assign_defense         ; BCC: No overflow, use calculated value

.set_defense_max
    LDA #$FF                    ; LDA: Cap at 255
                                ;   - Maximum defense value

.assign_defense
    STA $202D,X                 ; STA: Store physical defense
                                ;   - $202D+X = character's defense stat

.set_mevade                     ; Calculate magic evade
    CLC                         ; CLC: Prepare for addition

    LDA $4051,Y                 ; LDA: Load helmet magic evade

    ADC $405D,Y                 ; ADC: Add armor magic evade

    ADC $4069,Y                 ; ADC: Add accessory magic evade

    ADC $4075,Y                 ; ADC: Add right shield magic evade

    ADC $4081,Y                 ; ADC: Add left shield magic evade

    CMP #$63                    ; CMP: Compare with 99

    BCC .set_mevade_nrange      ; BCC: Branch if under cap

    LDA #$63                    ; LDA: Cap at 99

.set_mevade_nrange
    STA $202E,X                 ; STA: Store magic evade
                                ;   - $202E+X = character's magic evade

.set_mdefense                   ; Calculate magic defense
    CLC                         ; CLC: Prepare for addition

    LDA $4052,Y                 ; LDA: Load helmet magic defense

    ADC $405E,Y                 ; ADC: Add armor magic defense

    BCS .set_mdefense_max       ; BCS: Overflow check

    ADC $406A,Y                 ; ADC: Add accessory magic defense

    BCS .set_mdefense_max       ; BCS: Overflow check

    ADC $4076,Y                 ; ADC: Add right shield magic defense

    BCS .set_mdefense_max       ; BCS: Overflow check

    ADC $4082,Y                 ; ADC: Add left shield magic defense

    BCC .assign_mdefense        ; BCC: No overflow

.set_mdefense_max
    LDA #$FF                    ; LDA: Cap at 255

.assign_mdefense
    STA $202F,X                 ; STA: Store magic defense
                                ;   - $202F+X = character's magic defense

.set_protecter_flag             ; Combine all equipment special flags
    LDA $404E,Y                 ; LDA: Load helmet special flags
                                ;   - Flags: 01=HP Critical Catch, 02=Pre-emptive
                                ;     04=Back Row OK, 08=Half MP Cost
                                ;     10=Double GP, 20=Long Range
                                ;     40=Maneater, 80=Aegis Shield

    ORA $405A,Y                 ; ORA: Combine armor flags

    ORA $4066,Y                 ; ORA: Combine accessory flags

    ORA $4072,Y                 ; ORA: Combine right shield flags

    ORA $407E,Y                 ; ORA: Combine left shield flags

    STA $2039,X                 ; STA: Store combined special flags
                                ;   - $2039+X = all equipment passive abilities
