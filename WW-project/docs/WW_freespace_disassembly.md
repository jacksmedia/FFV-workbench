# Wounded Wardrobe v0.08 — Freespace Code Disassembly

**Bank:** $E8 (file offset $28xxxx)  
**Region:** $E8:5280–$E8:5331 (178 bytes; first 8 are padding)  
**Purpose:** Three routines that redirect the game's character-sprite tile copiers
to pull KO poses from the new WW art bank at $E8:0000 instead of the vanilla
single-pose block at $D4:9400.

---

## Memory Map Context

| SNES Address | File Offset | Contents |
|--------------|-------------|----------|
| $E8:0000–$E8:527F | $280000–$28527F | WW wounded art: 110 blocks × $C0 bytes (4bpp, 6 tiles each) |
| $E8:5280–$E8:5287 | $285280–$285287 | Padding (8 × $00) |
| $E8:5288–$E8:52C3 | $285288–$2852C3 | **Routine A**: Battle slot-map (v0.05, 60 bytes) |
| $E8:52C4–$E8:52CF | $2852C4–$2852CF | Padding (12 × $00) |
| $E8:52D0–$E8:52FD | $2852D0–$2852FD | **Routine B**: Menu KO hook (v0.06, 46 bytes) |
| $E8:52FE–$E8:52FF | $2852FE–$2852FF | Padding (2 × $00) |
| $E8:5300–$E8:5331 | $285300–$285331 | **Routine C**: MVN bank dispatch (v0.07, 50 bytes) |

---

## Hook Sites (in game code banks)

These five patches in the original ROM redirect execution into the freespace:

| Hook | File Offset | Bytes | Effect |
|------|-------------|-------|--------|
| Battle sprite loader | $012517 | `E2 20 22 88 52 E8 EA EA` | `SEP #$20; JSL $E85288; NOP×2` |
| Phase-1 palette force | $01B1C7 | `EA EA EA` | NOP out `LDA #$15` (battle KO palette) |
| Menu KO tile loader | $02D2BB | `22 D0 52 E8 EA×16` | `JSL $E852D0` + 16 NOPs |
| MVN bank dispatch | $02D319 | `22 00 53 E8 80 21 EA` | `JSL $E85300; BRA $D340; NOP` |
| Menu palette force | $02D47C | `EA EA` | NOP out `LDA #$15` (menu KO palette) |

---

## Routine A — Battle Slot-Map ($E8:5288)

**Called from:** C1:2517 after `SEP #$20` (8-bit A, 16-bit X/Y)  
**Entry state:** X = charID × 8 (0/8/16/24 for Bartz/Lenna/Galuf/Faris+Krile),
                 Y = party slot (0–3)  
**Exit state:** $76/$78 = 24-bit pointer to WW sprite block; A = $E8 (8-bit);
                DB = $E8; P restored  
**Purpose:** Compute `(job × 5 + hero) × $C0` and store as the source pointer
             for the DMA that copies wounded tiles into VRAM.

```asm
;─────────────────────────────────────────────────────────────────────────────
; Routine A: Battle KO sprite slot-mapper (v0.05)
; Replaces vanilla's single shared KO pose with per-hero, per-job art.
;
; Formula: block_index = job × 5 + hero   (0–109)
;          byte_offset = block_index × $C0
;          pointer     = $E8:0000 + byte_offset  →  stored in $76/$78
;─────────────────────────────────────────────────────────────────────────────

E8/5288:  08          PHP                 ; save P (caller set M=1 via SEP #$20)
E8/5289:  8B          PHB                 ; save data bank
E8/528A:  A9 7E       LDA #$7E            ; \
E8/528C:  48          PHA                 ;  | set DB = $7E (WRAM)
E8/528D:  AB          PLB                 ; /
E8/528E:  C2 20       REP #$20            ; M=0: 16-bit accumulator

;--- extract hero ID from X (charID×8 → hero 0–4) ---
E8/5290:  8A          TXA                 ; A = X = charID × 8
E8/5291:  4A          LSR                 ; ÷2
E8/5292:  4A          LSR                 ; ÷4
E8/5293:  4A          LSR                 ; ÷8 → A = hero (0–4)
E8/5294:  85 00       STA $00             ; $00 = hero

;--- read job from WRAM job table ---
E8/5296:  E2 20       SEP #$20            ; M=1: 8-bit A for table read
E8/5298:  B9 CA CF    LDA $CFCA,Y         ; A = job ID for party slot Y (0–21)
E8/529B:  85 02       STA $02             ; $02 = job (8-bit)
E8/529D:  64 03       STZ $03             ; $03 = 0 (extend to 16-bit)

;--- compute block index = job×5 + hero ---
E8/529F:  C2 20       REP #$20            ; M=0: 16-bit math
E8/52A1:  A5 02       LDA $02             ; A = job
E8/52A3:  0A          ASL                 ; ×2
E8/52A4:  0A          ASL                 ; ×4
E8/52A5:  18          CLC
E8/52A6:  65 02       ADC $02             ; +job = ×5
E8/52A8:  18          CLC
E8/52A9:  65 00       ADC $00             ; +hero = block index
E8/52AB:  85 02       STA $02             ; $02 = block index (0–109)

;--- multiply by $C0 (192): block×$C0 = block×$80 + block×$40 ---
;    $C0 = $80 + $40 = 128 + 64; use shifts + add
E8/52AD:  0A          ASL                 ; ×2
E8/52AE:  0A          ASL                 ; ×4
E8/52AF:  0A          ASL                 ; ×8
E8/52B0:  0A          ASL                 ; ×16
E8/52B1:  0A          ASL                 ; ×32
E8/52B2:  0A          ASL                 ; ×64  → A = block × $40
E8/52B3:  85 04       STA $04             ; $04 = block × $40
E8/52B5:  0A          ASL                 ; ×128 → A = block × $80
E8/52B6:  18          CLC
E8/52B7:  65 04       ADC $04             ; A = block×$80 + block×$40 = block×$C0
E8/52B9:  85 76       STA $76             ; $76 = low 16 bits of pointer

;--- store bank byte ---
E8/52BB:  E2 20       SEP #$20            ; M=1: 8-bit
E8/52BD:  A9 E8       LDA #$E8            ; bank $E8 (WW art)
E8/52BF:  85 78       STA $78             ; $78 = bank

;--- restore and return ---
E8/52C1:  AB          PLB                 ; restore DB
E8/52C2:  28          PLP                 ; restore P
E8/52C3:  6B          RTL                 ; return to C1:251B

; (12 bytes padding $00 follow)
```

---

## Routine B — Menu KO Hook ($E8:52D0)

**Called from:** C2:D2BB (after the 20-byte hook replaces the vanilla per-charID table lookup)  
**Entry state:** $EA = charID (low 3 bits), $EB = job (low 5 bits); 16-bit A (M=0)  
**Exit state:** $E0 = 16-bit offset, $E2 = $00E8 (bank); stack +1 (caller ID pushed)  
**Purpose:** Same formula as Routine A, but for the menu's wounded-tile copier at C2:D298.

```asm
;─────────────────────────────────────────────────────────────────────────────
; Routine B: Menu KO sprite offset (v0.06)
; The menu tile copier at C2:D298 uses $E0/$E2 as a 24-bit source pointer.
; Vanilla loads a 4-entry charID table; this replaces it with WW indexing.
;─────────────────────────────────────────────────────────────────────────────

E8/52D0:  08          PHP                 ; save P (M=0 at entry)

;--- push caller-ID for later stack-relative add ---
E8/52D1:  A5 EA       LDA $EA             ; A.lo = charID byte (full FieldChar byte 0)
E8/52D3:  29 07 00    AND #$0007          ; mask to hero 0–4 (bits 2:0)
E8/52D6:  48          PHA                 ; push hero onto stack

;--- job × 5 ---
E8/52D7:  A5 EB       LDA $EB             ; A = job byte
E8/52D9:  29 1F 00    AND #$001F          ; mask to job 0–21
E8/52DC:  85 E0       STA $E0             ; $E0 = job
E8/52DE:  0A          ASL                 ; ×2
E8/52DF:  0A          ASL                 ; ×4
E8/52E0:  18          CLC
E8/52E1:  65 E0       ADC $E0             ; +job = ×5
E8/52E3:  18          CLC
E8/52E4:  63 01       ADC $01,S           ; + stacked hero = block index
E8/52E6:  85 E0       STA $E0             ; $E0 = block index

;--- multiply by $C0 ---
E8/52E8:  0A          ASL                 ; ×2
E8/52E9:  0A          ASL                 ; ×4
E8/52EA:  0A          ASL                 ; ×8
E8/52EB:  0A          ASL                 ; ×16
E8/52EC:  0A          ASL                 ; ×32
E8/52ED:  0A          ASL                 ; ×64
E8/52EE:  85 E2       STA $E2             ; $E2 = block × $40 (temp)
E8/52EF:  0A          ASL                 ; ×128
E8/52F0:  18          CLC
E8/52F1:  65 E2       ADC $E2             ; A = block × $C0
E8/52F3:  85 E0       STA $E0             ; $E0 = offset (16-bit)

;--- store bank ---
E8/52F5:  A9 E8 00    LDA #$00E8          ; bank $E8 (16-bit immediate)
E8/52F8:  85 E2       STA $E2             ; $E2 = $00E8

;--- clean stack and return ---
E8/52FA:  68          PLA                 ; discard pushed hero
E8/52FB:  28          PLP                 ; restore P
E8/52FC:  6B          RTL                 ; return to C2:D2BF

; (2 bytes padding $00 follow)
```

---

## Routine C — MVN Bank Dispatch ($E8:5300)

**Called from:** C2:D319 (replaces the hardcoded bank-resolve + CMP chain)  
**Entry state:** $E2 = computed high byte of source address; $8E = bank addend
                 from earlier 24-bit add; carry valid from that add  
**Exit state:** one of four MVN instructions executed, copying tiles from the
                resolved bank ($D2/$D3/$D4/$E8) into VRAM shadow at $7E; RTL
**Purpose:** The vanilla tile copier only knows banks $D2/$D3/$D4 (walk sprites).
             WW adds bank $E8 for wounded poses; this dispatch extends the CMP
             chain to route $E8 to its own MVN.

```asm
;─────────────────────────────────────────────────────────────────────────────
; Routine C: MVN bank dispatch (v0.07)
; The 65816 MVN opcode embeds both source and dest banks as immediates, so
; different banks require different opcodes. Vanilla dispatches D2/D3/D4;
; this adds E8 for WW art.
;
; Execution flow:
;   1. Finish the bank-byte computation started at C2:D319
;   2. Compare against $E8, $D4, $D3 in order
;   3. Execute the matching MVN xx,$7E and RTL
;─────────────────────────────────────────────────────────────────────────────

E8/5300:  A5 E2       LDA $E2             ; A = partial bank byte
E8/5302:  65 8E       ADC $8E             ; A += $8E (carry from 24-bit add at hook)
E8/5304:  29 FF 00    AND #$00FF          ; mask to low byte (bank 00–FF)

;--- check for WW bank ---
E8/5307:  C9 E8 00    CMP #$00E8          ; is it bank $E8? (WW art)
E8/530A:  F0 1F       BEQ $532B           ; yes → MVN $E8,$7E

;--- vanilla banks ---
E8/530C:  C9 D4 00    CMP #$00D4          ; bank $D4? (walk set 3)
E8/530F:  F0 13       BEQ $5324           ; yes → MVN $D4,$7E

E8/5311:  C9 D3 00    CMP #$00D3          ; bank $D3? (walk set 2)
E8/5314:  F0 07       BEQ $531D           ; yes → MVN $D3,$7E

;--- default: bank $D2 ---
E8/5316:  A9 1F 00    LDA #$001F          ; A = tile count - 1 (32 tiles = $20, -1)
E8/5319:  54 7E D2    MVN $7E,$D2         ; copy from $D2:xxxx → $7E:xxxx
E8/531C:  6B          RTL

;--- bank $D3 ---
E8/531D:  A9 1F 00    LDA #$001F
E8/5320:  54 7E D3    MVN $7E,$D3
E8/5323:  6B          RTL

;--- bank $D4 ---
E8/5324:  A9 1F 00    LDA #$001F
E8/5327:  54 7E D4    MVN $7E,$D4
E8/532A:  6B          RTL

;--- bank $E8 (WW) ---
E8/532B:  A9 1F 00    LDA #$001F
E8/532E:  54 7E E8    MVN $7E,$E8         ; copy from $E8:xxxx → $7E:xxxx
E8/5331:  6B          RTL
```

---

## How the Three Routines Cooperate

```
┌─────────────────────────────────────────────────────────────────────────┐
│  BATTLE PATH (C1 bank)                                                  │
│                                                                         │
│  C1:2517  JSL $E85288        ← Routine A computes $76/$78 pointer       │
│           ...                                                           │
│  C1:B1C7  (NOPped LDA #$15)  ← palette force removed                    │
│           ...                                                           │
│  C1:xxxx  MVN copies tiles using $76/$78                                │
└─────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────┐
│  MENU PATH (C2 bank)                                                    │
│                                                                         │
│  C2:D2BB  JSL $E852D0        ← Routine B computes $E0/$E2 pointer       │
│           ...                                                           │
│  C2:D319  JSL $E85300        ← Routine C does the actual MVN by bank    │
│           ...                                                           │
│  C2:D47C  (NOPped LDA #$15)  ← palette force removed                    │
└─────────────────────────────────────────────────────────────────────────┘
```

The two palette-force NOPs (Phase-1 at $01B1C7, menu at $02D47C) are separate
from the tile logic: they prevent the game from overriding the job palette
with the Freelancer gray when a character is KO'd.

---

## Raw Bytes Reference

```
; Routine A ($285288, 60 bytes)
08 8B A9 7E 48 AB C2 20 8A 4A 4A 4A 85 00 E2 20
B9 CA CF 85 02 64 03 C2 20 A5 02 0A 0A 18 65 02
18 65 00 85 02 0A 0A 0A 0A 0A 0A 85 04 0A 18 65
04 85 76 E2 20 A9 E8 85 78 AB 28 6B

; Routine B ($2852D0, 46 bytes)
08 A5 EA 29 07 00 48 A5 EB 29 1F 00 85 E0 0A 0A
18 65 E0 18 63 01 85 E0 0A 0A 0A 0A 0A 0A 85 E2
0A 18 65 E2 85 E0 A9 E8 00 85 E2 68 28 6B

; Routine C ($285300, 50 bytes)
A5 E2 65 8E 29 FF 00 C9 E8 00 F0 1F C9 D4 00 F0
13 C9 D3 00 F0 07 A9 1F 00 54 7E D2 6B A9 1F 00
54 7E D3 6B A9 1F 00 54 7E D4 6B A9 1F 00 54 7E
E8 6B
```

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| v0.05 | 2026-07-01 | Routine A: battle slot-mapper, fixes charID-vs-slot bug |
| v0.06 | 2026-07-01 | Routine B: menu KO hook at C2:D2BB |
| v0.07 | 2026-07-03 | Routine C: MVN bank dispatch for menu path |
| v0.08 | 2026-07-03 | Menu palette NOP at $02D47C; no code-block changes |
| v0.09 | 2026-07-19 | Art update only; repair script restored code after overrun |

---

*Generated 2026-07-20 from ff5c.sfc (repaired v0.09)*
