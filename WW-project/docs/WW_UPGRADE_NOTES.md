# Wounded Wardrobe — Version Upgrade Notes (v0.04 → v0.08)

*A hack for Final Fantasy V (SNES) that replaces the five generic "wounded"
sprites with 110 job-specific KO poses — every hero stays in costume, even
face-down.*

*These notes document how each version fixed the previous one's bug, written
for romhackers learning 65816 ASM. Each section follows the same arc:
**symptom → evidence → root cause → fix → lesson**. Companion files:
`scripts/patch_WW_v0_0*.py` (buildable, heavily commented) and `_WIP.txt`
(the raw chronological log).*

---

## The hack in one paragraph

FFV draws every KO'd hero with one of five generic wounded sprites stored at
`D4:9400` (192 bytes each — 6 tiles of 4bpp, one per hero, job-agnostic).
Wounded Wardrobe expands the ROM to 4MB and stores **110 sprites** (22 jobs ×
5 heroes) at `E8:0000`, laid out job-major:

```
address = E8:0000 + (job × 5 + heroID) × $C0
```

Everything else in the hack is plumbing: finding every place the game loads
the vanilla wounded sprite or forces the vanilla wounded *palette*, and
redirecting each one to the formula above. There turned out to be exactly
four such places. Versions 0.05–0.08 are the story of finding them.

**Test methodology used throughout:** before drawing final art, the 110
sprite slots were filled with *numeral tiles* — each block visibly displays
its own index. When a KO sprite appears in-game, the number on screen tells
you exactly which block the code computed. It's `printf` debugging for
graphics, and it's the reason every bug below was diagnosable from a
screenshot. Highly recommended technique.

---

## v0.04 → v0.05 — The battle loader: read the registers you already have

### Symptom

v0.04 loaded job-specific sprites, and with one particular party it looked
*almost* right — 3 of 4 heroes correct. Reordering the party scrambled which
hero got which sprite. Sprites tracked **party position**, not **hero
identity**.

### Evidence

The numeral test showed each slot receiving a block number matching its
*seat*, not its character. A "works for one formation, breaks on shuffle"
bug is a classic signature of confusing two index spaces — here, *slot*
(seat 0–3 in the party lineup) versus *charID* (Bartz=0, Lenna=1, Galuf=2,
Faris=3, Krile=4).

### Root cause

The v0.04 hook lives at `C1:2517`, inside the battle sprite loader. v0.04
assumed the X register there encoded the party slot (`slot = ((X−8)>>3)&3`)
and then read hero identity from RAM. Reading the *surrounding* code in the
Bank C1 disassembly showed both assumptions were wrong:

```
C1/24EB  Y = 0                     ; loop over party slots
C1/24EE  LDA $CFC6,Y               ; A = CHARACTER ID for slot Y ($FF = empty)
C1/2505  ASL ×3 / TAX              ; X = charID × 8  ← row into pointer matrix
C1/250B  LDA $C124A3,X → $70       ; walk-sprite base for this HERO
C1/2517  LDA $C124A7,X → $76       ; ★ KO-sprite pointer  ← our hook site
C1/2526  LDA $CFCA,Y               ; job (0-21); × $600 selects the job's art
C1/259A  PLY / INY / CPY #4 / loop
```

Three revelations:

1. **X = charID × 8**, not slot × 8. The pointer matrix at `C1:24A3` has one
   row per *hero*. (v0.04's `X−8` also underflowed for Bartz, whose charID
   is 0 → X = 0.)
2. **Y = the party slot**, still live in the register at the hook.
3. **`$7E:CFCA,Y` is the game's own slot→job table** — the very value the
   loader multiplies by `$600` to pick the walking sprites. (Confirming
   detail: the per-hero walk bases are spaced `$8400` apart = 22 jobs ×
   `$600`. When spacing math confirms a table's meaning, trust it.)

So at the hook, *both inputs we need are already in registers*. v0.04 was
reconstructing them from RAM — wrongly.

### Fix

The v0.05 routine (60 bytes at `E8:5288`) drops the RAM table entirely:

```
hero = X >> 3          ; charID, straight from the register
job  = $7E:CFCA,Y      ; the game's own per-slot job table
$76  = (job×5 + hero) × $C0
$78  = #$E8
```

The `×$C0` is done shift-and-add style: `idx×192 = idx×64 + idx×128`
(`ASL ×6`, stash, `ASL` once more, add). The `job×5` is `(job<<2)+job`.

One convention worth noting: the 8-byte hook (`SEP #$20 / JSL $E85288 /
NOP NOP`) overwrites part of the *following* instruction, leaving two
residual bytes (`24 C1` = a harmless `BIT $C1`, then `85 78` = `STA $78`).
The routine therefore deliberately exits with **A = $E8 in 8-bit mode**, so
that leftover `STA $78` harmlessly re-stores the bank byte. When a hook
can't cleanly cover whole instructions, make the leftovers work *for* you.

### Playtest result

4/4 hero/job matches, stable across party reorders. Confirmed 2026-07-01.

### Lesson

**Before hooking a routine, disassemble the whole loop around the hook
site.** The registers at your entry point were set up by nearby code for
the game's own purposes — often they already hold exactly what you need, in
a cleaner form than anything you can dig out of RAM. And beware index
spaces: "slot" and "character" are different coordinates, and a hack that
accidentally converts between them will *look* right for the one party you
tested.

---

## v0.05 → v0.06 — The menu loader: find every consumer of the data

### Symptom

Not a bug — a missing feature. Battle KO sprites were perfect, but the main
menu still drew KO'd heroes with the vanilla generic wounded sprite.

### Evidence / method

Rather than trace menu code (largely undisassembled), we searched the ROM
for the *data*. The vanilla KO art lives at `D4:9400`, so any loader must
hold a pointer containing the bytes `00 94 D4`. The whole-ROM search found
exactly **two** copies:

- `C1:24A3` — the battle matrix (already hooked in v0.05)
- `C0:EC97` — a second table, 4-byte stride, five entries `D4:9400+charID×$C0`

A second search for code referencing `EC97` found exactly **one** consumer:
`C2:D2C3`. Two tables, two consumers, both now known — the search proves
there is no third path that could sneak vanilla sprites in. That
completeness guarantee is the real payoff of data-driven search.

### The menu loader, decoded

`C2:D298` runs once per slot (loop at `C2:D240`):

```
C2/D2A9  LDA $000500,X → $EA    ; 16-bit read of FieldChar bytes 0-1:
                                ;   $EA = charID (bits 0-2) + row (bit 7)
                                ;   $EB = job byte
C2/D2AF  JSR $D2DB              ; walk ptr = base[charID] + (job&$1F)×$600
C2/D2B2  ... JSR $D304          ; copy 24 tiles (walk poses)
C2/D2BB  LDA $EA / AND #$0007   ; charID again...
C2/D2C3  LDA $C0EC97,X → $E0/$E2 ; ★ KO pointer from the table
C2/D2CF  ... JSR $D304          ; copy 6 tiles (KO pose)
```

Note what this proves in passing: the game itself masks FieldChar byte 0
with `#$07` to get the charID — so `$0500` bit-packs charID (bits 0–2) and
row (bit 7). Disassembly labels (this byte is named `CharRow` in one
disassembly) describe *one* use of a byte, not necessarily all of it.

A neat trick used here: **instruction widths prove processor state**. The
vanilla `AND #$0007` assembles as 3 bytes — that only happens when the
accumulator is 16-bit (`M=0`). We never had to run the code to know the
register width at our hook; the opcode stream itself is the evidence.

### Fix

Replace the 20 bytes at `C2:D2BB` (mask + table lookup) with
`JSL $E852D0` + 16 `NOP`s. The freespace routine (46 bytes) recomputes:

```
$E0 = ((job & $1F)×5 + (charID & $07)) × $C0
$E2 = $00E8
```

using the same masks the vanilla code uses, from the same scratch bytes
(`$EA/$EB`) the game just refreshed — which means changing jobs *inside*
the menu updates the KO sprite for free, through the vanilla refresh path.

### Playtest result

Correct hero+job sprites in the menu... loaded from the wrong *bank*. See
v0.07 — the offsets were perfect, and that precision is what made the next
diagnosis possible.

### Lesson

**Search for the data, not the code.** Pointer constants are fingerprints:
find every copy of a pointer table, then find every reader of each copy,
and you have a *provably complete* list of hook sites. This works even when
no disassembly exists for the code you're hunting.

---

## v0.06 → v0.07 — The MVN trap: some opcodes hardcode their banks

### Symptom

Menu KO tiles showed the right *offsets* but sourced from bank `$D2` (the
vanilla walking-sprite bank) instead of `$E8`. Tester's tile-viewer data:

| Hero | Job | Expected block | Observed source |
|------|-----|----------------|-----------------|
| Faris (charID 3) | 0 | 3 → `$0240` | `$12` **0240** |
| Lenna (charID 1) | 1 | 6 → `$0480` | `$12` **0480** |
| Bartz (charID 0) | 10 | 50 → `$2580` | `$12` **2580** |

Three-for-three matches on the offset with a constant wrong bank. This table is a beautiful example of how precise test data collapses a bug hunt: the offset math is *proven* correct, so only the bank plumbing is suspect.

### Root cause

The menu tile copier `C2:D304` moves tiles with **`MVN`**, the 65816 block-
move instruction — and `MVN` is peculiar: **both the source and destination
banks are encoded in the instruction itself**, as operand bytes. You cannot
parameterize an MVN's bank through a register. So Square's programmers did
the pragmatic 1992 thing — they enumerated the three banks character
graphics lived in:

```
C2/D319  LDA $E2 / ADC $8E / AND #$00FF   ; resolve bank byte
C2/D320  CMP #$00D4 / BEQ → MVN $D4,$7E
C2/D325  CMP #$00D3 / BEQ → MVN $D3,$7E
C2/D32A  LDA #$001F / MVN $D2,$7E         ; DEFAULT — the fall-through
```

Our bank `$E8` matched neither compare and fell into the `$D2` default.
Vanilla bank + our offset = exactly the observed tiles.

### Fix

The 7 bytes of bank-resolve code at `C2:D319` become `JSL $E85300 /
BRA $D340 / NOP`, and the freespace routine (50 bytes at `E8:5300`)
re-implements the dispatch with a fourth case:

```
CMP #$00E8 / BEQ → MVN $E8,$7E     ; the Wounded Wardrobe case
```

Two preservation details that make this a drop-in replacement:

- The vanilla `ADC $8E` has **no CLC** — it deliberately inherits the carry from the 24-bit source-address addition above it. `JSL` doesn't disturb flags, so the carry chain survives into our routine unchanged.
- `MVN` sets the data bank register to the destination bank (`$7E`) as a side effect; vanilla code depends on that. Our MVNs do the same, and    `RTL` → `BRA` rejoins the per-tile loop exactly where vanilla would.

Only WW code ever resolves bank `$E8`, so every other caller of the copier (walk sprites use all three vanilla branches) behaves identically.

### Playtest result

WW sprites pixel-accurate in the menu. Confirmed 2026-07-03.

### Lesson

**Know your opcode's quirks before trusting a pointer.** On the 65816, `MVN`/`MVP` bake banks into the instruction — any engine whose copy loop is MVN-based will need a dispatch patch before it can read expansion banks, no matter how correctly you set up the "pointer." When graphics land at the right offset in the wrong bank, go looking for an MVN.

---

## v0.07 → v0.08 — The palette force: parallel systems need parallel fixes

### Symptom

Menu KO sprites correct in shape but colored with palette group `$15` (Freelancer) — purple cat-ear hood on Krile, Freelancer colors on Lenna's
Monk outfit.

### Root cause

FFV builds character palettes twice, in two independent systems: the battle
path (fixed ages ago — Phase 1 of this project, `NOP` at `C1:B1C7`) and the
menu/field path at `C2:D45F`, which rebuilds the menu CGRAM shadow
(`$7E:7400 + slot×$20`) on every redraw:

```
C2/D46E  LDA $0501,X / AND #$1F   ; A = job = palette index (0-21)
C2/D475  BIT $051A,X              ; Status1: N flag = dead, V = stone
C2/D478  BVS → stone palette
C2/D47A  BPL → alive (keep job index)
C2/D47C  LDA #$15                 ; ★ dead → force Freelancer palette
C2/D47E  XBA / JSR $D492          ; copy 16 colors into the shadow
```

The satisfying part: this exact site was found and patched **months
earlier** (`patch_WW_v2.py`, "P1", April) during the original KO-palette
investigation. When the battle fix moved to the C1 approach, the v2 script
fell out of the patch lineage — the battle was covered, the menu never was.
The fix was sitting in the project's own scripts folder the whole time.

### Fix

`$02D47C`: `A9 15` → `EA EA`. With the force NOP'd, A still holds the job
palette index loaded at `C2:D471` when execution reaches the `XBA`, so the
palette copier fetches the job's colors. The alive path branched over these
bytes anyway (zero change) and the stone path branches away earlier (zero
change). Two bytes, surgical.

### Playtest result

Complete success — MVP logic achieved, 2026-07-03.

### Lesson

Two lessons. **(1) Parallel subsystems fail in parallel.** Battle and menu
each have their own sprite loader, their own tile copier, *and* their own
palette builder; a fix applied to one system tells you exactly what to go
hunting for in the other. **(2) Never delete research.** The April trace
and the shelved v2 script turned a potential multi-session hunt into a
five-minute pattern-match. A reverse-chronological work log (`_WIP.txt`)
that preserves *failed and superseded* approaches is a debugging asset, not
clutter.

---

## Final patch map (v0.08 — complete code hack, 256-byte IPS)

| File offset | SNES | Size | Purpose |
|-------------|------|------|---------|
| `$012517` | `C1:2517` | 8 | Battle hook: `SEP #$20 / JSL $E85288 / NOP×2` |
| `$01B1C7` | `C1:B1C7` | 3 | Phase 1: battle KO keeps job palette (NOP×3) |
| `$02D2BB` | `C2:D2BB` | 20 | Menu hook: `JSL $E852D0` + NOP×16 |
| `$02D319` | `C2:D319` | 7 | MVN dispatch hook: `JSL $E85300 / BRA $D340 / NOP` |
| `$02D47C` | `C2:D47C` | 2 | Menu KO keeps job palette (NOP×2) |
| `$285288` | `E8:5288` | 60 | Battle KO source: `(job×5+hero)×$C0`, bank `$E8` |
| `$2852D0` | `E8:52D0` | 46 | Menu KO source: same formula from `$EA/$EB` |
| `$285300` | `E8:5300` | 50 | MVN bank dispatch: vanilla D2/D3/D4 + new E8 case |
| `$280000` | `E8:0000` | `$5280` | **Sprite data**: 110 × 192 bytes, job-major |

Sprite art requirements: 4bpp SNES planar, 6 tiles (16×24) per pose, one
pose per (job, hero) pair, drawn to each hero's per-job palette. Ordering:
`(job × 5 + hero)`, heroes in charID order (Bartz, Lenna, Galuf, Faris,
Krile), jobs 0–21 in the game's internal job-graphics order.

## Credits & tools

Built on the shoulders of the FFV community: bank disassemblies by
**noisecross** (C1), **Modoh** (C2 battle, with named structs), **Lenophis**
and others (C0/C3/C4/E0); RPGe by **Myria, SoM2Freak, harmony7** et al.
(whose expansion-bank VWF, discovered live in this ROM, demonstrated the
E0+ bank techniques this hack also relies on); bugfix patch corpus by
**inu**. Diagnosis done without working breakpoints — static disassembly,
whole-ROM byte search, numeral test sprites, and a tile viewer.

*Doc compiled 2026-07-03. Project log: `_WIP.txt`. Build scripts:
`scripts/patch_WW_v0_05.py` … `patch_WW_v0_08.py` (each verifies the prior
version's exact bytes before writing — patches as executable documentation).*
