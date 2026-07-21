# FF4 JOB SYSTEM (S34n4e) — Sprite & Palette Architecture Analysis

*Session 2026-07-06. Static forensics on FF4_JOB_SYSTEM_1.5 vs FF2US v1.1 base
(CRC32 23084FCD, MD5 27D02A4F03E172E029C9B82AC3DB79F7 — verified good).
Verified: 1.5.sfc == base + FF4_JOB_SYSTEM_1.5.ips (byte-exact), so the IPS
write-set is the complete hack. Method: IPS region clustering → address-constant
hunting → targeted disassembly diffing (tools in this directory: ips_dump.py,
find_refs.py, find_hooks.py, find_bytes.py, diffasm.py, disasm_lorom.py,
dump_pals.py, dump_items.py, apply_ips.py).*

---

## 1. Vanilla FF4 (FF2US) battle sprite & palette architecture

FF4 is **LoROM** (file offset = bank*0x8000 + (addr−0x8000); code/data addressed
as $BB/8000-$BB/FFFF). Compare FFV = HiROM. Same Square-engine lineage otherwise.

### Data
| What | SNES addr | File | Layout |
|---|---|---|---|
| Battle character sprite sheets | `$1A/8000` | 0xD0000 | 17 sheets × 0x800 bytes, 4bpp SNES, 14×6-tile arrangement (ff6tools `characterGraphics`) |
| Battle character palettes | `$1C/FD00` | 0xE7D00 | 16 palettes × 0x20 bytes (16 colors BGR555, ff6tools `characterPalette`) |
| Character records (WRAM) | `$1000 + slot*0x40` | — | 5 party slots; pointer table in ROM at `$0F/C625` |
| Job spell lists (hack) | `$14/FFA2` | 0xA7FA2 | 14 entries × 3 bytes (white/black/summon list ids) |

Sheet *n* and palette *n* are parallel arrays: 0=Cecil(DK), 1=Kain, 2=Rydia(child),
3=Tellah, 4=Edward, 5=Rosa, 6=Yang, 7=Palom, 8=Porom, 9=Cecil(Paladin), 10=Cid,
11=Rydia(adult), 12=Edge, 13=FuSoYa, 14=Golbez, 15=Anna.

### Vanilla flow (battle init, bank $01 code)
Battle party loader at **$01/8DA2** loops the 5 slots:

```
$01/8DA4  LDA $E4            ; slot 0..4
$01/8DA6  JSR $9007          ; X ← char record ptr (table $0F/C625 → $1000/$1040/…)
$01/8DAE  LDA $0000,X / AND #$3F → $5A   ; actor id
$01/8DBF  LDA $0001,X → $5C  ; VANILLA: class/graphics byte = sheet+palette index
$01/8DC4  JSR $8DD0          ; do the load (below)
```

**$01/8DD0** (per character):
- source addr = `$1A:8000 + ($5C * 0x800)` — note the *8-bit ASL×3 + XBA* trick:
  effective index = `$5C & 0x1F`, bank byte hardcoded `#$1A` at $01/8DED.
- size 0x600, VRAM dest from table at `$1E/FD73` indexed by slot → DMA queue
  (`JSR $818A / $8078`).
- palette: `X = ($5C & 0x0F)*0x20`, copies 0x20 bytes `$1C/FD00,X` →
  CGRAM staging `$FE28 + slot*0x20` ($01/8E26).

So in vanilla, **one byte (char record +$01, the class) drives sheet, palette and
spell lists**. Monsters have a separate path: per-actor palette index RAM table
`$F0A3` populated at $03/F6F5 from monster records ($2001,X AND #$1F), consumed
by the status-recolor routine $02/DA70 (also reads `$1C/FD00`). The gray
"petrify" palette comes from a fixed table at `$0E/CB00` ($02/9181).

### SNES pedagogy corner
- The 65816 does DMA to VRAM only via the S-CPU's MDMA channels during blanking;
  games therefore *queue* transfers (here via $818A/$8078) and the NMI handler
  drains the queue — same pattern as FFV's C1 vblank queue we mapped in April.
- CGRAM is 512 bytes = 16 BG + 16 OBJ palette rows; each OAM entry carries a
  3-bit palette selector. Party slot *k*'s sprites point at a fixed OBJ row, and
  the engine swaps the row *content* — that's why one 0x20-byte copy recolors a
  whole character.

---

## 2. What S34n4e changed (the "relic-slot mutation")

**Footprint**: 1,096 IPS records, 254,330 bytes, 45 regions. ROM expanded
1MB → 2MB but the expansion holds only ~7KB of code/data ($20/8000-9A24 ≈ 6.7KB,
$21/8000-81A2 = 418 bytes) — **~1MB of expansion space is free**.

### 2.1 The item-ID-as-class trick (core mechanism)
The Job goes in the old **Arms/ring equipment slot = char record offset +$32**
(slots: +$30 head, +$31 body, +$32 arms→Job, +$33/34 RH+qty, +$35/36 LH+qty).

Job items have deliberately chosen IDs **0xA1–0xAD** (Dragoon, Caller, Sage,
Bard, Ranger, Monk, BlackWz, WhiteWz, Paladin, DKnight, 0xAB=secret "??????",
Ninja, Time Wz):

- `ID & 0x0F` → job index 1–13 (palette pick, spell-list pick ×3 into $14/FFA2)
- `ID & 0x1F` → sheet index 1–13 (the loader's 8-bit shift naturally masks to 5 bits)
- empty slot (0) → index 0 = "Jobless"

**No translation table exists — the item ID *is* the class code.** The hack then
swaps the *source byte* at every relevant reader from vanilla `+$01` to `+$32`:

| Site | Change | Role |
|---|---|---|
| $01/8DBF | `LDA $0001,X` → `LDA $0032,X` | battle loader: sheet+palette index |
| $01/8B3A | `LDA $0001,Y` → `LDA $0032,Y` | battle re-show path (guards $1BC2, → $8FC8) |
| $01/AEE0 | `LDA $0001,X` → `LDA $0032,X` | battle menu: job spell lists ($14/FFA2) |
| $01/AAA7 | `LDY #$0001` → `LDY #$0032` | same swap via Y-indexed read |

Sheets 0–13 at $1A/8000 and palettes 0–13 at $1C/FD00 were redrawn wholesale
(IPS: 121KB over banks $16–$1A ending exactly at sheet 13's end 0xD7000; one
448-byte record = exactly palettes 0–13; 14/15 Golbez/Anna untouched).

New palettes 0–4 are the five character colorways (0=purple, 1=blue, 2=green,
3=tan/yellow, 4=gold/red — matching the README's "each character represents a
color"); 5–13 are the job colorways (echoing the vanilla owner of each sheet:
Dragoon→Kain-blue, Caller→Rydia-green, etc.).

### 2.2 Support code
- **Bank $20** ($20/8000+, 6.7KB): event-command extension dispatcher; a menu
  battle-sprite viewer (tile uploader $20/941C reads `$1A/8000,X` directly and
  writes VRAM $4800+ via $2116/$2118; OBJ palette row upload at $20/94AB from
  $0E/CB00); DMA-queue trampolines $2099xx that the hack rewired several
  bank-$01 call sites onto (JSL $2099DB replaces JSR $818A/$8078 pairs).
- **Bank $21** ($21/8000, 418 bytes): v1.5 "unequip all" — walks the five equip
  bytes ($1030–$1036) into inventory ($1440+). Hooked from $01/BE0B-BE56.
- **Battle engine edits**: dense in-place patch clusters at $0E/9E68–B992
  (4.4KB), $0E/E016–F372 (2.5KB), $0E/FF00–$0F/D5A8 (9.5KB, 225 records) —
  commands/algorithms per README (not yet mapped in detail; not needed for the
  sprite question).
- Menu banks $01–$03: equip-slot logic, job shop, class descriptions, etc.

### 2.3 The palette question (ONE open item)
Static reading says the *battle* loader picks palette by **job** (`$32 & 0x0F`),
while alexj's play observation (and README color-identity) says colors are locked
per **character**. Possible resolutions: (a) observation comes from field/menu
sprites (field sheets in banks $16–$19 were redrawn per character); (b) an
unfound later CGRAM overwrite. **Decisive 1-byte experiment**: at $01/8E09
(file 0x08E09) change `A5 5C` (LDA $5C) → `A5 5A` (LDA $5A = actor id): if
battle colors flip to per-character palettes 0–4, we've both answered the
question and produced the "character-colored jobs" MVP.

---

## 3. Feasibility: per-character sheets per job ("Sage Rydia ≠ Sage Tellah")

**Verdict: FEASIBLE — moderate effort, and *less* invasive than WW Phase 2.**

Why it's tractable:
1. **Space is a non-issue.** 5 chars × 14 jobs = 70 sheets × 0x800 = 143.5KB;
   ~1MB free in the already-expanded ROM (fits even 0x800-padded per-bank,
   16 sheets/bank → 5 banks, e.g. $22–$26).
2. **Single choke point (so far).** All battle sheet DMAs found flow through
   $01/8DD0, which has both inputs already in zero page: `$5A` = actor id,
   `$5C` = job byte. Replace the `index*0x800 + $1A:8000` computation with a
   JSL into expanded space that does `ptr = table[actor*14 + (job&0x0F)]`
   (24-bit pointers, 70×3 bytes = 210 bytes). The DMA queue already takes an
   arbitrary bank in $21 — no queue changes needed.
3. **Palette side is nearly free.** Keep per-character colors: 1-byte patch
   (§2.3). Or full per-(char,job) palettes: 70×0x20 = 2.2KB + same table lookup
   in the palette copy at $01/8E07.
4. **Proven pipeline.** This is exactly the WW methodology: expansion + pointer
   redirection + verifying patch scripts + IPS deliverable. Plus S34n4e himself
   built on ff6tools — our fork can grow an editor for the new sheet table.

Work items (rough order):
- [ ] **Playtest probe**: confirm current battle palette behavior (job vs char)
      — or just run the $01/8E09 experiment.
- [ ] Verify $01/8DD0 is the only battle sheet loader (victory pose? $8FC8 path
      re-uses it via $01/8B38's job-byte push — check; mid-battle reload cases).
- [ ] Patch $01/8DD0 core → JSL new selector in free expanded space (bank $22+),
      pointer table char×job.
- [ ] Same treatment for the menu viewer $20/941C (its sheet index arrives as a
      stack param — trace its caller at $20/8Fxx to add the char id).
- [ ] Sheet injection tooling (script: PNG/4bpp → expanded banks + table gen,
      following WW's pipeline), then art pass (70 sheets max; start with 1 char
      × 1 job as MVP, fall back to shared sheets for undrawn combos — the table
      makes vanilla-sharing the default, so art can land incrementally!).
- [ ] IPS + verify script + doc, per romhacking-pedagogy method.

Key risk/unknowns: unmapped battle-engine edits in $0E/$0F could contain a
second sheet-load path (e.g. Mini/Frog-style transformations — FF4 has Mini,
Pig, Frog!). Those statuses may swap sheets via another route — must check how
vanilla loads the Mini sheet before finalizing the selector hook.

---

## 4. Cross-game lesson (FFV ↔ FF4)

Same engine family, same idioms we saw in FFV: queued vblank DMA, parallel
graphics/palette arrays indexed by one class byte, LoROM vs HiROM being the
main addressing difference. The "choose your data IDs so bitmasks do the
lookup" trick (job items 0xA1–0xAD) is a classic 8-bit-era space saver worth
stealing for our own hacks: it cost S34n4e *zero* translation tables and only
four one-byte code swaps to re-source the entire class system from equipment.
