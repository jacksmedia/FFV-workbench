;===============================================================================
; ff5_dresscode.commented.asm
;    Final Fantasy V: Dress Code - Job-based Map Sprites
;    COMMENTED VERSION - Opcode explanations for 65c816 learners
;
; PURPOSE:
;   This patch changes the overworld/map sprites to reflect each character's
;   current job class instead of their default appearance. If Bartz is a
;   Knight, he appears as a Knight on the map; if Lenna is a White Mage,
;   she appears as a White Mage, etc.
;
; TECHNICAL OVERVIEW:
;   - Hooks the sprite loading routines in the field engine
;   - Looks up the character's current job from save data
;   - Redirects DMA to load sprites from job-specific graphics banks
;   - Requires expanded ROM with job sprite graphics at $F9-$FC
;===============================================================================

hirom                           ; HIROM directive: Use HiROM memory mapping

;===============================================================================
; RAM AND ROM DEFINITIONS
;===============================================================================

!tempram_char = $1f10           ; Temporary storage for character ID
                                ;   - Located near top of stack area
                                ;   - Used during sprite lookup calculations

!jobtable = $f9ff00             ; ROM address of job sprite pointer table
                                ;   - Each entry is 3 bytes (24-bit pointer)
                                ;   - Points to graphics data for each job

;===============================================================================
; HOOK 1: Map Event Sprite Loader
; Original code determines which sprite to load for NPCs/events
;===============================================================================

org $c03ded                     ; ORG: Position at original comparison
                                ;   - Original: CMP #$4B / BCC $27
                                ;   - $4B = first character sprite ID

jml loadmap                     ; JML (Jump Long): 4-byte unconditional jump
                                ;   - Unlike JMP, JML can jump to any bank
                                ;   - Transfers control to our custom loader
                                ;   - DMA destination regs at $0B23-$0B25
                                ;     will be set by our routine

;===============================================================================
; HOOK 2: Leader/Walking Sprite Loader
; Handles the sprite shown when walking around the map
;===============================================================================

org $c01d70                     ; ORG: Toad transformation branch fix

db $0f                          ; DB: Change branch offset from $0E to $0F
                                ;   - Extends branch by 1 byte to hit our JML
                                ;   - Original branch landed before our hook

org $c01d7b                     ; ORG: Mini transformation branch fix

db $04                          ; DB: Change branch offset from $03 to $04
                                ;   - Same adjustment for Mini status

org $c01d7c                     ; ORG: Position for our hooks

jml loadleader                  ; JML: Jump to leader sprite loader
                                ;   - Original: LDA $0ADA (load map leader)

jml abortloadleader             ; JML: Jump target for Mini/Toad branches
                                ;   - These statuses use special sprites

nop                             ; NOP padding to fill remaining space
nop
nop
nop
nop
nop

;===============================================================================
; FREESPACE ROUTINE: loadmap
; Handles sprite loading for map events (NPCs, cutscenes, etc.)
; Located in expanded ROM area at $F9F000
;===============================================================================

org $f9F000                     ; ORG: Position in expanded ROM
                                ;   - File offset: $39F000 in headerless ROM

loadmap:                        ; Entry point for map sprite loading

cmp #$4b                        ; CMP: Compare A with $4B
                                ;   - A contains sprite ID to load
                                ;   - $4B = Bartz, $4C = Lenna, etc.
                                ;   - Values below $4B are non-character sprites

bcs doreplacemap                ; BCS (Branch if Carry Set): A >= $4B
                                ;   - If this is a character sprite, process it

bra abortloadmap                ; BRA: Not a character, use default loading

abortloadmap:                   ; Return to original sprite loading code

jml $C03E18                     ; JML: Jump back to original routine
                                ;   - Handles non-character sprites normally

;-------------------------------------------------------------------------------
; doreplacemap: Process Character Sprite Replacement
;-------------------------------------------------------------------------------

doreplacemap:                   ; A = character sprite ID ($4B+)

sec                             ; SEC (Set Carry): Prepare for subtraction

sbc #$4b                        ; SBC (Subtract with Carry): A = A - $4B
                                ;   - Converts sprite ID to character index
                                ;   - $4B->0 (Bartz), $4C->1 (Lenna), etc.

pha                             ; PHA: Save character index to stack

php                             ; PHP: Save processor flags

phx                             ; PHX: Save X register

phy                             ; PHY: Save Y register

dec                             ; DEC (Decrement): A = A - 1

dec                             ; DEC: A = A - 1 again
                                ;   - Adjusts because sprite IDs start after
                                ;     Toad ($00) and Mini ($01) sprites
                                ;   - Bartz's CHARACTER index is 0, but his
                                ;     SPRITE index is 2 ($4B - $49 = 2)

sta !tempram_char               ; STA: Store adjusted index to temp RAM

ldy #$0004                      ; LDY: Y = 4 (loop counter for 4 party slots)

ldx #$0000                      ; LDX: X = 0 (character data offset)

;-------------------------------------------------------------------------------
; Character Slot Search Loop
; Finds which party slot contains this character
;-------------------------------------------------------------------------------

charcheckloop:                  ; Loop through party slots

    lda $0500,x                 ; LDA: Load character ID from save data
                                ;   - $0500 = first character slot
                                ;   - Character data is $50 bytes per slot

    and #$07                    ; AND: Mask to character ID (bits 0-2)
                                ;   - Bits 3-7 contain other flags
                                ;     (hidden, row position, etc.)

    cmp !tempram_char           ; CMP: Compare with target character

    beq ischar                  ; BEQ: Found the character! Branch to process

    txa                         ; TXA: A = X (current offset)

    clc                         ; CLC: Clear carry for addition

    adc #$50                    ; ADC: Add $50 to check next slot
                                ;   - Each character slot is $50 bytes

    tax                         ; TAX: Update X with new offset

    dey                         ; DEY: Decrement loop counter

    cpy #$0000                  ; CPY: Check if more slots to check

    bne charcheckloop           ; BNE: Continue if slots remain

bra notchar                     ; BRA: Character not found in party

;-------------------------------------------------------------------------------
; ischar: Character Found - Load Job-Specific Sprite
;-------------------------------------------------------------------------------

ischar:

nop                             ; NOP: Reserved space for Moogle Suit patch hook
nop
nop

lda $501,x                      ; LDA: Load job ID from character data
                                ;   - Byte 1 of character data = current job
                                ;   - 0=Freelancer, 1=Knight, etc.

clc                             ; CLC: Clear carry for calculation

asl                             ; ASL (Arithmetic Shift Left): A = A * 2

adc $501,x                      ; ADC: A = A + job ID = job * 3
                                ;   - Each job table entry is 3 bytes
                                ;   - This calculates table offset

tax                             ; TAX: X = job table offset

lda !jobtable,x                 ; LDA: Load bank byte from job table
                                ;   - First byte of entry = bank ($F9-$FC)

sta $0b25                       ; STA: Store to DMA source bank register
                                ;   - $0B23-$0B25 = 24-bit DMA source address

rep #$20                        ; REP: Enable 16-bit accumulator

inx                             ; INX: Move to address bytes in table

lda !jobtable,x                 ; LDA: Load 16-bit address from table
                                ;   - Bytes 2-3 of entry = address

sep #$10                        ; SEP: 8-bit index mode (for character loop)

ldy !tempram_char               ; LDY: Load character index

rep #$10                        ; REP: Back to 16-bit index

beq skip_charselect_loop        ; BEQ: If Bartz (index 0), no offset needed

;-------------------------------------------------------------------------------
; Character Offset Loop
; Each character's sprites are $800 bytes apart within a job's graphics
;-------------------------------------------------------------------------------

charselect_loop:                ; Add $800 per character

clc                             ; CLC: Clear carry

adc #$0800                      ; ADC: Add $800 (2048 bytes per character)
                                ;   - Job graphics contain all 5 characters
                                ;   - Spaced $800 bytes apart

dey                             ; DEY: Decrement character counter

bne charselect_loop             ; BNE: Continue for remaining characters

skip_charselect_loop:

sta $0b23                       ; STA: Store 16-bit address to DMA registers
                                ;   - $0B23-$0B24 = address portion

ply                             ; PLY: Restore Y register

plx                             ; PLX: Restore X register

plp                             ; PLP: Restore processor flags

pla                             ; PLA: Restore original A

jml $c03e00                     ; JML: Jump to DMA execution routine
                                ;   - Performs the actual sprite load

;-------------------------------------------------------------------------------
; notchar: Character Not in Party - Use Default Sprite
;-------------------------------------------------------------------------------

notchar:

ply                             ; PLY: Restore registers

plx

plp

pla

jml $c03df4                     ; JML: Return to original code path
                                ;   - Loads default sprite

;===============================================================================
; FREESPACE ROUTINE: loadleader
; Handles sprite for the party leader (walking around the map)
;===============================================================================

loadleader:

LDA $0ADA                       ; LDA: Load map leader sprite ID
                                ;   - Native code we're replacing

cmp #$07                        ; CMP: Compare with $07 (Krile + 1)
                                ;   - Valid character IDs: $02-$06

bcs abortloadleader             ; BCS: If >= $07, not a main character

cmp #$02                        ; CMP: Compare with $02 (Bartz)

bcc abortloadleader             ; BCC: If < $02, not a main character
                                ;   - $00 = Toad, $01 = Mini sprites

jmp doreplaceleader             ; JMP: Process character sprite

;-------------------------------------------------------------------------------
; abortloadleader: Use Default Leader Sprite
;-------------------------------------------------------------------------------

notcharleader:

lda $0ADA                       ; LDA: Reload leader sprite ID

abortloadleader:                ; Entry point from Mini/Toad branches

  ASL                           ; ASL: Multiply by 2 for table index

  TAX                           ; TAX: X = table offset

  REP #$20                      ; REP: 16-bit A

  LDA $C01E02,X                 ; LDA: Load sprite address from default table

  STA $4302                     ; STA: Store to DMA address register
                                ;   - $4302-$4303 = DMA destination

jml $C01D8A                     ; JML: Continue with default loading

;-------------------------------------------------------------------------------
; doreplaceleader: Load Job-Specific Leader Sprite
;-------------------------------------------------------------------------------

doreplaceleader:

dec                             ; DEC: Adjust sprite ID
dec                             ;   - Same adjustment as loadmap

sta !tempram_char               ; STA: Store character index

ldy #$0004                      ; LDY: 4 party slots to check

ldx #$0000                      ; LDX: Start at first slot

charcheckloopleader:            ; Same search loop as loadmap

    lda $0500,x

    and #$07

    cmp !tempram_char

    beq ischarleader

    txa

    clc

    adc #$50

    tax

    dey

    cpy #$0000

    bne charcheckloopleader

bra notcharleader               ; Character not found

ischarleader:

nop                             ; Reserved for Moogle Suit hook
nop
nop

lda $501,x                      ; LDA: Get job ID

clc

asl                             ; Calculate job * 3

adc $501,x

tax

lda !jobtable,x                 ; LDA: Get bank byte

sta $4304                       ; STA: Store to DMA bank register

rep #$20                        ; REP: 16-bit A

inx

lda !jobtable,x                 ; LDA: Get address

sep #$10

ldy !tempram_char

rep #$10

beq skip_charselect_loopleader

charselect_loopleader:          ; Add $800 per character

clc

adc #$0800

dey

bne charselect_loopleader

skip_charselect_loopleader:

sta $4302                       ; STA: Store address to DMA

jml $c01d8a                     ; JML: Continue with sprite loading

;===============================================================================
; JOB SPRITE POINTER TABLE
; 3 bytes per job: Bank byte, Address low, Address high
; Note: Address is stored as high byte, low byte (unusual order)
;===============================================================================

org $f9ff00                     ; ORG: Position table at end of $F9 bank

jobtable:

; Format: db BANK, ADDR_LOW, ADDR_HIGH
; Example: $F9,$00,$00 means bank $F9, address $0000 = $F90000

;--- Bank $F9: Jobs 0-5 ---
db $F9,$00,$00                  ; Knight     - $F90000
db $F9,$00,$28                  ; Monk       - $F92800
db $F9,$00,$50                  ; Thief      - $F95000
db $F9,$00,$78                  ; Dragoon    - $F97800
db $F9,$00,$A0                  ; Ninja      - $F9A000
db $F9,$00,$C8                  ; Samurai    - $F9C800

;--- Bank $FA: Jobs 6-11 ---
db $FA,$00,$00                  ; Berserker  - $FA0000
db $FA,$00,$28                  ; Ranger     - $FA2800
db $FA,$00,$50                  ; Mystic Knight - $FA5000
db $FA,$00,$78                  ; White Mage - $FA7800
db $FA,$00,$A0                  ; Black Mage - $FAA000
db $FA,$00,$C8                  ; Time Mage  - $FAC800

;--- Bank $FB: Jobs 12-17 ---
db $FB,$00,$00                  ; Summoner   - $FB0000
db $FB,$00,$28                  ; Blue Mage  - $FB2800
db $FB,$00,$50                  ; Red Mage   - $FB5000
db $FB,$00,$78                  ; Beastmaster- $FB7800
db $FB,$00,$A0                  ; Chemist    - $FBA000
db $FB,$00,$C8                  ; Geomancer  - $FBC800

;--- Bank $FC: Jobs 18-20 ---
db $FC,$00,$00                  ; Bard       - $FC0000
db $FC,$00,$28                  ; Dancer     - $FC2800
db $FC,$00,$50                  ; Mimic      - $FC5000

;--- Bank $DA: Job 21 (Freelancer uses different location) ---
db $DA,$00,$D8                  ; Freelancer - $DAD800

;===============================================================================
; REFERENCE NOTES
;===============================================================================
; SPRITE ID MAPPING:
;   $00 = Mini sprite
;   $01 = Toad sprite
;   $02-$06 = Bartz, Lenna, Galuf, Faris, Krile
;   $07+ = NPCs, Boko, Moogles, etc.
;
; JOB ID MAPPING:
;   $00 = Knight        $0B = Time Mage
;   $01 = Monk          $0C = Summoner
;   $02 = Thief         $0D = Blue Mage
;   $03 = Dragoon       $0E = Red Mage
;   $04 = Ninja         $0F = Beastmaster
;   $05 = Samurai       $10 = Chemist
;   $06 = Berserker     $11 = Geomancer
;   $07 = Ranger        $12 = Bard
;   $08 = Mystic Knight $13 = Dancer
;   $09 = White Mage    $14 = Mimic
;   $0A = Black Mage    $15 = Freelancer
;
; CHARACTER DATA LAYOUT:
;   $0500-$054F = Character 1 (Bartz)
;   $0550-$059F = Character 2 (Lenna)
;   $05A0-$05EF = Character 3 (Galuf/Krile)
;   $05F0-$063F = Character 4 (Faris)
;   Byte 0: Character ID (bits 0-2) + flags
;   Byte 1: Current Job ID
;
; SPRITE DATA SIZE:
;   Each job contains all 5 character variants
;   Each character's sprites = $800 bytes (2048)
;   Total per job = $800 * 5 = $2800 bytes (10240)
;
; DMA REGISTERS USED:
;   $0B23-$0B25: Map event sprite source (24-bit)
;   $4302-$4304: Leader sprite source (DMA channel regs)
;===============================================================================
