# Final Fantasy V (SNES) - Disassembly Context Notes

ROM: RPGe 1.10 English Fan Translation (1998)
CRC32: 0x17444605 (header) / 0x892E44BE (JSON def)
Size: 0x280000 (2.5 MB), HiROM mode
CPU: 65c816 (native mode, 16-bit X/Y, 8-bit A default)

---

## 1. ROM BANK MAP - HIGH-LEVEL ARCHITECTURE

| Bank | Address Range | Purpose | Primary Source |
|------|--------------|---------|----------------|
| C0 | $C00000-$C0FFFF | Field engine, main loop, NMI/IRQ, init | 1337_5k37c3r.rtf + Lenophis.txt |
| C1 | $C10000-$C1FFFF | Battle graphics/UI, sprites, text rendering, VRAM | noisecross.txt |
| C2 | $C20000-$C2FFFF | Battle engine (ATB, damage, AI, commands) | Instructor_Trepe.txt + Modoh c2battle.asm |
| C3 | $C30000-$C3FFFF | Code $0000-~2FFF (fade/transition + more, mostly undisassembled) + compressed gfx + map palettes $BB00-E700 | Lenophis.txt (365 bytes only!) + DOC_GAP_AUDIT.md §2.7 |
| C4 | $C40000-$C4FFFF | Sound: 65816 loader ($0000-0645) + embedded SPC700 program ($064D+, undisassembled) + song ptr tables ($3B97+) | Lenophis.txt + DOC_GAP_AUDIT.md §2.6 |
| C5-C6 | $C50000-$C6FFFF | Music sequence/sample data (pointed to by C4/3B97, C4/3BA6, C4/3C99 tables) | DOC_GAP_AUDIT.md §2.5 |
| C8-C9 | $C80000-$C9FFFF | Event scripts (bytecode); C8/2220-3320 ptr tables unmapped | FF5Events folder |
| CA | $CA0000-$CAFFFF | UNIDENTIFIED data (RPGe edits 64 bytes; candidate: battle animation scripts) | DOC_GAP_AUDIT.md §2.5 |
| CB-CD | $CB0000-$CDFFFF | Compressed map layouts (LZSS) | JSON |
| CE | $CE0000-$CEFFFF | NPC scripts, triggers, NPC properties | JSON |
| CF | $CF0000-$CFFFFF | Tilesets, tile properties, world data | JSON |
| D0 | $D00000-$D0FFFF | Monster stats, battle groups, ROM tables | JSON + Modoh |
| D1 | $D10000-$D1FFFF | Attack/spell data, job stats, item props | JSON + Modoh |
| D2-D4 | $D20000-$D4FFFF | Battle char GFX (110=5×22 jobs), monster GFX, BG data | JSON |
| D5-D8 | $D50000-$D8FFFF | Monster graphics, attack animations | JSON |
| D9 | $D90000-$D9FFFF | Monster palettes, underwater palette | JSON |
| DA-DB | $DA0000-$DBFFFF | Map sprite graphics, world graphics | JSON |
| DC-DF | $DC0000-$DFFFFF | Map graphics (Layers 1-3), palettes | JSON |
| E0 | $E00000-$E0FFFF | Monster/command names, data decompression | Lenophis.txt |
| E1-E3 | $E10000-$E3FFFF | Dialog text (2160 strings) | JSON |
| E7 | $E70000-$E7FFFF | Map titles, ability/attack/item names | JSON |

---

## 2. BANK C0 - FIELD ENGINE & SYSTEM CORE

### 2.1 Boot Sequence (C0/0000-C0/00AA)
- RESET vector -> C0/CEC0 (SEI/CLC/XCE, JML $C00000); NMI vector -> C0/CEE0 = JML $001F00,
  IRQ vector -> C0/CEE4 = JML $001F04. **NMI/IRQ are dispatched through 4-byte RAM
  trampolines at $00:1F00/$00:1F04** — patch RAM $1F01-1F03 to intercept vblank globally
  with no ROM hook (see DOC_GAP_AUDIT.md §2.1).
- C0/0000: SEI, CLC, XCE -> native mode
- C0/0003-0005: REP #$10 (16-bit XY), SEP #$20 (8-bit A)
- C0/0007-000D: STZ $420D/$420B/$420C (SlowROM, DMA off, HDMA off)
- C0/0010: LDA #$8F -> STA $2100 (screen blanked, max brightness)
- C0/001D: LDX #$1FFF, TXS (stack at $1FFF)
- C0/0024: PLB -> data bank $00
- C0/0029: PLD -> direct page $0B00
- C0/002D: STX $06 -> "zero register" at $0B06
- C0/002F: JSL $C40000 (init sound engine)
- C0/0038: JSR $4E69 (Mode 7 setup)
- C0/003B: JSR $490A (clear $0000-$1CFF)
- C0/0043: JSL $C2A000 (game select/title screen)

### 2.2 New Game Init (C0/007D)
- JSR $48FA: Init player stats
- JSR $4528: Init character names
- JSR $450A: Reset all vehicles
- STA $4200 #$81: Enable NMI + auto joypad
- JSR $A217: Start event script engine

### 2.3 Main Game Loop (C0/00AD)
```
C0/00AD: JSR $4E41          ; Wait for NMI (frame sync)
C0/00B0: LDA $02            ; Joypad buttons
C0/00B2: AND #$40           ; X button -> menu
         [Menu opening logic]
C0/0147: JSR $061A          ; Map tile event handler
C0/014A: JSR $A18B          ; Event processing
C0/014D: LDA $58            ; Check restart signal
         [Signal handling]
C0/0160: LDX $0AD6          ; Current map ID
C0/0163: CPX #$0005         ; World map? (0-4)
         BCC -> $016B (vehicle handler)
         JMP -> $0262 (dungeon handler)
C0/016B: JSR $073E          ; Vehicle handler
         [Controlled event triggers for specific coordinates]
C0/0246: JSR $0F8C          ; Player movement
C0/024D: JSR $2137          ; Update player sprite
C0/0256: JSR $1EC5          ; Draw vehicles
C0/0259: JSR $1E64          ; Draw shadow
C0/025E: JMP $00AD          ; Loop
```

### 2.4 NMI Handler (C0/02D1)
Called once per frame (60Hz NTSC):
- Saves all registers (PHP, PHA, PHX, PHY, PHB, PHD)
- Sets DP=$0B00, data bank=$00
- Reads $4210 to acknowledge NMI
- Disables DMA ($420B)
- Updates: color math ($47->$2131), subscreen ($49->$212D)
- JSR $4D67: Write CGRAM (palette DMA)
- JSR $4D3E: Write VRAM (tile DMA)
- Camera update ($4BC0), sprite updates ($A0-A7 flags)
- HDMA configuration ($5E -> $420C)
- Frame counter increment: $094A-$094D (32-bit)
- System counters: $3F, $3E, $51

### 2.5 Key Field RAM Addresses
| Address | Purpose |
|---------|---------|
| $0002-03 | Joypad input (current/previous) |
| $0B06 | Zero register |
| $0053 | Field state flag |
| $0055, $57-58 | Event signal flags |
| $005E | HDMA channel mask |
| $0061, $63 | Player X/Y step counters |
| $006E | Trigger condition flag |
| $00A0-A7 | Sprite/animation update flags |
| $0134-35 | Game mode/state flags |
| $0139 | New game / save slot flag |
| $094A-4D | Frame counters (32-bit) |
| $0AD6 | Current map ID (0-4=world, 5+=dungeon) |
| $0AD8-A9 | Player X/Y coordinates |
| $0ADC | Player vehicle (0=walk, 1=chocobo..6=airship) |
| $1088-89 | Sprite position cache |

---

## 3. BANK C1 - BATTLE GRAPHICS & UI

### 3.1 Overview
~32,592 lines of disassembly. Handles all visual presentation during battle:
- Sprite/object animation system
- Text rendering engine (skills, items, jobs, commands)
- Menu/UI display structures
- Battle status display (HP/MP bars, names)
- VRAM management and DMA transfers
- Screen effects and transitions

### 3.2 Entry Points
- C1/000C: Jump table dispatcher (13 function pointers)
- C1/003F: Initialization (bank register, screen mode config)
- C1/15D1: VRAM write routine
- C1/19EA: ISR handler (dispatches on $DBF5 state: 0-4)
- C1/2A2F: Text display dispatcher
- C1/2A4B: Skill text rendering with icons

### 3.3 Display State Machine
Controlled by $DBF5 (0-4):
- 0: C1/18D2 (default display)
- 1: C1/1815 (text display)
- 2: C1/187F (character info)
- 3: C1/18AE (skill info)
- 4: C1/17F0 (item info)

### 3.4 Cross-Bank Calls FROM C1
- JSL $C40004: Music/sound playback (called frequently)
- JSR $FC74-$FFFF: Internal utility subroutines (math, display helpers)
- $FEBA: 8x8 or 16x8 multiplication
- $FE67: Display helper
- $FF88: Sprite positioning

### 3.5 Key C1 RAM
| Address | Purpose |
|---------|---------|
| $CF45-46 | Palette color indices |
| $CF4D, $CF53-58 | Visual attributes |
| $D0xx | Character position/display data |
| $D1xx | Extended battle display data |
| $DB98-9B | Music/sound control |
| $DBF5-F6 | Screen state selector |

---

## 4. BANK C2 - BATTLE ENGINE (from Modoh's c2battle.asm)

### 4.1 Architecture
- Address range: $C20000-$C2A000 (~40KB)
- DBR: $7E, Direct Page: $0000
- Entry: StartC2 ($C2/0000)
- Framework: Asar 1.81 relocatable code
- References: ff5_structures.asm (external defines file)

### 4.2 Battle Initialization Flow
```
StartBattle ($C2/4CE0)
  -> InitBattle ($C2/4F0A)
     -> Clear $2000-$7BFF (battle RAM)
     -> Copy BattleData from field -> $7C74
     -> Init ATB wait time from $D0ECF2 speed table
     -> Load timer constants from $D12976 (11 bytes)
     -> Init 12 participant structures (4 party + 8 monsters)
  -> Init RNG from RAM checksum
  -> Load encounter from $D03000
  -> Copy monster IDs/flags to battle RAM
  -> Load monster stats from ROM
```

### 4.3 Main Battle Loop ($C2/5872)
```
1.  Copy MenuData from C1 (14 bytes)
2.  Check ResetBattle ($7CD8)
3.  Increment BattleTickerA -> cascade BattleTickerB (25% tick rate)
4.  CheckMonsterDeath ($C2/6265)
5.  UpdateMonsterList ($C2/5A41)
6.  CheckPartyDeath ($C2/6257)
7.  HandleATBMenu ($C2/176C) [if not reacting]
8.  CopyHPMPStatus ($C2/5921) [merge status + always-status]
9.  CallC1 routine $03 (wait frame)
10. CheckBattleEnd ($C2/5AB4) -> exit if $7BDE set
11. Check WaitModePause ($7C52)
12. UpdateMonsterRows ($C2/5B6C)
13. ATBWait ($C2/2432) + UpdateTimers ($C2/200B)
14. FindEndedTimers ($C2/20B2) + ApplyTimerEffects ($C2/2177)
15. HandleReactions ($C2/35E3)
16. Random_0_99 ($C2/02A2) [consume RNG]
17. Loop -> step 1
```

### 4.4 Character Structure (128 bytes per participant, base $2000)
```
Offset  Size  Field
+$00    1     CharRow (bit 6 = not on team)
+$01    1     Job
+$02    1     Level
+$06    2     CurrentHP
+$08    2     MaxHP
+$0A    2     CurrentMP
+$0C    2     MaxMP
+$13    1     RHWeapon
+$14    1     LHWeapon
+$15    1     CaughtMonster
+$1A    1     Status1 (Death=80, Stone=40, Zombie=02)
+$1B    1     Status2 (Sleep=01, Paralyze=04, Charm=08, Berserk=08)
+$1C    1     Status3 (Reflect=80)
+$1D    1     Status4 (Erased=80, Hiding=01, Singing=04)
+$1E    1     CmdStatus
+$1F    1     DamageMod
+$20    1     Passives1
+$21    1     Passives2
+$28    1     EquippedStr
+$2B    1     EquippedMag
+$44    1     MonsterAttack
+$56    1     ActionFlag
+$57    1     Command
+$58    1     MonsterTargets
+$59    1     PartyTargets
+$5A    1     SelectedItem
+$62    1     MonsterM (multiplier)
+$70-73 4     AlwaysStatus1-4 (persistent)
+$74    1     BonusStr (song modifier)
+$78    1     BonusLevel
+$7A    1     MSwordAnim
```
Party: $2000-$21FF (4 * $80), Monsters: $2200-$25FF (8 * $80)

### 4.5 Battle State RAM
| Address | Purpose |
|---------|---------|
| $7B2D-3D | AtkType[] per command |
| $7B40 | FightFlag |
| $7B42-44 | Reflector/Reflectee/Covered bitmasks |
| $7B46 | Reflected flag |
| $7B69-7A | BaseDamage[] (raw) |
| $7B7E-81 | CombinedStatus.S1-S4 |
| $7BDE | BattleOver flag |
| $7C20 | BlueLearnedCount |
| $7C21-28 | BlueLearned[] (8 spells) |
| $7C4C | SandwormBattle flag |
| $7C51 | QuickTurns |
| $7C52 | WaitModePause |
| $7C53-54 | BattleTickerA/B |
| $7C55 | RNGPointer |
| $7C74-87 | BattleData (event flags, magic lamp) |
| $7C94-96 | BattleTimer + enable |
| $7C98-99 | SpellCheckStone/Death |
| $7CD8 | ResetBattle flag |

### 4.6 ATB System
- Per-participant timers: $3D7F-$3D92
- Enable flags: $3CFB-$3D0E
- Wait time from ROM: $D0ECF2 (speed table)
- Tick rate: 25% (BattleTickerB increments every 4 frames)
- Display ATB values: $3ED0-$3EDD

### 4.7 Attack Processing Flow
```
ProcessTurn ($C2/48BD)
  -> ProcessCommands ($C2/9427)
     -> Load AtkType from MultiCommand
     -> For each command:
        -> Determine target (TargetType bits)
        -> Collect MP cost
        -> SetupAndLaunchAttack ($C2/6408)
           -> Hit determination (Attacker Lvl + Hit - Target Lvl)
           -> Base damage by AtkType:
              Swords: Str * WpnPwr / 128 + BaseDmg
              Fists:  Str * WpnPwr / 128 + BarehandDmg
              Magic:  Mag * SpellPwr / 128
              Monster: MonsterAtk * (1 + MonsterM)
           -> Modifiers: multi-target(-50%), back row(-50%),
              double grip(+50%), status bonuses, creature type
           -> Element check (weakness/resist/absorb)
           -> Cap at 9999
           -> ApplyDamage ($C2/654D)
```

### 4.8 Attack Type Reference
| ID | Type | ID | Type |
|----|------|----|------|
| 30 | Fists | 01 | Monster Fight |
| 31 | Swords | 06 | Magic Attack |
| 32 | Knives | 07 | Gravity (% HP) |
| 33 | Spears | 08 | Flare (fixed) |
| 34 | Axes | 0D | Drain (HP steal) |
| 35 | Bows | 10 | Heal |
| 37 | Katanas | 11 | Full Heal |
| 38 | Whips | 50 | Goblin Punch |
| 39 | Bells | 5A | White Wind |
| 3A | Long Reach Axes | 5F | Requiem |

### 4.9 Monster AI System
- AI scripts are bytecode at per-monster pointers
- ProcessAIScript ($C2/313B) interprets opcodes
- MonsterAIScript buffer: $4367-$437F (25 bytes per monster)

AI Conditions ($00-$12):
- $00: Always succeed
- $01: Check status bit
- $02: HP less than value
- $04: Alone (last monster)
- $06: Reaction to element
- $08: Reaction to magic ID
- $0D: Check event flags
- $10: One party member alive

Reaction system: dual sets per character (Reaction1/Reaction2)
- Triggered by: command, element, magic, item, targeting, HP threshold
- HandleReactions ($C2/35E3) processes all queued reactions

### 4.10 Cross-Bank Calls FROM C2
- CallC1 ($C2/0069): JSL C1/0000 (graphics commands)
  - $00=open menu, $01=close, $02=init gfx, $03=wait frame
  - $05-06=item/magic menu, $09=regen/poison display
- MusicChange ($C2/006E): JSL C4/0004
- ROM data: $D03000 (encounters), $D10B80 (magic), $D0ED85 (tables)
- CleanupFieldItems: JSL $D0EF78

---

## 5. BANK C3 - MENU SYSTEM

### 5.1 Overview
Partial disassembly by Lenophis. Contains:
- Palette data ($C3BB00-$C3E700): 44 palette sets, 256 colors each, BGR555
- Menu rendering routines
- Item/equipment/magic selection interfaces

### 5.2 Window/Label Drawing Routines
C3 handles the actual rendering of text labels to the tilemap for menu screens:
- **C3/B5AB-B5AD**: Loading screen clock label (the ":" colon display)
  - B5AB: label reference (which string/tile to draw)
  - B5AD: X tilemap position offset
- These are the FINAL writers to the VRAM tilemap — C2's staging ($034x) feeds into C3's rendering
- The noisecross TextEditor (GUI tool for RPGe) can identify and edit these window routines directly

### 5.3 Palette Data
- 44 sets starting at $C3BB00
- Each set: 512 bytes (256 colors * 2 bytes BGR555)
- Covers all map palette assignments

---

## 5A. GAME SELECT / SAVE SCREEN (C2/A000+)

### 5A.1 Save Screen Display (C2/C6B8)
Entry 5 in the dispatch table at C8/2F70. Sets up the save/load screen:
```
C6B8: PHB / PHP / REP #$20
C6BC: LDX #$EF85, LDA #$0017, JSR $DA9D   ; copy 24 bytes from C0/EF85 to WRAM $2BBE
C6C5: LDA #$5000, STA $2BBA
C6CB: JSR $DDD7                             ; render tiles from 2BBE layout table
C6D0: LDA #$3012, JSR $C8DE                 ; text cursor setup (E7 string staging)
C6D4: LDX $80                               ; save slot index
C6D6: LDA $050A,X -> STA $29DF              ; save slot metadata
C6DC: SEP #$20, LDA $051A,X -> STA $29E1
C6E3: PLP / PLB / RTS
```

### 5A.2 C8DE - Shared Text Staging Routine (6 callers)
Sets up E7 string addresses in WRAM $0340-$034F for downstream C3 rendering:
```
C8DE: PHB / PHP / REP #$20
C8E2: PHA                        ; push parameter (e.g. $3012) on stack
C8E3: JSR $D0B2                  ; setup
C8E6: LDA $7E / ASL / TAX        ; X = 2 * slot_index
C8EA: LDA $C0EB08,X              ; tilemap pointer from table
C8EE: TAX / PHX                  ; save pointer
C8F0: LDY #$0348, LDA #$0007
C8F6: MVN $7E,$7E                ; copy 8 bytes from tilemap(X) to $0348-$034F
C8F9: PLX
C8FA: STZ $0000,X through $0006,X  ; clear 4 tilemap positions
C906: LDA $0348 / ADC param / STA $0348   ; tile 0 += param → E7 address
C90F: LDA $034C / ADC param / STA $034C   ; tile 2 += param → E7 address
; Secondary row: checks X-$20, copies to $0340-$0347, adds param to $0340
C93D: PLA / PLP / PLB / RTS
```
- 6 callers with different E7 base params: $3C1C, $3012, $3B3C, $1E98, $1016, $1016
- $0348/$034C are staging values consumed by C3 window routines (NOT directly by C2 code)
- **Key lesson**: $034x has no direct readers in C2 — C3's window system is the downstream consumer

### 5A.3 Tilemap Pointer Table (C0/EB08)
Per-save-slot staging area addresses:
```
Entry 0: $0240   Entry 1: $0248   Entry 2: $0250   Entry 3: $0258
Entry 4-11: $0002, $002E, $005A, $0086, $00B2, $0000, $0501, $05FE
```

### 5A.4 Time Display - Two Independent Rendering Paths
**Path 1 - In-game menu TIME (hardcoded, always works):**
```
C2/E3A6: PHB/PHP, DBR=$7E, SEP #$20
  STA $91 (hours), XBA, STA $92 (minutes)
  JSR $E44E (render hour digits)
  REP #$20
  LDA #$00CF              ; ← HARDCODED colon tile
  STA $0000,X             ; write to tilemap buffer
  ... JSR $E4ED (render minute digits)
  PLP/PLB/RTS
```
- Called from: C2/C409 (in-game menu), C2/E3EE (via E3E3 wrapper)

**Path 2 - Loading screen clock (C3 window label):**
- C3/B5AB-B5AD: label reference + X position for the ":" on the save/load screen
- Reads colon character from E7 string table (affected by blanked $CF)
- Fix: changed label reference at C3/B5AB to match Path 1's source; adjusted X offset at C3/B5AD

**E3E3 - Time Display Wrapper (reads save data):**
```
C2/E3E3: PHP, SEP #$20
  LDA $7A00,X (hours), XBA, LDA $7B00,X (minutes), XBA
  JSR $E3A6 (render with hardcoded CF)
  PLP/RTS
```
- Callers: C2/A611 (game select), C2/CABB, C2/E3F4

### 5A.5 E7 String Table & Pointer Table
- E7 bank: null-terminated strings for menu labels
- Pointer table at $C0/F987: 2-byte LE pointers into E7 bank
- String rendering at C2/C32D: loads string ID from DP $E0, looks up via `LDA $C0F987,X`, jumps to $E02FF0
- General text engine at C0/92BD: `LDA $E70000,X` loop, writes to $1B00,Y WRAM buffer

---

## 6. BANK C4 - SOUND ENGINE

### 6.1 Overview
Disassembled by Lenophis. Contains the SPC700 audio driver:
- Entry: $C40000 (init), $C40004 (play command)
- Called from C0 (field), C1 (battle gfx), C2 (battle engine)
- Handles music playback, sound effects, volume control
- MusicData buffer at $1D00
- Control flag at $DBB3

---

## 7. BANK E0 - DATA UTILITIES

### 7.1 Overview
Partial disassembly by Lenophis. Contains:
- Monster name table ($E00050-$E00F50): 384 names, 10 chars each
- Battle command names ($E01150-$E013F0): 96 names, 7 chars each
- Data decompression routines
- Text encoding utilities

---

## 8. EVENT SCRIPTING SYSTEM (Banks C8-C9)

### 8.1 Overview & Architecture
Events are bytecode scripts stored in $C849DC-$C9FF9C (1940 scripts).
Interpreted by C0's event handler at $046A.

**Three Script Types:**
- **Event Scripts** (1940): Main game scripts, 3-byte pointer table at $C83320-$C849DC
- **NPC Scripts** (922): NPC dialog/behavior, encoding = [trigger conditions] + [npcDialog fallback]
  - Pointer table: $CE0000-$CE0740, data: $CE0740-$CE2294
- **Trigger Scripts** (704): Map tile trigger conditions, encoding = trigger
  - Pointer table: $D8E080-$D8E600, data: $D8E600-$D8FFA8

**Named Event Scripts:**
```
0=No Event, 1-8=NPC Dialog 1-8, 16=Game Start, 38=Intro, 323=Ending,
1407=Restore Party HP/MP/Status, 1792-1799=Piano Practice 1-8
```

**Event Characters (used by $A8/$A9/$BA-$BC):**
0=Butz, 1=Lenna, 2=Galuf/Krile (shared slot), 3=Faris

### 8.2 Event Opcodes (complete reference from ff5u-sfc.json)

**Object Actions ($00-$7F party, $80-$A0 NPC/object)**
$00-$7F: Party member action (action embedded in opcode, 1 byte)
  - Party opcodes $0B/$0C differ: $0B=Enable Walking Anim, $0C=Disable Walking Anim
  - Party opcodes $10+ map to objectAction[$10+], i.e. shifted by 16
$80-$A0: Object action (2 bytes: opcode=object ID bits 6-0, byte2=action)
  - Object IDs: 0-31 (32 max), refer to NPCs on current map

**Object Action Table (82 actions, $00-$51):**
```
$00=Do Nothing        $01=Move Up          $02=Move Right
$03=Move Down         $04=Move Left        $05=Jump 1 Tile
$06=Jump 2 Tiles      $07=Toggle Sprite Priority (Top)
$08=Toggle Sprite Priority (Bottom)
$09=Show Object       $0A=Hide Object      $0B=Toggle Walking Animation
$10=Anim Speed Normal $11=Anim Speed Slowest $12=Anim Speed Slow
$13=Anim Speed Fast   $14=Toggle Layer Priority (Top)
$15=Toggle Layer Priority (Bottom)
$20=Face Up           $21=Face Up (Walking)     $22=Face Right
$23=Face Right (Walk) $24=Face Down             $25=Face Down (Walking)
$26=Face Left         $27=Face Left (Walking)
$28=Face Down (Alt)   $29=Face Up (Alt)         $2A=Face Left (Alt)
$2B=Face Left (Walk, Alt) $2C=Face Down (h-flip) $2D=Face Up (h-flip)
$2E=Face Left (h-flip)    $2F=Face Right (h-flip)
$30=Down (R Hand <)   $31=Down (R Hand -)   $32=Down (R Hand >)
$33=Down (L Hand >)   $34=Down (L Hand -)   $35=Down (L Hand <)
$36=Up (R Hand >)     $37=Up (R Hand <)     $38=Up (L Hand <)
$39=Up (L Hand >)     $3A=Left (Arm Up)     $3B=Left (Arm Forward)
$3C=Right (Arm Up)    $3D=Right (Arm Forward)
$3E=Down (Head Down)  $3F=Up (Head Down)    $40=Left (Head Down)
$41=Right (Head Down)
$42=Knocked Down      $43=Knocked Down (h-flip)
$44=Kick Left         $45=Kick Right        $46=Laugh 1  $47=Laugh 2
$48=Crouching         $49=Jumping           $4A=Surprised
$4B=Up (Alt)          $4C=Down (Angry)      $4D=Up (Arms Up <>)
$4E=Up (Arms Up ><)   $4F=Down (Head <)     $50=Down (Head >)
$51=Up (Symmetric)
```

#### Category: Control
```
$70-$75: Wait (1) — 0=15f/0.25s, 1=30f/0.5s, 2=45f/0.75s,
                     3=60f/1s, 4=90f/1.5s, 5=120f/2s
$7C: Stop Timer (1)
$A2-$A5 xx: Change Event Switch (2) — 4 opcodes = 2 banks × on/off
  byte 1: switch index (0-511, 9-bit across bank pair)
  bank = (opcode - $A2) >> 1, polarity = (opcode - $A2) & 1 (0=On, 1=Off)
$A6/$A7 xx: Change Battle Switch On/Off (2) — byte 1=switch (0-255)
$B2 xx: Wait Frames (2) — byte 1=frame count
$B3 xx: Wait Seconds (2) — byte 1 × 0.25 = seconds
$C7 xx: Parallel Commands (2) — byte 1=byte count of parallel block
$CD xx xx: Call Subroutine (3) — bytes 1-2=16-bit event script index
$CE xx xx: Repeat Sequential (3) — byte 1=count, byte 2=bytes per iteration
$CF xx xx: Repeat Parallel (3) — byte 1=count, byte 2=bytes per iteration
$D1 xx xx xx: Start Timer (4) — byte 1=duration, bytes 2-3=event ID (16-bit)
$D7 xx xx xx: Start Timer + Music Speedup (4) — same as $D1 but speeds up music
$E7: Branch on Characters Present (1)
$F1 xx: Branch Forward 50% Random (2) — byte 1=skip count (+1)
$FF: End of Script (1)
```

#### Category: Dialogue
```
$A0 xx: Show NPC Dialogue (2) — byte 1=dialog offset (+1, so 0→dialog 1)
$AD xx: Display Inn Dialogue (2) — byte 1=price: 0=10GP..7=80GP (×10)
$C8 xx xx: Display Dialogue (3) — bytes 1-2: bits 14-0=dialog ID (0-2159)
$EA: Show Map Title (1)
$F0 xx xx: Display Dialogue Yes/No (3) — bytes 1-2: bits 14-0=dialog ID
```

#### Category: Character
```
$A8 xx: Change Character HP (2):
  bits 7-6=Character (0=Butz,1=Lenna,2=Galuf/Krile,3=Faris)
  bit 5=Add(0)/Subtract(1)
  bits 4-0=Amount: 0=10, 1=20, 2=50, 3=100, 4=200, 5=500, 6=1000, 7=2000, 31=Max
$A9 xx: Change Character MP (2) — same layout, max restores to max MP
$BA/$BB/$BC xx xx: Change Status (3):
  opcode: $BA=Remove(AND), $BB=Set(OR), $BC=Toggle(XOR)
  byte 1=Character (same as above)
  byte 2=Status flag bitmask (indexes status enumeration)
$B7 xx: Add/Remove Character (2):
  bits 2-0=Character (indexes characterNames)
  bit 3=Gender (0=Male, 1=Female)
  bits 5-4=Battle Order
  bit 6=Present (inverted: 0=present, 1=not)
  bit 7=Add(0)/Remove(1)
```

#### Category: Inventory
```
$AA/$AB xx: Give/Take Item (2) — $AA=Give, $AB=Take, byte 1=item index
$AC xx: Give Spell (2) — byte 1=spell index (into attackName)
$AF/$B0 xx: Give/Take GP (2) — $AF=Give, $B0=Take, byte 1=GP amount ×10
$C6 xx: Give Job (2) — byte 1=job index (reversed order via jobNameReversed)
```

#### Category: Object
```
$B1 xx: Change Party Sprite (2) — 0=Tiny, 1=Frog, 2=Butz, 3=Lenna,
  4=Galuf, 5=Faris, 6=Krile, 7=Chocobo, 8=Moogle, 9=Ship, 10=Airship,
  11=Tent, 12=Cabin
$C1 xx: Change Party Graphics Alt (2) — same sprite table as $B1
$D3 xx xx xx: Change Object Position Absolute (4):
  byte 1: bits 5-0=Object ID (into object table, 32 max)
  byte 2: bits 5-0=X position, bits 7-6=Direction (0=Up,1=Right,2=Down,3=Left)
  byte 3: bits 5-0=Y position
$D8 xx xx: Change Object Position Relative (3):
  byte 1: bits 5-0=Object ID, bits 7-6=Direction
  byte 2: bits 7-4=X offset (signed 4-bit), bits 3-0=Y offset (signed 4-bit)
$DB: Update Party Sprite (1)
```

#### Category: Screen
```
$76/$77/$78: Scroll Speed (1) — $76=Normal(1×), $77=Fast(2×), $78=Slow(½×)
$7E: Stop Fade (1)
$AE xx: Pixelate Screen (2) — byte 1=speed
$B8/$B9 xx: Color Math Add/Subtract (2):
  byte 1: bits 7-5=Color (0=Black,1=Red,2=Green,3=Yellow,4=Blue,5=Magenta,
           6=Cyan,7=White), bits 4-3=Speed (0=Slow,1=Med,2=Fast,3=Fast),
           bits 2-0=Intensity
$BE xx: Shake Screen (2) — byte 1=amplitude
$C0 xx: Change Window Mask (2) — byte 1=mask value
$C3/$C4 xx: Fade In/Out (2) — $C3=In, $C4=Out, byte 1=speed
$C5 xx: Flash Screen (2) — byte 1 bits 7-5=Color (same as B8/B9 color table)
$D9 xx xx: Change Palette (3) — byte 1=VRAM palette slot, byte 2=palette index
$E6: Grayscale Palette (1)
```

#### Category: Map
```
$79: Show Mini-Map (1)
$C2 xx: Hide Vehicle (2) — byte 1=vehicle index
$D2 xx xx xx xx: Show Vehicle (5):
  byte 1=World Map index (0-2)
  byte 2=X position, byte 3=Y position
  byte 4: bits 7-5=Vehicle ID, bits 4-2=Vehicle type (0-6), bits 1-0=Graphics
$D6 xx xx xx: Change Vehicle (4):
  bytes 1-2: bits 12-0=Map, bit 13.5=Unknown
  byte 3: bits 7-5=Vehicle ID, bits 4-2=Vehicle type, bits 1-0=Graphics
$E0/$E1/$E3 xx×5: Change Map (6):
  opcode: $E0=Fade Out/In, $E1=No Fade, $E3=Fade Out Only
  bytes 1-2: bits 9-0=Destination Map ID
  byte 2: bit 5=Show Map Title, bit 6=Set Parent Map, bit 7=Unknown
  Dungeon (map≥5): byte 3 bits 5-0=X, bits 7-6=Direction; byte 4 bits 5-0=Y
  World (map<5): byte 3=full X, byte 4=full Y; byte 5 bits 7-5=Vehicle
$F3/$F4 xx xx xx: Map Background Abs/Rel (4):
  $F3=Absolute, $F4=Relative to Party
  byte 1: bits 7-6=Layer (0=L1,1=L2,2=L3), bits 5-0=X (absolute or signed)
  byte 2: bits 5-0=Y (absolute or signed)
  byte 3: bits 3-0=Width(+1), bits 7-4=Height(+1)
```

#### Category: Sound
```
$B4 xx: Play Song (2) — byte 1=song index (0-71)
$B5 xx: Play Sound Effect (2) — byte 1=SFX index (0-255)
$C9 xx xx: Resume Suspended Song (3):
  byte 1: bits 7-4=Envelope Duration, bits 3-0=Relative Volume
  byte 2: bits 7-4=Initial Absolute Volume, bits 3-0=Final Absolute Volume
$D0 xx xx: SPC Interrupt (3) — byte 1=interrupt, byte 2=parameter
$D4 xx xx xx: Play Song Manual (4):
  byte 1=Song, byte 2: bits 7-4=Envelope, bits 3-0=Relative Vol
  byte 3: bits 7-4=Initial Vol, bits 3-0=Final Vol
$D5 xx xx xx: Play SFX Manual (4):
  byte 1=SFX, byte 2: bits 7-4=Envelope, bits 3-0=Initial Relative Vol
  byte 3: bits 3-0=Final Relative Vol, bits 7-4=Absolute Vol
$E4/$E5: Wait for SPC Port-2/Port-3 (1)
```

#### Category: Menu/Misc
```
$7A: Open Name Change Menu (1)
$7B/$7D/$7F: Undocumented commands (1 each)
$A1 xx: Open Shop Menu (2) — byte 1 bits 5-0=shop index (0-63)
$B6 xx: Show Cutscene (2) — byte 1: 240=Credits, 241=Title, 242=Tycoon Meteor,
  244=Walse Meteor, 246=Gohn Meteor, 248-251=Various
$BF xx: Special Command (2) — 0=Game Over, 2=Crystal Shatters, 11=Tower Sinking
$DA xx xx xx: Command $DA (4) — 3 parameter bytes (undocumented)
$DC xx: Open Tutorial Menu (2) — 0-4=Jobs 1-5, 5=Battle Row, 6=Battle Order
$DD xx xx: Change RAM (3) — bytes 1-2: 16-bit offset (+$0500), byte 3: value
$EB: Command $EB (1) — (undocumented)
```

#### Category: Battle
```
$BD xx xx: Battle Normal (3):
  byte 1: bits 6-0=Battle group (into battleGroupEvent), bit 7=Fade In Manually
  byte 2: Background (into battleBackgroundProperties, $FF=Map Default)
$E2 xx xx: Battle Can Lose (3) — same layout as $BD
$E8 xx xx: Battle Character Stats Ending (3) — same layout as $BD
```

**SPC Interrupt Sub-commands (opcode $D0, byte 1=interrupt ID):**
```
$10-$1F: System Sound Effects 0-15
Volume:   $80=All, $81=Song Only, $82=SFX Only (absolute)
          $83=All, $84=Song Only, $85=SFX Only (relative)
Tempo:    $86=All, $87=Song Only, $88=SFX Only (multiplier)
Pitch:    $89=All, $8A=Song Only, $8B=SFX Only (multiplier)
Stop:     $F0=All, $F1=Song Only, $F2=SFX Only
Stereo:   $F3=Stereo, $F4=Mono
$F5=Mute/Unmute Channels, $F8/$F9=Enable Fast Forward, $FA=Disable Fast Forward
$FB=Enable Conditional Jump, $FC=Reflect Sound Effects
```

### 8.2A Trigger Script Opcodes (used by triggerScript + npcScript conditions)
```
$F0: End of NPC Script (1)
$F5 xx xx xx xx: RAM Bool 2-byte (5):
  bytes 1-2: bits 13-0=RAM address (+$0500 base)
  bytes 3-4: 16-bit bitmask
$F6: If Button Pressed (1)
$F7 xx: If Facing Direction (2) — byte 1: 0=Up, 1=Right, 2=Down, 3=Left
$F8 xx xx xx: RAM Bool 1-byte (4):
  bytes 1-2: bits 13-0=RAM address (+$0500 base)
  byte 3: 8-bit bitmask
$F9 xx xx xx xx: RAM Compare 2-byte (5):
  bytes 1-2: bits 13-0=RAM address
  byte 2: bits 7-6=Compare (0=Equal, 1=Greater, 2=Less)
  bytes 3-4: 16-bit compare value
$FA xx xx xx: RAM Compare 1-byte (4):
  bytes 1-2: bits 13-0=RAM address
  byte 2: bits 7-6=Compare type
  byte 3: 8-bit compare value
$FB-$FE xx: If Switch On/Off (2):
  4 opcodes = 2 banks × 2 polarities (reversed from event.switch)
  byte 1: switch index (max 511, 9-bit across bank pair)
$FF xx xx: Execute Event (3) — bytes 1-2=16-bit event script index
```
RAM addresses in trigger scripts are 14-bit values relative to $0500 base.

### 8.2B NPC Script Structure
NPC scripts combine trigger conditions with dialog fallback:
- Encoding: `[trigger conditions]* + [npcDialog]`
- Trigger opcodes ($F0-$FF) provide conditional branching
- Default fallback: 2-byte NPC dialog pointer (bits 14-0 = dialog ID)
- Each NPC entry in npcProperties byte 0-1 (bits 13-0) indexes into npcScript

### 8.3 Sprite/Object Addressing
- $00-$7F: Party member actions (action encoded in opcode itself)
- $80-$A0: Object/NPC actions (object ID in opcode bits 6-0, action in next byte)
- Object IDs: 0-31, referring to NPCs on the current map
- Switch opcodes ($A2-$A5): 4 consecutive opcodes encode bank (0/1) and polarity (on/off)
  - event.switch: opcode+0=bank0 OFF, +1=bank0 ON, +2=bank1 OFF, +3=bank1 ON
  - trigger.switch ($FB-$FE): reversed polarity from event.switch

### 8.4 Trigger Structures

**Event Triggers** ($CE2800, 511 sets, ptr table $CE2400, 4 bytes/trigger):
Byte 0=X, Byte 1=Y, Bytes 2-3=Trigger script index (16-bit)
Code refs: $C0064A/$C00650 (ptr table), $C0065C, $C00675

**Entrance Triggers** ($CE3AC0, 511 sets, ptr table $CE36C0, 6 bytes/trigger):
```
Byte 0=X, Byte 1=Y
Bytes 2-3: bits 9-0=Destination Map, bit 13=Show Title, bit 14=Set Parent, bit 15=Unknown
Bytes 4-5: Dungeon (map≥5): byte 4 bits 5-0=destX, bits 7-6=direction; byte 5 bits 5-0=destY
           World (map<5): full X and Y coordinates
```
Code refs: $C00691/$C00697 (ptr table), $C006A6-$C0072F

### 8.5 Event Examples
- **Full Heal** (C9/A6D9): A8 1F/5F/9F/DF + A9 1F/5F/9F/DF + BA 00-03 02 + FF
- **Tule Inn** (C9/1D28): AD 00 + CE 06 01 + 02 + CD DC 03 + CD DD 03 + FF
- **Switch Demo** (C8/5313): Demonstrates simultaneous sprite movement with C7 opcode
- **Caught You** (C9/6869): Complex cutscene with 500+ bytes of sprite choreography

---

## 9. JSON ROM MAP - DATA STRUCTURE INDEX

### 9.1 Monster Data
- monsterProperties: $D00000-$D03000 (384 monsters, 32 bytes each)
- monsterName: $E00050-$E00F50 (384 names, 10 chars)
- monsterItems: $D05000-$D05600 (384 entries, 4 bytes: rare steal/common steal/rare drop/common drop)
- monsterGraphicsProperties: $D4B180-$D4B900 (384 entries, 5 bytes)
- monsterPosition: $D08900-$D09900 (512 position sets)
- monsterPalette: $CED000-$CEF270 (315 palettes, 16 colors BGR555, 32 bytes each)
- monsterSpecialAttackProperties: $D09900-$D09C00 (384 attacks, 2 bytes)
- monsterSpecialAttackName: $E73700-$E73B00 (64 names, 16 chars)

**monsterProperties field map (32 bytes):**
```
Byte  0:   Speed
Byte  1:   Attack Power
Byte  2:   Damage Multiplier
Byte  3:   Evade
Byte  4:   Defense
Byte  5:   Magic Power
Byte  6:   Magic Defense
Byte  7:   Magic Evade
Bytes 8-9: HP (16-bit)
Bytes 10-11: MP (16-bit)
Bytes 12-13: Experience reward (16-bit)
Bytes 14-15: GP reward (16-bit)
Byte  16:  Attack Graphics
Byte  17:  Element Immune (bitmask, element flags)
Bytes 18-20: Status Immune (24-bit bitmask, status bits 0-23)
Byte  21:  Element Absorb (bitmask)
Byte  22:  Attack Type (bitmask, attackType flags)
Byte  23:  Element Weak (bitmask)
Byte  24:  Monster Type (bitmask: Undead/Archaetoad/Beast/Avis/Dragon/Heavy/Desert/Human)
Byte  25:  Flags: bit 3=Can't be Caught, bit 4=Can't be Controlled, bit 7=Can't be Scanned
Bytes 26-27: Status Set (16-bit, status bits 0-15)
Bytes 28-29: Status Set 2 (16-bit, status bits 16-31)
Byte  30:  Monster ID (name index)
Byte  31:  Level
```

**monsterSpecialAttackProperties (2 bytes):**
```
Byte 0: Flags (bitmask): bit 0=+50% Damage, bit 1=HP Leak, bit 2=Charm,
        bit 3=Paralyze, bit 4=Blind, bit 5=Poison, bit 6=Aging,
        bit 7=Unavoidable/Ignore Defense
Byte 1: Name index (into monsterSpecialAttackName, 64 entries)
```

### 9.2 Character/Job Data
- characterProperties: $D17000-$D17140 (4 chars, 80 bytes each)
- characterNames: $D15500-$D1551E (5 names, 6 chars)
- jobName: $D15600-$D156B0 (22 jobs, 8 chars)
- jobStats: $D156B0-$D15708 (22 jobs, 4 bytes: str/agi/sta/mag with -24 offset)
- jobBattleCommands: $D15760-$D157B8 (22 jobs, 4 default commands)
- jobEquipment: $D15708-$D15760 (22 jobs, 4 bytes equipment bitmask)
- jobAbilitiesLearned: $D15300-$D1542C (21 sets, ptr table $D152C0, 3 bytes: 16-bit AP + type/ID)
- jobAbilitiesInnate: $D157B8-$D157E4 (22 jobs, 2 bytes: 16-bit flag bitmask)
- jobAbilitiesCount: $D152EA-$D15300 (22 jobs, 1 byte: count of learnable abilities)
- characterExpProgression: $D15000-$D15129 (99 levels, 3 bytes each = 24-bit EXP)
- characterHPProgression: $D15129-$D151EF (99 base HP, 2 bytes each)
- characterMPProgression: $D151EF-$D152B5 (99 base MP, 2 bytes each)

**characterProperties field map (80 bytes):**
```
Byte  0:   bits 2-0=Character ID, bit 3=Gender (0=Male,1=Female),
           bit 6=Not Present (inverted bool), bit 7=Row (0=Front,1=Back)
Byte  1:   Job (indexes jobName)
Byte  2:   Level
Bytes 3-5: Experience (24-bit)
Bytes 6-7: Current HP (16-bit)
Bytes 8-9: Max HP (16-bit)
Bytes 10-11: Current MP (16-bit)
Bytes 12-13: Max MP (16-bit)
Byte  14:  Helmet (item index)
Byte  15:  Armor (item index)
Byte  16:  Accessory (item index)
Byte  17:  Shield Right (item index)
Byte  18:  Shield Left (item index)
Byte  19:  Weapon Right (item index)
Byte  20:  Weapon Left (item index)
Byte  21:  Caught Monster (monster index)
Bytes 22-25: Battle Commands 1-4 (indexes battleCommandName)
Bytes 36-39: Base Stats: Str/Agi/Sta/Mag
Bytes 40-43: Current Stats: Str/Agi/Sta/Mag
Byte  44:  Evade
Byte  45:  Defense
Byte  46:  Magic Evade
Byte  47:  Magic Defense
```

**jobEquipment bitmask (4 bytes = 2×16-bit):**
```
Bytes 0-1 (Weapons): bit 0=Knife, 1=Ninja Sword, 2=Sword, 3=Knight Sword,
  4=Spear, 5=Axe, 6=Hammer, 7=Katana, 8=Rod, 9=Staff, 10=Flail, 11=Bow,
  12=Harp, 13=Whip, 14=Bell
Bytes 2-3 (Armor): bit 0=Shield, 1=Heavy Helmet, 2=Light Helmet,
  3=Dancer Clothes, 4=Heavy Armor, 5=Light Armor, 6=Mage Robe, 7=Common,
  8=Glove, 9=Ring, 10=Thief Glove, 11=Chemist Glove, 12=Mage Hat
```

**jobAbilitiesInnate bitmask (16 flags):**
```
bit 0=Detect Passages, 1=Pitfalls, 2=Floor Damage, 3=Dash, 4=Learning,
5=Barrier, 6=Evade, 7=Counter, 8=Two-Handed, 9=Preemptive, 10=Caution,
11=Berserk, 12=Medicine, 13=Double Grip, 14=Brawl, 15=Cover
```

**jobAbilitiesLearned entry (3 bytes):**
```
Bytes 0-1: AP required (16-bit)
Byte  2:   bit 7=Innate Ability (if set, index abilityNameInnateLong; if clear, index battleCommandName)
           bits 6-0=Ability index
```

### 9.3 Attack/Spell Data
- attackProperties: $D10B80-$D11380 (256 attacks, 8 bytes each)
- attackName: $E70F90-$E71780 (168 names, 12 chars — attacks 87-255)
- attackNameLong: $E71780-$E72740 (168 names, 24 chars)
- spellName: $D11C80-$D11E8A (87 spells, 6 chars — attacks 0-86)
- attackPalette: $D1A3A0-$D1ABA0 (128 palettes, 16 colors BGR555)
- attackAnimationProperties: $D838EC-$D84157 (431 anims, 5 bytes)
- abilityName: $E70900-$E70F90 (105 abilities, 16 chars)
- abilityNameInnate: $D16200-$D16308 (33 innate, 8 chars)
- abilityNameInnateLong: $E77060-$E77378 (33 innate, 24 chars)
- abilityStatsInnate: $D16308-$D1638C (33 innate, 4 bytes: str/agi/sta/mag)
- battleCommandName: $E01150-$E013F0 (96 commands, 7 chars)
- battleCommandStats: $D15E00-$D16200 (128 commands, 4 bytes: str/agi/sta/mag bonuses)

**attackAnimationProperties field map (5 bytes, 431 entries at $D838EC):**
```
Byte 0: bits 7-5=Graphics Bank (0=Spell GFX 1, 1=Spell GFX 2, 2=Spell GFX 3,
          3=Weapon Hit, 4=Animals, 5-7=No Graphics)
        bits 4-0=Graphics index (within selected bank)
Byte 1: bits 6-0=Palette index (into attackPalette), bit 7=Unknown
Byte 2: Script index (animation script to execute)
Byte 3: Init Function index
Byte 4: Sound Effect index
```

**Attack Graphics ROM Banks:**
```
attackGraphics1: $D90000-$D92EC8 (snes3bpp, "Spell Graphics 1")
attackGraphics2: $D92EC8-$D95760 (snes3bpp, "Spell Graphics 2")
attackGraphics3: $D95760-$D97C50 (snes3bpp, "Spell Graphics 3")
attackGraphics4: $D1D800-$D1F000 (snes3bpp, "Weapon Hit")
attackGraphics5: $D1ABA0-$D1BE00 (snes4bpp, "Animals")
attackGraphics6: $D1C000-$D1D800 (snes3bpp, alternate palette)
```

**battleCommandStats field map (4 bytes, 128 entries at $D15E00):**
```
Byte 0: Strength bonus
Byte 1: Agility bonus
Byte 2: Stamina bonus
Byte 3: Magic bonus
```
Indexed by battleCommandName (96 commands). Stat bonuses applied when command is equipped.

**attackProperties field map (8 bytes):**
```
Byte 0: Targeting (flags): bit 2=Roulette, 3=Target Enemy Default,
        4=Can Target Either Side, 5=Can Select Target,
        6=Always Target All, 7=Can Target All
        bits 1-0=Action Delay (0-3)
Byte 1: Attack Type (bitmask flags, same as section 10.3)
Byte 2: bits 3-0=Unknown, bits 7-4=Blue Magic Learn (flags):
        bit 4=10% Learn, bit 5=50% Learn, bit 6=100% Learn, bit 7=Can't Learn
Byte 3: bits 6-0=MP Cost, bit 7=Can't Reflect
Byte 4: bits 6-0=Attack Effect (0-127, see table below), bit 7=unused
Bytes 5-7: additional data (vary by effect type)
```

**Attack Effects (0-127):**
```
 0=No Effect           16=Restore HP          48=Unarmed           80=Goblin Punch
 1=Monster Fight       17=Restore Full HP     49=Sword             81=Increase Stats
 2=Monster Special     18=Inflict Status 1    50=Knife             82=Mucus
 3=Magic Sword 1       19=Inflict Status 2    51=Spear             83=MP Damage
 4=Magic Sword 2       20=Inflict Status 3    52=Axe/Staff         84=Attacker HP Dmg(-)
 5=Magic Sword 3       21=Toggle Status       53=Bow + Status      85=Fusion
 6=Offensive Magic     22=Reverse Status      54=Bow               87=Random Effect
 7=HP-Based Dmg+Stat   23=Instant Death       55=Katana            88=Mind Blast
 8=Ignore Defense      24=Instant Destroy     56=Whip              89=Increase HP
 9=Random Damage       25=Remove Status       57=Bell              90=White Wind
10=Physical Magic      26=Resurrect           58=Axe (no back pen) 92=Hug
11=Level-Based Dmg     27=Whispering Wind     59=Rod               93=Zombie Status
12=Ign Def + HP Leak   28=Change Element      60=Rune Weapons      97=Stalker Attack
13=Drain HP            29=View Stats          61=Death Claw        98=Byblos Attack
14=Drain MP            30=Drag                62=Failure(EL+TS)    99=Grand Cross
15=HP to Critical      31=Void                63=Zombie Breath    100=Chicken Knife
32=End Battle          64=Change Row          101=Interceptor     105=Control
33=Reset Battle        66=Restore HP+Status   102=Targeting       106=Sandworm
34=Quick               67=Steal               103=Pull            107=Change Attribute
35=Earth Wall          68=Escape              104=End Battle      108=Monster Type Bonus
36=Restore HP (fixed)  69=Throw               109=Vampire         112=Wormhole
37=Restore MP (fixed)  70=GilToss             110=Brave Blade     113=Level Down
38=Full HP/MP          71=Tame                111=Fight (Strong)  114=Bow(vs.Type)
39=Status Added        72=Catch               115=Spear(vs.Type)  127=No Attack
40=Damage (fixed)      73=Flirt
41=Inflict Status 4    74=Dance
42=HP-Based Dmg+Leak   75=L5 Doom
43=Attacker HP Dmg     76=L2 Old
44=Random Effect       77=L4 Qrter
45=Ground Attack       78=L3 Flare
46=Reaper's Sword      79=Spirit
```

### 9.4 Item Data
- itemPropertiesWeapon: $D10000-$D10600 (128 weapons, 12 bytes)
- itemPropertiesArmor: $D10600-$D10C00 (96 armor, 12 bytes)
- itemNames: $D11380-$D11C80 (256 items, 9 chars)
- itemNamesLong: $E75860-$E77060 (256 items, 24 chars)
- itemDescription: $E75200-$E75800 (128 descs, ptr table $E75100-$E75200)
- itemPrice: $D12A00-$D12D00 (384 prices, 2 bytes — multiplier system)
- shopProperties: $D12D40-$D12F80 (64 shops, 9 bytes: type + 8 item/spell IDs)
  
**shopProperties field map (9 bytes, 64 shops at $D12D40):**
```
Byte 0: bits 2-0=Shop Type (0=Magic, 1=Weapon, 2=Armor, 3=Item,
          4=Relic, 5=Guild, 6=Medicine, 7=General)
        bit 7=Discounted Prices
Bytes 1-8: If Magic shop: 8 spell indices (into attackName)
           If non-Magic: 8 item indices (into itemNames)
```

  **Named shops:**
```
  0-2=Tule (Weapon/Armor/Item)
  3=Tule Magic
  4-10=Carwen
  11-12=Karnak Weapon 1/2
  13=Karnak Armor
  15=Karnak/Crescent Black
  16=Karnak/Jachol White
  17=Karnak/Istory Time
  21=Istory Relic
  27=Lix Guild
  51-52=Dwarf (Weapon/Armor)
  54-61=Mirage Town (all)
  62-63=Karnak (Get Arrested)
```

**itemPropertiesWeapon field map (12 bytes):**
```
Byte  0:   Targeting (same bit layout as attackProperties byte 0)
Byte  1:   Attack Type (bitmask flags)
Byte  2:   bits 5-0=Item Type (indexes itemType enum), bit 6=Can't be Thrown
Byte  3:   bit 7=Bonus Type (0=Attack Element, 1=Stat Bonus)
           If element: bits 6-0=Element bitmask
           If stat: bits 6-3=Stats (bit 3=Str, 4=Spd, 5=Sta, 6=Mag),
                    bits 2-0=Bonus value (0=+1..7=+5, special 3-6 for mixed)
Bytes 4-5: bits 5-0 of byte 4=Description index
           Flags (10-bit across bytes 4-5 upper): bit 0=Can Double Grip,
           1=Double Grip Only, 2=Wonder Rod, 3=Use Ability, 4=Magic Sword,
           5=Action on Hit, 7=First Strike, 8=Knife Parry, 9=Sword Parry
Byte  6:   bits 6-0=Spell Cast (attack index), bit 7=Breaks After Use
Byte  7:   Attack Power
Byte  8:   bits 6-0=Attack Effect (same enum as attackProperties)
Bytes 9-11: additional weapon data
```

**itemPropertiesArmor field map (12 bytes):**
```
Byte  0:   Armor Slot (flag bits 0-3): bit 0=Accessory, 1=Armor, 2=Helmet, 3=Shield
Byte  1:   Weight
Byte  2:   bits 5-0=Item Type (indexes itemType enum)
Byte  3:   bit 7=Bonus Type (0=Attack Element, 1=Stat Bonus) — same as weapon
Byte  5:   Flags (bitmask): bit 0=Improve Catch, 1=Become Undead,
           2=Improve Sword Dance/Flirt, 3=Halve MP Cost, 4=Improve Steal,
           5=Improve Brawl, 6=Elf Cape Dodge, 7=Block All Magic
Byte  6:   Evade
Byte  7:   Defense
Byte  8:   Magic Evade
Byte  9:   Magic Defense
Byte  10:  Element Effect (named sets): 0=None, 1=Diamond Gear, 2=Halve All,
           3=Angel Suit, 4=Flame Ring, 5=Coral Ring, 6=Bone Mail,
           7=Flame Shield, 8=Ice Shield
Byte  11:  Status Effect (named sets): 0=None, 1=Guard Ring, 2=Cursed Ring,
           3=Running Shoes, 4=Aegis Shield, 5=Ribbon, 6=Tiara/Rainbow/Red Shoes,
           7=Bard's Clothes, 8=Glasses, 9=Angel Suit, 10=Bone Mail,
           11=Wall Ring, 12=Giant's Glove, 13=Angel Ring, 14=Thornlet,
           15=Mirage Vest, 16-19=Genji (Shield/Helmet/Armor/Glove)
```

**itemPrice system (2 bytes, 384 entries — items 0-127 weapons, 128-223 armor, 256+ attacks):**
```
Byte 0: bits 7-6=Price Override flags (bit 6=Sells for 5GP, bit 7=Can't be Sold)
        bits 4-0=Price Multiplier (0=x1, 1=x10, 2=x100, 3=x1000,
                                    4=x10000, 5=x100000, 6=x1000000)
Byte 1: Base price value (multiplied by 10 × multiplier)
```

### 9.5 Map Data
- mapProperties: $CE9C00-$CED000 (512 maps, 26 bytes — full field map below)
- mapLayouts: $CB0290-$CDF9FF (324 compressed ff5-lzss, ptr table $CB0000, autoBank)
  - Code refs: $C06ACD (bank), $C06AE1/$C06AE7/$C06AF4 (pointers)
- mapTilesets: $CF0038-$CFC540 (28, ptr table $CF0000, snes4bppTile+interlace+ff5-lzss)
- mapTileProperties: $CFC56E-$CFD7CB (23 sets × 256 tiles × 2 bytes, ff5-lzss)
- mapPalettes: $C3BB00-$C3E700 (44 palette sets)
- mapColorMath: $C05BB8-$C05BF4 (20 × 3 bytes — SNES color math config)
- mapAnimationProperties: $C09D9B-$C0A18B (28 × 36 bytes — per-tileset anim config)
- mapGraphics: $DC2E24-$DF9B00 (40 entries, snes4bpp, ptr table $DC2D84, 4-byte ptrs)
- mapGraphicsLayer3: $DC0024-$DC2D84 (18 entries, snes2bpp, ptr table $DC0000)
- mapSpriteGraphics: $DA0000-$DB3A00 (snes4bpp, all field sprites)
- mapSpritePalettes: $DFFC00-$DFFC80 (4 × 32 bytes BGR555)
- mapBattleGroups: $D08000-$D08400 (512 refs)
- mapBattleProbability: $D084C0-$D08540 (512 rates, packed 2-bit)
- worldLayouts: $C70000-$C82220 (1280 rows, ff5-world RLE, ptr table $CFE000)
  - Code refs: $C069A2 (bank), $C069CF/$C069DA (pointers)
- worldGraphics: $DB8000-$DBD000 (3 × $2000 bytes, linear4bpp)
- worldPalettes: $CFFCC0-$CFFFC0 (3 × 256 colors BGR555)
- worldPaletteAssignments: $CFF9C0-$CFFCC0 (3 × 256 bytes)
- worldTileProperties: $CFEA00-$CFF0C0 (3 × 192 × 3 bytes — passability + BG)
  ```
  Bytes 0-1: Passability flags (16-bit bitmask):
    bit 0=Foot, 1=Chocobo, 2=Black Chocobo, 3=Hiryuu,
    4=Submarine, 5=Ship, 6=Airship, 7=Submarine Can Surface,
    8-11=Passable Through (Right/Left/Bottom/Top),
    12=Can't Dismount Chocobo, 13=Black Chocobo Can't Land,
    14=Hiryuu Can't Land, 15=Airship Can't Land
  Byte 2: bits 3-0=Battle Background (per-world mapping),
    bit 5=Bottom of Sprite Transparent, bit 6=Bottom of Sprite Underwater
  ```
- worldTilesets: $CFF0C0-$CFF9C0 (3 × 768 bytes, 32×24 tilemap)

**mapProperties field map (26 bytes):**
```
Bytes 0-1: Map ID (16-bit)
Byte  2:   Title index (indexes mapTitle)
Byte  3:   bit 4=Alt Sprite Palette (bool)
Byte  4:   bit 7=Map Animation (inverted: 0=enabled, 1=disabled)
           bits 5-0=Color Math index, bit 6=Unknown 4.6
Byte  5:   Tile Properties index (indexes mapTileProperties)
Bytes 6-7: Tile Damage config:
           Byte 6 (downstairs): bits 2-0=Damage (0=None,1-2=50,3=100,4=300,5=400,6=500,7=1000)
             bits 5-3=SFX, bit 6=Inflict Poison, bit 7=Enable Battles
           Byte 7 (upstairs): same layout
Byte  8:   Tileset index (indexes mapTilesets)
Bytes 9-11: Graphics packing:
           Byte 9 bits 5-0=GFX1 (masked 0x3F), bits 11-6=GFX2 (masked 0x0FC0 across 9-10)
           Byte 10 bits 9-4=GFX3 (masked 0x03F0 across 10-11)
           Byte 11 bits 7-2=GFX Layer3 (masked 0xFC)
Bytes 12-13: Layout1 (bits 9-0, 10-bit), Layout2 (bits 11-2 = 0x0FFC across 13-14)
Bytes 14-15: Layout3 (bits 13-4 = 0x3FF0 across 14-15)
Byte  16:  Layer 3 V-Offset
Byte  17:  Layer 3 H-Offset
Byte  18:  Layer 2 V-Offset
Byte  19:  Layer 2 H-Offset
Byte  20:  Parallax: bits 7-6=L3 V-Parallax, bits 5-4=L3 H-Parallax,
           bits 3-2=L2 V-Parallax, bits 1-0=L2 H-Parallax
           (0=Normal 1x, 1=Half 0.5x, 2=Double 2x, 3=No Scroll 0x)
Byte  21:  bit 7=Tiled Layer 3, bit 6=Tiled Layer 2
           bits 5-3=H-Scroll Speed (0=None,1=-4,2=-2,3=-1,5=+1,6=+2,7=+4)
           bits 2-0=V-Scroll Speed (same values)
Byte  22:  Palette index (indexes mapPalettes)
Byte  23:  Palette Animation
Byte  24:  Battle Background (indexes battleBackgroundProperties)
Byte  25:  Song index
```

**mapAnimationProperties field map (36 bytes, 28 per-tileset entries at $C09D9B):**
```
Bytes 0-7:   Enable flags for main tiles 1-8 (bit 7 of each byte)
Bytes 8-11:  Enable flags for Layer 3 tiles 1-4 (bit 7 of each byte)
Bytes 12-27: Main tile indices 1-8 (16-bit each, into tileset)
Bytes 28-35: Layer 3 tile indices 1-4 (16-bit each)
```
Animated tiles overwrite at $B800-$BFFF (8 main) and $FC00-$FFFF (4 L3) in VRAM.

**mapTitle:** $E70000-$E70673 (163 entries, dialog encoding, null-terminated)
- Pointer table: $D07000-$D07146, offset $E70000
- Entry 0 = "No Title", remainder are location names
- Referenced by mapProperties byte 2 (title index)

### 9.6 Battle Configuration
- battleProperties: $D03000-$D05000 (512 battles, 16 bytes each):
  ```
  Byte 0:  bits 7-4 = GFX flags (7=Credits, 6=Underwater, 5=Final Boss, 4=Wall Monsters)
           bits 2-0 = Entry anim (0=Normal, 1=Drop, 2=ScrollUp, 3=FadeIn, 4=Demo, 5=ScrollRight)
  Byte 1:  Escape % (0-100, $80=Can't Run)
  Byte 2:  ABP reward
  Byte 3:  Monster Present bitmask (bit 7=M1, bit 6=M2, ..., bit 0=M8)
  Bytes 4-11: Monster IDs (1 byte each; +256 offset when Boss flag set)
  Byte 12: Palette assignments M1-M4 (2 bits each: bits 7-6=M1, 5-4=M2, 3-2=M3, 1-0=M4)
  Byte 13: Palette assignments M5-M8 (same pattern)
  Byte 14: bit 7=Continue Previous Song, bit 6=Disable Fanfare
           bits 5-3=Song (0=Battle, 1=Boss, 2=Neo-Exdeath, 3=Gilgamesh, 4=Exdeath,
                          5=Exdeath Battle, 6=Gogo, 7=Exdeath Destroyed)
  Byte 15: bit 7=Force Back Attack, bit 6=Disable Void, bit 5=Boss Battle (9-bit monster IDs),
           bit 4=Sandworm, bit 2=Cast Void at Start, bit 1=No Reward, bit 0=Alternate Death
  ```
- battleGroupRandom: $D06800-$D07000 (256 groups × 8 bytes, 4 battles × 10-bit IDs)
- battleGroupEvent: $D07800-$D07A00 (256 groups × 4 bytes, 2 battles × 10-bit IDs)
- worldBattleGroup: $D07A00-$D08000 (192 groups × 8 bytes, 4 terrain types × 2-byte group)
- battleCharacterGraphics: $D20000-$D49400 (110 entries × 1536 bytes, snes4bpp, 5 chars × 22 jobs)
- battleCharacterGraphicsDead: $D49400-$D497C0 (5 entries × 192 bytes, snes4bpp)
- battleCharacterPalette: $D4A3C0-$D4B180 (110 entries × 32 bytes, BGR555)
- battleBackgroundGraphicsPointer: $D84196-$D841D5 (21 × 3 bytes, pointers)
- battleBackgroundGraphicsOffset: $D84157-$D84196 (21 × 3 bytes, tile offsets)
- battleBackgroundGraphics: $D841D5-$D8DE36 (9 entries, ff5-lzss compressed, snes4bpp)
- battleBackgroundLayout: $D4C8A5-$D4EFF1 (28 entries, 32×20 tilemap)
- battleBackgroundPalette: $D4BB31-$D4C5B1 (84 palettes × 32 bytes, BGR555)
- battleBackgroundTileFlip: $D4C748-$D4C86D (9 entries, ff5-battlebgflip)
- battleBackgroundProperties: $D4BA21-$D4BB31 (34 BGs × 8 bytes)
  ```
  Byte 0: Graphics index (into battleBackgroundGraphicsPointer)
  Byte 1: Palette 1 index, Byte 2: Palette 2 index (into battleBackgroundPalette, 84 total)
  Byte 3: Layout index (into battleBackgroundLayout, 28 layouts)
  Byte 4: H-Flip data (0xFF=None), Byte 5: V-Flip data (0xFF=None)
  Byte 6: Tile Animation (0=None, 1=Cave w/Water, 2=Fire Ship, 4=Beach,
          5=Flying Fortress, 6=Castle Exdeath, 7=Castle Interior)
  Byte 7: Palette Animation (0=Flying Fortress, 1=The Void, 2=Neo Exdeath, 255=None)
  ```
  Named BGs: 0=Grass(Bartz), 1=Forest, 2=Desert, 3=Swamp, 4=Beach,
  5=Ship Graveyard Int, 6=Cave, 7=Cave w/Water, 8=Tower Int, 9=Tower Ext,
  10=Shrine, 11=Castle Int, 12=Castle Ext(Bartz), 13=Library, 14=Ship Int,
  15=Moore Ext, 16=Mountain, 17=Pyramid, 18=Flying Fortress, 19=Moore Int,
  20=Castle Exdeath, 21=Ship Ext, 22=Fire Ship, 23=The Void, 24=Ronka,
  25=Ship Graveyard Ext, 26=Karnak Int, 27=Phoenix Tower, 28=Final Battle,
  29=Tower Walse(Underwater), 30=Desert w/Holes, 31=Neo Exdeath,
  32=Castle Ext(Galuf), 33=Grass(Galuf)
- battleDialog: $E73B00-$E74FAD (234 messages, ptr table $D0F000-$D0F1D4)
- battleMessage: $E72760-$E72F00 (256 messages, ptr table $D139A9-$D13BA9)

### 9.7 Event/NPC Data
- snesHeader: $C0FFC0-$C0FFE0 (32 bytes — game title, map mode, ROM/RAM size, checksum)
- eventScript: $C849DC-$C9FF9C (1940 scripts, ptr table $C83320-$C849DC, 3-byte pointers)
- dialog: $E10000-$E36FBB (2160 dialog strings, ptr table $E013F0-$E02D40, 3-byte pointers)
- npcScript: $CE0740-$CE2294 (922 NPC scripts)
- npcProperties: $CE5DC2-$CE9BFE (512 NPC sets, variable length, ptr table $CE59C0)
- npcScript: $CE0740-$CE2294 (922 scripts, ptr table $CE0000-$CE0740)
- triggerScript: $D8E600-$D8FFA8 (704 triggers, ptr table $D8E080-$D8E600)
- eventTriggers: $CE2800-$CE3660 (511 sets, ptr table $CE2400-$CE2800)
- entranceTriggers: $CE3AC0-$CE58D2 (511 sets, ptr table $CE36C0-$CE3AC0)
- treasurePointers: $D13000-$D13210 (528 × 1 byte — index into treasureProperties)
- treasureProperties: $D13210-$D13600 (528 × 4 bytes):
  ```
  Byte 0: X position, Byte 1: Y position
  Byte 2: bit 7=Monster-in-a-box
    If MiaB: bits 5-0=Battle index (+$40 into battleGroupEvent), bit 6=Contents (0=Item,1=Spell)
    If regular: bits 6-5=Contents (0=GP,1=Spell,2=Item,3=Item), bits 2-0=GP multiplier
  Byte 3: Item/Spell/GP base amount
  ```

---

## 10. ENUMERATION TABLES

### 10.1 Status Effects (32 total, 4 bytes)
```
Byte 1: Darkness(0), Zombie(1), Poison(2), Float(3), Mini(4), Toad(5), Stone(6), Wounded(7)
Byte 2: Image1(8), Image2(9), Mute(10), Berserk(11), Charm(12), Paralyze(13), Sleep(14), Aging(15)
Byte 3: Regen(16), Invulnerable(17), Slow(18), Haste(19), Stop(20), Shell(21), Armor(22), Wall(23)
Byte 4: Hidden(24), Critical(25), Singing(26), HP Leak(27), Countdown(28), Controlled(29), False Image(30), Erased(31)
```

### 10.2 Elements (8, bitmask flags — can combine)
Fire(0), Ice(1), Lightning(2), Poison(3), Holy(4), Earth(5), Wind(6), Water(7)

### 10.3 Attack Types (8, bitmask flags — can combine)
Blue Magic(0), White Magic(1), Black Magic/Rod(2), Dimension Magic(3),
Summon(4), Song/Harp/Bell(5), Aerial/Bow/Whip(6), Physical(7)

### 10.4 Monster Types (8)
Undead(0), Demon(1), Mgc.Beast(2), Flying(3), Dragon(4), Heavy(5), Dry+Mech(6), Humanoid(7)

### 10.5 Vehicles
None(0), Chocobo(1), Black Chocobo(2), Hiryuu(3), Submarine(4), Ship(5), Airship(6)

### 10.5A Named Event Switches (512 total, most unnamed)
```
12=Obtained Cornago Jar, 69=Defeated Gilgamesh (Big Bridge),
100=Quelb Gate is Locked, 209=Obtained Requiem Song, 273=Obtained Love Song,
507=Enable Mini-Map, 509=Enable Tent/Save, 511=Disable Random Battles
```
Battle Switches: 256 total, all unnamed (default "Battle Switch %i")

### 10.5B Named Trigger Scripts
17=Tent, 18=Cabin, 255=Save Point (704 total)

### 10.5C Named NPC Switches (922 total, selected highlights)
```
 8=Pyramid of Moore - First Tablet     32=Great Sea Trench - Third Tablet
 9=Castle Tycoon - King's Journal      40=Quelb - Frog Man
25=Carwen - Barrel (Cottage)           50=Tycoon Meteorite - Galuf
26=Walse - Galura                      74=Wind Shrine - Wing Raptor
86=Pirate Ship - Locked Door           95=Tycoon Meteorite - Boco
87-88=Tule - Faris in Pub             128=Local Control
208=Castle Walse - King Walse         213=Castle Walse - Shiva
223-230=Tower of Walse - Crystals     242-244=Airship - Cid/Mid
292-303=Sealed Castle - 12 Legendary Weapons
363-364=Karnak Castle - Crystal/Shards
572=Black Tower - Flare Magic         573=White Tower - Holy Magic
579=Island Shrine - Second Tablet     639=Istory Falls - Fourth Tablet
640-651=Tule/Karnak - Shop NPCs       880=Istory Falls - Leviathan
917-918=Piano (Bottom/Top)            919=The Void - Exdeath
```

### 10.6 Item Types (31 types, used by weapon/armor byte 2 bits 5-0)
```
 0=None       8=Hammer     16=Bell       24=Mage Robe
 1=Common     9=Katana     17=Shield     25=Glove
 2=Knife     10=Rod        18=Heavy Helm 26=Ring
 3=Ninja Sw  11=Staff      19=Light Helm 27=Accessory
 4=Sword     12=Flail(Un)  20=Mage Hat   28=Thief Gear
 5=Knight Sw 13=Bow        21=Dancer Gr  29=Chemist Gear
 6=Spear     14=Harp       22=Heavy Arm  30=Exotic Weapon
 7=Axe       15=Whip       23=Light Arm
```

### 10.7 Text Encoding (RPGe character table)
```
$53-$5C: '0'-'9'
$5D: \m (minute), $5E: \h (hour), $5F: \p (period)
$60-$79: 'A'-'Z'
$7A-$93: 'a'-'z'
$94=il, $95=it, $97=li, $98=ll    (DTE: Double-character Table Encoding)
$96: space
$99: '  $9A: "  $9B: :  $9C: ;  $9D: ,
$9E: (  $9F: )  $A0: /  $A1: !  $A2: ?  $A3: .
$A4=ti, $A5=fi, $AC=if, $AD=It, $AE=tl, $AF=ir, $B0=tt  (more DTE)
$AA: '  $AB: "  $C5: -  $CD: %  $E2: +
$FE: space (in fixed-length names)  $FF: pad (string terminator in names)
$00: null terminator (in null-terminated strings)
```

**Item/Equipment Symbols (used in names):**
```
$BC=key  $BD=shoes  $BE=special  $BF=hammer  $C0=tent  $C1=bowtie
$C2=potion  $C3=robe  $C4=music  $C6=star  $C8=scroll  $CA=claw  $CC=gauntlet
$E3=sword  $E4=white magic  $E5=black magic  $E6=time magic
$E7=dagger  $E8=spear  $E9=axe  $EA=katana  $EB=rod  $EC=staff
$ED=bow  $EE=harp  $EF=whip  $F0=bell  $F1=shield  $F2=cap  $F3=armor  $F4=ring
```

**Dialog Escape Codes (in-string control):**
$00=\0, $01=\n (newline), $02-$06=\char00-\char04 (character name insertion),
$0C=\wait, $0F=\page, $10=\gp, $11=\item, $12=\spell, $17=\wait[

**Encoding Stacks** (how text formats compose):
- fixedLength: DTE → fixedLength → itemSymbols → text
- dialog: dialogEscape → nullTerminated → text
- battleText: DTE → nullTerminated → text → battleText ($CF=colon in battleText)
- nullTerminated: DTE → nullTerminated → text

---

## 11. FREE SPACE (Available for ROM hacks)
```
$C9FF9C-$CA0000  (100 bytes)
$CDF9FF-$CDFA40  (65 bytes)
$CE2294-$CE2400  (364 bytes)
$CE3660-$CE36C0  (96 bytes)
$CE58D2-$CE59C0  (238 bytes)
$CE9BFE-$CE9C00  (2 bytes)
$CEF270-$CEF400  (400 bytes)
$CFD7CB-$CFD800  (53 bytes)
$D0F1D4-$D0FFA0  (3532 bytes)
$D13600-$D13840  (576 bytes)
$D1542C-$D15500  (212 bytes)
$D4EFF1-$D4F000  (15 bytes)
$D8FFA8-$D90000  (88 bytes)
$E36FBB-$E70000  (~233K bytes - LARGEST)
$E70673-$E70900  (653 bytes)
$E75900-$E7F800  (~40K bytes)
```
Total free: ~275KB+ (mostly in $E36FBB-$E70000 and $E75900-$E7F800)

---

## 11A. COMPRESSION FORMATS

### ff5-lzss (Maps, Tilesets, Tile Properties)
- LZSS with **2KB sliding window**, initial buffer offset **$07DE** (not 0)
- First 2 bytes = decompressed length (16-bit LE)
- Flag byte: 8 bits, each controls next token (1=raw byte, 0=compressed pair)
- Compressed token: 2 bytes → **11-bit position** (low bits) + **5-bit length** (high bits)
- Terminates when decompressed output reaches declared length
- Used by: mapLayouts, mapTilesets, mapTileProperties, battleBackgroundGraphics
- **Differs from ff6-lzss**: ff6 terminates on compressed size, uses different bit packing

### ff5-world (World Map Rows)
- Simple RLE for 256-byte world rows
- Bytes $00-$BF: literal tile values
- Bytes $C0-$FF: run of (byte - $BF) copies of the NEXT byte
- Special: $0C/$1C/$2C = 3-byte staircase pattern (byte, byte+1, byte+2)
- Pointer table at $CFE000-$CFEA00

### Tileset Interlace Pipeline
mapTilesets uses a 4-stage decode: `ff5-lzss → interlace(2,4,256) → interlace(4,16,2) → snes4bppTile`

### SNES Tile Formats
- **snes4bpp**: 8×8 tiles, 4 bitplanes planar, 32 bytes/tile
- **snes3bpp**: 8×8 tiles, 3 bitplanes, 24 bytes/tile
- **snes2bpp**: 8×8 tiles, 2 bitplanes, 16 bytes/tile
- **snes4bppTile**: 32-bit PPU tile word: `palette[bits 18-16] | vFlip[bit 29] | hFlip[bit 28] | tileIndex[bits 9-0]`

---

## 11B. MAP SYSTEM INTERNALS

### Metatile Encoding
Each map layout cell = 1 byte metatile index (0-255). Decoded to 2×2 grid of 8×8 PPU tiles:
```
tile_index = ((byte & 0xF0) << 2) | ((byte & 0x0F) << 1)
Top-left:     tileset[tile_index]       Top-right:    tileset[tile_index + 1]
Bottom-left:  tileset[tile_index + 32]  Bottom-right: tileset[tile_index + 33]
```
High nibble selects row (×4), low nibble selects column (×2) in the 32×32 tileset grid.

### Graphics Assembly (3 banks + Layer 3)
mapProperties byte 9 packs three 6-bit graphics indices:
```
gfx[0x0000-0x3FFF] = mapGraphics[gfx1]      (16KB, masked 0x3F)
gfx[0x4000-0x7FFF] = mapGraphics[gfx2]      (16KB, masked 0x0FC0)
gfx[0x8000-0xBFFF] = mapGraphics[gfx3]      (16KB, masked 0x03F0)
gfx[0xC000-0xFFFF] = mapGraphicsLayer3[L3]   (16KB)
```
Animation tiles overwrite at $B800-$BFFF (8 main tiles) and $FC00-$FFFF (4 L3 tiles).

### World Map Sectors (Battle Regions)
World map divided into 8×8 sectors per world (192 total):
`sector = (x >> 5) | ((y >> 5) << 3) | (world << 6)`
Each sector indexes into worldBattleGroup (192 × 8 bytes: 4 terrain × 2-byte group index).

### NPC Sprite Graphics Ranges
```
Index $00-$31 (0-49):   Small NPC, 16 tiles, offset = g × $0200
Index $32-$4A (50-74):  Medium NPC, 32 tiles, offset = (g-$32) × $0400 + $6400
Index $4B-$51 (75-81):  Large NPC, 64 tiles, offset = (g-$4B) × $0800 + $C800
Index $52-$66 (82-102): Small (bank 2), 16 tiles, offset = (g-$52) × $0200 + $10000
Index $67 (103):        Hiryuu body, offset = $12A00
Index $68 (104):        Hiryuu head, offset = $136C0
```
All offsets × 2 for actual byte address into mapSpriteGraphics ($DA0000).
Sprite frame table: $C0/2A95 (80 frames × 16 bytes, 4 tile words per frame).

### NPC Properties Structure (7 bytes per NPC, at $CE5DC2)
```
Bytes 0-1: bits 13-0 = Event script index, bits 15-14 = Unknown
Byte 2:    Graphics index (into sprite ranges above)
Byte 3:    bits 5-0 = X position, bits 7-6 = Movement1 (0=Normal, 2=Toward, 3=Away)
Byte 4:    bits 5-0 = Y position, bits 7-6 = Movement2 (0=Random, 1=Circle, 2=Back+Forth, 3=Straight)
Byte 5:    bits 1-0 = Speed (0=Normal, 1=Slow, 2=Slowest, 3=Fast)
           bit 2 = Stationary, bits 6-4 = Animation (0=Walk, 1=1Frame, 2=2F, 3=4F, 4=8F, 5=Animal)
           bit 7 = Face Party reaction
Byte 6:    bits 2-0 = Palette (0-7), bit 3 = Top priority, bit 4 = Bottom priority
           bits 7-5 = Direction (0=Up, 1=Right, 2=Down, 3=Left, 4-7=Special)
```
Pointer table: $CE59C0-$CE5DC2 (512 NPC sets, variable length per map).

---

## 11C. MONSTER GRAPHICS SYSTEM

### monsterGraphicsProperties (5 bytes per monster, $D4B180)
```
Bytes 0-1: bits 14-0 = graphics pointer (×8, base $D50000 into monsterGraphics)
           bit 15 = is3bpp flag (snes3bpp if set, snes4bpp if clear)
Bytes 2-3: bits 9-0 = palette pointer (×16, base $CED000 into monsterPalette)
           byte 2 bit 7 = useLargeMap (16×16 tile grid if set, 8×8 if clear)
Byte 4:    Map index into monsterGraphicsMap (small or large sub-array)
```

### Monster Graphics Bitmap (Sparse Tile System)
monsterGraphicsMap at $D0D000: each entry is a bitmap defining which tiles in the grid are occupied.
- Small map: 8 bytes = 64 bits (8×8 grid)
- Large map: 32 bytes = 256 bits (16×16 grid)
Algorithm walks bitmap L-to-R, T-to-B: if bit is set, assign next sequential tile index.
Tile 0 is always blank. Actual tile data is sequential in the graphics bank.

### Monster Position Format
Each position = 1 byte: `(X/8) << 4 | (Y/8)`, giving 0-120px range in 8px steps.

---

## 12. CROSS-REFERENCE: BANK CALL GRAPH

```
C0 (Field) --JSL--> C2/A000 (Title/Game Select)
C0 (Field) --JSL--> C4/0000 (Sound Init)
C0 (Field) --JSR--> CA/3C   (Event flags)
C0 (Field) --JSR--> CB/11   (Unknown)
C2 (Battle) --JSL--> C1/0000 (Battle GFX, via CallC1)
C2 (Battle) --JSL--> C4/0004 (Music, via MusicChange)
C2 (Battle) --LDA--> D0/xxxx (ROM tables)
C2 (Battle) --LDA--> D1/xxxx (Spell/item data)
C2 (Battle) --JSL--> D0/EF78 (Field item cleanup)
C1 (BattleGFX) --JSL--> C4/0004 (Sound)
```

---

## 13. DOCUMENTATION SOURCES & AUTHORS

| File | Author | Coverage | Quality |
|------|--------|----------|---------|
| Bank_C0 (RTF) | 1337_5k37c3r | **C0/0000-60FF only** (measured 2026-06-09) | Rich contextual notes, game logic explained |
| Bank_C0 (TXT) | Lenophis | **134 of 256 pages** — holes listed in DOC_GAP_AUDIT.md §1.1; disassembles RPGe not J | Minimal but precise, good for quick ref |
| Bank_C1 | noisecross | Full C1 bank (verified to C1/FFFE) | Dense, ~32K lines, minimal comments |
| Bank_C2 | Instructor Trepe | Function name index only, to C2/964D — no disassembly | Foundation for Modoh's work |
| c2battle.asm | Modoh | C2/0000-9FFF complete; **menu code C2/A000+ NOT covered** | BEST SOURCE - labeled, structured, relocatable |
| Bank_C3 | Lenophis | **C3/0000-016D only (365 bytes)** | Fade/transition entry stub w/ trace annotations |
| Bank_C4 | Lenophis | C4/0000-0645 (65816 loader only; SPC700 program at $064D+ undisassembled) | Sound engine |
| Bank_E0 | Lenophis | E0/2D40-31B1 — complete for all 13 entry points called from C0 (verified) | RPGe text helpers |
| DOC_GAP_AUDIT.md | (this project, 2026-06-09) | Coverage audit + new findings: vectors, RAM NMI trampolines, D0/D9 HDMA-DMA routines, menu dispatch, bank C5/C6 ID | Verified against both reference ROMs |
| ff5u-sfc.json | (FF5 tools) | Full ROM map | Complete data structure definitions |
| FF5Events/ | (various, 2011) | Event scripts | Decoded event bytecode examples |
| ff5-*.js | (ff5 webapp tools) | Editor code | Map/battle/script editors, format decoders |

---

---

## 14. APPLIED HACKS & PATCHES

### 14.1 Serity's Equip Icons Upgrade
- IPS patch: `FFV Clean - Serity's Equip Icons upgrade.ips`
- Expands ROM and adds code at $EF/A500+ (file offset $2FA500+)
- Equip icon data table at $2FA600 (SNES $EFA600): maps equipment categories to icon tiles
- Sort list at $6FF99: determines equipment category display order on equip screen
- Icon tiles use FFV character encoding (e.g. $CF=colon, $E3=sword, $B6=knightsword)
- Free space available: $EFA500-$EFA5FF (~256 bytes before icon data table)

### 14.2 Equip Icon Data Table ($2FA600 / $EFA600)
```
Format: [bitmask 4 bytes] [icon tile 1 byte] per entry (5 bytes each)
01 00 00 00 E7  knife        08 00 00 00 B6  knightsword
04 00 00 00 E3  sword        02 00 00 00 B7  ninjasword
10 00 00 00 E8  spear        40 00 00 00 BF  hammer
20 00 00 00 E9  axe          00 00 02 00 B5  heavy helmet
80 00 00 00 EA  katana       00 00 04 00 F2  light helmet
00 01 00 00 EB  rod          00 00 00 10 B4  mage hat
00 06 00 00 EC  staff        00 00 08 00 C1  ribbon
00 08 00 00 ED  bow          00 00 10 00 F3  heavy armor
00 10 00 00 EE  harp         00 00 20 00 B3  medium armor
00 20 00 00 EF  whip         00 00 40 00 C3  mage robe
00 40 00 00 F0  bell         00 00 80 00 00  common (none)
00 80 00 00 00  none         00 00 00 03 F4  ring/glove
00 00 01 00 F1  shield       00 00 00 04 00  thief glove (none)
```
- Rendering code: C2/D7F6 (bottom row), C2/D802 (top row, equip/job screens)
- VRAM destination for equip icons in job menu: C2/CD4F
- WRAM buffer: $7E65EA (Eqp: label area), $7E65F2 (icon tiles)

### 14.3 Custom Patches Applied
- **Blanked $CF at E7/$3012**: Removed unwanted colon icon from equip screen
  - Side effect: broke loading screen time colon (shared E7 byte)
  - Fix: C3/B5AB-B5AD — redirected label reference to alternate colon source, adjusted X offset
- **Mime duplication fix**: 3-byte patch (details from prior session)
- **Paladin/Freelancer icon row adjustment**: Custom ASM at expanded ROM space
  - Checks class ID at $7E01D8 (≥$14 = paladin/freelancer)
  - Adjusts starting icon position for wider equip range

---

---

## 15. WEBAPP ROM EDITOR (tools/ff5/)

### 15.1 Architecture
HTML5 webapp with JSON-driven ROM definitions. All addresses live in the JSON files;
JS files reference data by property name (`this.rom.battleProperties`, etc.).
Base framework in `tools/rom/` (romtools.js, gfx.js, tose70.js) and `tools/lib/`.

### 15.2 JSON Definition Files
- `ff5u-sfc.json` — RPGe SFC ROM map (10,197 lines, primary reference)
- `ff5j-sfc.json` — Japanese SFC
- `ff5u-gba.json` — GBA English
- `ff5e-gba.json` — GBA European

### 15.3 Editor JS Files
- `ff5-battle.js` — Battle encounter editor (monster placement, graphics, palettes)
- `ff5-battle-bg-editor.js` — Battle background tilemap viewer/editor
- `ff5-map.js` — Map editor (layers, triggers, NPCs, sprites, world maps)
- `ff5-map-layer.js` — Map layer decoder (metatile expansion algorithm)
- `ff5-map-tileset.js` — Tileset decoder (interlace pipeline, animation patching)
- `ff5-script.js` — Event/trigger/NPC script editor (opcode encode/decode)
- `ff5-level.js` — Level progression chart (EXP/HP/MP curves)

### 15.4 Key Code Cross-References (pointer table refs in executable code)
```
C0 Bank:
  $C00691/$C00697 — entrance trigger ptr table bounds
  $C006A6-$C0072F — entrance trigger pointer offsets (9 locations)
  $C0064A/$C00650 — event trigger ptr table bounds
  $C0065C/$C00675 — event trigger pointer offsets
  $C00D7B/$C00D86 — treasure pointer refs
  $C05CC4/$C05CCF — treasure pointer refs (alt path)
  $C00DB9-$C00E3B — treasure property refs (8 locations)
  $C05CFB/$C05D09 — treasure property refs (alt path)
  $C06ACD — map layouts bank byte
  $C06AE1/$C06AE7/$C06AF4 — map layout pointer table
  $C069A2 — world layout bank byte
  $C069CF/$C069DA — world layout pointer table
  $C05BB8-$C05BF4 — mapColorMath inline data
  $C09D9B-$C0A18B — mapAnimationProperties inline data
  $C02A95-$C02F95 — mapSpriteFrame inline data

C1 Bank:
  $C133E2/$C133E8/$C133EE — battleBackgroundLayout pointer + bank
```

---

## 16. CRAWLER SCRIPTS & GENERATED RESOURCES

### 16.1 Naming/Collation Scripts (Python, in crawler root)
All scripts read ROM data + existing JSONs, cross-reference, and output named JSON.
Re-runnable; cached in project folder for iterative refinement.

| Script | Output JSON | Records | Coverage |
|--------|------------|---------|----------|
| `name_events.py` (v4) | `ffv_event_names_0-1939.json` | 1,940 events | Named w/ dialog + switch/NPC cross-refs |
| `name_triggers.py` | `ffv_trigger_scripts_0-703.json` | 704 trigger scripts | Conditions, events, map placements |
| `name_npc_switches.py` | `ffv_npc_switches_0-921.json` | 922 NPC switches | 746 named (80%) via map+dialog cross-ref |
| `name_event_switches.py` | `ffv_event_switches_0-511.json` | 512 event switches | 464 named (90%) via 4-source cross-ref |
| `name_entrance_triggers.py` | `ffv_entrance_triggers_0-510.json` | 1,283 entrance triggers | Full map connectivity |
| `build_map_atlas.py` | `ffv_map_atlas.json` (1 MB) | 512 maps | Aggregated per-map data |

### 16.2 Event Switch Naming — Map Resolution Pipeline
Event switches are named by cross-referencing 4 data sources:
1. **Event trigger placements** (atlas `eventTriggers`) — event_id → map
2. **Trigger script placements** (`mapPlacements` in trigger JSON) — event_id → map
3. **NPC caller placements** (event.npcScripts[] → npc.mapPlacements[]) — event_id → map
4. **Checker maps** (triggers/NPCs that check the switch) — LAST RESORT only

**Map trust hierarchy** (setter maps > single-checker > skip):
- Setter maps (sources 1-3): used directly if ≤3 unique maps per event
- Multi-map subroutines (>3 maps, e.g. Piano NPC on 8 pubs): skip maps entirely,
  also skip checker maps (set `is_subroutine` flag)
- Single-checker fallback: only if all checker locations agree on one map AND
  setter isn't a subroutine
- Multiple checker maps: skip — use event name only

**Known pattern: subroutine events** (Inn handlers 1280-1300, Piano 1792-1798)
have no direct trigger/NPC map placement. They're called via `call()` from other
events. Map attribution is omitted; event name (e.g. "Inn (630gp)") is used alone.

### 16.3 Webapp Integration — String Table Injection
`inject_string_tables.py` merges crawler-generated names into `tools/ff5/ff5u-sfc.json`:

| String Table | Location in JSON | Original | After Inject |
|-------------|-----------------|----------|-------------|
| `eventSwitch` | `stringTable.eventSwitch.string` | 8 | 464 |
| `npcSwitch` | `stringTable.npcSwitch.string` | 298 | 746 |
| `eventScript` | `assembly.eventScript.stringTable.string` | 21 | 1,914 |
| `triggerScript` | `assembly.triggerScript.stringTable.string` | 3 | 679 |
| `battleGroupRandom` | `assembly.battleGroupRandom.stringTable.string` | 0 | 245 |
| `battleGroupEvent` | `assembly.battleGroupEvent.stringTable.string` | 0 | 198 |

Script uses **rebuild** (not merge) — starts from hardcoded originals, adds fresh
auto-generated names. Safe to re-run after updating any source JSON.

### 16.4 Webapp Architecture (ff6tools)
- Browser SPA at `tools/ff6tools.html`, no build system
- ROM loaded → `ff5u-sfc.json` parsed → `ROMObject.create()` → `rom.disassemble()`
- `stringTable` entries are the primary extension point for naming
- `"link": "mapProperties[%i]"` enables cross-navigation via `parsePath()`
- Editors extend `ROMEditor`, activated by `"editor"` property in JSON def
- `FF5Map` renders tiles, triggers, NPCs, entrances with PPU emulator
- `FF5Script` delegate generates human-readable event/trigger command descriptions

See `CROSSWALK_NOTES.md` for full Phase 1-4 integration plan.

### 16.5 Label Enrichment Pipeline (v2)

After PR feedback requesting unique + more descriptive labels, a comprehensive
enrichment pipeline was built (`enrich_labels.py`):

**Data sources extracted from ROM:**
- Monster names: $E00050, 384 entries, 10-byte fixed-length text (373 non-empty)
- Battle formations: $D03000, 512 entries, 16 bytes each (monster slots at bytes 4-11)
- Note: 2-byte DTE pair 0xA6A7 = "Bla" (required for "BlackGoblin" etc.)
- Boss monsters use offset +256 (flagged by byte 15 bit 5)

**Enrichment transforms:**
- `battle(264)` -> `Sekmet(Bat.264)` (monster names from formations)
- `event_switch` -> `ESw.269:Obtained Cabin!=ON` (switch names inlined)
- `npc_switch` -> `NSw.544:It's locked.=OFF` (NPC switch names inlined)
- `call(1407)` -> `call: Restore Party HP/MP/Status` (call target resolution)
- `Shop #0` -> `Tule - Weapon Shop(Sh.0)` (shop name lookup)
- Bracket notation removed, comma-separated format used throughout
- Trigger script double-map bug fixed (strip map prefix from event names)
- Circular references detected and avoided (switch named after its own event)

**Deduplication:**
- `(n) ` prefix added to all duplicate names within each table
- Result: 100% unique names across all 6 tables (4,246 / 4,246)

**Full pipeline order (idempotent, safe to re-run):**
1. `name_events.py` -> `event_names_0-1939.json` (base ROM parse)
2. Copy to `ffv_event_names_0-1939.json`
3. `improve_event_names.py` (add map prefixes, 420 events enriched)
4. `name_event_switches.py` -> `ffv_event_switches_0-511.json`
5. `enrich_labels.py` (resolve all refs, dedup, inject into webapp JSON)

### 16.6 Map Display on Script Selection (mapLookup)

When a user selects an Event Script or Trigger Script in the webapp, the central
map pane now automatically shows the associated map. This is powered by lookup
tables injected into the webapp JSON.

**Data pipeline (in `enrich_labels.py`):**
1. **Direct map associations** (3 sources, same as `improve_event_names.py`):
   - Atlas `eventTriggers[].events[]` → map's `mapId`
   - Trigger script `mapPlacements[].mapId` → event IDs from `events[]`
   - NPC caller chains: event's `npcScripts[]` → NPC's `mapPlacements[].mapId`
   - Result: ~1,197 events with direct map associations
2. **Reverse call-graph** (for unmapped subroutine events):
   - Parse all 1,940 event scripts for opcode 0xCD (call) targets
   - Build reverse index: `callee_id → [caller_ids]`
   - BFS up caller chain (max depth 3) to find a caller with a known map
   - Result: ~482 additional events resolved (Inn handlers, Piano scripts, etc.)
3. **Trigger lookup**: first `mapPlacements[].mapId` per trigger script
   - Result: ~655 triggers

**Webapp JSON injection:**
- `assembly.eventScript.mapLookup` = `{ "114": 131, ... }` (1,679 entries)
- `assembly.triggerScript.mapLookup` = `{ "1": 184, ... }` (655 entries)
- String-keyed dicts with integer mapId values

**JS hook (`property-list.js`, `select()` method):**
- When `object instanceof ROMScript`, look up `definition.assembly[parentKey].mapLookup[object.i]`
- If found, call `this.showEditor(this.rom.mapProperties.item(mapId))`
- `parentKey` is `object.parent.key` → `"eventScript"` or `"triggerScript"`
- Events without a known map leave the map pane unchanged

### 16.7 Battle Group Auto-Naming

The webapp's Battle category has three sub-options: Battles (512, already named),
Random Battle Groups (256), and Event Battle Groups (256). Groups are a lookup
layer holding indices into the master 512 battleProperties. `enrich_labels.py`
now auto-names both group types.

**ROM data extracted:**
- `battleGroupRandom`: $D06800, 256 × 8 bytes (4 × 16-bit LE, mask 0x03FF)
- `battleGroupEvent`: $D07800, 256 × 4 bytes (2 × 16-bit LE, mask 0x03FF)
- `mapBattleGroups`: $D08000, 512 × 2 bytes (map → random group index)
- Event script opcodes 0xBD/0xE2/0xE8 byte 1 bits 0-6 → event group index

**Reverse lookups:**
- `rand_group_to_maps`: 158 random groups referenced by maps (excl group 0)
- `evt_group_to_events`: 85 event groups referenced by scripts

**Naming strategies:**
- Random groups: unique monsters joined with `/` (max 3, 12 chars each);
  if 1-3 maps reference the group, prepend first map name from atlas
- Event groups: monsters from 2 formation slots (joined ` / ` if different);
  event context from first referencing script with a map prefix (skip dialog-only)

**Webapp injection:**
- `assembly.battleGroupRandom.stringTable.string`: 245 entries
- `assembly.battleGroupEvent.stringTable.string`: 198 entries
- Unnamed entries (11 random, 58 event) fall through to `default: "... Group %i"`

**Coverage:** 245/256 random + 198/256 event = 443 battle groups named

### 16.8 Font / Tile Infrastructure

Core tilemap font extraction pipeline built for per-tile webapp editing.

**ROM data confirmed:**
- Font tile graphics: file offset `$11F000`, SNES 2bpp, 8×8 px, 16 bytes/tile, 256 tiles
- Tile index formula: `row*16 + col` in the 16-wide grid; anchor B = tile `$61` (col 1, row 6) ✓
- Palette: file offset `$F827`, 4×BGR555 LE: `0x0000`=black / `0x4000`=dark-blue / `0x39CE`=grey / `0x7FFF`=white

**Files created:**
- `ffv_menufont_RPGe.tbl` — UTF-8 font table (256 entries, `HH=value` format); RPGe reference schema
- `ffv_menufont_ff5c.tbl` — fork for custom ff5c ROM; new ligatures filled in at $A6–$A9 and $B1–$BB;
  uncertain slots ($B4/$B6/$B7/$B9/$BB) marked [?] for author review
- `extract_font_tiles.py` — 2bpp extractor (Pillow); outputs per-ROM to `out/<rom_stem>/font/`:
  - `font_sheet.png` — 16×16 composite, authentic palette
  - `font_sheet_labeled.png` — annotated with hex ID + tbl character
  - `font_sheet_light.png` — grey background (reveals dark-blue icon tiles $40–$52)
  - `tiles/tile_XX.png` — 256 individual tiles at 4× scale
- Usage: `python extract_font_tiles.py` (RPGe) or `python extract_font_tiles.py 0x11F000 ff5c.sfc`

**tbl layout (RPGe):**
- `$00–$1F`: control/event codes ($01=EOL, $02=Bartz, $0C=Delay, $17=Wait)
- `$20–$39`: uppercase A–Z set 1 (dialogue font, `_` suffix)
- `$3A–$40`: status icons: stone/toad/mini/float/poison/zombie/darkness
- `$41–$50`: status/battle icons (dark-blue; visible on light sheet); cursor ▼ TBD
- `$51–$52`: solid dark-blue background fill tiles
- `$53–$5C`: digits 0–9 · `$5D–$5F`: stat glyphs "m"/"H"/"P"
- `$60–$79`: uppercase A–Z set 2 (menu font, CONFIRMED) · `$7A–$93`: lowercase a–z
- `$94–$B0`: kerning ligature tiles (il/it/li/ll/'/"/:/;/,/(/) + ti/fi/`/~/if/lt/tl/ir/tt)
- `$B1–$BB`: hiragana/katakana modifiers (RPGe-untouched); repurposed in ff5c for new ligatures
- `$BC–$C4`: item-type icons (Key/Shoe/Hamr/Tent/Ribn/Drnk/Suit/Song)
- `$C5–$CF`: punctuation set 2 ($C9/$CB/$CF are menu-system dupes, bracketed for future removal)
- `$D0–$DF`: bar tiles + controller button icons (A/B/X/Y/L/R…; $D2–$DF incl $F5=[Btn-U])
- `$E3–$F4`: weapon/armor type icons · `$F7–$FE`: gauge fill tiles =1–=8 · `$FF`: space

**ff5c.sfc custom ROM (4MB expanded):**
- Same tile offset ($11F000) and palette ($F827) as RPGe
- Custom letterforms ($20–$93), redesigned status icons ($3A–$4F), reworked item icons ($C0–$CF)
- 20 new ligatures distributed across: `$A6–$A9` (yo/te/le/el), `$B1–$BB` (ie/in/ou/ow/oo + 6 TBD)
- Tile identification method: read `tiles/tile_XX.png` individually at 4× scale; compare left-char
  shape to known single-char tiles (e.g. $92=y confirmed the Y-fork = 'y', making $A6=yo not ro)

**Gotchas:**
- `1bpp` in `1bpp.tbl` = 1-byte-per-character TEXT encoding, NOT tile storage format; tiles are 2bpp
- Space tile `$FF` is solid dark-blue (palette index 1), NOT all-zero bytes — heuristic search
  must not require `tile[$FF] == 0x00*16`

---

*Notes compiled by Claude for romhacking context persistence.*
*Last updated: 2026-03-16 (v12: v0.9 failure confirmed — ATB conflict at $7F:0010; v1.0 tried $7F:00C0 — failed; v1.1 two-hook design ready for test; new files: rom_compare.py, rom_comparison_notes.md)*

*Additional notes added on March 11th with observer initiative; encouraged to supplement these while working*
**Findings:**
Found the DMA setup at C0/$4AE4.
I'm seeing the OAM shadow clearly at $0200.
The attribute byte write loop is at C1/67C3.

---
## KO Palette Hack — Research Log (March 11, 2026)

### What $BC88-$BC8A actually does (CONFIRMED WRONG ASSUMPTION)
$BC88-$BC8A → feed HDMA channels → write to COLDATA ($2132) at C1/12CB (`STA $420C`).
These bytes control the KO sprite COLOR TINTING/DISSOLVE effect (screen-level color math), NOT OAM palette.
C1/1292: `LDA $BC88 → STA COLDATA` confirmed from Mesen debugger screenshot.
The first patch attempt (writing $E8/$EA/$EC to $BC88-$BC8A) was patching the wrong system entirely.

### WRAM OAM Shadow: $0200-$03FF (confirmed)
- 128 sprites × 4 bytes each = 512 bytes at $7E:0200-$7E:03FF
- OAM high table (2 bits/sprite) at $7E:0400-$7E:041F
- Clear code confirms: C1/62EB fills $0300-$03FF with $F0F0 (hides sprites 64-127)
- C1/632E fills $0220-$02F7 with $F0F0 (hides sprites 8-61)
- C1/5FF0-$6013 writes sprites 0-1 from $CD48/$CD49/$CD4A/$CD4B tables

### Party character OAM sprite layout
Each character uses up to 10 sub-sprite OAM slots ($0A stride between slots).
Base sprite assignments (set by C1/6D5C-6DDF loop):
- Slot 0 (top char):    sprites 94-103,  OAM bytes $0178-$01A3
- Slot 1:               sprites 84-93,   OAM bytes $0150-$0177
- Slot 2:               sprites 74-83,   OAM bytes $0128-$014F
- Slot 3 (bottom char): sprites 64-73,   OAM bytes $0100-$0127
Bartz (slot 3) confirmed at sprite 68 (OAM $0110), attribute=$3E (palette 7) via Mesen.
WRAM address for Bartz's first sub-sprite attribute: $0303 (= $0200 + sprite64*4 + 3).

### $CF4B table: per-slot ALIVE OAM attribute byte
Computed at C1/6DCA-6DCE: `tya / asl / ora #$38 / sta $CF4B,X`
- Slot 0: $CF4B+$00 = $38  (priority 3, palette 4)
- Slot 1: $CF4B+$20 = $3A  (priority 3, palette 5)
- Slot 2: $CF4B+$40 = $3C  (priority 3, palette 6)
- Slot 3: $CF4B+$60 = $3E  (priority 3, palette 7)  ← matches Mesen OAM capture ✓
These are used for ALIVE sprite frames only.

### General sprite attribute source: ROM table $D83452 (bank $D8)
OAM write loop at C1/679D-67D2:
  X = index into $D83452 (4-byte sprite entries: X_off, Y_off, tile, attribute)
  Y = OAM byte offset (starts at sprite_start[slot] * 4, advances +1 per byte)
  C1/67C3: `lda $D83452,X`  ← attribute byte from ROM
  C1/67C7: `eor $F7`         ← apply direction flip ($00=right, $40=left)
  C1/67C9: `sta $0200,Y`     ← write to WRAM OAM shadow
For KO frames: $D83452 table entries have attribute $E0 (Y-flip|X-flip|priority2|palette0).
This is almost certainly where the wrong palette-0 attribute gets written to OAM during KO.

### Outer slot loop: C1/667C-66D4
Iterates X = 0,1,2,3 (one per party slot).
- Y = X * 32 = $CF table stride offset
- `lda $D1CF,X` = animation state per slot
- state == 8: calls C1/66D5 (special sprite writer, writes hardcoded attr $31 to OAM)
- state != 8: calls C1/673A (general sprite writer → eventually C1/679D OAM loop)
C1/66CA: `phx / jsr $673A / plx` — slot index X preserved across call.

### C1/F4EF: NOT OAM DMA (resolved)
C1/F4DA-$F54C sets up HDMA for Mode 7 matrix coefficients:
- Channel 0: $4301=$1B → B-bus $211B (M7A), source $7E:BCB1
- Channel 1: $4301=$1C → B-bus $211C (M7B), source $7E:BF52
- Channel 3: $4301=$1D → B-bus $211D (M7C), source $7E:C1F3
- Channel 7: $4301=$1E → B-bus $211E (M7D), source $7E:C494
This is NOT OAM DMA. No `$4301 = $04` (OAM DMA) found yet in C1.

### OAM DMA CONFIRMED — C0/$4D42-$4D66 (bank C0, NOT C1)
C04D4D: STA $4301 = $04    ← B-bus $04 = $2104 = OAMDATA — THIS IS THE OAM DMA
C04D53: STX $4302 = $0200  ← DMA source = WRAM $0200 (OAM shadow start) ✓
C04D58: STA $4304 = $00    ← source bank = $00
C04D5E: STX $4305 = $0220  ← length = 544 bytes = 512 (low table) + 32 (high table) = full OAM ✓
C04D63: STA $420B = $01    ← trigger DMA channel 0
Second sub at C04D67: CGRAM DMA (B-bus $22 = $2122 = CGDATA), separate palette upload.
Write breakpoint on $7E0303 fires EVERY VBLANK because Mesen triggers on DMA reads too.
"Debugger opened" and "Power/reset" checkboxes in Break settings caused immediate title-screen break.

### Execute breakpoint result — KO attribute path in BANK D9
D97CAA–D97CB3: VBlank SYNC BARRIER (per-slot, called from C1/$FD1D via JSL)
  Return address from call stack: bank $C1, addr $FD21 → JSL was at C1/$FD1D
D97CB4–D97CD0: OAM CLEAR ROUTINE
  LDA #$F0 / STA $0200,X loop: CPX #$0200 → fills 512 bytes (sprites 0-127 all hidden)
  LDA #$00 / STA $0400,X loop: CPX #$0020 → fills 32 bytes (OAM high table zeroed)
  RTL — called separately, NOT part of the sync barrier
Y=$0006 during sync = slot_index × 2 = slot 3 (top hero KO'd maps to internal slot 3)
  Per-slot rendering loop: Y = 0,2,4,6 for slots 0,1,2,3 — sync barrier called once per slot
Execute BP fired at D9/$7CB1 (wrong — bank prefix C1 was missing, Mesen defaulted to wrong bank)
C1/FD1D: JSL $D97CAA (VBlank sync wrapper) + RTS — part of VRAM DMA pipeline at C1/FD27-FD9B
C1/3A6E: animation state machine dispatcher ($CD38 → jump table $C13A96, ~30 handlers)
Party char sprite writes SEPARATE chain: C1/1935→$667C→$673A→$679D→C1/67C9
C1/67C9 execute BP did NOT fire during KO — KO sprite is NOT written by $667C→$673A→$679D chain
Reason: C1/668A `lda $D1CB,X / bne $66CE` — KO slots likely have $D1CB,X != 0 → SKIP whole render
KO lying-down sprite is written by $3A6E animation dispatch (separate path)
UNRESOLVED: does OAM attr actually change to $E0 when KO'd, or stays $3E and COLDATA does all coloring?
NEXT SIMPLE CHECK: pause during KO, WRAM Memory Viewer at $0303 — is it $E0 or $3E?
If $E0: OAM palette changes, need to trace $3A6E dispatch handlers for KO animation
If $3E: color change is COLDATA-only, patch approach shifts to $BC88 HDMA values
NEXT: read C1/$FD1D-$FD40 to see what runs after RTL from sync (the actual OAM write for slot)
Execute BP at C1/67C9 (A==$E0) fired at D9/7CB1 instead — meaning the KO OAM write
is in bank D9, called FROM C1 via JSL or similar long-call mechanism.
D97CAA–D97CB3: VBlank SYNC BARRIER (INC $A5 / loop: LDA $A5 / ORA $DB9A / BNE loop / RTL)
  — spins until VBlank ISR clears $A5=0 AND $DB9A=0 — NOT the patch site.
  — breakpoint fires hundreds of times per frame (every loop iteration); A=$0001 during spin.
D97CB4: LDX #$0000    ← NEW subroutine after RTL
D97CB7: LDA #$E0      ← PROBABLE PATCH SITE — loads KO OAM attribute (palette 0!)
Status at break: Y=$0006 (sub-sprite counter or stride, NOT OAM offset), X=$0030, DB=$7E
NEED: read disassembly at D97CB7 onwards to see where $E0 is written to OAM shadow ($0200+)

### NEXT STEP: Execute breakpoint at C1/67C9 with condition A==$E0
DO NOT use write breakpoint on WRAM — fires on DMA every VBlank.
Instead: Mesen Execute breakpoint at address C1/67C9 (`sta $0200,Y`), condition: A == $E0
Also uncheck "Debugger opened" and "Power/reset" in Break on... panel.
When a character is KO'd in battle, breakpoint fires only for the CPU write of the $E0 attribute byte.
At that hit: Y = OAM byte offset → derive party slot from Y range:
  $100-$127 = slot 3, $128-$14F = slot 2, $150-$177 = slot 1, $178-$1A3 = slot 0

### Patch strategy (once site confirmed)
Hook C1/67C3-67C9 sequence. When attribute byte has bit 7 set (Y-flip = KO indicator):
- Derive slot from OAM offset Y:
  - Y & ~3 in range $100-$127 → slot 3, correct attr = $EE
  - Y & ~3 in range $128-$14F → slot 2, correct attr = $EC
  - Y & ~3 in range $150-$177 → slot 1, correct attr = $EA
  - Y & ~3 in range $178-$1A3 → slot 0, correct attr = $E8
- Replace palette bits (bits 3-1) in the attribute byte before writing to OAM.
Freespace for patch routine: $C9FF9C-$CA0000 (file offset $09FF9C, 100 bytes).


### Phase 2, New Sprites:
Two tiny wrapper stubs:
  - C1/FD1D: JSL $D97CAA + RTS — calls the VBlank sync barrier
  - C1/FD22: JSL $D97CB4 + RTS — calls the OAM clear

After sync, C1/$02F2 calls $3A6E → $AD2D → jmp $37EF — those are the actual sprite write routines.

---
## KO Palette Hack — Research Log (March 11, 2026, continued)

### FOUND: KO sprite attribute write site — C1/6289 (CONFIRMED)

The KO lying-down sprite is written by C1/$6268, called from the loop at C1/$61C9.
NOT through the alive-sprite chain ($667C → $673A → $679D → $67C9) which skips KO slots.

**C1/$6268 — single KO sprite writer (all 4 OAM bytes)**:
  C1/6268: sta $88           ← incoming X-pos adjustment
  C1/626A: lda $D03E,X       ← X position from ROM table (indexed by slot X=0-3)
  C1/626D–$6275: scroll/flip → sta $0200,Y  ← write X pos to OAM
  C1/6278: lda $D04A,X       ← Y position from ROM table
  C1/627B–$6281: offset → sta $0201,Y       ← write Y pos
  C1/6284: lda #$EC          ← HARDCODED KO TILE ($EC = lying-down sprite tile)
  C1/6286: sta $0202,Y       ← write tile
  C1/6289: lda #$33          ← HARDCODED KO ATTRIBUTE BASE ($33 = priority 3, palette 1, NT1)
  C1/628B: eor $F7           ← apply direction flip ($F7=$40 for left-facing)
  C1/628D: sta $0203,Y       ← write attribute ← THIS IS THE PATCH SITE
  C1/6290–$6293: iny×4
  C1/6294: rts

$33 eor $40 (left-facing) = $73 ← CONFIRMED MATCHES USER'S WRAM CHECK ✓
X = slot index (0,1,2,3) throughout — NOT modified inside $6268.
Callers: C1/$61F2 (slot 0, X=0), $6218 (X=1), $623E (X=2), $6264 (X=3), each guarded by $DB75 bits.

### Complete patch plan (ready to apply)

**Step 1: Restore old wrong hooks** (if $017D8C/$017DCB were modified):
  - File $017D8C (11 bytes): A9 E0 8D 88 BC 8D 89 BC 8D 8A BC
  - File $017DCB (11 bytes): A9 E0 8D 88 BC 8D 89 BC 8D 8A BC

**Step 2: Write new hook** at file $016289 (7 bytes):
  5C 9C FF C9 EA EA EA   ; JML $C9FF9C + 3×NOP

**Step 3: Write freespace routine** at file $09FF9C (19 bytes):
  BF AB FF C9  ; LDA $C9FFAB,X  — load alive_attr from inline table (slot 0-3 → $38/$3A/$3C/$3E)
  09 01        ; ORA #$01       — set name-table bit (NT1 for KO tile set)
  45 F7        ; EOR $F7        — apply direction flip
  99 03 02     ; STA $0203,Y    — write KO attribute with correct palette
  5C 90 62 C1  ; JML $C16290   — return to INY×4 / RTS
  38 3A 3C 3E  ; inline table: slot 0→$38, slot 1→$3A, slot 2→$3C, slot 3→$3E

**Result**: KO attributes become:
  Slot 0 (palette 4, left): $39 eor $40 = $79  (was $73)
  Slot 1 (palette 5, left): $3B eor $40 = $7B  (was $73)
  Slot 2 (palette 6, left): $3D eor $40 = $7D  (was $73)
  Slot 3 (palette 7, left): $3F eor $40 = $7F  (was $73)

**Addressing mode notes**:
  LDA $C9FFAB,X = opcode BF (LDA long,X, 24-bit address, X unchanged, accesses ROM bank $C9)
  EOR $F7 = opcode 45 (Direct Page, reads WRAM $7E:00F7 via bank-0 DP, works from any bank)
  STA $0203,Y = opcode 99 (absolute indexed Y, uses DBR=$7E from caller context)

**ALSO**: $3A6E animation dispatch jumps to ~30 handlers via table at $C13A96.
  Handler $3CC1 (index not in $3A6E table — called from outside) calls jsr $02F2 → full sprite pipeline.
  The $3Cxx handlers (indices 9-17, 25-28) jump to $44xx and $43xx — animation state setters.
  None of the $3A6E handlers directly write OAM — they update animation state only.

---
## KO Palette Hack — Research Log (March 15, 2026) — PARADIGM SHIFT

### OAM attribute approach was wrong (v0.4–v0.7 all invalid)
Confirmed via Mesen Sprite Viewer: OAM palette indices (4–7 per slot) do NOT change when a character
is KO'd. The palette field in OAM stays correct. The earlier research log above (patch at $016289,
writing $38/$3A/$3C/$3E corrected attributes) was chasing the wrong mechanism.

### Real bug: CGRAM color contents change to Freelancer on KO
Confirmed via Mesen CGRAM viewer: when a character KOs, the 32 bytes for their CGRAM palette slot
($C0–$CF for slot 0, etc.) change from job-specific colors to Freelancer palette colors.
OAM still says "use palette 4" but palette 4 now contains Freelancer colors.
$BC88/$BC89/$BC8A are COLDATA (color math staging) bytes, NOT OAM attributes — another earlier
misconception corrected.

### Root cause: $C1/7CB5 palette loader called with palette_group=0 for KO
Call chain on KO event:
  KO event → C1/$DECB (`jsr $DEA6 / jmp $7A2A`) → $7A2A sets $D0F4=1 → $7979 dispatch → $7CB5

$D10A layout: bits 6–5 = party slot (0–3), bits 4–2 = palette group (0=Freelancer), bits 1–0 = flags
$9A = (D10A bits 4–2) >> 1 = palette_group×2 (0 for KO/Freelancer)
$0A32 computes: ($9A × $CEF600[sprite_offset]) >> 8 → one CGRAM color byte
16-iteration loop fills $F9CC[0..15], then copies to $ACB7 CGRAM shadow → DMA'd to CGRAM each frame

### Correct patch site: $C1/7CD9 — inside the 16-iteration loop
At C1/7CD9–7CDC: `AND #$1C / LSR / STA $9A` — re-reads $D10A and sets $9A every iteration.
Hook (5 bytes): `5C 9C FF C9 EA` — JML to freespace at $C9FF9C + NOP
File offset: $017CD9

### v0.8 — hook correct, freespace logic correct, backup table in ROM (FAIL)
Freespace used `BF C2 FF C9 / 9F C2 FF C9` (LDA/STA $C9FFC2,X).
$C9FFC2 is ROM — STA silently discarded, LDA always returns $00.
Result: restore path always sees backup=0 → BEQ fires → $9A stays 0 → no change.

### Critical discovery: ff5c.sfc was NEVER patched before this session
Confirmed via Python read: hook bytes at $017CD9 were original game code (`29 1C 4A 85 9A`),
freespace at $09FF9C was all zeros. Every prior test failure (v0.8, early v0.9 attempts) was
running the completely unpatched ROM. The $7F:0010 WRAM fluctuations the user observed during battle
were unrelated game activity, not our hook. Backup created as `ff5c.sfc.bak`.

### v0.9 — patch applied to ff5c.sfc 2026-03-15 (CONFIRMED FAILED)
Hook at file $017CD9 (unchanged): `5C 9C FF C9 EA`
Freespace at file $09FF9C (42 bytes — as confirmed in ROM by rom_compare.py):
  29 1C 4A 85 9A AD 0A D1 29 60 4A 4A 4A 4A 4A AA A5 9A D0 0A
  BF 10 00 7F F0 08 85 9A 80 04 9F 10 00 7F 5C DE 7C C1 00 00 00 00
Backup table: $7F:0010–$7F:0013 (4 bytes, one per slot)
Logic: replicate hook-site AND/LSR/STA, extract slot→X from D10A bits 6–5,
  if $9A≠0: STA $7F0010,X (save alive palette group)
  if $9A=0: LDA $7F0010,X — if non-zero restore $9A, else keep 0 (genuine Freelancer)
  JML $C17CDE (return to loop: LDA $88 / JSR $0A32)

### WRAM address history (lessons)
- $C9FFC2: ROM, not WRAM — STA silently discarded, LDA returns $00 ✗
- $7F:0010–$7F:0013: ATB turn-order tracking; values fluctuate and reset to $00 mid-battle — confirmed conflict ✗
- $7F:0080–$7F:0083: confirmed occupied by game ✗
- $7F:00C0–$7F:00C3: v1.0 backup table; v1.0 failed but WRAM address may not be root cause (see v1.1)

### Second palette write path found (bank $C0)
Write breakpoint on $7EACB7 fired outside battle at PC=C05E98 (bank $C0 code).
C0/$5E96: `JSL $FAF2AC` — calls palette computation subroutine.
$FAF2AC via HiROM mirror (2.5MB ROM mod $280000) = file offset $12F2AC = bank $D2 original game code.
This is the world-map/menu palette update path, NOT the battle KO path (fired outside battle only).
During battle the $7EACB7 write breakpoint fires too frequently (every alive-state palette update)
to isolate the KO-specific write. Full investigation deferred.

### v0.9 failure root cause (CONFIRMED 2026-03-16)
$7F:0010–$7F:0013 used by ATB system — changes from $00 to other values as characters/monsters act,
then resets to $00 after turns complete. Hook fires correctly (backup save writes non-zero values),
but ATB overwrites backup with $00 before KO restore runs. Restore sees $00 → BEQ → $9A stays 0 → Freelancer.

Additional confirmed facts this session:
- $F8C5 = $00 during KO → CGRAM copy NOT blocked (not the issue)
- OAM palette indices = 04/05/06/07 per slot — OAM unchanged on KO (not the issue)
- $BC88–$BC8A locked at $E0 during battle — COLDATA staging bytes, NOT OAM attributes (not the issue)
- $7CB5 confirmed in BOTH noisecross C1 disassembly (line 15714) AND debugger — not an assumption
- rom_compare.py: confirmed v0.9 hook + payload present in ff5c.sfc; payload uses $7F:0010

### v1.0 — $7F:00C0 backup (FAILED)
Hook at $017CD9 unchanged. Payload: BF/9F operand changed to `C0 00 7F` (= $7F:00C0).
$7F:0080–:0083 confirmed occupied; $7F:00C0–:00C3 appeared unused.
Result: KO still shows Freelancer. Exact failure mode unclear — $7F:00C0 may be occupied,
OR (more likely) D10A bits 4-2 are already zeroed inside $7979 dispatch path before our hook at $7CD9 fires.

### v1.1 — two-hook approach (DESIGNED 2026-03-16, READY FOR TEST)
Move the SAVE to the death path at $7A65 (fires before D10A is zeroed). Keep RESTORE inside $7CB5 loop.

**Hook 1 — SAVE at death path**: File $017A65, replace `9C 0A D1 7B` (4 bytes):
  5C C8 FF C9    JML $C9FFC8

**Save payload at $09FFC8** (31 bytes):
  AD 0A D1        LDA $D10A        ; D10A still valid here (before STZ fires)
  29 1C           AND #$1C         ; palette bits 4-2
  4A              LSR              ; → palette_group
  48              PHA              ; save palette_group
  AD 0A D1        LDA $D10A        ; re-read for slot bits
  29 60           AND #$60         ; bits 6-5 = slot
  4A 4A 4A 4A 4A  LSR×5           ; → slot index 0-3
  AA              TAX
  68              PLA              ; A = palette_group
  9F C0 00 7F     STA $7F00C0,X   ; backup[slot] = palette_group
  9C 0A D1        STZ $D10A        ; original instruction (replicate)
  7B              TDC              ; original instruction (replicate)
  5C 69 7A C1     JML $C17A69     ; return after hook site

**Hook 2 — RESTORE at $7CB5 loop**: File $017CD9 unchanged: `5C 9C FF C9 EA`

**Restore payload at $09FF9C** (30 bytes — replaces v0.9/v1.0 save+restore logic):
  29 1C 4A 85 9A  AND #$1C / LSR / STA $9A     ; replicate hook-site
  D0 13           BNE +$13 → skip restore        ; if $9A≠0 already has palette, done
  AD 0A D1        LDA $D10A
  29 60           AND #$60                       ; slot bits
  4A 4A 4A 4A 4A  LSR×5 → slot 0-3
  AA              TAX
  BF C0 00 7F     LDA $7F00C0,X                 ; load saved palette_group
  F0 02           BEQ +$02 → keep $9A=0         ; backup=0 → genuine Freelancer
  85 9A           STA $9A
  5C DE 7C C1     JML $C17CDE                   ; return to LDA $88 / JSR $0A32

**WRAM backup**: $7F:00C0–$7F:00C3 (unchanged from v1.0)
**Space**: $09FF9C–$09FFB9 (30 bytes RESTORE) + $09FFC8–$09FFE6 (31 bytes SAVE)

**CRITICAL CAVEAT**: If $D10A bits 4-2 are ALREADY ZERO when the death path reaches $7A65
(i.e., cleared earlier in the path before $7A65), v1.1 also fails. Verify with Mesen:
  Break at $C1:7A65, inspect $D10A — if bits 4-2 are non-zero, v1.1 should work.

### Pending for v1.1 test
- Apply 3 changes to ff5c.sfc: Hook1 at $017A65, Save payload at $09FFC8, Restore payload at $09FF9C
- Mesen breakpoint at $C1:7A65 to verify D10A bits 4-2 are non-zero at death path hook site

---

## KO Palette Hack — MCP Debugging Session (March 19, 2026)

### MCP server setup (COMPLETED)
- Mesen2-Expanded fork already built at `Mesen2-Expanded\bin\win-x64\Release\Mesen.exe`
- MCP server starts automatically at main window init (`McpDebugServer.cs`, port 51234)
- Claude Code `settings.json` requires `mcpServers` entry: `{"mesen-debugger": {"url": "http://localhost:51234/mcp"}}`
- **Workflow**: launch Mesen2-Expanded exe → load ROM → THEN launch Claude Code (MCP connects on startup)
- MCP trace tool (`get_trace_tail`) always returns empty — Mesen trace logger not enabled by server. This tool is non-functional as-is.

### ROM state confirmed via MCP
- `ff5c.sfc` has **v1.0 patch** applied (not v1.2 — rolled back to last known good)
- Hook confirmed at `$C17CD9`: `5C 9C FF C9 EA` ✓
- Payload confirmed at `$C9FF9C`: `29 1C 4A 85 9A AD 0A D1...` ✓

### Palette loader fully decoded from live ROM read
`$C1:7CB5` disassembly (with v1.0 hook in place):
```
7CB5: LDA $D10A → AND #$60 → 5×LSR → TAX       ; party slot 0-3 → X
7CC0: LDA $C17D4E,X → STA $92                   ; per-slot config byte
7CC6: LDA $D10A → AND #$1C → LSR → STA $9A      ; palette_group×2
7CCF: LDA $D10C → STA $88                        ; color parameter
7CD3: TDC → TAX                                  ; X=0 (loop counter init)
  [LOOP TOP $7CD5, runs 16×]
7CD5: PHX
7CD6: LDA $D10A
7CD9: JML $C9FF9C   ← v1.0 hook (replaces AND #$1C/LSR/STA $9A)
7CDD: NOP
7CDE: LDA $88 → JSR $0A32 → PLX → STA $F9CC,X
7CE7: LDA $88 → CLC → ADC #$10 → STA $88
7CEE: INX → CPX #$0010 → BNE $7CD5
```

`$0A32` decoded: hardware multiply via `$211B/$211C` (M7A×M7B). Computes one color byte as
`($9A × $CEF600[X]) >> 8` (MPYM at `$2135`). 16 calls produce 16 bytes at `$F9CC[0..15]`.

### Memory observations mid-battle (paused)
| Location | Value | Interpretation |
|---|---|---|
| `$7F:08C0-08C3` | `00 00 00 00` | v1.2 backup table — untouched (correct, v1.0 is loaded) |
| `$7F:00C0-00C3` | `01 01 01 01` | v1.0 backup table — **CLOBBERED by game** (confirmed ✗) |
| WRAM `$F9CC` (32 bytes) | non-zero color bytes | Palette computation output — has data, correct address |
| WRAM `$ACB7` (32 bytes) | `00 00 00...` | All zeros — NOT the CGRAM shadow buffer for battle |
| CGRAM OAM palettes 4-7 | valid BGR555 colors | Correct per-job palettes loaded in battle |
| CPU K register | `$C1` | Executing from ROM bank $C1 mid-battle ✓ |
| CPU DBR | `$7E` | Data bank = WRAM — STA $F9CC,X goes to $7E:F9CC ✓ |
| `$C2:7CB5` | different code | No duplicate palette loader in bank $C2 ✓ |

### DMA registers decoded (mid-battle)
- Channels 0-3, 6-7: HDMA (scroll, mode, color math) — no palette DMA
- Channels 4-5: regular DMA to VRAM (`$2118`) — no CGRAM DMA
- **No DMA channel targets `$2122` (CGRAM data port)**
- CGRAM is written by CPU directly, likely via `JSR $4D67` in the NMI handler at `$C0/02D1`
  (context.md §2.4 already documents this: "JSR $4D67: Write CGRAM (palette DMA)")

### Execute BP at $C17CD9 fires on reset but NOT in battle
- Confirmed fires on Ctrl+R (soft reset) — hook + BP mechanism work ✓
- Confirmed does NOT fire during battle or on KO
- MCP write BPs tested (WRAM `$F9CC`, `$ACB7`, bus `$002122`) — none fired in battle
- **Root cause unknown**: either (a) the battle KO path calls $7CB5 via JSR from a bank ≠ $C1,
  executing an unpatched copy, or (b) the actual CGRAM update path is entirely through the NMI
  handler's `$C0:4D67` routine and $7CB5 is NOT called on KO during battle

### Revised call chain hypothesis
Context.md previously documented KO chain as:
`KO event → C1/$DECB → jmp $7A2A → $7979 dispatch → $7CB5`
These intermediate addresses ($7A2A, $7979) were NOT confirmed to be in bank $C1.
If the KO event originates from bank **$C2** (battle engine) and calls `JSR $7CB5` (short),
it executes `$C2:7CB5` (confirmed = different code). Our hook only exists in `$C1:7CB5`.

### ~~Next session priorities~~ (RESOLVED — see March 21 session below)
~~1. Find the actual KO CGRAM update path~~
~~2. Verify the call bank~~
~~3. If $7CB5 IS reached from $C2: patch $C2:7CD9~~
~~4. If NMI $4D67 is the path: trace buffer~~

---
## KO Palette Hack — BREAKTHROUGH (March 21, 2026)

### Two completely separate palette systems confirmed
FFV has two independent CGRAM update paths that NEVER overlap:

| System | Code | WRAM shadow | DMA trigger | When active |
|--------|------|-------------|-------------|-------------|
| **Field** | `$C1:7CB5` loop | `$7E:0C00` (512B) | NMI handler `$C0:4D67` | World map, menus, field |
| **Battle** | `$C2:D3DB` caller | `$7E:7300` (512B) | Inline at `$C2:D421` | Battle only |

**All prior patches (v0.4-v1.2) hooked `$C1:7CB5` — a field-only routine that NEVER executes during battle.**

### Evidence chain
1. Execute BPs on `$C1:7CD9`, `$C1:7A2A`, `$C1:7979` — NONE fire during battle
2. CGRAM changes on KO but WRAM `$0C00-$0DFF` does NOT change — field shadow irrelevant
3. Full CGRAM vs `$0C00` comparison shows completely different contents during battle
4. ROM search: 3x `STZ $2121` in bank C2; only 1 DMA targeting CGDATA outside NMI
5. DMA param table at `$C0:EFF4`: `02 22 00 73 7E 00 02` — source=`$7E:7300`, size=$0200

### Battle palette update: `$C2:D3DB` (caller) and `$C2:D45F` (per-character)

**`$C2:D3DB`** loops 4 times (`$7E` = 0..3), calling `$D45F` per character:
```
$D3DB: PHB / PHP / REP #$20
$D3DF: STZ $7E                    ; loop counter = 0
$D3E1: JSR $D45F                  ; process character palette
       LDA $7E / INC / STA $7E / CMP #$0004 / BNE loop
       [MVN copies palette data from ROM banks C3/C0 to WRAM $7480/$74C0/$74E0]
       JSR $D42E                  ; final palette arrangement
       LDX #$EFF4 / LDY #$4300 / LDA #$0006
       MVN $00,$C0               ; copy 7-byte DMA params from $C0:EFF4 to $4300
       SEP #$20
$D421: STZ $2121                  ; CGADD = 0
$D423: LDA #$01 / STA $420B      ; fire DMA channel 0 (palette -> CGRAM)
       PLP / PLB / RTS
```

**`$C2:D45F`** — the actual per-character battle palette subroutine:
```
$D45F: PHB / PHP
$D461: SEP #$20                   ; 8-bit A
$D463: JSR $D4C5                  ; setup: compute char slot ptr into $80
$D466: LDX $80                    ; X = char structure pointer
$D468: LDA $0500,X                ; char byte 0
$D46B: AND #$07                   ; bits 2-0 (sub-palette variant)
$D46D: XBA                        ; move to high byte of A
$D46E: LDA $0501,X                ; ** JOB ID **
$D471: AND #$1F                   ; low 5 bits = job index 0-21
$D473: LDY $7E                    ; Y = loop counter (0-3)
$D475: BIT $051A,X                ; test Status1 (N=Death bit7, V=Stone bit6)
$D478: BVS $D484                  ; stone -> hardcoded stone palette
$D47A: BPL $D47E                  ; alive (N clear) -> keep job palette
$D47C: LDA #$15                   ; ** DEAD: force Freelancer palette index $15 **
$D47E: XBA                        ; swap palette index into position
$D47F: JSR $D492                  ; compute palette ROM address
$D482: BRA $D48F                  ; continue to palette copy
$D484: LDX #$F807                 ; [stone path]
$D487: REP #$20
$D489: JSR $D4B4
$D48C: MVN $7E,$C0                ; copy ROM palette to WRAM
$D48F: PLP / PLB / RTS
```

### The fix: 2-byte NOP at `$C2:D47C`
**File offset `$02D47C`**: change `A9 15` (LDA #$15) to `EA EA` (NOP NOP)

This removes the Freelancer palette forcing on death. The job palette index from `$0501,X` (loaded at $D46E) will pass through unchanged, so KO'd characters keep their alive-state job palette colors.

**No backup table needed.** No freespace needed. No WRAM hunting. Just 2 bytes.

### Live test result (March 21, 2026 — late session)
- ROM bytes at file $02D47C confirmed: `A9 15 EB 20 92 D4 80 0B` (matches decoded disassembly)
- Execute BPs set at `$C2:D47C`, `$02:D47C`, `$82:D47C` (all HiROM mirrors) — **NONE fired on KO**
- Execute BPs set at caller `$C2:D3DB`, `$02:D3DB`, `$82:D3DB` — **NONE fired on KO**
- `$C2:D3DB`/`$D45F` may only run at **battle initialization**, not on mid-battle status changes

---

## KO Palette Hack — SOLVED (March 21, 2026, continued session)

### Write BP mystery — ROOT CAUSE FOUND

**MVN/MVP block-move instructions bypass Mesen address-based write breakpoints entirely.**
- `$C2:D492` uses `MVN $D4,$7E` to copy 32 bytes from ROM palette table → WRAM CGRAM shadow
- Mesen never sees the individual writes because MVN is an internal DMA-like operation
- This explains ALL previous write BP failures across every session

### CGRAM shadow buffer — CONFIRMED

- Battle CGRAM shadow: **WRAM `$7E:7E09–$7E:8008`** (512 bytes), DMA'd to CGRAM by `$D0:DE66` each VBlank
- OBJ palette 4 (char 0) in shadow: **WRAM `$7E:7F89–$7E:7FA8`** (32 bytes)
- Freelancer palette bytes confirmed in shadow for KO'd Ranger: `19 21 84 10 FF 7F 00 69...` ✓

### Full palette write path decoded

```
$C2:D3DB — battle palette loop (caller)
  LDA $7E / INC / STA $7E / CMP #$0004 / BNE loop
  JSR $D45F                  ; process each character palette

$C2:D45F — battle palette init/refresh:
  $D461: SEP #$20
  $D462: JSR $D4C5
  $D466: LDX $80             ; char structure pointer
  $D468: LDA $0500,X; AND #$07; XBA    ; sprite slot
  $D46D: LDA $0501,X; AND #$1F        ; job palette group
  $D475: BIT $051A,X         ; death(bit7) / stone(bit6)
  $D478: BVS $D484           ; stone → stone palette
  $D47A: BPL $D47E           ; alive (N clear) → skip force
  $D47C: A9 15  LDA #$15     ; ← PATCH 1: → EA EA (NOP NOP)
  $D47E: XBA; JSR $D492      ; write palette

$C2:D492 — palette writer (THE CGRAM shadow writer):
  REP #$20
  AND #$0007; ASL; TAX       ; X = slot × 2
  AND #$1F00; LSR×3          ; A = palette_group × $20
  ADC $C0:F246,X             ; + ROM base from slot table
  TAX                        ; X = source in bank $D4
  JSR $D4B4                  ; set Y=WRAM dest, A=$001F
  MVN $D4,$7E                ; ← block-copy 32B ROM→WRAM shadow
```

### Second patch site — KO event handler ($C2:D97F in 4MB .bak)

**NOTE:** The 4MB expanded .bak ROM lays out this code differently from the original 2.5MB RPGe ROM.
In the .bak, the KO handler calls `JSR $D987` (a subroutine wrapper) rather than inlining STA $D8 / JSR $E47D.
`$D987` is also called legitimately from `$C2:A425` (palette group init — must NOT be clobbered).

Decoded from `ff5c.sfc.bak` (file offset $02D97F):
```
$C2:D97A: LDX $7E              ; char struct pointer (0/$50/$A0/$F0)
$C2:D97C: INC $0420,X          ; KO counter
$C2:D97F: A9 15  LDA #$15      ; <- PATCH 2: -> BD 01 05 85 D8
$C2:D981: 20 87 D9  JSR $D987  ;    (load job palette, skip JSR $D987 entirely)
$C2:D984: AB PL; 28 PLP; 60 RTS

; JSR $D987 subroutine (called from KO handler AND from $C2:A425):
$C2:D987: PHP; SEP #$20
$C2:D98A: STA $D8              ; stores A (= $15 in unpatched path, or job palette from $C2:A425)
$C2:D98C: JSR $E47D            ; OAM palette attrib update
$C2:D98F: LDX $80; LDA $DA; STA $053A,X
$C2:D996: LDA $D8; STA $0501,X ; writes palette group back to char struct
           ... ; PLP; RTS
```

P3 (NOP the STA $0501,X inside $D987) was considered but dropped:
`$D987` is also called from `$C2:A425` where `STA $0501,X` IS the legitimate init write.

### Actual patches applied to ff5c_ko_v2.sfc (verified via IPS)

Input: `ff5c.sfc.bak` (clean). Output: `ff5c_ko_v2.sfc`. Script: `patch_ko_v2.py`.

| # | File offset | Search pattern | Replacement | Effect |
|---|------------|---------------|-------------|--------|
| P1 | `$02D47C` | `A9 15 EB 20 92 D4` | `EA EA EB 20 92 D4` | NOP dead->Freelancer force in $D45F |
| P2 | `$02D97F` | `A9 15 20 87 D9` | `BD 01 05 85 D8` | Load job palette from $0501,X; skip JSR $D987 |

IPS verification confirmed:
- `$C2:D47C` = `EA EA` (P1) ✓
- `$C2:D97F` = `BD 01 05 85 D8` (P2) ✓

### Test result (March 21, 2026) — STILL FAILING

Both patches applied and IPS-verified. Tested from 3 different saves across multiple maps.
**Freelancer palette still appears on KO for all 4 characters.**

This means P1+P2 are necessary but not sufficient. At least one more Freelancer-forcing site exists
that we have not yet found. The fact that ALL 4 characters show Freelancer rules out a character-
specific issue; it is a systematic palette write that overwrites the CGRAM shadow after every KO.

### Implications and next hypotheses

1. **$D3DB call frequency unknown:** We assumed $D3DB/$D45F runs each frame (which would make P1
   sufficient). If it does run each frame but STILL forces Freelancer, something must be re-setting
   `$0501,X` to $15 BEFORE $D45F reads it. That third site is the real target.

2. **P2 bypass may be too late:** By the time the KO handler fires at `$D97F`, could `$0501,X`
   already contain $15 (set by a still-unknown site earlier in the KO event chain)?
   With P2, `LDA $0501,X` would then load $15 — our patch would correctly pass $15 through!
   This would explain why P2 doesn't help: we're reading a pre-corrupted value.

3. **Third (or earlier) Freelancer site exists:** Something sets `$0501,X = $15` BEFORE either
   $D47C or $D97F see it. Finding that site is the key to the fix.

4. **Execute BPs still needed on $D3DB:** Were BPs set before entering battle? If they only fired
   at init (never on KO), confirm that $D3DB is init-only — which would mean CGRAM shadow is only
   updated at init AND on the unknown third site (which writes Freelancer).

### ROM key addresses
- Palette table base: `$D4:AEC0` (file `$14AEC0`), 32 bytes per entry
- Freelancer palette: group `$15`, data at `$D4:B160` (file `$14B160`)
- `$0501,X` (stride `$50`): job/palette-group field per character
- `$051A,X`: Status1 byte — bit7=Death, bit6=Stone
- `$D987` callers: `$C2:D981` (KO handler, bypassed by P2) and `$C2:A425` (init — must not be altered)

### Next session priorities

1. **Find the third $0501,X = $15 write site**: Search ROM for all `9D 01 05` (STA $0501,X absolute)
   and `85 01` / `95 01` patterns that could set the job palette field to $15.
2. **Verify $D3DB call frequency with fresh BPs**: Set BP at $C2:D3DB BEFORE entering battle;
   confirm whether it fires every frame, every ATB tick, or only at init.
3. **Read $0501,X live in Mesen at moment of KO**: MCP `get_memory_range` immediately after KO
   event fires — does it already contain $15 before our P2 code runs?
4. **Consider wider search**: grep ROM for all `LDA #$15` (A9 15) occurrences in bank $C2 to
   enumerate every Freelancer-forcing candidate.

## KO Palette Hack — MCP Deep-Dive Session (March 22, 2026)

### Confirmed: $D97F is dead code / P2 likely never fires

Exhaustive ROM-wide search (Python, full 4MB):
- **`22 7F D9 C2` (JSL $C2:D97F)** — NOT FOUND anywhere in ROM
- **`20 7F D9` (JSR $D97F)** — NOT FOUND anywhere in ROM
- **`7F D9` in data tables** — NOT FOUND anywhere in C0–C2

The `$D97F` block (`LDA #$15 / JSR $D987`) has **zero callers** in the entire ROM.

### $D955 KO handler loop — structure decoded

```
$D955 loop:  JSR $D4C5            ; set X = char struct ptr ($80)
             LDA $0500,X          ; load slot byte
             AND #$07             ; slot bits
             CMP #$04             ; slot == 4?
             BEQ → $D96B          ; yes: char found
             INY / CPY #4 / BNE → $D955  ; next char
             BRA → $D981          ; no char with slot=4: fallback

$D96B:  [char found path]
             BRA → $D984          ; skip $D97F entirely → PLB/PLP/RTS

$D97F:  LDA #$15 / JSR $D987     ; ← DEAD CODE (unreachable from loop)
$D981:  JSR $D987                ; fallback (slot=4 not found) → A=garbage
$D984:  PLB / PLP / RTS
```

Live WRAM confirmed char 0 has slot=4 (`$0500=$8C`, bits 0-2=4), so the loop **always exits via BEQ→BRA→RTS** without touching palette. The fallback at `$D981` requires all 4 chars to lack slot=4 — unusual edge case.

**Implication**: P2 (patching `$D97F`) may never fire during normal KO events. Yet Freelancer still appears. A completely different code path is responsible.

### $D940 — confirmed sprite-frame selector, NOT palette writer

```
$D940: REP #$20
       LDA $D8 / CMP #$0015
       BEQ → LDY #$F4A3   ; Freelancer animation frame address
             → LDY #$F498  ; job animation frame address
       LDA #$C08A / JSR $E59D
       RTS
```

`$E59D` = sprite frame dispatcher. With P2 applied, `$D8 = $0501,X` (correct job palette), so **the correct non-Freelancer sprite frame is selected**. This part of the fix works.

### CGRAM shadow architecture — clarified

| Buffer | Address | Written by | Flushed by |
|--------|---------|------------|------------|
| Palette work buf | `$7E:7400+char×$20` | `$D492/$D4B4` | (not directly to CGRAM) |
| CGRAM shadow | `$7E:7E09–$7E:8008` | `$D304` (triple-MVN) | VBlank DMA `$D0:DE66` |

- `$D492`/`$D4B4` write to `$7E:7400` (work buffer), **not** the CGRAM shadow
- `$D304` (called from `$CD81`, `$D27A`, `$D2B8`, `$D2D5`, `$D3BF`, `$F4AE`) = actual CGRAM shadow writer via triple bank-dispatched MVN
- VBlank DMA (channel 4): source `$7E:7E09`, length `$0200` → CGRAM

### Live WRAM snapshot (char 3 KO'd, paused post-animation)

`$7FE9` (char 3 OBJ pal 7) = `00 00 84 10 FF 7F A6 21...` — NOT Freelancer ($19 21...), NOT job $09 ($06 22...). Only 4–5 bytes match either palette. This **confirms the transient write hypothesis**: Freelancer colors are written to CGRAM shadow DURING the KO animation frames, then overwritten before the snapshot was taken.

### $E47D — new suspect for OAM palette attribute corruption

`$D987` calls: `STA $D8 / JSR $E47D / STA $0501,X`

`$E47D` is an OAM update routine ("complex sprite attribute computation, reads from `$0843,X` and ROM tables"). With `$D8=$15` (Freelancer) passed in, it may set **OAM palette bits** for the KO sprite to palette 0 (Freelancer) rather than the character's assigned OBJ palette 4–7. This is the **new top suspect** for the visible Freelancer colors — not CGRAM content but OAM attribute bits.

Decoding `$E47D` in full is the highest-priority next step.

### Tooling note — HxD for full-ROM byte searches

For exhaustive multi-bank byte pattern searches (e.g. "find all A9 15 in 4MB ROM"), **use HxD Ctrl+F** (hex search) rather than Python or MCP reads — far faster and gives file offsets directly. User can run searches on request between sessions.

---

## March 27, 2026 — MCP Live Debugging Session

### Mesen MCP status
- `debugger_status`, `get_memory_range`, `get_disassembly`, `get_cpu_state`, `get_ppu_state`, `pause`, `resume` all work
- **`set_breakpoints` does NOT work** in Mesen-Expanded alpha — never rely on it

### $E47D — CLEARED as suspect
Fully decoded via MCP ROM read. **NOT an OAM writer.** It's a sprite graphics data lookup routine:
- Takes palette group from DP `$D8`
- Calls `$E4B2` (computes index from palette group + char index using C0:EF65 table)
- Reads sprite metadata from `$0843,X`
- Indexes into `$D1:52C0` table using palette group
- Returns graphics pointers in `$DA/$DC/$DE`
- Never touches OAM or CGRAM

### $EB82 — CLEARED
Sprite parameter loader. Reads `$0501,Y` (palette group), indexes into `$D1:5760`/`$D1:5708` tables, writes sprite animation params to `$0516-$0518`, `$0520`, `$0540-$0542`. Data setup only.

### $D6DC — OAM palette writer (fully decoded)
```
$D6DC: PHB/PHP/SEP #$20
$D6E0: STA $E0              ; A low byte = sprite tile count
$D6E6: XBA                  ; get A HIGH byte
$D6E8: AND #$07 / ASL / ASL ; palette bits → OAM position
$D6EC: STA $E1              ; $E1 = palette-select value for OAM
    loop:
$D6F4: LDA $0000,X          ; load OAM attribute byte
$D6F7: AND #$E3             ; clear palette bits (2,3,4)
$D6F9: ORA $E1              ; set from $E1
$D6FB: STA $0000,X          ; write back
      [optional secondary buffer at $7DFFC0,X]
$D70E: INX / INX / DEC $E0 / BNE loop
$D714: PLP/PLB/RTS
```
Caller at `$CBD5` (in rendering loop) passes palette via high byte of 16-bit A. Value comes from `$2CE1,X` buffer. NOT called while game is paused with item menu open.

### $D987 call chain (fully mapped)
```
$D987: STA $D8 / JSR $E47D (data lookup) / STA $0501,X (palette write)
       → JSR $EB82 (sprite params) → JSR $E6D6 (dispatcher)
$E6D6: JSR $EBBD → JSR $E76C → JSR $E9CE
$EBBD: calls $D4C5 at entry (palette DMA setup in $D45F area)
```

### $D45F — P1 patch site (fully decoded)
```
$D45F: PHB/PHP/SEP #$20
$D463: JSR $D4C5            ; palette DMA setup
$D466: LDX $80              ; char slot
$D468: LDA $0500,X / AND #$07 / XBA   ; sprite bank → A high
$D46E: LDA $0501,X / AND #$1F         ; palette group → A low
$D475: BIT $051A,X          ; test Death(N=bit7) / Stone(V=bit6)
$D478: BVS stone_handler    ; stone → MVN from C0 bank
$D47A: BPL $D47E            ; alive → skip next
$D47C: NOP NOP              ; ← P1 PATCH (was LDA #$15)
$D47E: XBA / JSR $D492      ; write palette to work buffer
$D482: BRA exit
```
P1 correctly preserves real palette group from `$0501,X` for dead characters.

### $D304 — triple-MVN CGRAM shadow writer (fully decoded)
```
$D304: PHB/PHP/STA $E8      ; save loop count
  loop:
$D308: PHX
       LDA $E4 + C0:0002,X → TAY   ; Y = CGRAM shadow dest
       LDA $E0 + C0:0000,X → TAX   ; X = ROM palette source
       LDA $E2 + $8E → determine bank (D2/D3/D4)
       LDA #$001F / MVN $7E,$D{2|3|4}  ; copy 32 bytes
$D340: PLX / INX×4 / DEC $E8 / BNE loop
$D349: PLP/PLB/RTS
```

### $D298 — main per-character palette copier (fully decoded)
```
$D298: PHB/PHP
$D29A: LDA $7E / ASL / TAX             ; X = char_index × 2
$D29E: LDA $C0EC1B,X → STA $E4        ; CGRAM dest from table
$D2A4: JSR $D4C5                       ; palette setup
$D2A7: LDX $80
$D2A9: LDA $000500,X → STA $EA        ; 16-bit: $EA=$0500, $EB=$0501 (PALETTE GROUP!)
$D2AF: JSR $D2DB                       ; compute source from $EB
$D2B2: LDA #$0018 / LDX #$EC37
$D2B8: JSR $D304                       ; copy 24 entries
$D2BB: [compute sprite-bank source from $EA]
$D2CF: LDA #$0006 / LDX #$ECAB
$D2D5: JSR $D304                       ; copy 6 entries
$D2D8: PLP/PLB/RTS
```
**No death check.** Uses `$0501,X` directly. All 4 JSR $D304 callers ($CD81, $D27A, $D2B8, $D2D5) trace back to `$0501,X` for palette group.

### All four JSR $D304 call sites in bank C2
1. `$CD81` — in post-$D304 processing chain
2. `$D27A` — in loop (copies 3 palette groups, 10 entries each)
3. `$D2B8` — in $D298 (24 shared entries)
4. `$D2D5` — in $D298 (6 character-specific entries)

### Live MCP diagnostic — paused with char 0 KO'd (item menu open)

**All three layers read CORRECT while paused:**

| Layer | Address | Value | Expected | Status |
|-------|---------|-------|----------|--------|
| `$0501` (palette group) | WRAM $0501 | `$00` | `$00` (real job) | ✓ correct |
| CGRAM shadow OBJ pal 4 | WRAM $7F89 | `$2119 $1084...` | non-Freelancer | ✓ correct |
| OAM attr (sprites 98-103) | WRAM $0378 | `$38` | palette 4 | ✓ correct |

**Full OAM scan — all 128 sprites checked:**
| Slot | Sprites | Y range | Palette | Status |
|------|---------|---------|---------|--------|
| 0 (top, KO'd) | 98-103 | $3C-$44 | 4 | ✓ correct |
| 1 | 88-93 | $4E-$5E | 5 | ✓ correct |
| 2 | 78-83 | $68-$78 | 6 | ✓ correct |
| 3 (bottom) | 68-73 | $8A-$92 | 7 | ✓ correct |

No sprite near char 0's position has palette 0 or any non-4 palette.

### The paradox and resolution theory

**Everything reads correct in the paused snapshot, yet the screen shows full Freelancer (both wrong sprite graphics AND wrong palette colors).**

This confirms the **transient write hypothesis**: during the active frame, BOTH the VRAM tiles AND the CGRAM shadow are temporarily overwritten with Freelancer data. The VBlank DMA captures this Freelancer state. Then after DMA, the correct data is restored to the shadow. My paused snapshot catches the restored (correct) state, but the hardware displays the DMA'd (Freelancer) state.

**Key new finding:** User confirmed the KO'd character shows BOTH wrong sprite art AND wrong palette — full Freelancer appearance, not just palette colors. This means the bug is in the rendering pipeline that sets up BOTH VRAM tiles and CGRAM palette data per-frame, not just one or the other.

### Updated next priorities

1. **Phase-catch test**: Resume game, immediately re-pause, re-read CGRAM shadow at `$7F89`. If it shows Freelancer data, confirms per-frame transient write. Repeat several times to catch different phases.
2. **Identify the per-frame rendering routine** that writes BOTH VRAM tiles and CGRAM palette. The `$D298` path writes palette but what writes VRAM tiles? This is likely a single routine that takes palette group as input and sets up the complete character appearance.
3. **Look for death-check in the VRAM tile writer**: If the same code path loads Freelancer sprites for dead characters, there's a second `LDA #$15` or equivalent in the tile loading code.
4. **Check if `$D940` (sprite frame selector) is relevant**: It was confirmed to select Freelancer frame address when `$D8=$15`. With P2 bypassed (dead code), does this routine get called from another path?
5. **HxD searches still pending**: `A9 15` in full ROM, `9D 01 05` (STA $0501,X) in full ROM.