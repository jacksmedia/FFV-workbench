# The SNES Architecture & Debugging Guide
## A Practical Guide to Understanding the Super Nintendo's Internal Dance

*Written for romhackers who want to stop fighting the debugger and start speaking the console's language.*

---

## Table of Contents
1. [The Big Picture: What's Inside the Box](#the-big-picture)
2. [The 65816 CPU: The Conductor](#the-65816-cpu)
3. [Memory Architecture: The Filing System](#memory-architecture)
4. [The PPU: The Artist](#the-ppu)
5. [The APU: The Musician](#the-apu)
6. [DMA: The Express Lane](#dma)
7. [Communication Protocols: How Components Talk](#communication-protocols)
8. [Registers & Flags: The Control Panel](#registers-and-flags)
9. [Execution Flow: Following the Breadcrumbs](#execution-flow)
10. [Practical Debugging Strategies](#debugging-strategies)
11. [Common Patterns in SNES Games](#common-patterns)

---

## The Big Picture: What's Inside the Box {#the-big-picture}

Think of the SNES as a **restaurant kitchen** with specialized stations:

- **CPU (65816)**: The head chef who orchestrates everything
- **PPU (Picture Processing Unit)**: The plating artist who makes things look beautiful
- **APU (Audio Processing Unit)**: The sommelier/DJ in a separate soundproof room
- **WRAM**: The kitchen's main workspace (128KB of counter space)
- **VRAM**: The artist's canvas and paint palette (64KB)
- **Cart ROM**: The cookbook that never changes
- **Cart RAM/SRAM**: The notepad for recipe modifications

The key insight: **These components don't directly talk to each other.** The CPU is the only one who can coordinate. The PPU can't ask the APU for data. The APU can't read from VRAM. Everything flows through the CPU's hands.

---

## The 65816 CPU: The Conductor {#the-65816-cpu}

### The Basics

The 65816 is a **16-bit extension** of the 6502 (the NES's CPU). It can work in two modes:

- **Emulation mode**: Acts like an 8-bit 6502 (SNES games never use this)
- **Native mode**: Full 16-bit glory (what you care about)

**Clock speed**: ~3.58 MHz (or ~2.68 MHz in slow regions)
**Address space**: 24-bit (16MB addressable, though most is wasted space)

### The Metaphor: A Chef with Special Gloves

Imagine the CPU as a chef who can swap between:
- **8-bit gloves** (handles ingredients one byte at a time) - `m` flag set
- **16-bit gloves** (handles two bytes at once) - `m` flag clear

And for index fingers:
- **8-bit index fingers** - `x` flag set  
- **16-bit index fingers** - `x` flag clear

The CPU constantly changes glove sizes depending on the task. Assembly code controls this with `SEP` (Set Processor Status - put smaller gloves on) and `REP` (Reset Processor Status - put bigger gloves on).

```assembly
REP #$20        ; Clear 'm' flag -> 16-bit accumulator mode
LDA #$1234      ; Load 16-bit value
SEP #$20        ; Set 'm' flag -> 8-bit accumulator mode
LDA #$12        ; Load 8-bit value only
```

### Key Registers

The CPU has several **registers** (think: hands that hold things):

| Register | Size | Purpose | Metaphor |
|----------|------|---------|----------|
| **A** | 8/16-bit | Accumulator - main workspace | Your dominant hand |
| **X** | 8/16-bit | Index register | Your left index finger (for counting) |
| **Y** | 8/16-bit | Index register | Your right index finger (for counting) |
| **S** | 16-bit | Stack pointer | Your notepad's current page |
| **D** | 16-bit | Direct page pointer | Your current station in the kitchen |
| **DB** | 8-bit | Data bank | Which cookbook volume you're using |
| **P** | 8-bit | Processor status (flags) | Your current cooking mode settings |
| **PC** | 16-bit | Program counter | Which line of the recipe you're reading |
| **PB** | 8-bit | Program bank | Which recipe book you're reading from |

### The Status Register (P): Your Mode Switches

The **P register** contains 8 flags that control how the CPU behaves:

```
N V M X D I Z C
│ │ │ │ │ │ │ └─ Carry (did math overflow?)
│ │ │ │ │ │ └─── Zero (is result zero?)
│ │ │ │ │ └───── IRQ disable (ignore interrupts?)
│ │ │ │ └─────── Decimal mode (BCD math - usually off)
│ │ │ └───────── Index register size (8/16-bit)
│ │ └─────────── Memory/Accumulator size (8/16-bit)
│ └───────────── Overflow (signed math overflow?)
└─────────────── Negative (is bit 7 set?)
```

**Critical insight**: The `m` and `x` flags **change the behavior of every instruction**. When debugging, if you see `LDA $1234` and can't figure out if it's loading one or two bytes, check what mode the CPU is in!

### Banks: The Third Dimension

SNES memory is organized in **banks** (64KB chunks). Think of them as floors in a building:

- **Bank byte** (8 bits): Which floor? ($00-$FF)
- **Address** (16 bits): Which room on that floor? ($0000-$FFFF)

Full addresses are written as: `$7E:0010` (bank $7E, address $0010)

**Key banks you'll encounter:**

- `$00-$3F`: LoROM - first half mirrors hardware registers ($0000-$1FFF) and ROM
- `$40-$6F`: LoROM - more ROM
- `$7E`: WRAM (main workspace memory)
- `$7F`: WRAM (overflow workspace)
- `$80-$BF`: Mirror of $00-$3F (ROM access)
- `$C0-$FF`: HiROM area (if cart is HiROM)

**FFV is LoROM**, meaning ROM data lives in banks $00-$3F and $80-$BF at addresses $8000-$FFFF.

---

## Memory Architecture: The Filing System {#memory-architecture}

### Memory Map Overview

The SNES has a **complicated filing system** because it needs to accommodate different cart types. Here's the landscape:

```
$00:0000-$00:1FFF  Hardware registers (I/O ports)
$00:2000-$00:7FFF  ROM (LoROM) or empty space
$00:8000-$00:FFFF  ROM (LoROM)
  ... banks $01-$3F follow same pattern ...

$7E:0000-$7E:FFFF  WRAM (64KB)
$7F:0000-$7F:FFFF  WRAM (another 64KB)

$80:0000-$FF:FFFF  Mirrors of ROM banks (with variations)
```

### WRAM: The Scratch Pad

**128KB** of general-purpose RAM. This is where the game keeps:
- Variables (HP, status, inventory)
- Temporary calculations
- Decompressed graphics before sending to VRAM
- Stack (function call history)
- Your custom hack data (like that palette backup table at $7F:0010!)

**Access methods:**

1. **Direct addressing** (fast, bank $7E/$7F only):
   ```assembly
   LDA $0010    ; Read from $7E:0010
   ```

2. **Long addressing** (can reach any bank):
   ```assembly
   LDA $7E0010  ; Read from $7E:0010 explicitly
   ```

3. **DMA** (bulk transfers):
   ```assembly
   ; Copy 512 bytes from ROM to WRAM
   ```

### VRAM: The Graphics Canvas

**64KB** of video memory. The PPU draws from here. The CPU **cannot directly read** VRAM (well, it can via port $2139, but it's slow and weird).

**Structure:**
- **Character data** (tiles/graphics): Usually at $0000-$3FFF
- **Tilemap data** (which tiles go where): Usually at $4000+
- **BG3 priority layer**: Sometimes at specific locations

**Access pattern:**
```assembly
LDA #$00
STA $2116      ; VRAM address low byte
LDA #$20
STA $2117      ; VRAM address high byte -> address set to $2000

LDA #$FF
STA $2118      ; Write low byte to VRAM
LDA #$7F  
STA $2119      ; Write high byte to VRAM
```

The auto-increment register ($2115) controls whether the address advances after writing to $2118 or $2119.

### Cart ROM: The Immutable Cookbook

Your `.sfc` file gets mapped here. **Cannot be written to** (unless you have special flash carts).

In **LoROM** (FFV):
- Banks $00-$7D: $8000-$FFFF = first 4MB of ROM
- Banks $80-$FF: $8000-$FFFF = mirror of $00-$7F

In **HiROM**:
- Banks $C0-$FF: $0000-$FFFF = entire bank is ROM
- Larger games use this

### Cart RAM (SRAM): The Persistent Notepad

**8KB-128KB** (depending on cart) for save data. Mapped to:
- LoROM: `$70:0000-$7D:FFFF` (usually just $70-$73)
- HiROM: Different mapping

Battery-backed, survives power-off.

---

## The PPU: The Artist {#the-ppu}

The **Picture Processing Unit** is a separate chip that draws the screen. It runs **in parallel** with the CPU but has its own agenda.

### The Scanline Metaphor

Think of a CRT TV as a **typewriter**:
- The electron beam starts at top-left
- Draws one horizontal line (scanline) left-to-right
- Returns to left side, moves down one line
- Repeats 262 times (NTSC) or 312 times (PAL)
- Returns to top (VBlank period)

**Critical timing windows:**

1. **Active drawing** (scanlines 0-224): PPU is reading VRAM/CGRAM/OAM and compositing layers
   - **YOU CANNOT SAFELY MODIFY VRAM/CGRAM/OAM NOW**
   
2. **VBlank** (scanlines 225-261): PPU takes a break
   - **THIS IS YOUR WINDOW** to update graphics

3. **HBlank**: The brief moment between scanlines
   - Advanced techniques use this for mid-screen effects

### Graphics Layers

The SNES supports **4 background layers (BG1-BG4)** plus **128 sprites (OAM)**:

| Layer | Use in FFV | Priority |
|-------|------------|----------|
| BG1 | Main map/text | High |
| BG2 | Secondary details | Medium |
| BG3 | Often unused or priority tricks | Variable |
| BG4 | Rarely used | Low |
| Sprites | Characters, enemies, cursors | Per-sprite |

**Mode 1** (FFV's main mode):
- BG1: 16 colors (4bpp)
- BG2: 16 colors (4bpp)  
- BG3: 4 colors (2bpp)

### Color Palettes (CGRAM)

**512 bytes** (256 colors × 2 bytes per color) stored in **CGRAM** (Color Generator RAM).

Format: **15-bit BGR**
```
gggrrrrr 0bbbbbgg
└─────┘   └──┘└┘
  Red     Blu Grn
```

**Palette organization:**
- 16 palettes × 16 colors each = 256 colors
- Palette 0, color 0 = backdrop color (always transparent for sprites)

Your KO-palette hack **intercepts the palette write** and backs it up to WRAM before the game modifies it, right? That's because CGRAM can only be written via registers $2121-$2122, so you hook the function that writes there.

### OAM: Sprite Table

**544 bytes** defining where sprites appear:

- **512 bytes**: 128 sprites × 4 bytes each (X, Y, tile, attributes)
- **32 bytes**: High bits for X positions and size flags

Sprites can be 8×8, 16×16, 32×32, or 64×64 depending on register $2101.

---

## The APU: The Musician in a Soundproof Room {#the-apu}

The **Audio Processing Unit** is essentially a **separate computer** with:
- **SPC700 CPU** (8-bit, totally different architecture)
- **64KB of dedicated RAM**
- **8-channel audio mixer**

### Communication with APU

Here's the wild part: **The APU cannot access SNES memory**. It's truly isolated.

**Data transfer process:**
1. CPU writes audio commands/data to **4 communication ports** ($2140-$2143)
2. SPC700 reads from its mirrored ports
3. SPC700 acknowledges by writing back
4. Repeat until all sound data transferred

Think of it like **passing notes under a door**. The APU is in a soundproof studio, and you can only communicate through a tiny mail slot with 4 bytes visible at a time.

Most SNES games use **SPC sound drivers** (like N-SPC) that accept music commands:
```
CMD: $01 = Play song
DATA: $05 = Song #5
```

**For romhacking purposes**, you usually don't need to touch APU code. Just understand that music/SFX are handled by this separate system, and it communicates via ports.

---

## DMA: The Express Lane {#dma}

**Direct Memory Access** lets you transfer large blocks of memory **without CPU intervention**.

### Why DMA?

Copying 8KB byte-by-byte in a loop:
```assembly
LDX #$0000
loop:
  LDA source,X
  STA dest,X
  INX
  CPX #$2000
  BNE loop
```
This takes **forever** (relatively speaking). Each iteration = multiple cycles.

**DMA does it in a fraction of the time** because it's hardware-accelerated.

### DMA Setup Pattern

```assembly
LDA #$01
STA $4300      ; DMA mode (byte, increment)

LDA #$18
STA $4301      ; Destination register ($2118 = VRAM write)

LDA #<source
STA $4302      ; Source address low
LDA #>source  
STA $4303      ; Source address high
LDA #^source
STA $4304      ; Source bank

LDA #<size
STA $4305      ; Transfer size low
LDA #>size
STA $4306      ; Transfer size high

LDA #$01
STA $420B      ; Trigger DMA on channel 0
```

**Common DMA tasks:**
- Copy decompressed graphics to VRAM (during VBlank)
- Copy palette data to CGRAM
- Clear large blocks of WRAM
- Transfer tilemap updates

**Limitation**: DMA still requires CPU time (the CPU is frozen during DMA), so you still do it during VBlank when you're not drawing.

---

## Communication Protocols: How Components Talk {#communication-protocols}

### CPU → PPU

**Via hardware registers** ($2100-$213F):

| Register | Purpose | Example |
|----------|---------|---------|
| $2100 | Screen brightness | `LDA #$0F : STA $2100` = full bright |
| $2115-$2119 | VRAM access | Write graphics data |
| $2121-$2122 | CGRAM access | Write palette colors |
| $210D-$2114 | BG scroll positions | Pan the camera |

**Pattern:**
```assembly
; Set VRAM address
LDA #$00
STA $2116      ; Low byte
LDA #$20  
STA $2117      ; High byte = $2000

; Write data
LDA #$FF
STA $2118      ; Data low
LDA #$7F
STA $2119      ; Data high
```

### CPU → APU

**Via communication ports** ($2140-$2143):

```assembly
; Wait for APU ready signal
wait:
  LDA $2140
  CMP #$AA      ; Waiting for specific handshake value
  BNE wait

; Send command
LDA #$01        ; Play song command
STA $2140
LDA #$05        ; Song #5
STA $2141
```

### Interrupts: Tap on the Shoulder

The PPU can **interrupt** the CPU at specific times:

1. **NMI (Non-Maskable Interrupt)**: Fired every VBlank (~60 Hz)
   - **Vector at $00:FFEA** points to the NMI handler
   - Game main loop: game logic → wait for NMI → update graphics → repeat
   
2. **IRQ (Interrupt Request)**: Fired at scanline/H-counter triggers
   - Used for mid-screen effects (status bars, wavy water)
   - **Vector at $00:FFEE**

**NMI is your friend**. Most graphics updates happen here:

```assembly
NMI_Handler:
  ; Save registers
  PHA
  PHX  
  PHY
  
  ; Do VBlank tasks
  JSR UpdatePalettes
  JSR UpdateSprites
  JSR UpdateBG1Tiles
  
  ; Restore registers
  PLY
  PLX
  PLA
  RTI            ; Return from interrupt
```

---

## Registers & Flags: The Control Panel {#registers-and-flags}

### CPU Flags in Detail

Every arithmetic/comparison operation affects flags:

```assembly
LDA #$00
; Z flag = 1 (zero), N flag = 0 (positive)

LDA #$FF
; Z flag = 0 (not zero), N flag = 1 (negative, bit 7 set)

LDA #$80
ADC #$80
; C flag = 1 (carry), V flag = 1 (signed overflow)
```

**Branch instructions** check these flags:

| Instruction | Checks | Meaning |
|-------------|--------|---------|
| BEQ | Z = 1 | Branch if equal (zero) |
| BNE | Z = 0 | Branch if not equal |
| BCS | C = 1 | Branch if carry set |
| BCC | C = 0 | Branch if carry clear |
| BMI | N = 1 | Branch if minus (negative) |
| BPL | N = 0 | Branch if plus (positive) |
| BVS | V = 1 | Branch if overflow |
| BVC | V = 0 | Branch if no overflow |

**Practical debugging**: If you see `BEQ label` and execution doesn't branch, it means the previous operation set Z=0 (result was non-zero).

### Hardware Registers

These are **memory-mapped I/O** ports at $00:2000-$00:5FFF.

**Reading from them doesn't return RAM values**, it returns hardware status:

```assembly
LDA $4212      ; Read PPU status
AND #$80       ; Check bit 7 (VBlank flag)
BNE in_vblank  ; Branch if in VBlank
```

**Writing to them sends commands to hardware**:

```assembly
LDA #$0F
STA $2100      ; Set screen brightness to 15 (max)
```

**Key insight**: These registers often have **side effects**. Reading $2137 latches H/V counters. Writing to $2118 increments VRAM address. They're not just memory!

---

## Execution Flow: Following the Breadcrumbs {#execution-flow}

### How a Game Runs

1. **Power-On / Reset**
   - CPU jumps to address stored at $00:FFFC (reset vector)
   - Usually points to initialization code in ROM

2. **Initialization**
   - Clear WRAM
   - Initialize PPU registers
   - Upload initial graphics to VRAM
   - Upload palettes to CGRAM
   - Set up NMI/IRQ vectors
   - Initialize game variables

3. **Main Loop**
   ```assembly
   MainLoop:
     JSR ProcessInput       ; Read controller
     JSR UpdateGameLogic    ; Move characters, check collisions
     JSR PrepareGraphics    ; Update sprite buffer
     
     WaitVBlank:
       LDA $4212
       AND #$80
       BEQ WaitVBlank
     
     ; [VBlank starts, NMI fires here]
     
     JMP MainLoop
   ```

4. **NMI Handler** (runs during VBlank)
   ```assembly
   NMI:
     ; Upload sprite data to OAM
     JSR UpdateOAM
     
     ; Upload any new tiles to VRAM
     JSR UpdateVRAM
     
     ; Update palettes if needed
     JSR UpdateCGRAM
     
     ; Update scroll positions
     JSR UpdateScrollRegs
     
     RTI
   ```

### The Stack: Your Breadcrumb Trail

The **stack** grows **downward** from $7E:1FFF (or wherever register S points).

**JSR (Jump to Subroutine)** pushes return address:
```assembly
JSR SomeFunction
; Stack now has: [return address high] [return address low]

SomeFunction:
  ; Do stuff
  RTS            ; Pull return address and jump back
```

**Nested calls create a trail**:
```
Main → FunctionA → FunctionB → FunctionC
Stack: [Main+2] [FuncA+2] [FuncB+2] [FuncC is executing]
```

**PHA/PLA** (Push/Pull Accumulator) save/restore A:
```assembly
LDA #$42
PHA              ; Save A to stack
LDA #$99         ; Do something else
PLA              ; Restore A (now $42 again)
```

**Debugging tip**: If the stack pointer (S) is at an unexpected value, you might have unbalanced pushes/pulls or a runaway recursion.

---

## Practical Debugging Strategies {#debugging-strategies}

### Strategy 1: Memory Watches

**Goal**: Track when/how a value changes.

1. Identify the RAM address (e.g., current HP at $7E:0100)
2. Set a **write breakpoint** (if your emulator supports it)
3. Or: repeatedly read the value and log when it changes

**Without breakpoints** (your Mesen2 situation):
```python
# Pseudo-code for your MCP approach
last_value = read_memory(0x7E, 0x0100)
while True:
  current_value = read_memory(0x7E, 0x0100)
  if current_value != last_value:
    print(f"HP changed from {last_value} to {current_value}")
    # Now check nearby code execution
  last_value = current_value
```

### Strategy 2: Code Tracing

**Goal**: Follow execution from A to B.

**With a debugger**:
1. Set breakpoint at function entry
2. Step through instruction-by-instruction (F11)
3. Watch registers change

**Without breakpoints**:
1. Add **logging code** to the ROM:
   ```assembly
   ; Original code
   LDA $10
   STA $2000
   
   ; Modified with logging
   LDA $10
   PHA           ; Save A
   LDA #$42      ; Magic marker
   STA $7F1FFE   ; Write to unused RAM spot
   PLA           ; Restore A
   STA $2000
   ```

2. Poll that RAM location for the marker appearing

### Strategy 3: Data Flow Analysis

**Goal**: Understand how a value travels.

**Example: Tracking palette data**

1. **Source**: Palette data in ROM at $C3/5000
2. **Transfer**: Decompressed to WRAM $7E:2000 via routine at $C2/3456
3. **Upload**: DMA'd to CGRAM via routine at $C2/3500
4. **Modification**: Your hack intercepts at step 3

**Trace it backwards**:
- See palette on screen → check CGRAM
- CGRAM written via $2121-$2122 → search for STA $2122
- Find the function → disassemble it → see where data comes from
- Find source buffer → search for writes to that buffer
- Find decompression routine → find ROM source

### Strategy 4: Pattern Recognition

**Common patterns in SNES games**:

1. **Function prologues**:
   ```assembly
   PHP           ; Save flags
   REP #$30      ; 16-bit mode
   PHA           ; Save A
   PHX           ; Save X
   PHY           ; Save Y
   ```

2. **Function epilogues**:
   ```assembly
   PLY
   PLX
   PLA
   PLP
   RTS
   ```

3. **VBlank wait**:
   ```assembly
   loop:
     LDA $4212
     AND #$80
     BEQ loop
   ```

4. **Controller read**:
   ```assembly
   LDA $4218      ; Joypad 1 current
   EOR $4218+2    ; XOR with previous
   AND $4218      ; Mask = newly pressed
   ```

**If you see these patterns**, you know what the code is doing even without full context.

### Strategy 5: Comparative Analysis

**Technique**: Make a minimal change and compare execution.

1. Save state in emulator
2. Note a memory value (e.g., HP = 100)
3. Load state, play forward 10 frames, note value (HP = 95)
4. Load state again, modify one instruction (NOP out a damage calculation)
5. Play forward 10 frames, note value (HP = 100 still)
6. **Conclusion**: That instruction was responsible for the -5 damage

### Strategy 6: NMI Injection

**Technique**: Use NMI as a hook point to run diagnostics.

```assembly
NMI_Handler:
  ; Original game code
  JSR OriginalNMI
  
  ; Your diagnostic code
  JSR LogCurrentState
  RTI

LogCurrentState:
  LDA $7E0010    ; Read some variable
  STA $7F1FFF    ; Write to logging buffer
  RTS
```

Every frame, your code runs and logs state. Read the buffer externally.

---

## Common Patterns in SNES Games {#common-patterns}

### Pattern 1: Data Tables

**ROM tables** are everywhere:

```assembly
; Jump table for menu options
MenuJumpTable:
  dw MenuItem0    ; $C2:1000
  dw MenuItem1    ; $C2:1050
  dw MenuItem2    ; $C2:10A0

; Code that uses it
LDA CurrentMenuItem  ; e.g., #$01
ASL A                ; Multiply by 2 (word size)
TAX
JMP (MenuJumpTable,X) ; Jump to MenuItem1
```

**Debugging tip**: If you see `LDA (SomeTable,X)` or `JMP (SomeTable,X)`, you're dealing with a table. Find the table to understand the options.

### Pattern 2: Bit Flags

**Compact status storage**:

```assembly
; Status byte at $7E:0050
; Bit 0 = Poisoned
; Bit 1 = Sleeping
; Bit 2 = Confused
; Bit 7 = KO'd

; Check if KO'd
LDA $7E0050
AND #$80       ; Mask bit 7
BNE is_kod

; Set KO flag
LDA $7E0050
ORA #$80       ; Set bit 7
STA $7E0050

; Clear poison
LDA $7E0050
AND #$FE       ; Clear bit 0 (AND with 11111110)
STA $7E0050
```

**Debugging tip**: If you see `AND #$80` or `ORA #$40`, the code is checking/setting individual bits. Each bit is a boolean flag.

### Pattern 3: Ring Buffers

**Circular queues** for input histories or animation frames:

```assembly
; 16-entry buffer at $7E:0200
; Current index at $7E:0100

; Write next entry
LDX $7E0100
LDA NewValue
STA $7E0200,X
INX
TXA
AND #$0F       ; Wrap at 16 (keep low 4 bits)
STA $7E0100
```

### Pattern 4: State Machines

**Character AI, menu systems**:

```assembly
; Current state at $7E:0080
; 0 = Idle, 1 = Walking, 2 = Attacking

LDA $7E0080
ASL A
TAX
JMP (StateTable,X)

StateTable:
  dw State_Idle
  dw State_Walking
  dw State_Attacking

State_Idle:
  ; Check for input
  LDA Joypad
  AND #$08       ; Right pressed?
  BEQ done
  
  LDA #$01       ; Switch to Walking state
  STA $7E0080
  
done:
  RTS
```

### Pattern 5: Fixed-Point Math

**SNES has no floating-point unit**, so games use **fixed-point**:

```assembly
; 8.8 fixed point (8 integer bits, 8 fractional bits)
; Value $0180 = 1.5 (1 * 256 + 128)

; Multiply two 8.8 values
LDA Value1     ; $0180 = 1.5
LDX Value2     ; $0200 = 2.0

; Multiply (16×16→32-bit, not shown here)
; Result = $0300 = 3.0
```

Or **16.16** for higher precision. Check if you see values being shifted right after multiplication (to divide away the extra precision bits).

---

## Putting It All Together: A Real Debugging Session

### Scenario: "Why does my character take damage when stepping on this tile?"

**Step 1: Find the damage routine**

Search ROM for strings like "HP" or numbers that match damage values. Or:
- Watch HP RAM address ($7E:0100 hypothetically)
- See it change from 100 to 95
- Save state before tile step, load and step through with breakpoints

**Step 2: Reverse from HP write**

```assembly
; Found: $C2/5678
LDA CurrentHP
SEC
SBC DamageAmount
STA CurrentHP     ; ← This is where HP changed
```

**Step 3: Trace backward to find DamageAmount source**

```assembly
LDA TileID
CMP #$25          ; Is it tile $25 (lava)?
BNE no_damage
LDA #$05
STA DamageAmount  ; ← Damage set here
```

**Step 4: Find where TileID is read**

```assembly
LDA PlayerY
LSR A
LSR A
LSR A             ; Divide by 8 (convert pixel to tile coord)
LDX PlayerX  
LSR A
LSR A
LSR A
; Compute offset into tilemap
; Load from tilemap buffer
LDA TilemapBuffer,X
STA TileID
```

**Step 5: Modify behavior**

Now you know:
- Where tile damage is checked: $C2/5678
- The tile ID that triggers it: $25
- The damage amount: $05

**Hack options**:
1. Change tile ID check: `CMP #$25` → `CMP #$FF` (disable)
2. Change damage amount: `LDA #$05` → `LDA #$00`
3. Change tile in map data (not a code hack)

---

## Final Thoughts: The Gestalt

The SNES is a **parallel dance** of specialized components:

- **CPU** orchestrates everything but is slow at bulk work
- **PPU** draws non-stop, 60 times per second, and demands data during VBlank
- **APU** plays music in total isolation, communicating through a tiny mailbox
- **DMA** is the forklift that moves heavy loads when CPU can't keep up

**Data flows in loops**:
1. Game logic updates variables in WRAM
2. NMI fires (60 Hz heartbeat)
3. WRAM data → DMA → VRAM/CGRAM/OAM
4. PPU reads VRAM/CGRAM/OAM → pixels on screen
5. Player sees result, presses button
6. Controller input → WRAM variables
7. Repeat

**Debugging is archaeological**:
- You're excavating 30-year-old code written by Japanese developers under tight deadlines
- No comments, no source, just raw bytes
- But patterns emerge: tables, state machines, bit flags
- Learn to recognize these patterns and you'll read assembly like prose

**The breakthrough moment** comes when you stop seeing:
```assembly
LDA $10
ASL A
TAX
LDA ($12),Y
```

And start seeing:
> "Load the menu index, double it (because table entries are 2 bytes), use it to index into the pointer table, and load the data from the pointed-to location."

That shift—from **syntax to semantics**—is the goal. You're getting there.

---

## Resources for Deeper Learning

- **65816 Reference**: https://softpixel.com/~cwright/sianse/docs/65816NFO.HTM
- **SNES Development Wiki**: https://wiki.superfamicom.org/
- **Fullsnes Doc**: https://problemkaputt.de/fullsnes.htm (hardware registers)
- **FFV Disassembly Projects**: Search GitHub for "ff5 disassembly"
- **Your own _WIP.txt**: You're building institutional knowledge! Keep that log.

---

*Good luck, romhacker. May your breakpoints be few and your stack never overflow.*
