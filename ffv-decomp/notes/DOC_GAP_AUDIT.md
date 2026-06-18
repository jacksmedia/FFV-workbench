# FFV Disassembly Documentation — Gap Audit

Audit date: 2026-06-09. Produced by cross-checking every disassembly doc in this
directory against the two reference ROMs:

| ROM | File | Size | CRC32 |
|-----|------|------|-------|
| J (1992 original) | `_Final Fantasy V J (CRC32 = C1BC267D).sfc` | 2MB, HiROM, banks C0–DF | C1BC267D |
| RPGe 1.10 (1998 translation) | `_FFV RPGe (CRC32 = 17444605).sfc` | 2.5MB, banks C0–E7 | 17444605 |

Method: (1) parsed each doc to map its true address coverage; (2) scanned both
ROMs for cross-bank `JSL`/`JML` instructions *as written in the verified docs*
(not raw byte scans, which produce false positives in data); (3) disassembled
every call target that landed outside documented territory using the new
`disasm65816.py`; (4) diffed the `ff5u-sfc.json` ROM map against the full
address space. All addresses below are SNES HiROM (`bank/addr`); file offset =
`(bank-0xC0)*0x10000 + addr`.

---

## 1. TRUE coverage of each doc (corrections to received wisdom)

Several coverage claims circulating in our notes (context.md §13) are wrong.
Measured reality:

| Doc | Claimed | **Actual measured coverage** |
|-----|---------|------------------------------|
| Bank_C0 RTF (1337_5k37c3r) | "Full C0 bank" | **C0/0000–60FF only** (37% of bank) |
| Bank_C0 TXT (Lenophis) | "Full C0 bank" | **134 of 256 pages** — riddled with holes (see §1.1) |
| Bank_C1 (noisecross) | Full | Full C0/0000–FFFF ✓ (confirmed, incl. fill bytes at FFFE) |
| Bank_C2 (Instructor Trepe) | Partial | Function *index* only (~90 routine names, no disassembly), ends C2/964D |
| c2battle.asm (Modoh) | Full C2 battle | C2/0000–9FFF ✓ complete and labeled. **Stops dead at A000** |
| Bank_C3 (Lenophis) | "Menu/palette" | **C3/0000–016D only — 365 bytes** (0.6% of bank) |
| Bank_C4 (Lenophis) | "Sound engine" | **C4/0000–0645 only** — the 65816-side loader. SPC700 program not disassembled |
| Bank_E0 (Lenophis) | Partial | E0/2D40–31B1 fragments — but **complete for its purpose**: covers all 13 entry points actually called from C0 (verified) |

Note: the Lenophis C0/E0 docs disassemble **RPGe**, not J — the C0 doc contains
`JSL $E02D40`-family calls that only exist in the translated ROM.

### 1.1 Holes in the Lenophis C0 doc (pages with zero lines)

```
C0/0800-0CFF   C0/2000-20FF   C0/2700-27FF   C0/2B00-30FF   C0/3300-33FF
C0/3800-38FF   C0/4000-40FF   C0/4300-43FF   C0/5100-53FF   C0/6700-68FF
C0/7300-82FF   C0/8500-8AFF   C0/9000-91FF   C0/9500-95FF   C0/9E00-A0FF
C0/A700-AFFF   C0/B100-B9FF   C0/BB00-BBFF   C0/C000-C1FF   C0/CD00-FFFF
```
Many holes are data tables (fine to omit from a *disassembly*), but they are
documented nowhere else either. C0/7300–82FF and C0/CD00–FFFF contain
identified content — see §2.4 and §2.1.

---

## 2. New findings (verified against ROM, not previously in any doc here)

### 2.1 Hardware vectors and the RAM interrupt trampolines ★ hack-critical

The native-mode vectors at C0/FFE0+ point into the undocumented C0/CD00–FFFF
region:

```
RESET → $CEC0    NMI(native) → $CEE0    IRQ(native) → $CEE4
```

```asm
C0/CEC0: 78           SEI               ; reset stub
C0/CEC1: 18           CLC
C0/CEC2: FB           XCE               ; native mode
C0/CEC3: 5C 00 00 C0  JML $C00000       ; -> boot code documented at C0/0000

C0/CEE0: 5C 00 1F 00  JML $001F00       ; NMI  -> RAM trampoline at $00:1F00
C0/CEE4: 5C 04 1F 00  JML $001F04       ; IRQ  -> RAM trampoline at $00:1F04
```

**Every NMI and IRQ in FFV is dispatched through 4-byte JML thunks in WRAM
$1F00 and $1F04.** The game rewrites these to switch handlers between field /
battle / menu modules. For hacking this is gold: you can intercept vblank
globally by patching 3 bytes of RAM at $1F01-1F03 (or chain the original) — no
ROM hook needed, works regardless of which engine is active. Directly relevant
to the KO-palette vblank-redraw work in `_WIP.txt`.

### 2.2 The menu program: C2/A000–FFFF (~24KB, zero disassembly exists)

Modoh's own source ends with: *"$C2A000 is the start of the menu code —
fortunately it is programmed as if it is in its own bank."* Confirmed: it is a
self-contained module with a 3-entry API at the top, called from outside:

```asm
C2/A000: 80 14        BRA $A016        ; entry 0: main menu     (JSL'd from C0/0043, C0/4560)
C2/A002: 20 7D FF     JSR $FF7D
C2/A005: 6B           RTL
C2/A006: 80 02        BRA $A00A        ; entry 1: (JSL'd from C1/FFF9 — battle->menu handoff)
C2/A008: 80 05        BRA $A00F        ; entry 2: (JSL'd from C0/4C90)
  ...
C2/A016: 20 1B A1     JSR $A11B        ; init
C2/A019: 64 39        STZ $39
C2/A01B: A5 34        LDA $34          ; (16-bit A here)
C2/A01D: 29 07 00     AND #$0007       ;   menu module index 0-7
C2/A020: 0A           ASL
C2/A021: AA           TAX
C2/A022: BF 00 E6 C0  LDA $C0E600,X    ; ** module dispatch pointer table at C0/E600 **
C2/A026: 85 C7        STA $C7
C2/A028: E2 20        SEP #$20
C2/A02A: 6C C7 01     JMP ($01C7)      ; jump to menu module
```

The menu module pointer table lives at **C0/E600** (inside a Lenophis hole).
This 24KB region is the single largest undisassembled block of 65816 code in
the game. The save/load-screen notes in context.md §5A (C2/C6B8, C2/C8DE,
C2/E3A6...) are the only documentation of it anywhere, and they came from this
project's own debugging sessions.

### 2.3 Undocumented code in "data" banks D0 and D9 ★ palette-relevant

noisecross's C1 doc contains a trampoline farm at C1/FC00–FDFF (thin `JSL` +
`RTS` wrappers) whose targets nobody ever followed. They land in banks D0/D9
**after** the monster data — real, reachable code:

| Routine | Called from | Function (verified by disassembly) |
|---------|------------|-------------------------------------|
| D0/DC2A | C1/FCD7 | Battle screen-effect **HDMA setup**: ch.3 → $2126 (window pos, mode $41 indirect, table D0/DD81), ch.6 → $2131 (CGADSUB color math, tables D0/DD9F or DD AC selected by flag $7E:DBD3); sets HDMA-enable shadow bit 3 in $7E:BC84. Mode switch on $7E:F9A1 |
| D0/DCA5 | C1/FCDC | Battle BG **parallax HDMA**: ch.0/1/2 → $210D/$210F/$2111 (BG1/2/3 HOFS), indirect tables in WRAM $7E:A897/$7E:A8B0/$7E:A930; alt path ch.2 → $2132 COLDATA w/ table D0/DD7A if $7E:DBD3 set |
| D0/DE1A | C1/FDCA | **General DMA-to-VRAM upload helper** (callable!): Y=VRAM addr, X=src addr, A=src bank, length in $70; uses ch.5, mode $01 → $2118/19, fires $420B, RTL |
| D0/DE40, DE66, DE8C, DED1 | C1/FDB6-FDCA | Siblings of DE1A (variant DMA setups — same register family) |
| D0/EF78 | C2/4246, C2/511C | Called from battle engine (Modoh labels the call but not the target) |
| D9/7CAA | C1/FD1D | Frame-wait loop: spins on counter $A5 vs flag $DB9A, RTL |
| D9/7CB4 | C1/FD22 | **OAM clear utility**: fills OAM shadow $0200–03FF with #$F0 (sprites offscreen), zeroes hi-table $0400–041F, RTL |

The HDMA tables themselves (D0/DD7A–DDB0 region, plus WRAM-built tables) are
likewise undocumented. Anyone doing battle palette/color-math hacks (us!)
should know D0/DC2A exists — it owns $2131 during battle effects, and color
math can override or tint sprite palettes independent of CGRAM contents.

**UPDATE 2026-06-09 (same day): the full suite is now disassembled and
commented in `Bank_D0_battle_DMA_disassembly.txt`.** Highlights beyond the
table above: **D0/DE66 is the CGRAM palette upload** (DMAs the $7E:7E09
shadow buffer — the one the 3/21 _WIP investigation found — 512 bytes through
$2122; single chokepoint for palette hacks); D0/DE8C is the OAM upload with
inhibit flag $7E:BC75; D0/DED1 is a VRAM zero-fill; the HDMA tables reveal
the battle screen split is driven by WRAM bytes $7E:BC82/83 (BG mode),
$7E:BC86/87 (color math), $7E:DBC2/C3 (BG2 tilemap base) for fight-area vs
message-window sections; and there is an extra orphan entry point at
**D0/DC86** (brightness-gradient HDMA) whose caller is still unidentified.
Region is byte-identical in J and RPGe.

### 2.4 C0/7300–82FF hole = long-pointer streaming tables into C6–C9

The 4KB hole in the Lenophis C0 doc is not code. It is tables of 6-byte
records — `[3-byte long pointer][2-byte size/param][tag]` — pointing at blobs
in banks C6–C9 (e.g. `$C7:7D40 len $03CD`, `$C8:7D44`, `$C9:7D47`...).
Raw byte-scans misread these as `JSL`s. They appear to drive bulk graphics/
tilemap streaming for the world maps. Identifying the consumer routine is an
open task (likely in another C0 hole).

### 2.5 Bank identifications: C5, C6 = music data; CA = unknown

Banks C5, C6, and CA appear in **no doc and no JSON definition** (the bank map
in context.md §1 simply skips them). Found: ascending long-pointer tables
inside the sound bank —

```
C4/3B97: 32 pointers spanning $C5:E5E8 .. $C6:BC98
C4/3BA6: 27 pointers into bank C6 ($C6:0395 ..)
C4/3C99: 15 pointers into bank C5 ($C5:0015 ..)
```

→ **C5 and C6 are music sequence/sample data addressed by the C4 sound
driver's song table.** (FF5 has ~70 tracks; table at C4/3B97 region is the
likely master song index — worth confirming counts.)

**CA (64KB) remains unidentified** — mid-entropy structured data, no obvious
pointer table at CA/0000, no inbound long pointers found from code banks.
RPGe alters 38 bytes at CA/0000 and 26 at CA/E000, so the translators touched
it (text-adjacent data? battle messages? worth diffing in detail). Candidate:
attack/battle animation scripts. Open task.

### 2.6 The second CPU: SPC700 program at C4/~064D

Lenophis's C4 doc covers only the 65816-side loader (it ends right at the
`CPX $2140` / `#$BBAA` IPL handshake sequence). Immediately after, at
C4/064D+, sits the **SPC700 program image** uploaded to the audio CPU:

```
C4/064D: E8 00      MOV A,#$00      ; (SPC700 encoding!)
C4/064F: 5D         MOV X,A
C4/0650: AF         MOV (X)+,A      ; classic zero-page clear loop
C4/0651: C8 F0      CMP X,#$F0
C4/0653: D0 FB      BNE -5
```

This is an entire second processor's worth of code (the music engine proper —
echo setup, channel mixing, sequence interpretation) with **zero disassembly
anywhere in the community corpus**. It requires an SPC700 disassembler, not a
65816 one. High-value, well-bounded project: the driver is a few KB and ends
where C5/C6 sequence data begins.

### 2.7 Bank C3: code extends far beyond the documented 365 bytes

The C3 doc stops at C3/016D, but verified 65816 code continues (e.g. at
C3/0170: `STZ $44 / LDX #$0005 / JSR $0ABC / JSR $1C96 / JSR $19D9 ...` and a
`JSL $C40004` sound call + `STA $1D00` MusicData write at C3/01C0-ish).
JSR targets prove code spans at least C3/0000–1CFF. Region character:

- C3/0000–~2FFF: code (entry C3/0000 = fade/transition handler per the
  Lenophis fragment; calls the sound API; sets up an indirect jump vector in
  $D0/$D2 — same dispatch idiom as C2/A02A)
- C3/3000–9FFF: entropy 7.1–7.5 → predominantly compressed graphics
- C3/BB00–E700: map palettes (the one piece in the JSON map)
- C3/E700–FFFF: unmapped (entropy 3–4.5 → sparse tables)

Open question: what calls C3/0000? No JSL/JML to it from any doc'd code — the
$D0/$D2 + `JMP ($00D0)`-style indirect dispatch means callers are invisible to
static call scans. A Mesen2 MCP memory watch on $04F0/$04F2 (where the
fragment stores the vector: `LDX #$7E4D / STX $D0 / LDA #$C3 / STA $D2`) would
catch it live.

### 2.8 C8/2220–3320: unmapped pointer tables between world layouts and events

`ff5u-sfc.json` maps World Layouts up to C8/2220 and event pointers from
C8/3320, leaving 4.3KB unaccounted. At C8/2F60+ there is a clean ascending
16-bit pointer table ($C5D0, $C5E1, $C5EC, $C5FB, $C60C, ... $EFC8 — likely
offsets into bank C8 itself). context.md §5A refers to "the dispatch table at
C8/2F70" (save-screen entry 5) — this is that table, but its full extent,
count, and base bank were never written down.

---

## 3. ff5u-sfc.json ROM-map holes (data side)

20.1% of the 2.5MB RPGe space (527,578 bytes) has no JSON definition. The
code banks account for most of it (expected — the JSON maps data), but these
are pure-data holes worth defining for the webapp:

| Hole | Size | Identification |
|------|------|----------------|
| C3/E700–FFFF | 6.4KB | unknown sparse tables after map palettes |
| C4/0646–C6/FFFF | ~196KB | SPC700 program + music sequences/samples (§2.5, §2.6) |
| C8/2220–3320 | 4.3KB | pointer tables incl. C8/2F60 (§2.8) |
| CA/0000–FFFF | 64KB | unidentified (§2.5) |
| D0/5600–6800 | 4.6KB | between Monster Items and Random Battle Groups — unknown |
| CE/F270–FFFF, CF/D7CB–DFFF | ~5.5KB | partially listed as free space in context.md §11; verify which bytes are truly free vs. unidentified data before claiming for hacks |

---

## 4. Prioritized gap list (community contribution targets)

1. **C2/A000–FFFF menu program** — biggest undisassembled 65816 block (~24KB).
   Start from the 3-entry API + C0/E600 module table (§2.2). This project's
   §5A save-screen notes already seed it.
2. ~~**D0/DC2A–DEFF battle HDMA/DMA suite**~~ **DONE 2026-06-09** — see
   `Bank_D0_battle_DMA_disassembly.txt`. Open remainders folded into that
   file's "Open items" list (find the D0/DC86 caller, $7E:DBD3 semantics,
   identify the $0640/$0740 arrays).
3. **C0 hole pages** — especially C0/CD00–FFFF (vectors §2.1, menu module
   table at E600, tilemap ptr table EB08, E7-string ptr table F987) and
   C0/7300–82FF (streaming tables §2.4).
4. **Bank C3 code** (0170–~2FFF) — needs dynamic tracing to find its callers.
5. ~~**SPC700 driver at C4/064D+**~~ **DONE 2026-06-12** — see
   `FFV_sound_driver_notes.txt`: full APU memory map, boot sequence, all 46
   music vcmds identified (cross-validated against pgate1's spcmake_byFF5),
   per-voice state map, song header format. Open remainders folded into that
   file's §8 (port cmds 1/2/7, SFX engine, tempo formula, tie/rest poke test).
6. **Identify bank CA** — diff J vs RPGe bytes (38+26 changed), test in
   emulator by corrupting a region and observing.
7. ~~**Song table at C4/3B97 + C5/C6 sequence format**~~ **DONE 2026-06-12**
   — sequence format fully specified in `FFV_sound_driver_notes.txt` §4-§5;
   music hacking is now possible (note = pitch×15+duration, vcmds $D2-$FF).

## 5. Tools added by this audit

- `disasm65816.py` — standalone 65816 linear disassembler (full 256-opcode
  table, SEP/REP width tracking, community doc output format).
  `python disasm65816.py <rom> <bank> <start> <end> [--m16]`
- `disasm_spc700.py` — full 256-opcode SPC700 (Sony APU CPU) disassembler
  with APU I/O + DSP register annotation and a branch-coherence `--check`
  mode. `python disasm_spc700.py <rom> --fileoff 0x04064F --aram 0x0200
  --len 0x17F0 [--start A --end B] [--check]`
- `doc_gap_audit.py` — region classifier + JSL scanner + J/RPGe differ that
  produced the raw data behind this report. Note: raw byte-scan JSL results
  include false positives in data regions; trust only targets confirmed from
  doc-verified code (§2 used the doc-extraction method).

## 6. Corrections to apply to context.md

- §1 bank table: add `C5–C6 = music sequence/sample data (C4 driver)`,
  `CA = unidentified`, and split `C4 = 65816 loader (0000-0645) + SPC700
  program (064D+)`.
- §13: Bank_C0 RTF coverage is C0/0000–60FF, not "Full"; Bank_C0 TXT covers
  134/256 pages; Bank_C3 doc is 365 bytes, not "menu system".
- §2.1 boot notes: add the real RESET entry (C0/CEC0) and the $1F00/$1F04
  NMI/IRQ RAM trampolines (§2.1 above).
