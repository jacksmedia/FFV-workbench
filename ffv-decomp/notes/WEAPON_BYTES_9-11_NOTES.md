# Weapon struct bytes 9, 10, 11 — decoded

## TL;DR
Bytes 9, 10, and 11 of each 12-byte weapon record (ROM `$D10000`, 128 × 12 bytes)
are **Param1, Param2, Param3** — three generic parameters whose meaning is
**determined by byte 8 (Attack Effect)**. They are also overloaded when the
weapon's *Flags* (byte 5) enables a proc-on-hit behavior.

The ff6tools editor shows them as `Byte 9 / Byte 10 / Byte 11` because no
single semantic label fits — they are context-dependent.

## Evidence from Modoh's disassembly (`c2battle_by_Modoh.asm`)

The full 12-byte weapon record is copied into a per-character `GearStats`
buffer at `$4049 + 12*slot`. The weapon slots land at `$4085` (RHWeapon) and
`$4091` (LHWeapon). Modoh labels them:

| Weapon byte | RHWeapon addr | LHWeapon addr | Label                       |
|-------------|---------------|---------------|-----------------------------|
| 0           | `$4085`       | `$4091`       | `Targetting`                |
| 1           | `$4086`       | `$4092`       | `Category` (Attack Type)    |
| 2           | `$4087`       | `$4093`       | (Item Type + Can't Throw)   |
| 3           | `$4088`       | `$4094`       | (Element / Stat Bonus)      |
| 4           | `$4089`       | `$4095`       | (Description + Flags low)   |
| 5           | `$408A`       | `$4096`       | `Properties` (Flags high)   |
| 6           | `$408B`       | `$4097`       | `ItemMagic` (Spell Cast)    |
| 7           | `$408C`       | `$4098`       | `AtkPower`                  |
| 8           | `$408D`       | `$4099`       | `AtkType` (Attack Effect)   |
| **9**       | `$408E`       | `$409A`       | **Param1**                  |
| **10**      | `$408F`       | `$409B`       | **Param2**                  |
| **11**      | `$4090`       | `$409C`       | **Param3**                  |

When a `Fight` command fires (`$C245FF` #FightCommand), `.CopyAttackInfo` at
`$C2467E` copies the 12 weapon bytes verbatim into `AttackInfo` at `$79FC+Y`.
Later, `CopyAttackParams` at `$C2653A` loads them into the attacker's temp
scratch:

```
$C2653D: LDA $7A05,X   ; AttackInfo.Param1  -> weapon byte 9
$C26540: STA $57       ; Param1 scratch
$C26542: LDA $7A06,X   ; AttackInfo.Param2  -> weapon byte 10
$C26545: STA $58       ; Param2 scratch
$C26547: LDA $7A07,X   ; AttackInfo.Param3  -> weapon byte 11
$C2654A: STA $59       ; Param3 scratch
```

The dispatched `Attack%02X` handler (selected by byte 8 = Attack Effect) then
reads `$57`/`$58`/`$59`. Each handler assigns its own meanings.

## Known per-AttackEffect meanings (from Modoh comments)

Modoh's `%org` headers spell out the Param meanings for several effects:

| Byte 8 (Attack Effect) | Param1 (byte 9)     | Param2 (byte 10)     | Param3 (byte 11)     |
|------------------------|---------------------|----------------------|----------------------|
| 03 Magic Sword Lv.1    | MSword anim         | Element flags        | Status flags         |
| 04 Magic Sword Lv.2    | MSword anim         | Element flags        | Status flags         |
| 05 Magic Sword Lv.3    | MSword anim         | Element flags        | Status flags         |
| 06 Offensive Magic     | (unused)            | Spell Power          | Element              |
| 07 Gravity             | Hit %               | Fraction / 16        | Status 2             |
| 18 Inflict Status 1    | Status byte 1       | (hit?)               | (hit?)               |
| 19 Inflict Status 2    | Status byte 2       | ...                  | ...                  |
| 20 Inflict Status 3    | Status byte 3       | ...                  | ...                  |
| (other effect IDs)     | varies              | varies               | varies               |

A full per-effect table would be built by reading each `%sub(AttackNN)` block
between `$C26921` and `$C27FFF` in the disassembly. The pattern is always
`LDA Param1/2/3` -> effect-specific semantic.

## Additional overload: proc-on-hit weapons

When the weapon's `Properties` byte (byte 5) has certain flag bits set, Param2
and Param3 take on a second, separate meaning **in addition to** their
attack-effect role, used only by the proc dispatcher:

- **Bit 1 (`$02`) "Use Ability"** — at `$C24668`:
  ```
  CMP RHWeapon.Param2,X   ; proc chance (vs Random_0_99)
  BCS .NormalAttack
  LDA RHWeapon.Param3,X   ; proc command ID to dispatch
  JMP DispatchCommand_CommandReady
  ```
- **Bit 3 (`$08`) "Magic on Hit" / "Action on Hit"** — at `$C24707`:
  ```
  CMP RHWeapon.Param2,X   ; proc chance
  BCS .LeftHand
  LDA RHWeapon.Param3,X   ; proc spell ID to cast
  ```

So for any weapon with those flags:
- **byte 10 = proc chance (0-99)**
- **byte 11 = command ID (Use Ability) or spell ID (Action on Hit)**
- byte 9 is not read by the proc dispatcher directly.

## Suggested ff5u-sfc.json changes

The cleanest labeling is to rename the three generic slots and reference the
AttackEffect table inline where appropriate:

```json
"param1": {
    "type": "property",
    "name": "Param 1",
    "begin": 9
},
"param2": {
    "type": "property",
    "name": "Param 2 (proc chance if Use Ability / Action on Hit)",
    "begin": 10
},
"param3": {
    "type": "property",
    "name": "Param 3 (proc command/spell if Use Ability / Action on Hit)",
    "begin": 11
}
```

A richer treatment could introduce a conditional `invalid` clause so that,
when the Flags enable procs, Param2/3 switch to `attackName`- or
`battleCommandName`-backed string tables. The base rename alone already closes
the blank-label gap in the editor.

## Cross-references
- Editor definition: `tools/ff5/ff5u-sfc.json` lines 7256-7270 (`weapon9`, `weapon10`, `weapon11`).
- Weapon copy loop: `c2battle_by_Modoh.asm` `$C24675` -> `.CopyAttackInfo` at `$C2467E`.
- Param dispatch: `c2battle_by_Modoh.asm` `$C2653A` (`CopyAttackParams`).
- Per-effect Attack routines: `$C268E2` onward.
