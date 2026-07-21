# FF4 JOBS — Per-Character Job Sheets: Implementation Plan

*Executor-oriented plan. Written for an engineer/LLM who has NOT read the
project history. Follow phases in order. Every phase ends with a GATE — a
verification you must pass before continuing. If a GATE fails, STOP and write
your findings to `_WIP_FF4.txt`; do not improvise around a failed gate.*

**Goal:** In S34n4e's "FF4 Job System" hack, all five characters currently
share one battle sprite sheet per job (Sage Rydia looks like Sage Tellah).
Make each character use their own sheet per job: 5 characters × 15 job slots
= 75 sheets, stored in expansion banks, with undrawn combos automatically
falling back to today's shared art.

---

## 0. Required reading and hard rules

Read first (all paths relative to `WW-project\FF4_JOBS\` unless noted):

1. `FF4_JOBSYS_ANALYSIS.md` — the reverse-engineering doc this plan is built on.
2. `..\docs\WW_UPGRADE_NOTES.md` — the FFV precedent. Internalize the four
   lessons: (v0.05) *slot and character are different index spaces*; (v0.06)
   *search for data constants to find all consumers*; (v0.07) *MVN hardcodes
   banks*; (v0.08) *parallel subsystems need parallel fixes*.
3. `..\scripts\patch_WW_v0_08.py` — the build-script pattern you will copy:
   verify expected bytes → patch → write new ROM + IPS. Never skip the verify.

### Hard rules (violating any of these is an automatic STOP)

- **R1.** Never modify a ROM in place. Input ROM → new output ROM per version
  (`ff4jobs - PCJv0.01.sfc`, v0.02, …). Keep every version.
- **R2.** The working base is `FF4_JOB_SYSTEM_1.5\FF4_JOB_SYSTEM_1.5.sfc`
  (2,097,152 bytes). Do NOT use `FF4_JOBS\FF4_JOB_SYSTEM.sfc` (older build).
- **R3.** Before writing any patch bytes, `check()` that the file currently
  contains the exact expected old bytes (copy the pattern from
  `patch_WW_v0_08.py`). Mismatch = STOP.
- **R4.** You may write ONLY to: (a) the exact hook ranges listed in this plan
  (all below file offset 0x100000), and (b) file offsets 0x138000–0x168000
  (banks $27–$2C, verified empty). Nothing else. In particular never touch
  0x100000–0x101A24 or 0x108000–0x1081A2 (S34n4e's own expansion code).
- **R5.** Address math is **LoROM**: `file_offset = bank*0x8000 + (addr −
  0x8000)`; SNES `$BB/AAAA` has `AAAA >= 0x8000`. (FFV was HiROM — do not
  reuse FFV math.)
- **R6.** The Mesen2 MCP emulator has **no working breakpoints** (despite its
  docs). You verify with memory/VRAM reads, savestates, and playtest
  screenshots only.
- **R7.** Keep a reverse-chronological log `_WIP_FF4.txt`: date, what you did,
  exact bytes, observed result — including failures. Never delete research.
- **R8.** Report playtest results faithfully. "Sprite wrong but colors right"
  is a *useful* result — log the exact symptom; do not round it to "works".

### Address reference card

| Thing | SNES | File offset | Notes |
|---|---|---|---|
| Battle sheets (shared, S34n4e) | `$1A/8000` | `0xD0000` | 15 slots × 0x800; index = job |
| Battle palettes | `$1C/FD00` | `0xE7D00` | 16 × 0x20; 0–4 = per-character colorways |
| Battle party loader (per slot) | `$01/8DA2` | `0x08DA2` | reads record byte +$00 (actor) and +$32 (job item) |
| Sheet+palette load core | `$01/8DD0` | `0x08DD0` | **our main hook target** |
| Palette copy inside core | `$01/8E26` | `0x08E26` | `$1C/FD00,X → $FE28+slot*$20` |
| DMA queue helpers | `$01/818A`, `$01/8078` | `0x0818A`, `0x08078` | take src offset $1F, bank $21, size $22 |
| Char record ptr table | `$0F/C625` | `0x7C625` | slots → WRAM $1000/$1040/$1080/$10C0/$1100 |
| Job byte in char record | offset `+$32` | — | 0 = Jobless, or job item ID 0xA1–0xAD; `& 0x0F` = job index 1–13 |
| Menu job-sprite viewer | `$20/941C` | `0x10141C` | reads `$1A/8000,X` directly, writes $2116/$2118 |
| NEW: our code bank | `$27/8000` | `0x138000` | routine below |
| NEW: per-char sheet banks | `$28+c/8000` | `0x140000 + c*0x8000` | char c slot j at `+ j*0x800` |

### The one formula

```
sheet(char c 0–4, job j 0–15):
    bank        = $28 + c
    SNES addr   = $8000 + j*0x800
    file offset = 0x140000 + c*0x8000 + j*0x800
```
j = 0 is Jobless, j = 1–13 the jobs (index = job item ID & 0x0F), 14–15 spare.
One character = exactly one 32 KB bank. No pointer table needed.

---

## Phase 0 — Environment & assumption verification (no ROM writes)

**0.1** Verify the toolchain: run
`python apply_ips.py "..\..\ff4 (v1.1) [crc32=23084FCD].sfc" FF4_JOB_SYSTEM_1.5\FF4_JOB_SYSTEM_1.5.ips FF4_JOB_SYSTEM_1.5\FF4_JOB_SYSTEM_1.5.sfc`
(run from `WW-project\FF4_JOBS\`; adjust relative paths as needed). Expected
output: `EXACT MATCH`.

**0.2** Verify hook-site bytes. Using `disasm_lorom.py` on the 1.5 ROM,
disassemble `01 8DD0 8DF4` and confirm it matches the listing in
`FF4_JOBSYS_ANALYSIS.md` §1. The 28 bytes at file `0x08DD5` must be exactly:
`A9 00 EB A5 5C 0A 0A 0A EB C2 20 18 69 00 80 85 1F A9 00 06 85 22 E2 20 A9 1A 85 21`.

**0.3** Verify target banks are empty: file range 0x138000–0x168000 must be
all `0x00` in the 1.5 ROM.

**0.4** MVN check (WW v0.07 lesson). Disassemble `$01/8078–$01/81FF` and
confirm the DMA path contains **no** `MVN`/`MVP` (opcodes `54`/`44` as
instructions) and **no** `CMP #$1A`-style bank dispatch. The source bank must
flow from zero-page `$21` into the queue unmodified. If you find a bank
compare or MVN: STOP, document it — it becomes an extra dispatch patch
exactly like WW v0.07.

**0.5** Emulator ground truth (Mesen2 MCP, FF4_JOB_SYSTEM_1.5.sfc loaded,
full party of 5, in battle):
- Read WRAM `$1000, $1040, $1080, $10C0, $1100` (byte 0 of each record).
  Record the values. **Expected: `value & 0x3F` ∈ {0..4}, one per character,
  stable across party reorder.** If not 0–4, STOP and log the actual values —
  the routine in Phase 2 masks with `AND #$07` and must be revised to a small
  lookup if IDs exceed 7.
- Read offset `+$32` of each record. Expected: 0 or 0xA1–0xAD matching each
  character's equipped job.
- (WW v0.05 lesson check) Reorder the party, re-read: byte 0 values must
  follow the *characters*, not the seats.

**0.6** Second-loader hunt (WW v0.06 lesson + Mini risk). FF4 has
transform-type statuses (Mini, Pig, Frog). In the emulator: inflict Mini
(e.g. cast Size/Minimum on a party member) and observe whether the battle
sprite changes to the tiny generic sprite. If it does, the game reloaded
VRAM from somewhere. Then, statically: search the 1.5 ROM for other readers
of the sheet region — `python find_bytes.py <rom> "A91A8521"`
(`LDA #$1A / STA $21`) and inspect each hit's context with `disasm_lorom.py`.
Every additional party-sheet load site found must be listed in `_WIP_FF4.txt`
with a decision: hook it the same way (Phase 4) or document as known gap.

**GATE 0:** 0.1–0.5 all pass; 0.6 findings logged. Write a Phase 0 report in
`_WIP_FF4.txt` before proceeding.

---

## Phase 1 — Build data banks with fallback pre-fill (data only, no hooks)

Write `build_sheets.py` (model on `patch_WW_v0_08.py` conventions):

1. Read `FF4_JOB_SYSTEM_1.5.sfc`.
2. For char c in 0..4, for job slot j in 0..15:
   - source = file `0xD0000 + min(j,13)*0x800` (S34n4e's shared sheet for
     that job; slots 14–15 get copies of slot 13 — harmless spares).
   - dest = `0x140000 + c*0x8000 + j*0x800`, length 0x800.
3. Additionally, if a directory `art/` contains a file named `c{c}_j{j}.bin`
   (exactly 0x800 bytes of 4bpp SNES tile data), it OVERRIDES the fallback
   copy for that slot. This is the incremental-art mechanism: spriters
   deliver per-combo files; everything else stays S34n4e's shared art.
4. Output `ff4jobs - PCJv0.01.sfc`. No code changes in this version.

**GATE 1:** Output ROM boots in the emulator and battles look 100% identical
to 1.5 (no hooks yet, so any visible difference means you wrote outside the
allowed range — STOP and diff the ROMs with `rom_compare.py` or a byte diff).

---

## Phase 2 — The battle hook (the core change)

### 2.1 New routine — 38 bytes at `$27/8000` (file 0x138000)

Assembled bytes (verify against the listing as you transcribe):

```
E2 20        SEP #$20      ; defensive: 8-bit A (entry state is 8-bit)
A5 5A        LDA $5A       ; actor/char id (loader stored byte0 & $3F here)
29 07        AND #$07      ; mask to 0-7 (Phase 0.5 verified ids are 0-4)
18           CLC
69 28        ADC #$28      ; bank = $28 + char
85 21        STA $21       ; -> DMA source bank
A9 00        LDA #$00
EB           XBA           ; clear B accumulator half
A5 5C        LDA $5C       ; job byte (0 or $A1-$AD)
29 0F        AND #$0F      ; -> job slot 0-13
0A 0A 0A     ASL A ×3      ; (slot*8) low byte
EB           XBA           ; *0x100 -> A(16) will be slot*0x800
C2 20        REP #$20      ; 16-bit A
18           CLC
69 00 80     ADC #$8000    ; offset = $8000 + slot*$800
85 1F        STA $1F       ; -> DMA source offset
A9 00 06     LDA #$0600
85 22        STA $22       ; -> DMA size (0x600, same as vanilla)
E2 20        SEP #$20      ; exit in 8-bit A, as the following code expects
6B           RTL
```

Full hex string (38 bytes, spaces cosmetic — strip them; cross-check against
the listing above byte by byte before writing):

```
E220 A55A 2907 18 6928 8521
A900 EB A55C 290F 0A0A0A EB
C220 18 690080 851F A90006 8522
E220 6B
```

(This preserves vanilla behavior in every respect except bank and index
source — same DMA size, same zero-page contract.)

### 2.2 Hook — replace 28 bytes at file `0x08DD5` ($01/8DD5)

- OLD (must verify, R3): `A9 00 EB A5 5C 0A 0A 0A EB C2 20 18 69 00 80 85 1F A9 00 06 85 22 E2 20 A9 1A 85 21`
- NEW: `22 00 80 27` (JSL $278000) followed by 24 × `EA` (NOP).

Why whole-block replacement: the JSL+NOPs cover complete instructions only —
no residual half-instructions (compare the WW v0.05 hook note about leftover
bytes; here we avoid the issue entirely).

Deliver as `patch_PCJ_v0_02.py`: input v0.01 ROM, `check()` the OLD bytes and
the empty 38 bytes at 0x138000, write routine + hook, emit ROM + IPS.

### 2.3 Numeral test (do NOT skip — this is the WW printf-for-graphics step)

Before trusting real art, make every slot self-identifying:
- Write `make_test_sheets.py`: for each (c, j) generate an 0x800-byte sheet
  that is mostly blank but has tile rows stamped with big block digits
  reading `c` and `j` (a 3×5-pixel font on 8×8 tiles is enough; color index
  1 on 0). Simplest robust approach: draw digits into a 112×48 1-bit bitmap
  in Python (14×6 tiles), then convert to 4bpp SNES planar per tile
  (plane 0 = bitmap, planes 1–3 = 0). Tile order within the sheet is
  row-major 8×8 tiles; the on-screen arrangement uses the tilemap in
  `tools/ff4/ff4j-sfc.json` (`characterGraphics.assembly.spriteSheet`), so
  digits may appear scrambled on screen — that's fine, you only need to READ
  the digits, and the first 2 tile columns map to the standing pose.
- Build a test ROM (v0.02t) with test sheets in all 80 slots.
- Emulator: battle with all 5 chars, various jobs. Each character must show
  *their own* c digit and their equipped job's j digit. Reorder the party
  and re-test (slot-vs-char trap!). Change a job in the menu, re-enter
  battle, re-test.

**GATE 2:** numeral test correct for: 5/5 characters, ≥3 different jobs,
after a party reorder, and after a job change. Log a screenshot list in
`_WIP_FF4.txt`. Then rebuild with real (fallback) data — battles must look
identical to 1.5 again (because fallback = shared art). That identity check
proves the hook computes compatible addresses end-to-end.

---

## Phase 3 — Palette decision (small, optional, do after Phase 2)

Current hack behavior (from static analysis): the battle palette index =
job byte & 0x0F — the palette copy at `$01/8E26` uses the same `$5C` the
sheet uses. Two options; ask alexj which he wants before implementing:

- **Option A (per-character colors):** 1-byte patch at file `0x08E09`:
  `A5 5C` (LDA $5C) → `A5 5A` (LDA $5A). Palette index becomes the actor id →
  palettes 0–4, the five character colorways. Depends on Phase 0.5 confirming
  actor ids are 0–4.
- **Option B (per-char-per-job palettes):** extend the Phase 2 routine to
  also load palette from a new 75×0x20 table in bank $27 — only do this if
  spriters actually want unique colors per combo; needs the copy loop at
  `$01/8E26` re-pointed. Bigger job; write a design note first.
- **Option C:** leave untouched (job-colored, S34n4e's current behavior).

**GATE 3:** whichever option: playtest that alive/KO/petrify colorings all
look right (WW v0.08 lesson: palette forces hide in status-handling paths —
check the status recolor path `$02/DA70` behavior with a petrified ally).

---

## Phase 4 — Sweep the secondary loaders

From Phase 0.6's findings plus these known sites:

- **$01/8B38 path** (in-battle re-show; pushes the job byte then
  `JMP $8FC8`): disassemble `$01/8FC8`-onward; if it recomputes a sheet
  address from `#$1A`, hook it with the same JSL (it has the same zero-page
  contract). If it merely re-queues the already-loaded VRAM, no change.
- Any Mini/Pig/Frog reload path found in 0.6: same treatment.
- Victory pose / character intro poses: covered by the 0x600 sheet load
  (poses are inside the sheet), but verify visually during GATE 2.

**GATE 4:** re-run the numeral ROM through: battle entry, taking damage,
KO + revive, row change, victory fanfare, a Mini infliction. All digits stay
correct throughout.

---

## Phase 5 — Menu job viewer (nice-to-have; time-boxed)

The menu sprite preview reads `$1A/8000,X` directly at `$20/948E` (inside
routine `$20/941C`; sheet index arrives as a stack parameter from the caller
chain around `$20/8F48`). To make the preview per-character you must find, in
the caller, where the currently-viewed character is known, and feed the bank
the same `$28+c` way — likely by patching `$20/948E`'s `LDA $1A8000,X` into a
JSL that reads a bank variable you set in the caller.

This is the fuzziest part of the plan. Time-box it. **Fallback is
acceptable:** the menu keeps showing shared art while battle shows unique
art. Ship the battle feature rather than blocking on the menu.

**GATE 5:** either the menu preview follows the character, or the fallback
decision is logged with your caller-trace notes for the next attempt.

---

## Phase 6 — Packaging

1. Final build script chain: v0.01 (data) → v0.02 (hook) → v0.03+ (palette /
   secondary loaders / menu), each script `check()`-verifying its
   predecessor, matching the WW checkpoint lineage pattern.
2. Emit one consolidated IPS against stock `FF4_JOB_SYSTEM_1.5.sfc` (code +
   pre-filled banks + any delivered art). Also emit a code-only IPS for
   S34n4e review.
3. Write `PCJ_UPGRADE_NOTES.md` in the WW_UPGRADE_NOTES.md style
   (symptom → evidence → root cause → fix → lesson per version).
4. Spriter kit: export the 15 current shared sheets as PNGs (ff6tools or
   YY-CHR both open the ROM; sheets at file 0xD0000, 4bpp), one reference
   palette PNG per character (palettes 0–4 at file 0xE7D00), the
   `c{c}_j{j}.bin` naming contract, and the 14×6 tile arrangement diagram
   from `tools/ff4/ff4j-sfc.json`. Constraint for artists: 16 colors, color 0
   transparent, and (if Option A palettes) the sheet must read correctly in
   *each* character palette it will be displayed with.

---

## Failure triage quick table (from WW experience)

| Symptom in numeral test | Likely cause | First check |
|---|---|---|
| Digits track seat, not character | slot/char confusion | `$5A` vs `$5B` in routine; Phase 0.5 data |
| Right j, wrong c (or vice versa) | mask error | `AND #$07` / `AND #$0F` operands |
| Right offsets, wrong bank's art | bank not reaching DMA | Phase 0.4 again; a bank dispatch or MVN downstream |
| Garbage tiles everywhere | routine size/state mismatch | M/X flags at exit; hook covered exactly 28 bytes? |
| Works at battle start, breaks mid-battle | second loader path | Phase 4 sweep |
| Menu wrong, battle right | expected until Phase 5 | — |
| Colors wrong only when KO'd/petrified | palette force elsewhere | WW v0.08 lesson; `$02/DA70` path |



## Handoff message

Thank you, Alex — happy to be your cowlleague on this one! 🐄 That session was a genuinely fun piece of detective work: S34n4e's item-ID trick was a treat to unravel, and it's satisfying that the WW lessons transferred so cleanly.

When you hear back from S34n4e or the spriters, the highest-value things to bring back here are: (1) his answer on the battle-palette question (job-colored vs character-colored — one sentence from him settles our only open unknown), and (2) any second sheet-loader paths he knows about (Mini/Pig/Frog). Either answer slots straight into Phase 0 of the plan.

One honest caveat to carry into the pitch conversation: the plan inherits the open palette question from yesterday's analysis (battle color follows job in the code, character in your observation). Phase 0.5 and the Option A/B/C fork in Phase 3 handle it either way, but if S34n4e answers the pitch, that's the single best question to ask him directly — he'll know in one sentence what took us a disassembler to half-answer.

Good luck with the pitch — I'll be here when the art starts landing or when it's time to run Phase 0. 🎨