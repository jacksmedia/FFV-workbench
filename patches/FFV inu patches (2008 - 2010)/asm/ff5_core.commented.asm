;===============================================================================
; ff5_core.commented.asm
;    Core improvements revision 1.7
;    COMMENTED VERSION - Opcode explanations for 65c816 learners
;
; Original Author: inu
; Comments added for archival/educational purposes
;
; This file contains core battle system improvements including:
;   - Battle main loop and initialization
;   - Character parameter handling
;   - Monster data loading
;   - MP recovery mechanics
;   - Effect processing
;   - Various bugfixes and optimizations
;===============================================================================

incsrc ff5_labels.inc           ; Include FFV address label definitions
incsrc ff5_core_config.inc      ; Include configuration constants

;===============================================================================
; BATTLE MESSAGE TABLES
; These tables define which messages are shown based on attack outcomes
; Format: 16-bit pointers stored as high byte, low byte pairs
;===============================================================================

;-------------------------------------------------------------------------------
; Messages shown when attack fails (miss, ineffective, etc.)
;-------------------------------------------------------------------------------
org FILEPOS_MAGMES_INFO         ; ORG: Assemble at this ROM address
    db MAGMES_INFO_0X>>8, MAGMES_INFO_0X  ; DB (Define Byte): Raw byte data
                                ; ">>" is right shift - gets high byte
                                ; This creates a 16-bit pointer split into bytes
    db MAGMES_INFO_1X>>8, MAGMES_INFO_1X  ; Message pointer 1
    db MAGMES_INFO_2X>>8, MAGMES_INFO_2X  ; Message pointer 2
    db MAGMES_INFO_3X>>8, MAGMES_INFO_3X  ; Message pointer 3
    db MAGMES_INFO_4X>>8, MAGMES_INFO_4X  ; Message pointer 4
    db MAGMES_INFO_5X>>8, MAGMES_INFO_5X  ; Message pointer 5
    db MAGMES_INFO_6X>>8, MAGMES_INFO_6X  ; Message pointer 6
    db MAGMES_INFO_7X>>8, MAGMES_INFO_7X  ; Message pointer 7

;-------------------------------------------------------------------------------
; Messages shown during ally attacks
;-------------------------------------------------------------------------------
org FILEPOS_MAGMES_ALLY
    db MAGMES_ALLY_0X>>8, MAGMES_ALLY_0X  ; Ally attack message 0
    db MAGMES_ALLY_1X>>8, MAGMES_ALLY_1X  ; Ally attack message 1
    db MAGMES_ALLY_2X>>8, MAGMES_ALLY_2X  ; Ally attack message 2
    db MAGMES_ALLY_3X>>8, MAGMES_ALLY_3X  ; Ally attack message 3
    db MAGMES_ALLY_4X>>8, MAGMES_ALLY_4X  ; Ally attack message 4
    db MAGMES_ALLY_5X>>8, MAGMES_ALLY_5X  ; Ally attack message 5
    db MAGMES_ALLY_6X>>8, MAGMES_ALLY_6X  ; Ally attack message 6
    db MAGMES_ALLY_7X>>8, MAGMES_ALLY_7X  ; Ally attack message 7

;-------------------------------------------------------------------------------
; Messages shown during enemy attacks
;-------------------------------------------------------------------------------
org FILEPOS_MAGMES_ENEMY
    db MAGMES_ENEMY_0X>>8, MAGMES_ENEMY_0X  ; Enemy attack message 0
    db MAGMES_ENEMY_1X>>8, MAGMES_ENEMY_1X  ; Enemy attack message 1
    db MAGMES_ENEMY_2X>>8, MAGMES_ENEMY_2X  ; Enemy attack message 2
    db MAGMES_ENEMY_3X>>8, MAGMES_ENEMY_3X  ; Enemy attack message 3
    db MAGMES_ENEMY_4X>>8, MAGMES_ENEMY_4X  ; Enemy attack message 4
    db MAGMES_ENEMY_5X>>8, MAGMES_ENEMY_5X  ; Enemy attack message 5
    db MAGMES_ENEMY_6X>>8, MAGMES_ENEMY_6X  ; Enemy attack message 6
    db MAGMES_ENEMY_7X>>8, MAGMES_ENEMY_7X  ; Enemy attack message 7

;===============================================================================
; BATTLE MAIN LOOP
; Entry point for battle processing - saves state, runs battle, restores state
; Called via JSL from field code
;===============================================================================
org $C20003
BATTLE_MAIN:
    PHP                         ; PHP (Push Processor status): Save flags to stack
                                ;   - Saves N/V/M/X/D/I/Z/C flags
                                ;   - Allows restoring exact CPU state later

    REP #$30                    ; REP (Reset Processor bits): Clear bits in P register
                                ;   - #$30 = bits 4 and 5 = M and X flags
                                ;   - Enables 16-bit accumulator AND 16-bit index registers
                                ;   - Critical: changes how LDA/LDX/LDY interpret data

    PHB                         ; PHB (Push data Bank): Save current data bank
                                ;   - Data bank determines high byte of absolute addresses

    PHD                         ; PHD (Push Direct page): Save direct page register
                                ;   - Direct page is base for $xx addressing

    PHA                         ; PHA (Push Accumulator): Save A to stack
                                ;   - 16-bit push since M flag is clear

    PHX                         ; PHX (Push X): Save X register to stack

    PHY                         ; PHY (Push Y): Save Y register to stack

    SEP #$20                    ; SEP (Set Processor bits): Set bit 5 (M flag)
                                ;   - Enables 8-bit accumulator mode
                                ;   - Index registers remain 16-bit (X flag still clear)

    JSR $0053                   ; JSR: Call register initialization at $C20053
                                ;   - Sets up DP, data bank, screen state

    JSR BATTLE_INIT             ; JSR: Call battle initialization routine
                                ;   - Increments battle counter, saves step count

    STZ $7CD8                   ; STZ: Clear battle reset flag
                                ;   - $7CD8: 0=continue, 1=reset battle

.reset                          ; Battle main loop entry point
    JSR $4CE0                   ; JSR: Call battle start routine at $C24CE0
                                ;   - Main battle processing loop

    TDC                         ; TDC: A = Direct Page (usually 0)
                                ;   - Efficient way to zero accumulator

    STA $002100                 ; STA: Write to Screen Display register
                                ;   - $2100: INIDISP - Initial display settings
                                ;   - Writing 0 forces blanking (screen off)

    STA $00420C                 ; STA: Write to HDMA Enable register
                                ;   - $420C: HDMAEN - Disable all HDMA channels

    STA $00420B                 ; STA: Write to DMA Enable register
                                ;   - $420B: MDMAEN - Disable all DMA channels

    STA $004200                 ; STA: Write to Interrupt Enable register
                                ;   - $4200: NMITIMEN - Disable NMI/IRQ

    LDA $7CD8                   ; LDA: Load battle reset flag

    BNE .reset                  ; BNE: If reset requested, restart battle loop
                                ;   - Allows battle to restart (e.g., Game Over retry)

    SEI                         ; SEI (Set Interrupt disable): Disable IRQ
                                ;   - Prevents interrupts during cleanup

    JSR $0053                   ; JSR: Call register re-initialization
                                ;   - Clean up before returning to field

    REP #$30                    ; REP: Enable 16-bit A and X/Y
                                ;   - Match the state we saved

    PLY                         ; PLY (Pull Y): Restore Y from stack

    PLX                         ; PLX (Pull X): Restore X from stack

    PLA                         ; PLA (Pull Accumulator): Restore A from stack

    PLD                         ; PLD (Pull Direct page): Restore DP register

    PLB                         ; PLB (Pull data Bank): Restore data bank

    PLP                         ; PLP (Pull Processor status): Restore flags
                                ;   - Restores M/X flags to caller's state

    RTL                         ; RTL (Return from subroutine Long): Return to caller
                                ;   - Pops 24-bit return address (bank + offset)
                                ;   - Used to return from JSL calls

                                ; /* org $C2003C - Reserved space */
    NOP : NOP : NOP : NOP       ; 23 bytes of padding/reserved space
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP

;===============================================================================
; INITIALIZE BATTLE REGISTERS
; Sets up CPU state for battle processing
;===============================================================================
org $C20053
INIT_BATTLE_REGS:
    LDX #$0000                  ; LDX: Load 0 into X (16-bit)

    PHX                         ; PHX: Push $0000 to stack

    PLD                         ; PLD: Pull into Direct Page register
                                ;   - Sets DP = $0000 (zero page)
                                ;   - DP addressing now uses $0000-$00FF

    TDC                         ; TDC: A = 0 (DP is now $0000)

    STA $004200                 ; STA: Disable interrupts via NMITIMEN

    LDA #$80                    ; LDA: Load $80
                                ;   - #$80 = Force Blank bit

    STA $002100                 ; STA: Write to INIDISP
                                ;   - Bit 7 set = screen blanked (off)
                                ;   - Required before VRAM/OAM writes

    TDC                         ; TDC: A = 0

    LDA #$7E                    ; LDA: Load $7E (WRAM bank)

    PHA                         ; PHA: Push $7E to stack

    PLB                         ; PLB: Pull into Data Bank register
                                ;   - DB = $7E, absolute addresses now in WRAM
                                ;   - e.g., LDA $1234 reads $7E:1234

    RTS                         ; RTS: Return from subroutine

;===============================================================================
; INITIALIZE BATTLE RAM
; Clears and initializes all battle-related WRAM
;===============================================================================
org $C24F0A
INIT_BATTLE_RAM:
    LDX #$0067                  ; LDX: Loop counter for temp memory
                                ;   - Will clear $0000-$0067 (104 bytes)

.init_temp                      ; Clear temporary/direct page memory
    STZ $00,X                   ; STZ with DP,X: Clear byte at DP+X
                                ;   - With DP=$0000, clears $0000+X

    DEX                         ; DEX (Decrement X): X = X - 1

    BPL .init_temp              ; BPL (Branch if Plus): Loop while X >= 0
                                ;   - BPL checks N flag (bit 7 of result)
                                ;   - When X becomes $FFFF, high bit set = negative

    LDX #$5CD4                  ; LDX: Loop counter for global battle memory
                                ;   - Will clear $2000-$7CD4 (23,765 bytes!)

.init_global                    ; Clear main battle state
    STZ $2000,X                 ; STZ absolute,X: Clear $2000+X

    DEX                         ; DEX: Decrement counter

    BPL .init_global            ; BPL: Loop while X >= 0

    TXA                         ; TXA: A = X (which is now $FFFF, so A = $FF)
                                ;   - Clever: reuse loop's end value

    STX $41A9                   ; STX: Store $FFFF to next-turn actor slot 0
                                ;   - $FFFF = no actor queued

    STX $41AB                   ; STX: Store $FFFF to next-turn actor slot 2

    STA $41AD                   ; STA: Store $FF to next-turn actor slot 4
                                ;   - 8-bit store (only low byte)

    STA $41CC                   ; STA: Store $FF to current actor number
                                ;   - $FF = no character acting

    STA $7C4B                   ; STA: Store $FF to boss monster ID

    LDX #$01FF                  ; LDX: Counter for action script area
                                ;   - Clear 512 bytes

.init_action_script             ; Fill action script with $FF
    STA $384C,X                 ; STA: Store $FF to action script
                                ;   - $FF marks empty/unused script slots

    DEX                         ; DEX: Decrement counter

    BPL .init_action_script     ; BPL: Loop while X >= 0

    LDX #$001F                  ; LDX: Counter for battle flags (32 bytes)

.set_battle_flags               ; Copy lamp usage flags
    LDA $09B4,X                 ; LDA: Load magic lamp usage from save data

    STA $7C74,X                 ; STA: Store to battle state
                                ;   - Preserves which lamp summons used

    DEX                         ; DEX: Decrement

    BPL .set_battle_flags       ; BPL: Loop

    LDA $0AFB                   ; LDA: Load timer enable flag from save
                                ;   - 0=OFF, 2=ON (countdown timer)

    STA $7C94                   ; STA: Store to battle timer state

    LDX $0AFC                   ; LDX: Load remaining timer value (16-bit)

    STX $7C95                   ; STX: Store to battle timer

    LDX $7CD5                   ; LDX: Load step count initial value (low)

    STX $0947                   ; STX: Store to active step count

    LDA $7CD7                   ; LDA: Load step count (high byte)

    STA $0949                   ; STA: Store high byte

    INC $7C72                   ; INC: Increment battle state flag

    RTS                         ; RTS: Return

;-------------------------------------------------------------------------------
; BATTLE_INIT - Called once at battle start
;-------------------------------------------------------------------------------
BATTLE_INIT:
    LDX $09C0                   ; LDX: Load battle count from save data

    CPX #$FFFF                  ; CPX (Compare X): Check if maxed out

    BEQ .battle_count_max       ; BEQ: Skip increment if at maximum

    INX                         ; INX: Increment battle count

    STX $09C0                   ; STX: Store updated battle count

.battle_count_max
    LDX $0947                   ; LDX: Load current step count (low)

    STX $7CD5                   ; STX: Save as initial value for battle

    LDA $0949                   ; LDA: Load step count (high)

    STA $7CD7                   ; STA: Save high byte

    RTS                         ; RTS: Return

    NOP : NOP : NOP : NOP       ; Padding
    NOP

;===============================================================================
; INITIALIZE CHARACTER PARAMETERS
; Sets up each party member's stats at battle start
;===============================================================================
org $C2515C
INIT_CHARACTER_PARAM:
    TDC                         ; TDC: A = 0

    TAY                         ; TAY: Y = 0 (source index into save data)

    TAX                         ; TAX: X = 0 (destination index into battle data)

.begin                          ; Main loop - process each character
    LDA $0502,Y                 ; LDA: Load character level from save

    STA $2002,X                 ; STA: Store to battle state

    STZ $2022,X                 ; STZ: Clear power-up value

    REP #$20                    ; REP: Enable 16-bit accumulator

    LDA $0524,Y                 ; LDA: Load Strength/Agility (16-bit, 2 stats)

    STA $2024,X                 ; STA: Store to battle data

    LDA $0526,Y                 ; LDA: Load Vitality/Magic (16-bit)

    STA $2026,X                 ; STA: Store to battle data

    LDA $0508,Y                 ; LDA: Load Max HP (16-bit)

    STA $2008,X                 ; STA: Store Max HP to battle state

    CMP $2006,X                 ; CMP: Compare Max HP with current HP
                                ;   - Check if current HP exceeds new max

    BCS .hp_normal_range        ; BCS (Branch if Carry Set): Skip if Max >= Current
                                ;   - Carry set means A >= compared value

    STA $2006,X                 ; STA: Cap current HP at Max HP

.hp_normal_range
    STZ $201E,X                 ; STZ: Clear status change 5 & attack flags

    STZ $2030,X                 ; STZ: Clear absorb/immune elements

    STZ $2032,X                 ; STZ: Clear weak/resist elements

    STZ $2034,X                 ; STZ: Clear vulnerability & status immunity 1

    STZ $2036,X                 ; STZ: Clear status immunity 2 & 3

    STZ $2038,X                 ; STZ: Clear equipment special flags

    TYA                         ; TYA: A = Y (source index)

    CLC                         ; CLC: Clear carry for addition

    ADC #$0050                  ; ADC: Add $50 (80 decimal)
                                ;   - Each character's save data is 80 bytes apart

    TAY                         ; TAY: Update source index

    TDC                         ; TDC: A = 0

    SEP #$20                    ; SEP: Back to 8-bit accumulator

    JSR $01E0                   ; JSR: Add $80 to X register
                                ;   - Each character's battle data is 128 bytes apart

    CPX #$0200                  ; CPX: Check if processed all 4 characters
                                ;   - 4 characters * $80 = $200

    BNE .begin                  ; BNE: Loop if more characters

    RTS                         ; RTS: Return

    NOP : NOP : NOP             ; Padding

;===============================================================================
; REMOVE ZERO-QUANTITY ITEMS
; Cleans up inventory by removing items with 0 count
;===============================================================================
; /* org $C251AB */
REMOVE_ZEROITEM:
    LDX #$00FF                  ; LDX: Start from last item slot (255)

.begin
    LDA $0640,X                 ; LDA: Load item type at slot X

    BEQ .clear_item_c           ; BEQ: If item type is 0, clear count too

    LDA $0740,X                 ; LDA: Load item count at slot X

    BNE .continue               ; BNE: If count > 0, item is valid, skip

.clear_item_t                   ; Item has 0 count, clear the type too
    STZ $0640,X                 ; STZ: Clear item type

.clear_item_c
    STZ $0740,X                 ; STZ: Clear item count

.continue
    DEX                         ; DEX: Move to previous slot

    BPL .begin                  ; BPL: Loop while X >= 0

    RTS                         ; RTS: Return

;-------------------------------------------------------------------------------
; Hook existing JSL calls to use our new routine
;-------------------------------------------------------------------------------
org $C24246
    JSR REMOVE_ZEROITEM : NOP   ; Replace 4-byte JSL with 3-byte JSR + NOP

org $C2511C
    JSR REMOVE_ZEROITEM : NOP   ; Same replacement at another call site

;===============================================================================
; TRANSFER BATTLE RESULTS
; Copies battle state back to save data after victory
;===============================================================================
org $C251F4
TRANSFER_BATTLE_RESULT:
    TDC                         ; TDC: A = 0

    TAX                         ; TAX: X = 0 (battle data index)

    LDY #$7C1A                  ; LDY: Load pointer to character number table
                                ;   - Character ID format: bits 0-3=number,
                                ;     bit 5=dead, bit 6=stone, bit 7=absent

    STY $10                     ; STY: Store pointer to DP $10

    TAY                         ; TAY: Y = 0 (save data index)

.begin                          ; Loop for each character
    STZ $201B,X                 ; STZ: Clear temporary status 2

    STZ $201C,X                 ; STZ: Clear auxiliary magic status

    STZ $201D,X                 ; STZ: Clear status change 4

    STZ $201E,X                 ; STZ: Clear status change 5

    NOP : NOP : NOP             ; Reserved for: STZ $2035,X (item immunity patch)
    NOP : NOP : NOP             ; Reserved for: STZ $2036,X
    NOP : NOP : NOP             ; Reserved for: STZ $2037,X

    LDA ($10)                   ; LDA (indirect): Load character number via pointer
                                ;   - Reads from address stored at $10-$11

    STA $2000,X                 ; STA: Store character ID to battle data

    LDA #$46                    ; LDA: Load $46 (70 decimal)
                                ;   - Number of bytes to copy per character

    STA $0E                     ; STA: Store as loop counter

.move_params                    ; Copy character data loop
    LDA $2000,X                 ; LDA: Load from battle data

    STA $0500,Y                 ; STA: Store to save data

    INX                         ; INX: Next battle data byte

    INY                         ; INY: Next save data byte

    DEC $0E                     ; DEC: Decrement counter

    BNE .move_params            ; BNE: Loop until all bytes copied

    REP #$21                    ; REP: 16-bit A, clear carry
                                ;   - #$21 = bits 0 and 5 = C and M flags

    TYA                         ; TYA: A = Y (save data offset)

    ADC.w #$0050-$0046          ; ADC.w: Add $000A to skip to next character
                                ;   - .w forces 16-bit addressing
                                ;   - Save data is $50 apart, we copied $46

    TAY                         ; TAY: Update save index

    TXA                         ; TXA: A = X (battle data offset)

    ADC.w #$0080-$0046          ; ADC.w: Add $003A to next character
                                ;   - Battle data is $80 apart

    TAX                         ; TAX: Update battle index

    TDC                         ; TDC: A = 0

    SEP #$20                    ; SEP: Back to 8-bit A

    INC $10                     ; INC: Increment character pointer low byte
                                ;   - Moves to next character ID

    CPX #$0200                  ; CPX: Check if all 4 characters done

    BNE .begin                  ; BNE: Loop if more

    LDX #$00FF                  ; LDX: 256 item slots to copy

.move_items                     ; Copy item inventory back to save
    LDA $2734,X                 ; LDA: Load item type from battle inventory

    STA $0640,X                 ; STA: Store to save data

    BEQ .set_empty              ; BEQ: If type is 0, clear count too

    LDA $2834,X                 ; LDA: Load item count

.set_empty
    STA $0740,X                 ; STA: Store item count

    BNE .next_item              ; BNE: If count > 0, continue

    STA $0640,X                 ; STA: Also clear type if count is 0

.next_item
    DEX                         ; DEX: Previous slot

    BPL .move_items             ; BPL: Loop while X >= 0

    REP #$21                    ; REP: 16-bit A, clear carry

    LDA $094A                   ; LDA: Load total play time (low 16 bits)

    ADC $DB6E                   ; ADC: Add battle elapsed time (low)

    STA $094A                   ; STA: Store updated play time

    LDA $094C                   ; LDA: Load play time (high 16 bits)

    ADC $DB70                   ; ADC: Add battle elapsed time (high)

    STA $094C                   ; STA: Store updated play time

    BCC .time_normal_range      ; BCC: Skip if no overflow

    LDA #$FFFF                  ; LDA: Cap at maximum value

    STA $094A                   ; STA: Set low bytes to max
    STA $094C                   ; STA: Set high bytes to max

.time_normal_range
    TDC                         ; TDC: A = 0

    SEP #$20                    ; SEP: 8-bit A

    RTS                         ; RTS: Return

                                ; /* org $C25276 - Padding */
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP

;===============================================================================
; FIX 8TH MONSTER TARGETING
; Bug: Original code couldn't target the 8th monster slot
;===============================================================================
org $C29510
FIX_EIGHTH_MONSTER:
    CPY #$000D                  ; CPY: Compare Y with 13 (was #$000C = 12)
                                ;   - Allows targeting monster slots 0-12
                                ;   - Original only allowed 0-11

;===============================================================================
; FIX ATB INITIALIZATION
; Bug: Incorrect check for which character acts first
;===============================================================================
org $C24F01
FIX_ATB_INIT:
    NOP                         ; NOP: Remove incorrect instruction
    NOP
    NOP
    CPX #$0200                  ; CPX: Correct comparison value

;===============================================================================
; FIX SONG EFFECT RANGE
; Bug: Bard's Song stat boosts didn't affect all enemies
;===============================================================================
org $C2234C
FIX_SONG:
    LDX #$0200                  ; LDX: Fix range (was #$0180 = only 3 enemies)
                                ;   - #$0200 covers all 4 enemy slots

;===============================================================================
; SANDWORM SPECIAL HANDLING
; Sandworm battle uses non-standard monster party structure
; These fixes ensure correct behavior with monster ID high bytes
;===============================================================================
org $C20B2C
THROW_IF_SANDWORM:
    LDX $04F0                   ; LDX: Load monster party formation ID

    CPX #$01BF                  ; CPX: Check for Sandworm formation
                                ;   - $01BF = Sandworm battle ID

    BEQ .sandworm               ; BEQ: Branch if this is Sandworm battle

    LDX $32                     ; LDX: Load attacker index

    LDA $0E                     ; LDA: Load target value

    STA $2058,X                 ; STA: Store as enemy target

    BRA $0B46                   ; BRA: Continue normal processing

.sandworm                       ; Special Sandworm handling
    LDX $32                     ; LDX: Load attacker index

    LDA $0E                     ; LDA: Load target

    AND #$FC                    ; AND: Mask off lower 2 bits
                                ;   - Only the holes can be targeted

    STA $2058,X                 ; STA: Store modified target

org $C23EDF
POISON_IF_MAGISSA:              ; Fix for Magissa/Forza battle
    LDX $04F0                   ; LDX: Load monster party ID

    CPX #$01BA                  ; CPX: Check for Magissa formation

    BEQ $3EEB                   ; BEQ: Branch if Magissa battle

    BRA $3F11                   ; BRA: Otherwise continue normally

org $C2569A
ITEM_DROP_IF_SANDWORM:          ; Fix item drops for Sandworm
    LDX $04F0                   ; LDX: Load monster party ID

    CPX #$01BF                  ; CPX: Check for Sandworm formation

    BNE $56A7                   ; BNE: Continue if not Sandworm

    RTS                         ; RTS: Skip item drop for Sandworm holes

;===============================================================================
; INITIALIZE MONSTER MAX MP
; Sets maximum MP for monsters at battle start
;===============================================================================
org $C23FE0
INIT_MONSTER_MAXMP:
    REP #$20                    ; REP: Enable 16-bit accumulator

    LDA $3F09,X                 ; LDA: Load monster MP from data (offset +10)

    CMP $220C,Y                 ; CMP: Compare with current Max MP (9999 cap)

    BCC .minimum_mp             ; BCC: If monster MP < 9999, skip cap

    STA $220C,Y                 ; STA: Store monster's Max MP

.minimum_mp
    BIT $3F18,X                 ; BIT: Test monster data byte at offset +26
                                ;   - Check bit 7 (permanence flag)

    BPL .not_permanence         ; BPL: Branch if bit 7 clear

    TYA                         ; TYA: A = Y

    CLC                         ; CLC: Clear carry

    ADC #$0056                  ; ADC: Add $56 to index
                                ;   - Skip to alternate data location

    TAY                         ; TAY: Update index

.not_permanence
    LDA $3F19,X                 ; LDA: Load initial status 1 (offset +26)

    AND #$FF7F                  ; AND: Clear bit 7 (permanence flag)
                                ;   - Only keep status bits

    STA $221A,Y                 ; STA: Store permanent/temporary status

    LDA $3F1B,X                 ; LDA: Load initial status 3 (offset +28)

    STA $221C,Y                 ; STA: Store auxiliary status

    TDC                         ; TDC: A = 0

    SEP #$20                    ; SEP: Back to 8-bit A

;===============================================================================
; INITIALIZE MONSTER NAME
; Sets up monster name display from data
;===============================================================================
org $C2400A
INIT_MONSTER_NAME:
    LDA $12                     ; LDA: Load monster slot number

    ASL                         ; ASL: Multiply by 2 for 16-bit index

    TAY                         ; TAY: Y = slot * 2

    LDA $3F1D,X                 ; LDA: Load monster name ID (offset +30)

    STA $4008,Y                 ; STA: Store name (low byte)

    LDA $4021,Y                 ; LDA: Load monster number (high byte)

    CMP #$FF                    ; CMP: Check if slot is empty

    BEQ .is_empty               ; BEQ: Branch if empty (set name = $00FF)

    STA $4009,Y                 ; STA: Store name (high byte)

.is_empty
    REP #$20                    ; REP: 16-bit A

    LDA $4020,Y                 ; LDA: Load monster number (16-bit)

    ASL                         ; ASL: Multiply by 2

    TAX                         ; TAX: X = monster number * 2

    TDC                         ; TDC: A = 0

;===============================================================================
; LOAD MONSTER NAME FOR DISPLAY
; Gets monster name for battle message display
;===============================================================================
org $C25A8C
LOAD_MONSTER_NAME:
    REP #$20                    ; REP: 16-bit A

    LDA $4008,X                 ; LDA: Load monster name ID

    CMP $0E                     ; CMP: Compare with previous name

    BEQ .inc_same_monster       ; BEQ: Same monster type, increment count

    INY                         ; INY: Move to next display slot
    INY
    INY
    INY

    STA $4038,Y                 ; STA: Store name for display

    STA $0E                     ; STA: Remember this name

    NOP                         ; NOP: Alignment

.inc_same_monster:
    TDC                         ; TDC: A = 0

    SEP #$20                    ; SEP: 8-bit A

    CLC                         ; CLC: Clear carry

    LDA $403A,Y                 ; LDA: Load monster count

    ADC #$01                    ; ADC: Increment count

    STA $403A,Y                 ; STA: Store updated count

;===============================================================================
; INITIALIZE MONSTER PARAMETERS
; Determines which monster data table to use (normal vs boss)
;===============================================================================
org $C24D5E
INIT_MONSTER_PARAM:
    TDC                         ; TDC: A = 0

    TAX                         ; TAX: X = 0

    STX $10                     ; STX: Clear pointer

org $C24D62
.begin
    ASL                         ; ASL: A * 2 for 16-bit indexing

    TAY                         ; TAY: Y = A * 2

    LDA $4021,Y                 ; LDA: Load monster number (high byte)

    BEQ .normal                 ; BEQ: If high byte = 0, normal monster
                                ;   - Monster IDs 0-255 are normal

    INC                         ; INC: Check if ID is $FF00+

    BNE .boss                   ; BNE: If not $FFXX, it's a boss (256+)

.normal                         ; Normal monster data table
    LDA.b #FILEPOS_MONDATA1>>16 ; LDA.b: Load bank byte of normal monster data
                                ;   - .b forces 8-bit operand

    LDY.w #FILEPOS_MONDATA1     ; LDY.w: Load address of normal monster data
                                ;   - .w forces 16-bit operand

    BRA .assign_address         ; BRA: Skip boss data load

.boss                           ; Boss monster data table
    LDA.b #FILEPOS_MONDATA2>>16 ; LDA.b: Bank of boss monster data

    LDY.w #FILEPOS_MONDATA2     ; LDY.w: Address of boss monster data

.assign_address
    STA $14                     ; STA: Store bank byte

    STY $12                     ; STY: Store address

org $C24DA1
    BNE .begin                  ; BNE: Loop for more monsters

;===============================================================================
; SET COMMAND RESULT
; Processes attack results and sets up display/effects
; This is a large routine handling damage display, reflect, targeting, etc.
;===============================================================================
org $C29761
SET_COMMAND_RESULT:
    JSR $9885                   ; JSR: Call reaction pattern setup

    LDA $7B2C                   ; LDA: Load current attacker number

    TAX                         ; TAX: X = attacker

    LDA $D0EE85,X               ; LDA: Load action data index from ROM table
                                ;   - Long absolute addressing into bank $D0
                                ;   - Table maps attacker # to action struct offset

    TAY                         ; TAY: Y = action data index

    STZ $0E                     ; STZ: Clear flag byte

    LDA $4747                   ; LDA: Load commanded spell number

    CMP #$81                    ; CMP: Check for $81 (Monster Ability/Specialty)

    BNE .unset_specialty        ; BNE: Skip if not specialty

    LDA #$01                    ; LDA: Set specialty flag

    TSB $0E                     ; TSB (Test and Set Bits): OR into $0E
                                ;   - Sets bit 0 in $0E

.unset_specialty
    LDA $7BFB                   ; LDA: Load "no action" flag
                                ;   - 0 = perform action, non-0 = skip

    BEQ .unset_no_action        ; BEQ: Branch if action should proceed

    LDA #$20                    ; LDA: Set no-action flag

    TSB $0E                     ; TSB: Set bit 5 in flags

.unset_no_action
    LDA $7C5D                   ; LDA: Load "hide" usage flag

    BEQ .unset_alt_palette      ; BEQ: Skip if not hiding

    LDA #$02                    ; LDA: Set alternate palette flag

    TSB $0E                     ; TSB: Set bit 1

.unset_alt_palette
    LDA $47                     ; LDA: Load actor number (0-3=party, 4+=enemy)

    CMP #$04                    ; CMP: Check if enemy

    BCC .unset_monster          ; BCC: Branch if party member (< 4)

    SBC #$04                    ; SBC: Subtract 4 to get enemy index

    TAX                         ; TAX: X = enemy index

    LDA #$80                    ; LDA: Set "monster action" flag

    TSB $0E                     ; TSB: Set bit 7

    TXA                         ; TXA: Restore enemy index to A

.unset_monster
    STA $3BCD,Y                 ; STA: Store acting character number

    LDA $7B45                   ; LDA: Load target number (may be redirected)

    TAX                         ; TAX: X = target

    CMP #$04                    ; CMP: Check if targeting enemy

    BCC .unset_attack_to_monster ; BCC: Branch if targeting ally

    SBC #$04                    ; SBC: Get enemy index

    TAX                         ; TAX: X = enemy index

    LDA #$40                    ; LDA: Set "attack to monster" flag

    TSB $0E                     ; TSB: Set bit 6

.unset_attack_to_monster
    LDA $3BCE,Y                 ; LDA: Load current target bitmap

    JSR $01D6                   ; JSR: Set bit (7-X) in A
                                ;   - Adds this target to bitmap

    STA $3BCE,Y                 ; STA: Store updated target bitmap

    LDA $5F                     ; LDA: Load critical hit effect

    ORA $61                     ; ORA: OR with magic critical effect

    BEQ .unset_flash            ; BEQ: Skip if no critical

    LDA #$10                    ; LDA: Set flash flag

    TSB $0E                     ; TSB: Set bit 4

.unset_flash
    LDA $7B40                   ; LDA: Load "physical attack blocked" flag

    BEQ .unset_no_damage        ; BEQ: Skip if not blocked

    LDA #$08                    ; LDA: Set no-damage-sound flag

    TSB $0E                     ; TSB: Set bit 3

.unset_no_damage
    LDA $0E                     ; LDA: Get all flags

    STA $3BCC,Y                 ; STA: Store to action result flags

    LDA $7B46                   ; LDA: Load reflect animation flag

    BNE .reflected              ; BNE: Branch if spell was reflected

    LDA $3BCF,Y                 ; LDA: Load "actually hit" bitmap

    ORA $7B41                   ; ORA: Add target hit bits

    STA $3BCF,Y                 ; STA: Store updated hit bitmap

    BRA .check_target           ; BRA: Continue to target check

.reflected                      ; Handle reflected spell
    LDA $7B45                   ; LDA: Load reflected target

    STA $48                     ; STA: Store as current target

    LDA $3BD0,Y                 ; LDA: Load "reflected by" bitmap

    ORA $7B42                   ; ORA: Add reflector bits

    STA $3BD0,Y                 ; STA: Store updated reflect source

    LDA $7B41                   ; LDA: Load target hit bits

    BEQ .check_target           ; BEQ: Skip if no targets hit

    LDA $7B2C                   ; LDA: Load attacker number

    JSR $01B6                   ; JSR: Multiply by 8

    STA $0F                     ; STA: Store offset

    LDA $48                     ; LDA: Load target number

    CMP #$04                    ; CMP: Check if enemy

    BCC .reflected_to_ally      ; BCC: Branch if ally

    SBC #$04                    ; SBC: Get enemy index

.reflected_to_ally
    CLC                         ; CLC: Clear carry

    ADC $0F                     ; ADC: Add attacker offset

    TAX                         ; TAX: X = combined index

    LDA $7B43                   ; LDA: Load reflect target bits

    STA $7B49,X                 ; STA: Store reflect destination

    LDA $3BD1,Y                 ; LDA: Load reflect target bitmap

    ORA $7B43                   ; ORA: Add new targets

    STA $3BD1,Y                 ; STA: Store updated bitmap

.check_target
    LDA $7B44                   ; LDA: Load "cover" usage flag

    STA $3BD2,Y                 ; STA: Store covering character

    LDA $7B2C                   ; LDA: Load attacker number

    TAX                         ; TAX: X = attacker

    LDA $7B1C,X                 ; LDA: Load target count

    BEQ .end_of_command         ; BEQ: If 0 targets, end command

    INC $7ABC                   ; INC: Increment current target counter

    CMP $7ABC                   ; CMP: Compare with total targets

    BNE .next_target            ; BNE: If more targets, continue

.end_of_command                 ; All targets processed
    LDA $3BCF,Y                 ; LDA: Load "actually hit" bitmap

    BNE .target_specific_message ; BNE: Branch if anyone was hit

.no_targets_hit                 ; Attack missed everyone
    LDA.b #FILEPOS_MAGMES_INFO>>16  ; Load info message table bank

    LDY.w #FILEPOS_MAGMES_INFO      ; Load info message table address

    BRA .clear_battle_message   ; Continue to message display

    ; Padding
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP

.target_specific_message        ; Attack hit at least one target
    LDA $3BCC,Y                 ; LDA: Load action flags

    BPL .attack_from_ally       ; BPL: Branch if bit 7 clear (ally attack)

.attack_from_enemy              ; Enemy attack message
    LDA.b #FILEPOS_MAGMES_ENEMY>>16

    LDY.w #FILEPOS_MAGMES_ENEMY

    BRA .clear_battle_message

.attack_from_ally               ; Ally attack message
    LDA.b #FILEPOS_MAGMES_ALLY>>16

    LDY.w #FILEPOS_MAGMES_ALLY

.clear_battle_message
    STY $10                     ; STY: Store message table address

    STA $12                     ; STA: Store message table bank

    JSR $9965                   ; JSR: Set up message index
                                ;   - X = message number, Y = parameter

    LDA $3C5F,X                 ; LDA: Load message display number

    TAY                         ; TAY: Y = message number

    AND #$07                    ; AND: Get lower 3 bits (message index in byte)

    TAX                         ; TAX: X = bit index

    TYA                         ; TYA: A = message number

    LSR                         ; LSR: Divide by 8 (3 times)
    LSR
    LSR

    TAY                         ; TAY: Y = byte index in table

    LDA [$10],Y                 ; LDA [indirect long],Y: Load from message table
                                ;   - 24-bit indirect addressing
                                ;   - Uses $10-$12 as pointer + Y offset

    JSR $01DB                   ; JSR: Clear bit (7-X) if set in A
                                ;   - Checks if this message should display

    BNE .next_command           ; BNE: Branch if message should show

    JSR $9965                   ; JSR: Reset message index

    TDC                         ; TDC: A = 0

    STA $3C5F,X                 ; STA: Clear message (suppress it)

.next_command
    INC $7B2C                   ; INC: Increment attacker counter

    INC $79FB                   ; INC: Increment damage display counter

    STZ $7ABC                   ; STZ: Clear target counter

    STZ $7C08                   ; STZ: Clear MP drain flag

.next_target
    RTS                         ; RTS: Return

;===============================================================================
; FIX STALKER PROCESS
; Stalker boss splits into copies - this fixes HP tracking
;===============================================================================
org $C2758C
FIX_STALKER_PROCESS:
    JSR $01EC                   ; JSR: X = A * 128 (battle data index)
                                ;   - Calculates offset to character data

    LDA $201D,X                 ; LDA: Load status 4 flags
                                ;   - Bits: 01=petrify, 02=clear, 04=thrown,
                                ;     08=swap, 10=condemned, 20=near death,
                                ;     40=critical, 80=stone

    AND #$BF                    ; AND: Clear bit 6 (critical flag)
                                ;   - Prevents false critical state

    STA $201D,X                 ; STA: Store updated status

    REP #$20                    ; REP: 16-bit A

    TDC                         ; TDC: A = 0

    DEC                         ; DEC: A = $FFFF
                                ;   - Will be used as "maximum" comparison value

    STA $0E                     ; STA: Store $FFFF to $0E

    TDC                         ; TDC: A = 0

    TAY                         ; TAY: Y = 0 (monster slot index)

    TAX                         ; TAX: X = 0 (battle data index)

.set_lowest_hp                  ; Find monster with lowest HP
    LDA $4020,Y                 ; LDA: Load monster number

    CMP #$FFFF                  ; CMP: Check if slot is empty

    BEQ .continue               ; BEQ: Skip empty slots

    LDA $2206,X                 ; LDA: Load monster's HP

    CMP $0E                     ; CMP: Compare with current lowest

    BCS .continue               ; BCS: Skip if >= current lowest

    STA $0E                     ; STA: New lowest HP

.continue
    CLC                         ; CLC: Clear carry

    TXA                         ; TXA: A = X

    ADC #$0080                  ; ADC: Add $80 (next monster's data)

    TAX                         ; TAX: X = next monster offset

    INY                         ; INY: Next slot (2 bytes per entry)
    INY

    CPX #$0200                  ; CPX: Check if all slots processed

    BNE .set_lowest_hp          ; BNE: Loop for more monsters

;===============================================================================
; MP ADDITION TO SELF
; Handles MP recovery for the acting character
;===============================================================================
org $C26766
MP_ADDITION_SELF:
    LDX $7B73                   ; LDX: Load self MP recovery amount

    BMI $679E                   ; BMI: Skip if $FFFF (no recovery)
                                ;   - BMI checks bit 15 of X

    LDA $47                     ; LDA: Load actor number

    JSR $685C                   ; JSR: Calculate display index
                                ;   - X = damage/heal display index

    REP #$21                    ; REP: 16-bit A, clear carry

    LDA $7B73                   ; LDA: Load MP recovery amount

    ORA #$8000                  ; ORA: Set "healing" flag (bit 15)

    STA $3A4C,X                 ; STA: Store to display value
                                ;   - $8000 = heal, $4000 = miss

    NOP : NOP : NOP : NOP       ; Padding (optimized code)

    LDA $7B73                   ; LDA: Reload MP recovery

    AND #$3FFF                  ; AND: Mask to just the value

    STA $0E                     ; STA: Store to temp

    LDX $32                     ; LDX: Load attacker data index

    LDA $200A,X                 ; LDA: Load current MP

    ADC $0E                     ; ADC: Add recovery amount

    BCS .mp_overflow            ; BCS: Branch if overflow

    CMP $200C,X                 ; CMP: Compare with Max MP

    BCC .mp_normal_range        ; BCC: Branch if under max

.mp_overflow
    LDA $200C,X                 ; LDA: Cap at Max MP

.mp_normal_range
    STA $200A,X                 ; STA: Store new MP

    TDC                         ; TDC: A = 0

    SEP #$20                    ; SEP: 8-bit A

;===============================================================================
; MP ADDITION TO TARGET
; Handles MP recovery/drain for the target
;===============================================================================
org $C2679E
MP_ADDITION_TARGET:
    LDX $7B75                   ; LDX: Load target MP recovery amount

    BMI $67E0                   ; BMI: Skip if $FFFF (no recovery)

    LDA $7C61                   ; LDA: Load alternate target flag

    BEQ .get_target_no          ; BEQ: Use normal target if flag clear

    LDA $7C60                   ; LDA: Load alternate target number

    BRA .do_addition            ; BRA: Use alternate target

.get_target_no
    LDA $48                     ; LDA: Load normal target number

.do_addition
    JSR $685C                   ; JSR: Calculate display index

    REP #$21                    ; REP: 16-bit A, clear carry

    LDA $7B75                   ; LDA: Load MP recovery amount

    ORA #$8000                  ; ORA: Set healing flag

    STA $3A4C,X                 ; STA: Store to display

    NOP : NOP : NOP : NOP       ; Padding

    LDA $7B75                   ; LDA: Reload amount

    AND #$3FFF                  ; AND: Mask to value only

    STA $0E                     ; STA: Store to temp

    LDX $49                     ; LDX: Load target data index

    LDA $200A,X                 ; LDA: Load target's MP

    ADC $0E                     ; ADC: Add recovery

    BCS .mp_overflow            ; BCS: Handle overflow

    CMP $200C,X                 ; CMP: Compare with max

    BCC .mp_normal_range        ; BCC: Under max is fine

.mp_overflow
    LDA $200C,X                 ; LDA: Cap at Max MP

.mp_normal_range
    STA $200A,X                 ; STA: Store new MP

    TDC                         ; TDC: A = 0

    SEP #$20                    ; SEP: 8-bit A

;===============================================================================
; DISABLE ALL EFFECTS
; Clears all active visual effect slots
;===============================================================================
org $C1B660
DISABLE_ALL_EFFECTS:
    SEC                         ; SEC (Set Carry): Prepare for loop

    LDA #$70                    ; LDA: Start at effect slot $70

.begin
    TAX                         ; TAX: X = current slot

    STZ $D1D8,X                 ; STZ: Disable effect 0 at slot X

    STZ $D258,X                 ; STZ: Disable effect 8

    STZ $D2D8,X                 ; STZ: Disable effect 16

    STZ $D358,X                 ; STZ: Disable effect 24

    SBC #$10                    ; SBC: Subtract $10 (next slot down)
                                ;   - Carry was set, so no borrow

    BCS .begin                  ; BCS: Loop while A >= 0

    RTS                         ; RTS: Return

    NOP : NOP                   ; Padding

;===============================================================================
; BATTLE EFFECT 00h: MAGIC ATTACK
; Main spell casting effect handler
;===============================================================================
org $C1B677
BATTLE_EFFECT_00h:
    NOP : NOP : NOP             ; Padding (removed code)

    STZ $DB6B                   ; STZ: Clear overlay effect flag

    STZ $DB77                   ; STZ: Clear Aegis effect flag

    STZ $DBDF                   ; STZ: Clear effect sound balance

    JSR $9D93                   ; JSR: Wait for damage display to finish

    JSR $B536                   ; JSR: Execute casting effect

    JMP BATTLE_EFFECT_07h       ; JMP: Continue with post-cast effects

;===============================================================================
; BATTLE EFFECT 07h: MAGIC (NO CAST ANIMATION)
; Used for instant-cast or reflected spells
;===============================================================================
org $C1B68C
BATTLE_EFFECT_07h:
    JSR $9D93                   ; JSR: Wait for damage display

    JSR $8D47                   ; JSR: Get spell number

    TAX                         ; TAX: X = spell number for effect lookup

    JMP DO_EFFECT               ; JMP: Execute the spell's effect

    NOP : NOP : NOP : NOP       ; Padding
    NOP : NOP

;===============================================================================
; DO_EFFECT - Main effect execution routine
; X register contains effect number to execute
;===============================================================================
org $C1B69C
DO_EFFECT:
    BRA .do_effect              ; BRA: Skip over reserved space

    ; Reserved space for "fast nothing" optimization patch
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP

; Commented-out optimization code:
;   CPX #$00AA      ; Check for "Nothing" effect
;   BEQ .do_nothing
;   CPX #$00AC      ; Check for "No Damage" effect
;   BEQ .do_nothing
;   CPX #$00EE      ; Check for "Monster status set" effect
;   BNE .do_effect
;.do_nothing
;   RTS

.do_effect
    STZ $DB6A                   ; STZ: Clear reflect effect flag

.do_compound_effect             ; Entry for chained/compound effects
    STX $F86E                   ; STX: Store effect number

    STZ $F86D                   ; STZ: Clear "reflect target effect" flag

    STZ $DB6B                   ; STZ: Clear overlay flag

    STZ $DB77                   ; STZ: Clear Aegis flag

.do_additional_effect           ; Entry for additional/secondary effects
    INC $DB77                   ; INC: Enable Aegis effect check

    STZ $F86A                   ; STZ: Clear chain effect (low)

    STZ $F86B                   ; STZ: Clear chain effect (high)

    JSR $A847                   ; JSR: Set up effect data from number in X

    JSR $B300                   ; JSR: Refresh monster graphics, init effect flags

    LDA $F582                   ; LDA: Load effect execution type

    STA $D1BC                   ; STA: Store to active effect type

    AND #$3F                    ; AND: Mask to effect handler index

    ASL                         ; ASL: Multiply by 2 for jump table

    TAX                         ; TAX: X = table index

    JSR ($B746,X)               ; JSR indirect: Call effect handler via table
                                ;   - Jump table at $B746 contains handler addresses

    JSR DISABLE_ALL_EFFECTS     ; JSR: Clean up effect slots

    LDX $F86A                   ; LDX: Load chain effect number

    BNE .do_compound_effect     ; BNE: If chained effect, process it

    LDA $DB61                   ; LDA: Load character display flags

    BEQ .not_summon             ; BEQ: Branch if not summon display

    STZ $F8B4                   ; STZ: Clear summon state

    LDA #$80                    ; LDA: Set party display flag

    STA $DB60                   ; STA: Request party redraw

    JSR $02F2                   ; JSR: Wait for screen update

    LDA #$10                    ; LDA: Color math setting

    STA $BC85                   ; STA: Set color math designation

    LDA #$1F                    ; LDA: Full brightness

    JSR $B3FE                   ; JSR: Set Fixed Color Data brightness

    JSR $24D5                   ; JSR: Redraw character graphics

    JSR $B40A                   ; JSR: Restore sprite colors

    TDC                         ; TDC: A = 0

    STZ $7E                     ; STZ: Clear temp

    JSR $7B43                   ; JSR: Additional cleanup

.wait_bg_reset                  ; Wait for background reset (potential hang risk)
    JSR $02F2                   ; JSR: Wait for update

    LDA $D0EE                   ; LDA: Check BG reset flag

    BNE .wait_bg_reset          ; BNE: Loop until clear

    LDX $F86E                   ; LDX: Reload effect number

    CPX #$0068                  ; CPX: Check for "Ruby Light" (Carbuncle summon)
                                ;   - $0068 = Carbuncle's effect ID

    BNE .not_summon             ; BNE: Skip if not Carbuncle

    LDX #$0000                  ; LDX: Clear effect number

    STX $F86E                   ; STX: Clear stored effect

    LDX #$001F                  ; LDX: Load Reflect effect ID
                                ;   - Carbuncle casts Reflect on party

    BRA .do_additional_effect   ; BRA: Execute Reflect effect

.not_summon
    STZ $DB56                   ; STZ: Clear summon flag

    LDA $F86D                   ; LDA: Load reflect target flag

    BNE .end_effect             ; BNE: Skip if already processed reflect

    INC $F86D                   ; INC: Mark reflect as processed

    LDX $F86E                   ; LDX: Load effect number

    JSR $8D41                   ; JSR: Get reflect target characters

    BNE .do_additional_effect   ; BNE: If reflected, process on new targets

.end_effect
    STZ $DBDF                   ; STZ: Clear sound balance

    STZ $BC85                   ; STZ: Clear color math

    JSR $AD2D                   ; JSR: Update monster death displays

    JSR $1CB8                   ; JSR: Refresh monster graphics

    JMP $3CBB                   ; JMP: Clear battle message

;===============================================================================
; CHARACTER CODE 12h: MAGIC NAME
; Displays spell name in battle message
;===============================================================================
org $C08A85
CHAR_MAGIC_NAME:
    LDA $16A3                   ; LDA: Load spell number

    REP #$20                    ; REP: 16-bit A

    ASL                         ; ASL: Spell # * 2

    STA $0F                     ; STA: Store temp

    ASL                         ; ASL: Spell # * 4

    CLC                         ; CLC: Clear carry

    ADC $0F                     ; ADC: Add temp (now spell # * 6)
                                ;   - Each spell name is 6 bytes

    TAX                         ; TAX: X = name offset

    LDA $06                     ; LDA: Load 0 (from $06)

    SEP #$20                    ; SEP: 8-bit A

    STZ $09                     ; STZ: Clear character counter

.next_char                      ; Copy each character of spell name
    LDA FILEPOS_MAGNAME,X       ; LDA: Load character from name table

    CMP #$E0                    ; CMP: Check for icon byte

    BCS .continue               ; BCS: Skip icons (>= $E0)

    STA $19D3,Y                 ; STA: Store character (low)

    LDA #$00                    ; LDA: High byte = 0

    STA $1A13,Y                 ; STA: Store character (high)

    INY                         ; INY: Next output position

.continue
    INX                         ; INX: Next source character

    INC $09                     ; INC: Increment counter

    LDA $09                     ; LDA: Load counter

    CMP #$06                    ; CMP: Check if 6 characters done

    BNE .next_char              ; BNE: Loop for more

    STY $AB                     ; STY: Store output index

    JMP $8459                   ; JMP: Continue message processing

;===============================================================================
; CHARACTER CODE 11h: ITEM NAME
; Displays item name in battle message
;===============================================================================
org $C08AB7
CHAR_ITEM_NAME:
    LDA $16A2                   ; LDA: Load item number

    REP #$20                    ; REP: 16-bit A

    STA $0F                     ; STA: Store item #

    ASL                         ; ASL: Item # * 2
    ASL                         ; ASL: Item # * 4
    ASL                         ; ASL: Item # * 8

    CLC                         ; CLC: Clear carry

    ADC $0F                     ; ADC: Add original (now item # * 9)
                                ;   - Each item name is 9 bytes

    TAX                         ; TAX: X = name offset

    LDA $06                     ; LDA: Load 0

    SEP #$20                    ; SEP: 8-bit A

    STZ $09                     ; STZ: Clear counter

.next_char
    LDA FILEPOS_ITEMNAME,X      ; LDA: Load character from item name table

    CMP #$E0                    ; CMP: Check for icon

    BCS .continue               ; BCS: Skip icons

    STA $19D3,Y                 ; STA: Store character (low)

    LDA #$00                    ; LDA: High byte

    STA $1A13,Y                 ; STA: Store character (high)

    INY                         ; INY: Next position

.continue
    INX                         ; INX: Next source

    INC $09                     ; INC: Increment counter

    LDA $09                     ; LDA: Load counter

    CMP #$09                    ; CMP: Check if 9 characters done

    BNE .next_char              ; BNE: Loop

    STY $AB                     ; STY: Store output index

    JMP $8459                   ; JMP: Continue message processing

;===============================================================================
; CHARACTER CODE 10h: INTEGER
; Displays numeric value in battle message
;===============================================================================
org $C08AEA
CHAR_INTEGER:
    STZ $0C                     ; STZ: Clear "first digit found" flag
                                ;   - Used to skip leading zeros

    LDX $06                     ; LDX: X = 0 (digit index)

.next_num
    LDA $0C                     ; LDA: Load first-digit flag

    BNE .num_found              ; BNE: If digit found, always output

    LDA $10AD,X                 ; LDA: Load digit value

    BEQ .continue               ; BEQ: Skip leading zeros

    INC $0C                     ; INC: Mark first digit found

.num_found
    LDA $10AD,X                 ; LDA: Load digit value

    CLC                         ; CLC: Clear carry

    ADC #$53                    ; ADC: Add $53 to get ASCII '0'-'9'
                                ;   - $53 = font offset for digit '0'

    STA $19D3,Y                 ; STA: Store character (low)

    LDA #$00                    ; LDA: High byte = 0

    STA $1A13,Y                 ; STA: Store character (high)

    INY                         ; INY: Next output position

.continue
    INX                         ; INX: Next digit

    CPX #$0007                  ; CPX: Check if 7 digits processed

    BNE .next_num               ; BNE: Loop for more

    STY $AB                     ; STY: Store output index

    JMP $8459                   ; JMP: Continue processing

;===============================================================================
; INITIALIZE BATTLE GRAPHICS
; Sets up graphics-related WRAM areas
;===============================================================================
org $C10888
INIT_BATTLE_GFX:

org $C1095E
    LDA #$7E                    ; LDA: WRAM bank

    PHA                         ; PHA: Push to stack

    PLB                         ; PLB: Set as Data Bank

    LDX #$283E                  ; LDX: Count for main graphics area
                                ;   - Clears $7EB3B7-$7EDBF5

.init_1
    STZ $B3B7,X                 ; STZ: Clear byte

    DEX                         ; DEX: Decrement

    BPL .init_1                 ; BPL: Loop while >= 0

    LDX #$008A                  ; LDX: Count for direct page area
                                ;   - Clears $7E0070-$7E00FA

.init_2
    STZ $0070,X                 ; STZ: Clear byte

    DEX                         ; DEX: Decrement

    BPL .init_2                 ; BPL: Loop

    TDC                         ; TDC: A = 0

    LDX #$01FF                  ; LDX: Count for buffer area
                                ;   - Clears $7E7E09-$7E8008

.init_3
    STA $7E09,X                 ; STA: Clear byte (with accumulator)

    DEX                         ; DEX: Decrement

    BPL .init_3                 ; BPL: Loop

    LDX #$0FFF                  ; LDX: Count for effect area
                                ;   - Clears $7EDCF6-$7EECF5

.init_4
    STA $DCF6,X                 ; STA: Clear byte

    DEX                         ; DEX: Decrement

    BPL .init_4                 ; BPL: Loop

    LDX #$005F                  ; LDX: Count for image slots
                                ;   - Clears $7EF789-$7EF7E8

.init_image
    STZ $F789,X                 ; STZ: Clear "last displayed image" data

    DEX                         ; DEX: Decrement

    BPL .init_image             ; BPL: Loop

;===============================================================================
; GET TREASURES LOOTED
; Calculates percentage of treasure chests opened for status screen
;===============================================================================
org $C12EBF
GET_TREASURES_LOOTED:
    TDC                         ; TDC: A = 0

    TAX                         ; TAX: X = 0 (byte counter)

    STZ $7E                     ; STZ: Clear chest count

.begin                          ; Count set bits in chest flags
    LDA #$08                    ; LDA: 8 bits per byte

    STA $80                     ; STA: Store bit counter

    LDA $09D4,X                 ; LDA: Load chest flags byte

.get_bit                        ; Check each bit
    ASL                         ; ASL: Shift left, bit 7 to carry

    BCC .not_obtained           ; BCC: Skip if chest not opened

    INC $7E                     ; INC: Count this chest

.not_obtained
    DEC $80                     ; DEC: Next bit

    BNE .get_bit                ; BNE: Loop for 8 bits

    INX                         ; INX: Next byte

    CPX #$0020                  ; CPX: Check if 32 bytes ($20) processed
                                ;   - 32 bytes * 8 bits = 256 chest flags

    BNE .begin                  ; BNE: Loop for more bytes

    STZ $7F                     ; STZ: Clear high byte

    LDX #$0064                  ; LDX: Load 100 (for percentage)

    STX $80                     ; STX: Store multiplier

    JSR $FE67                   ; JSR: 16-bit multiply
                                ;   - ($7E) * ($80) = ($82: 32-bit result)

    LDX $82                     ; LDX: Load result (low 16 bits)

    STX $7E                     ; STX: Store

    LDX #TREASURES_TOTAL        ; LDX: Load total chest count constant

    STX $80                     ; STX: Store divisor

    JSR $FDE7                   ; JSR: 16-bit divide
                                ;   - ($7E) / ($80) = ($82) remainder ($84)

    LDX $82                     ; LDX: Load percentage result

    BRA $2EA7                   ; BRA: Continue to display

;===============================================================================
; PROGRAM OPTIMIZATIONS
; Various code size reductions that don't change behavior
; These replace longer instruction sequences with shorter equivalents
;===============================================================================
PROGRAM_OPTIMIZATION:

org $C21066
    LDA $47                     ; Load actor number
    TAX
    LDA $D0EEDB,X               ; Lookup table for gear offset
    TAX
    TDC
    TAY
    NOP : NOP : NOP : NOP : NOP ; Padding (replaced longer code)

org $C21285
    LDA $47
    TAX
    LDA $D0EEDB,X
    TAX
    TDC
    TAY
    NOP : NOP : NOP : NOP : NOP

org $C219EA
    LDA $41CC                   ; Load current actor
    ASL
    TAX
    REP #$21
    LDA $D0ED59,X               ; Magic address index lookup
    NOP : NOP : NOP : NOP : NOP : NOP : NOP : NOP
    ADC #$2D34                  ; First character's magic list
    STA $45
    TDC
    SEP #$20

org $C21A75
    LDA $41C0                   ; Load executing command
    REP #$20
    JSR $01B6                   ; Multiply by 8
    TAX
    TDC
    SEP #$20
    NOP : NOP

org $C21B0D
    LDA $41CC
    TAX
    LDA $D0ED85,X               ; Equipment data index
    TAY
    NOP : NOP : NOP : NOP : NOP

org $C21BBE
    LDA $41CC
    TAX
    LDA $D0ED85,X
    TAY
    NOP : NOP : NOP : NOP : NOP

org $C21EA8
    LDA $3D                     ; Current processing character
    ASL
    TAX
    REP #$20
    LDA $D0ED59,X
    TAX
    TDC
    SEP #$20
    NOP

org $C24056
    LDA $12
    ASL
    TAX
    REP #$20
    LDA $D0EEA5,X               ; Monster data offset table
    TAX
    TDC
    SEP #$20

org $C293B5
    LDA $47
    TAX
    LDA $D0EEDB,X
    TAX
    TDC
    TAY
    NOP : NOP : NOP : NOP : NOP

org $C29F42
    LDA $41CC
    PHX
    TAX
    LDA $CEFF84,X               ; Equipment setup index
    TAY
    PLX
    NOP : NOP

;===============================================================================
; GET 16-BIT DIGIT STRINGS
; Converts 16-bit number in X to ASCII digit string at $C4-$C7
;===============================================================================
org $C1FF2E
GET_16BIT_DIGIT:
    PHY                         ; PHY: Save Y

    REP #$20                    ; REP: 16-bit A

    TXA                         ; TXA: A = X (number to convert)

    SEP #$11                    ; SEP: 8-bit X, carry set
                                ;   - Unusual: sets X flag AND carry

    LDY $CE                     ; LDY: Load digit character base

    DEY                         ; DEY: Adjust for loop

    STY $7E                     ; STY: Store adjusted base

.count_thousands                ; Count how many 1000s
    SBC #$03E8                  ; SBC: Subtract 1000 ($3E8)

    INY                         ; INY: Increment count

    BCS .count_thousands        ; BCS: Loop while >= 0

    ADC #$03E8                  ; ADC: Add back 1000 (also sets carry)
                                ;   - Restore remainder

    STY $C4                     ; STY: Store thousands digit

    LDY $7E                     ; LDY: Reset counter

.count_hundreds                 ; Count how many 100s
    SBC #$0064                  ; SBC: Subtract 100 ($64)

    INY                         ; INY: Increment count

    BCS .count_hundreds         ; BCS: Loop

    ADC #$0064                  ; ADC: Add back 100

    STY $C5                     ; STY: Store hundreds digit

    LDY $7E                     ; LDY: Reset counter

    SEP #$20                    ; SEP: 8-bit A (for tens/ones)

.count_tens                     ; Count how many 10s
    SBC #$0A                    ; SBC: Subtract 10

    INY                         ; INY: Increment count

    BCS .count_tens             ; BCS: Loop

    STY $C6                     ; STY: Store tens digit

    ADC #$0A                    ; ADC: Add back 10

    ADC $7E                     ; ADC: Add character base

    STA $C7                     ; STA: Store ones digit

    REP #$10                    ; REP: 16-bit X/Y

    PLY                         ; PLY: Restore Y

    RTS                         ; RTS: Return

    ; Padding
    NOP : NOP : NOP : NOP : NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP : NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP : NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP : NOP : NOP : NOP : NOP
    NOP : NOP

;===============================================================================
; GET 24-BIT DIGIT STRINGS
; Converts 24-bit number at $70-$72 to ASCII digit string at $C4-$CB
;===============================================================================
org $C1FF88
GET_24BIT_DIGIT:
    PHY                         ; PHY: Save Y

    TDC                         ; TDC: A = 0

    TAX                         ; TAX: X = 0 (table index)

    TAY                         ; TAY: Y = 0 (output index)

    STZ $73                     ; STZ: Clear high byte

.begin                          ; Process each digit place
    REP #$20                    ; REP: 16-bit A

    SEC                         ; SEC: Set carry for subtraction

    STZ $78                     ; STZ: Clear digit counter

.count                          ; Count how many times place value fits
    LDA $70                     ; LDA: Load low 16 bits of number

    SBC $D97D09,X               ; SBC: Subtract place value (low)
                                ;   - Table contains: 10000000, 1000000, 100000,
                                ;     10000, 1000, 100, 10 (as 32-bit values)

    STA $74                     ; STA: Store tentative result

    LDA $72                     ; LDA: Load high 16 bits

    SBC $D97D0B,X               ; SBC: Subtract place value (high)

    BCC .break                  ; BCC: If borrow, we've counted enough

    STA $72                     ; STA: Store updated high bits

    LDA $74                     ; LDA: Load low result

    STA $70                     ; STA: Store updated low bits

    INC $78                     ; INC: Increment digit

    BRA .count                  ; BRA: Count more

.break
    SEP #$20                    ; SEP: 8-bit A

    LDA $78                     ; LDA: Load digit count

    ADC $CE                     ; ADC: Add character base

    STA $00C4,Y                 ; STA: Store digit character

    INY                         ; INY: Next output slot

    INX                         ; INX: Advance table index (4 bytes per entry)
    INX
    INX
    INX

    CPY #$0007                  ; CPY: Check if 7 digits done

    BNE .begin                  ; BNE: Loop for more digits

    LDA $70                     ; LDA: Load remainder (ones digit)

    CLC                         ; CLC: Clear carry

    ADC $CE                     ; ADC: Add character base

    STA $CB                     ; STA: Store final digit

    PLY                         ; PLY: Restore Y

    TDC                         ; TDC: A = 0

    RTS                         ; RTS: Return

    ; Padding
    NOP : NOP : NOP : NOP : NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP : NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP : NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP : NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP : NOP : NOP : NOP : NOP
    NOP : NOP
