# 2bpp Menu VFW Quest - Session Handoff Log

**Last Active:** 2026-07-06 (second session)  
**Status:** v4.2 APPLIED — hooks CONFIRMED FIRING (user observed flag $A5C3); root cause of invisibility found via PPU-register forensics: font is at VRAM word $7000, not $6000; upload retargeted  
**Priority:** Playtest v4.2 (reload ROM first!): digits 0-8 in menus = success

---

## 0.5 2026-07-06 (cont.): Hooks confirmed; wrong VRAM base found and fixed

User confirmed $7E:F529 = $A5,$C3 after a full Mesen reload → **both the
ROM-reload theory and the hook design validated; code runs every menu
frame.** Silence was downstream: the upload target.

**PPU-register forensics (new technique, logged in memory):** Mesen2
savestate values are stored as `asciiKey\0 + u32 size + value` — grep the
decompressed state for lowercase-camelCase keys. From ff5c_11.mss:
```
ppu.bgMode                  = 0     <- MENU IS BG MODE 0: all layers 2bpp!
ppu.layers[0..3].chrAddress = $7000 <- font/char base, ALL layers
ppu.layers[0..3].tilemapAddress = $0000/$0800/$1000/$1800
ppu.mainScreenLayers        = $1E   (BG2+BG3+BG4+OBJ)
```
So the font is at **VRAM word $7000** (my earlier $6000 pick from the
overlay DP constant $5E was wrong — those constants are something else).
Cross-check: "Job" tilemap at word $1163 = BG3 map ($1000) + $163 =
row 11 col 3 ✓ matches the screenshot. v4.1's uploads to $6298 landed in
unmapped VRAM between the tilemaps and the font — flag set, nothing
visible. Exactly the observed symptom.

**v4.2** = v4.1 with `!VramFontBase = $7000` (digit '0' tile now VRAM
word $7298). Applied to ff5c.sfc (md5 6f2e037f9e838f0f1a2edcbb523dfa85),
IPS rewritten. RELOAD THE ROM, open a menu: digits 0-8 = "VWF Test!"
slices.

Note for the real integration: Mode 0 means EVERY menu layer is 2bpp —
the v2/v4 renderer works for any of them; per-BG palette offsets apply
(Mode 0 gives each BG its own CGRAM quarter).

---

## 0.4 2026-07-06: v4 silent -> v4.1 dual-hook + diagnostics

v4 playtest showed nothing. Disk verified: patch WAS present (hooks + code
intact, md5 checked). Leading suspect: **the emulator never reloaded
ff5c.sfc from disk** — Mesen keeps the ROM image in memory; both v3 and
v4 were patched while the user's emulator was already running. Secondary
suspect (render-once flag collision at $F529) ruled unlikely (savestate
shows $00 there) but eliminated anyway.

**v4.1 changes** (menu_vwf_v4.asm, applied; ff5c.sfc md5
cf1d06a785670180b18752272e8191ed; IPS rewritten, 4 records):
- Flag is now a 16-bit magic word $C3A5 at $7E:F529-F52A
- SECOND independent hook at **C0/44D4** (menu-entry force blank in the
  field->menu handoff): renders + uploads once per menu open, resets
  nothing stock, preserves X; resumes at C0/44D9 (SEI / PLA / JSL C30000)
- NMI hook at C2/FB26 unchanged in behavior: render-once + upload every
  menu frame

**DIAGNOSTIC PROTOCOL (in order):**
1. In Mesen: File -> reopen/reload ff5c.sfc (or power cycle). Savestates
   may be loaded AFTER the reload. Open the main menu.
   SUCCESS = digits 0-8 show text slices.
2. If still silent: with a menu open, MCP-read:
   - $7E:F529-F52A -> $A5,$C3 means our code RAN (problem is then
     downstream: VRAM address/format — report and we re-aim)
   - anything else = hooks never executed (ROM still stale, or the
     session's menu entry/NMI differ — read $00:1F00-1F03 to see the
     live NMI target; expect 5C 0C FB C2 in menus)
3. Optional display-path check without any code: MCP set_memory on VRAM
   (if the bridge exposes video memory) — scribble bytes at VRAM byte
   $C530 (word $6298); digits garble instantly if the font mapping is
   as established.

---

## 0.3 2026-07-05 (later still): v4 assembled and installed

`menu_vwf_v4.asm` = v2's flood-aware 2bpp renderer + native-2bpp VRAM
uploader + MVP hook riding the menu NMI:

- **Hook: C2/FB26** (inside the menu NMI handler C2/FB0C, replacing its
  5-byte force-blank `LDA #$80 : STA $2100` with JML+NOP). The stub
  replays the force-blank first, so VRAM is writable; fires every menu
  frame, menu-only by construction, works from savestates (no reboot).
- Render runs ONCE (flag $7E:F529=$A5; expect a one-frame blink the
  first menu frame); upload runs every NMI (9 tiles, ~72 word writes) so
  it survives any font re-upload by the menu.
- Uploads "VWF Test!" over digit tiles $53-$5B at VRAM word $6298
  ($6000 + $53*8). SUCCESS = digits 0-8 in any menu (gil, HP, LV,
  item counts) show proportional-text slices; 9 stays normal.
- Footprint (all byte-verified): hook 5B at 0x02FB26, code+table 656B at
  0x205300-0x20558F ($E0:5300, verified $FF free), + header checksum.
  Coexists with inert v3 block at $E05000 (intro pipeline renderer).
- **IPS: `patches/menu_vwf_v4.ips`** (3 records, round-trip verified) —
  applies v4 to a pre-v4 ff5c image.
- Revert: re-run this session's byte revert (restore A9 80 8D 00 21 at
  0x02FB26) or `cp ff5c.sfc.bak ff5c.sfc` + reapply other patches.

After a successful sighting, next leg = real integration: string
intercept at C2/E59D + dynamic tile pool + width-aware tilemap writes
(see 0.2 build plan).

---

## 0.2 2026-07-05 (later): Savestate forensics — the REAL menu architecture

Playtest showed the v3 MVP hook silent in menu AND battle. Root cause found
and the entire architecture ground-truthed by parsing the user's Mesen2
savestate `ff5c_11.mss` (saved with the ability menu open — previews are
256x239 RGB555 zlib at +0x23; state zlib follows; WRAM at state+0x244,
VRAM block at state+0x230FA for this file).

**Corrections to §0.1 (each verified against the live state):**

1. **The C1/91A6 4bpp converter is NOT the menu's** — it's the intro/legend
   screen pipeline ("Ancients text" loads right after it). With the menu
   open, NO 4bpp ink+shadow font exists anywhere in the state. The v3
   MVP hook at C1/9226 therefore never fired in menus; it has been
   REVERTED (bytes A2 00 10 86 70 restored). v3's code at $E05000 remains
   in ROM, inert (nothing jumps to it) — it is the correct renderer for
   the INTRO's 4bpp text if we ever want VWF there.
2. **Menu font = RAW 2bpp at VRAM word $6000** (single copy, byte-verified
   256/256 tiles vs $D1F000). Color 1 flood = window background; ink =
   colors 2/3. **v2's renderer model (strip flood → OR ink → repaint
   flood) is the correct one for menus.** v2's width table note: tilemap
   uses $96 as the in-string space tile and $FF as window fill — give
   both narrow widths in the table rev.
3. **The menu is a RAM program**: field code at C0/44C8 force-blanks,
   disables NMI, then JSL $C30000 → C3/000F decompresses (ff5-lzss,
   window init $07DE) C3/7E4D → $7F:8000 ($4800 bytes) and JML $7F8000.
   Returns (RTL) only when the player exits the menu. Ground-truth dump:
   `generated-data/menu_overlay_7F8000_true.bin` (from the savestate;
   my Python ff5-lzss diverges at +0x34 — window-init edge case, fix later).
4. **Menu NMI handler = C2/FB0C** (RAM trampoline $1F00 = JML $C2FB0C
   while menu is open; IRQ = $C2FC2E). ROM-resident, hookable.
5. The overlay decompresses window/UI gfx from more C3 blobs (C3/7445,
   C3/750D, C3/7891, C3/759A, C3/3342, C3/1DFE...) into $7E:6000/7000/9000
   staging, queues VRAM uploads via pointer records at $7F:F180+, e.g.
   window gfx → VRAM word $7000. DP constants at overlay $7F:8F1A:
   $58=$4000, $5C=$2000, $5E=$6000 (VRAM layer/chr bases).
6. Staging tilemap for the BG3 text map lives at $7E:5000 + vram_byte
   ("Job Menu" tile words found live at $7E:52C6 = VRAM word $0163;
   attr bytes $00; tile codes match ffv_menufont tbl; window fill $FF,
   border tiles $04/$05).

**v4 build plan (the definitive one):**
- Renderer: v2's 2bpp algorithm verbatim (already assembly-verified),
  buffers in the sentinel-verified $F357-$F52B window.
- Upload: 2bpp tiles are 8 words each; VWF tile N → VRAM word $6000+N*8.
  Reserve high tile indices (check which of $C0-$FE are unused by menu
  UI) as the dynamic VWF pool. Write via the menu's own machinery:
  either hook the menu NMI at C2/FB0C (ROM, patchable) to drain a small
  VWF DMA queue, or piggyback the $7F:F180 record list.
- String intercept: C2/E59D (ROM, patchable) — render chars → pool
  tiles → write pool tile words to the staging tilemap at X.
- MVP proof (works from savestates, no reboot needed): hook C2/E59D or
  C2/C33C to VWF-render one label at menu draw time; or poke VRAM word
  $6000+$53*8 via emulator MCP `set_memory` (if it exposes VRAM) to
  garble digits as a zero-code pipeline check.

---

## 0.1 2026-07-05: Pipeline decoded, v3 built and installed

WRAM sentinel test PASSED (user, live): $7E:F357+469 unresponsive during
menu/submenu/battle/shop. Buffers adopted.

**The menu text pipeline, fully traced (supersedes all prior assumptions):**

1. **$1B00 is NOT menu-related.** It's the FIELD dialogue decode buffer
   (C0/92BD fills it; C0/8D48+ consumes; Myria's dialogue VWF reads char
   codes from it). Town-name banner seen there confirms it's 1bpp-side.
2. **Font conversion C1/91A6-9211:** menu font is NOT displayed as 2bpp!
   The converter reads only BP1 (ink = colors 2/3) of each $D1F000 tile,
   synthesizes shadow = ink>>1, writes 4bpp tiles (BP0=shadow, BP1=ink,
   BP2/3=0) to $7F:8000 (256 x 32 bytes). ROM font's BP0 color-1 flood is
   discarded; on-screen background = color 0 = transparent.
3. **VRAM upload C1/9216-9223:** $7F:8000, $2000 bytes -> VRAM word $7000
   via JSR $FD27 (X=src, A=srcbank, Y=vram word, $70=size).
   Menu font tile N = VRAM word $7000 + N*16.
4. **String draw C2/E59D** (string ID -> ptr table $C0F987 -> Myria's
   substitution shim E0/2FF0 -> C2/C340 `JSR $E59D`): writes tile WORDS
   into a bank-$7E staging tilemap at X, PLUS companion tile $51/$52
   (solid color-1 fills) one 32-tile row above ($7DFFC0+X trick = X-$40).
   Char translation C2/E5ED: string $20-$48 -> tile+$40 ('A' string $20 ->
   tile $60), $49-$52 -> tile+$17, $53+ raw (digits $53-$5C direct).
   **This is the real integration hook for full VWF.**

**v3 (`menu_vwf_v3.asm`) — APPLIED to ff5c.sfc 2026-07-05:**
- 1bpp ink compositing (like the game itself, and like Myria's dialogue
  VWF) + pack-to-4bpp with carry-chained shadow at upload. v2's bg
  strip/repaint dropped (wrong model — bg is transparent in this pipeline).
- Width table unchanged (BP1-measured = exactly the ink this pipeline uses).
- WRAM all within the sentinel-verified window (see file header).
- Entry points: Clear / RenderChar (A=font tile code) / UploadVRAM
  (X=VRAM word addr, FORCED BLANK ONLY) / GetWidth / GetTileCount.
- Verified: model matches stock pipeline output pixel-for-pixel in style
  (out/vwf_test/vwf_v3_vs_stock.png); "VWF Test!" = 67px vs 72px fixed.
- MVP hook at C1/9226 (menu init, post font upload, forced blank):
  renders "VWF Test!" over digit tiles $53-$5A (VRAM $7530+).

**PLAYTEST INSTRUCTIONS:** reload ff5c.sfc, open the main menu. SUCCESS =
digits 0-7 anywhere in menus (gil, HP, item counts) show slices of a VWF
"VWF Test!" strip instead of numbers. Digits 8-9 stay normal. If digits
look normal everywhere, the C1/91xx init isn't the menu module's (might be
battle's) — check battle windows too. Revert: `cp ff5c.sfc.bak ff5c.sfc`
(then re-apply any other live patches) or re-run only the WW patch chain.

**Next after successful playtest — real integration design sketch:**
- Hook C2/E5C5 (the JSR $E5ED translate) or wrap C2/E59D wholesale in
  expansion code: accumulate the string via RenderChar, upload to a
  dynamic tile pool (unused tile indices, e.g. $C0-$FF -> VRAM $7C00+),
  then write tile words for the pool tiles into the staging tilemap at X.
- Constraints to solve: VRAM writes only during blank (menu init is fine;
  live redraws need a vblank queue or forced-blank window), pool
  allocation per window/row, and the companion row-$51 tiles.

---

## 0. 2026-07-04 Audit: v1 retired, v2 built (docs-only session)

A cross-reference audit — no live WRAM reports used — found the v1 code
(`menu_vwf.asm`) was not viable. Findings, each independently fatal:

1. **Never assembled.** asar rejects 15 lines: the 65816 has no `long,Y`
   addressing mode (only `long,X`) and no long `STZ`/`DEC`. Verified by
   test-assembling against a scratch ROM copy.
2. **WRAM collision.** v1's dest buffer $7E1E40-$203F overlaps the NMI/IRQ
   RAM trampolines at $1F00/$1F04 (context.md; DOC_GAP_AUDIT.md §2.1).
   First rendered line ⇒ vblank jumps into pixel data ⇒ crash.
3. **Fake free space.** org $D1A119 ("866 bytes free") is a structured game
   data table, byte-identical in pristine ff5c.sfc.bak.
4. **Wrong width table.** Myria's $E03225 table is for the 1bpp DIALOGUE
   font (max 12px); 193 entries default to 12px — wider than the menu
   font's 8px tiles. Text would have grown, not shrunk.
5. **Wrong space char.** Space is $FF, terminator is $00
   (ffv_menufont_ff5c.tbl); v1 special-cased $96.
6. **Color corruption in the merge.** The menu font floods every tile with
   background color 1 (ink = colors 2/3). Plain OR turns shadow (10₂) over
   background (01₂) into white (11₂). Discovered by dumping glyph grids.

**v2 (`menu_vwf_v2.asm`) fixes all of the above:**
- org $E0:5000 — inside a verified 46KB run of $FF fill ($E0:4C25-$E0:FFFF),
  same expansion bank as Myria's own VWF code.
- WRAM = the game's own dialogue pixel-render workspace ($F507 cursor,
  $F508+ shift buffers, $F357+ line buffer — see C1/2CF1 disassembly),
  idle during menus and re-initialized by the game before each dialogue.
- Own 256-entry width table **measured from the real ff5c glyphs** by
  `analysis-tools/gen_menu_width_table.py` (ink = BP1 set; regenerate after
  font edits). Digits stay 8px, so number columns keep their alignment.
- Background-aware merge: strip bg at load (BP0 &= BP1), OR sparse ink,
  then `MenuVWF_Finalize` repaints color 1 (BP0 |= ~BP1). Proven in the
  Python model: `out/vwf_test/vwf_v2_proof.png` ("Will o' Wisp 999",
  105px vs 128px fixed, shadows intact).
- Assembly-verified: 581 bytes at file 0x205000-0x205248 (+ header
  checksum), zero bytes outside the verified free run.

**Remaining before integration:**
1. **WRAM sentinel test** (the one live check v2 still needs): fill
   $7E:F357-$F52B with $AA via the emulator MCP, open/navigate every menu,
   read back. If untouched, the buffer reuse assumption holds.
2. **Hook point** — new lead: context.md §C0 documents the general text
   engine at **C0/92BD decoding E7 strings into the $1B00 WRAM buffer**
   (this is also where Myria's dialogue VWF reads char codes). The menu
   routine that consumes $1B00 and writes tile indices to $7F7700 is the
   hook. Since breakpoints don't work, read $7E1B00 with a menu open to
   confirm menu strings land there (pure memory read, no breakpoint).
3. VRAM upload + tilemap update stage (unchanged from §5).

---

## 1. Quest Summary

**Goal:** Add Variable Font Width to the 2bpp menu font (visible in shops, status screens, equipment menus) — the same font that's currently monospaced at 8px per character.

**Approach:** Adapt Myria's proven 1bpp dialogue VWF technique for 2bpp tiles, using her existing width table at $E03225 for unified character widths.

---

## 2. What's Complete

### 2.1 ASM Implementation
**File:** `ffv-decomp/asm/menu_vwf.asm`

- Full 2bpp VWF renderer (~250 bytes)
- Uses Myria's width table at `$E03225` (no duplicate table needed)
- Handles dual-bitplane shifting for 2bpp format
- Targets free ROM space at `$D1A119` (866 bytes available)
- Entry points:
  - `MenuVWF_Clear` — reset buffer before rendering
  - `MenuVWF_RenderChar` — render one character with VWF
  - `MenuVWF_RenderString` — render null-terminated string
  - `MenuVWF_GetWidth` — get rendered pixel width
  - `MenuVWF_GetTileCount` — get tile count needed

### 2.2 Python Prototype
**File:** `ffv-decomp/analysis-tools/prototype_2bpp_vwf.py`

Verified working. Test results:
| String | VWF Width | Fixed Width | Savings |
|--------|-----------|-------------|---------|
| Bartz | 35px | 40px | 12% |
| Galuf | 33px | 40px | 17% |
| Will o' Wisp | 71px | 96px | 26% |

### 2.3 Research Documentation
- `ffv-decomp/notes/MENU_VWF_RESEARCH.md` — original analysis
- `ffv-decomp/notes/2BPP_VWF_IMPLEMENTATION.md` — algorithm design
- `ffv-decomp/notes/2BPP_VWF_HOOK_INVESTIGATION.md` — hook search notes

---

## 3. What's Needed: The Hook Point

### 3.1 The Problem
We need to find WHERE in the ROM the menu system writes character tile indices to the tilemap. That's our hook point — we intercept there and redirect to our VWF renderer.

### 3.2 Known Architecture
```
Current (Fixed Width):
  String from E7 bank → C3 processes → Tile index written to $7F7700 tilemap → DMA to VRAM

Target (VWF):
  String → MenuVWF_RenderChar (pixel rendering) → DMA to VRAM tiles
        → Update tilemap to reference VWF tile range
```

### 3.3 Candidate Areas
1. **C2/A000+** — Menu code, undisassembled
   - Found ADC #$40 and ADC #$80 patterns (tile offset calculations)
   - String loop candidates at C2/B255, C2/C0B5, C2/D820, C2/FC4E
   
2. **C3 bank** — "Final writer to tilemap" per context.md
   - Only 365 bytes disassembled (C3/0000-016D)
   - Rest is compressed graphics + unknown code

3. **Tilemap buffer $7F7700** — Menu graphics buffer
   - Writes found at C1/27CB, C1/949C-94BC (but these are OAM/sprite related)

---

## 4. Next Step: Mesen Watchpoint Trace

**This is what the user needs to do:**

### Step-by-Step Instructions

1. **Load ROM in Mesen**
   - Open `ff5c.sfc` in Mesen emulator

2. **Open Debug Menu**
   - Tools → Debugger (or press F12)

3. **Set Memory Watchpoint**
   - In debugger, go to Breakpoints panel
   - Add new breakpoint:
     - Type: **Write**
     - Address: **$7F7700** (or range $7F7700-$7F7800)
     - Enable it

4. **Trigger Menu Text**
   - In game, open any menu that shows text:
     - Item menu (shows item names)
     - Magic menu (shows spell names)  
     - Status screen (shows job/character names)

5. **Capture the Break**
   - When breakpoint triggers, note the **PC (Program Counter)** address
   - This is the code writing to tilemap
   - Look at the call stack to see who called this routine

6. **Report Back**
   - The PC address (e.g., "C2/B3F7" or "C3/1A5C")
   - A few lines of surrounding code if visible
   - What type of menu triggered it

### What We're Looking For
- A routine that loops through characters
- Adds an offset to convert char code → tile index
- Writes to $7F77xx buffer

---

## 5. After Hook Is Found

Once we have the hook address:

1. **Analyze the routine** — understand its inputs/outputs
2. **Design the intercept** — JSL to our VWF code, return gracefully
3. **Handle VRAM upload** — DMA rendered VWF buffer to tile area
4. **Update tilemap** — reference VWF tiles instead of fixed tiles
5. **Test transparency** — verify 2bpp color 0 works as expected

---

## 6. Known Unknowns

1. **Transparent color behavior** — Will 2bpp color 0 act as transparent like 1bpp color 0? Need to test.

2. **VRAM tile space** — Where do VWF-rendered tiles go? May need dedicated VRAM area.

3. **Multiple text lines** — Current code handles one line; may need buffer management for multi-line menus.

---

## 7. Key Files Reference

| File | Purpose |
|------|---------|
| `ffv-decomp/asm/menu_vwf.asm` | The VWF implementation to integrate |
| `ffv-decomp/analysis-tools/prototype_2bpp_vwf.py` | Python version for testing |
| `ffv-decomp/notes/context.md` | Comprehensive ROM architecture reference |
| `ffv-decomp/third-party/disassemblies/Bank_C1_disassembly_by_noisecross.txt` | C1 bank (battle/text rendering) |
| `ff5c.sfc` | Working ROM to patch |
| `ff5 RPGe [crc32=17444605].sfc` | Reference RPGe ROM |

---

## 8. Memory Entry

This quest is tracked in project memory at:
`memory/vfw_dialogue_status.md`

---

*Handoff prepared: 2026-07-03*  
*Ready to resume when Mesen trace data is available*

---

## 9. Status Update 2026-07-18: v5 (full menu VWF) INSTALLED

v4.2 digits MVP **confirmed on-screen by user** (variable kerning visible).
That retires the pipeline-proof phase. Today `asm/menu_vwf_v5.asm` was
assembled onto `ff5c.sfc` (v4.2 state preserved as `ff5c.sfc.v4bak`).

Pre-install static verification performed against the stock ROM:

- C2/E59D head = `PHB PHP SEP #$20` (4 bytes) - matches v5 trampoline steal.
- C2/E5EA = `PLP PLB RTS` - matches v5 exit with [B][P] on stack.
- Translate routine C2/E5ED fully decoded: 16-bit adds `#$5140` ($20-$48)
  and `#$5217` ($49-$52); as-is path ORs $79/$7A = $FF00 (text mode).
  v5's 8-bit +$40/+$17 copies the low-byte mapping exactly.
- Companion-cell concern resolved: stock writes tile $51/$52 (letters) or
  $FF (as-is) to the row above; font tiles $51/$52/$FF are byte-identical
  blanks (`FF 00` x8), so v5's constant $FF flood is visually stock-equal.
- Freespace neighbors mapped: $E05000-$E052FF (earlier hacks, JSL from
  C4/4954), $E058E8 (JML from DE/4F4F), $E05E88 (JML from D7/A271).
  v5 spans $E05300-$E056FA - no collision.
- Post-patch diff: only the 3 hook sites, $E053xx-$E056FA, and checksum.

OPEN ITEM (from v5 header): queue WRAM $7E:A937-AB36 is NOT yet
sentinel-verified as menu-idle. If playtest shows glitches, run the
sentinel test (fill $AA, navigate menus/shops, read back) on the v4bak ROM.

Playtest expectations: all menu labels proportionally spaced; digits ~8px;
raw-mode / len>27 / queue-full strings fall back to stock 8px rendering
(mixed spacing in heavy menus is the queue-cap fallback, not a bug).
