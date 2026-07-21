# Proposal: Per-Character Job Sprites for FF4 Job System

**BLUF (bottom line up front): We'd like to build — with your blessing and
ideally your feedback — an add-on patch for FF4 Job System that gives each of
the five characters their own battle sprite sheet for every job, so Sage Rydia
no longer looks like Sage Tellah. We've reverse-engineered how 1.5 assigns
sheets and palettes, we've shipped this exact kind of upgrade before on FFV,
and the numbers say it fits comfortably: 70 sheets ≈ 144 KB of art in the
~1 MB of expansion space your ROM already has free. We're recruiting spriters
now. We'd love your input, and we'll share everything back for possible
inclusion in a future official version.**

---

## What we found (so you can check our homework)

Working from `FF4_JOB_SYSTEM_1.5.ips` against clean FF2US v1.1, we mapped the
sprite path:

- Job items `0xA1–0xAD` in the arms slot (record `+$32`), with `ID & 0x0F` /
  `& 0x1F` decoding straight to job/sheet index — the no-lookup-table design
  is genuinely slick.
- The class-byte→job-byte reader swaps at `$01/8DBF`, `$01/8B3A`, `$01/AEE0`,
  `$01/AAA7`; battle sheet+palette load funneling through `$01/8DD0`
  (sheets `$1A/8000 + n×$800`, palettes `$1C/FD00 + n×$20`); your bank `$20`
  menu viewer and `$21` unequip-all helpers.

If we've misread anything — especially whether any second path loads party
battle sheets (victory poses? Mini/Pig/Frog-type statuses?) — we'd genuinely
appreciate the correction.

## What we want to build

A **layered add-on** (applies on top of 1.5, touches nothing below the
expansion except a handful of hook bytes):

1. Replace the sheet-address computation in `$01/8DD0` with a JSL into
   expansion space: `bank = base + charID`, `offset = $8000 + job × $800` —
   one 32 KB expansion bank per character holding all 15 of their job sheets
   (Jobless + 14).
2. Build banks are **pre-filled with your current shared sheets**, so any
   (character, job) combo that hasn't been drawn yet renders exactly as 1.5
   does today. Art lands incrementally; nothing ever breaks.
3. Same treatment for the menu job-sprite viewer in bank `$20`.
4. Palettes stay yours (per-character color identity preserved).

## Why us / why now

This is the same upgrade we shipped for FFV as "Wounded Wardrobe": 110
job×hero KO sprites in an expanded bank, replacing 5 shared ones — hooks,
bank-dispatch patches, palette fixes, verified build scripts, the lot. The
method (numeral test sprites, data-driven pointer search, byte-verified
checkpoint patches) transfers directly, and your architecture makes FF4 the
*easier* target: you already did the expansion and centralized the loader.

## What we're asking from you

- A thumbs-up (or a "please don't," which we'll respect).
- Sanity-check of the loader analysis above — 15 minutes of your time could
  save us a playtest campaign.
- Any constraints for a future official merge: preferred expansion bank
  range, sheet ordering, credit format.
- Optional: the character/job design notes your spriters used, so ours match.

Everything we produce — analysis docs, build scripts, IPS, art — comes back
to you, credited, for FF4 Job System to use or ignore as you see fit.

*Contact: alex (alexj) — happy to share the full technical analysis doc.*
