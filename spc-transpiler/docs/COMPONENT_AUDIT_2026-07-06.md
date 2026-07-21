# SPC Transpiler Component Audit — 2026-07-06

Symptom reported from user testing: **track assignments incorrect and
inconsistent**. Root causes found, fixed, and verified end-to-end.

## Root causes (in order of impact)

### 1. LoROM pointer math on a HiROM game (the big one)
`parsers/ff5/track-index.ts` converted the 3-byte SNES addresses in the
BGM pointer table ($043B97) with the **LoROM** formula
`((bank & 0x7F) << 15) | (addr & 0x7FFF)`. FF5 is **HiROM**: the correct
conversion is simply `snesAddr & 0x3FFFFF`.

Example with the real first pointer (bytes `E8 E5 C5` = SNES C5:E5E8):
- HiROM (correct): file `0x05E5E8` — exactly where the ffbin wiki places BGM:00
- LoROM (the bug): file `0x22E5E8` — random expanded-ROM territory

Every track therefore parsed garbage from a *different* wrong offset,
which is precisely the "incorrect and not even consistent" symptom.
The song **names** were never the problem; the **data** was.

`parsers/ff6/sequence-parser.ts` had a second variant of the same bug:
it subtracted `0x8000` from HiROM in-bank addresses, shifting every FF6
pointer by 32KB.

**Fix**: `GameInfo.mapping: 'lorom' | 'hirom'` (FF4/FFMQ = lorom,
FF5/FF6 = hirom) + shared `snesToRomOffset()` / `romOffsetToSnes()` in
`utils/bytes.ts`. All parsers now route through it.

### 2. Whole-ROM CRC32 can never match a patched ROM (the confounder)
The CRC32 database itself was correct (verified: pristine FF5 J =
`C1BC267D`, RPGe = `17444605`). But any hack changes the whole-ROM CRC,
so the working ROM (ff5c.sfc) always fell through to the fallback
detection chain — where bugs 3 and 4 lived.

**Fix**: a new detection stage between CRC and name-matching: the
**region fingerprint** — CRC32 of the 216-byte BGM pointer table itself.
Measured `9B1F9B34` across pristine J, RPGe, and two different patched
hacks (including a 4MB expansion **and** a ROM whose internal name was
changed to "FF5 Clean", which name-based detection could never catch).
See `GAME_FINGERPRINTS` in `constants/game-signatures.ts`.

### 3. The SMC header check was dead code
`(rom.length & 0x1FF) === 0x200` can never be true — a 9-bit mask maxes
out at 0x1FF. Headered ROMs were silently treated as unheadered.
**Fix**: `(rom.length % 0x8000) === 0x200`.

### 4. FF5 pattern fallback checked the wrong bank bytes
It looked for bank `0x05/0x06` in the pointer table, but FF5 pointers
store HiROM banks `0xC5/0xC6`. The pattern could never match.
**Fix**: mask to `0x45/0x46` (covers C5/C6 and mirrors) and check two
pointers instead of one.

## Data corrections (`FF5_SONG_NAMES`)
Verified entry-by-entry against the ffbin wiki (FF5_soundo.pdf), which
lists BGM ID → Japanese title → file range:

- **0x41 was missing entirely** ("Beyond the Silence", Ending 1 — the
  only song stored outside banks C5/C6, at file 0x10C800 / SNES D0:C800)
- 0x09 覇最後の闘い → "The Final Battle" (was "The Last Battle")
- 0x2D 覇王エクスデス → "Evil Lord Exdeath" (was wrongly "The Decisive Battle")
- 0x40 決戦 → "The Decisive Battle" (was wrongly "The Final Battle")
- 0x14 タイクーン円舞曲 → "Tycoon Waltz" (was "Waltz Suomi")
- 0x15/0x24 sealed-things disambiguated: 0x15 封印されしもの = "The Sealed
  Ones", 0x24 封印の書 = "Sealed Book"
- Table rewritten in ascending ID order so community diffs are readable.

## Verification (repeatable)

```
npm run verify -- <rom-path> [trackIndex]   # dump + validate all 72 tracks
npm run smoke  -- <rom-path> [trackIndex]   # full FF5→FF6 transpile of one track
```

Results 2026-07-06:
- ff5 (J) pristine → detected via CRC32, 72/72 headers valid
- ff5 RPGe → detected via CRC32, 72/72 valid
- ff5c.sfc (active hack) → detected via fingerprint, 72/72 valid,
  every offset matches the ffbin wiki table
- ff5c.sfc.bak (4MB expansion, renamed header) → detected via fingerprint
- Smoke: track 0x22 "Clash on the Big Bridge" → 2,221 events, 8 channels,
  2,598 bytes of FF6 bytecode, 30 lossy warnings (triplet quantization —
  expected, FF6 has no triplet durations)

`npm run build` and `npm run typecheck` are green (≈80 pre-existing
strict-mode errors cleaned up along the way).

## Header-structure invariant (useful for validators)
Per the FF5 song header (22 bytes), the word at +2 (load address) always
equals the channel-1 pointer at +4 — the "duplicate first entry". The
verify script uses this plus `0 < length < 0x8000` as a cheap structural
sanity check per track.

## Toward community submissions
The pieces a contributed game definition needs are now all data, not
code: `mapping`, table offsets, `trackCount`, track names, optional
whole-ROM CRCs, and a region fingerprint. Next step when ready: lift
`GAME_OFFSETS` + names + fingerprints into a JSON manifest format with a
validation pass (the verify script is already most of that validator).
