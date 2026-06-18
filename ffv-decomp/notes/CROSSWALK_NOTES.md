# Crosswalk Notes: Integrating Crawler JSONs into ff6tools Webapp

## Overview

We have 6 new JSON resources produced by our crawler scripts. This document maps
each resource to specific integration points in the ff6tools webapp architecture,
identifying what changes are needed in `ff5u-sfc.json` (the ROM definition) and
potentially in the JavaScript editor code.

### Our Resources
| File | Records | Coverage |
|------|---------|----------|
| `ffv_event_names_0-1939.json` | 1,940 event scripts | Named with dialog/switch cross-refs |
| `ffv_trigger_scripts_0-703.json` | 704 trigger scripts | Conditions, events, map placements |
| `ffv_npc_switches_0-921.json` | 922 NPC switches | 746 named (80%) |
| `ffv_event_switches_0-511.json` | 512 event switches | 464 named (90%) |
| `ffv_entrance_triggers_0-510.json` | 1,283 entrance triggers | Full map connectivity |
| `ffv_map_atlas.json` | 512 maps | Aggregated per-map data |

### Webapp Architecture (Quick Reference)
- **ROM definition**: `tools/ff5/ff5u-sfc.json` controls everything
- **String tables**: `"stringTable"` section at line ~9569 provides names for entities
- **Hierarchy**: `"hierarchy"` array at line ~10 controls navigator tree
- **Links**: `"link": "mapProperties[%i]"` creates clickable cross-references
- **Editors**: `"editor": "FF5Map"` on assembly types activates custom editor classes
- **parsePath()**: Universal resolver for `"stringTable"`, `"link"`, `"external"` references

---

## 1. Event Switch Names (464 new, replacing 8)

### Current State (ff5u-sfc.json line 9611)
```json
"eventSwitch": {
    "name": "Event Switch",
    "length": 512,
    "default": "Event Switch %i",
    "string": {
        "12": "Obtained Cornago Jar",
        "69": "Defeated Gilgamesh (Big Bridge)",
        "100": "Quelb Gate is Locked",
        "209": "Obtained Requiem Song",
        "273": "Obtained Love Song",
        "507": "Enable Mini-Map",
        "509": "Enable Tent/Save",
        "511": "Disable Random Battles"
    }
}
```

### Integration
**What**: Replace the 8-entry `"string"` object with all 464 named entries from
`ffv_event_switches_0-511.json`.

**How**: For each entry in our JSON where `name` is non-null, add a key/value
pair `"<id>": "<name>"` to the string table. The 8 existing human-authored
names should be preserved (they match `nameTier: "existing"` in our JSON).

**Script**: Read our JSON, iterate `eventSwitches[]`, for each where
`entry.name` exists, emit `"<entry.id>": "<entry.name>"`. Skip orphans (no name).

**Impact**: Every place in the webapp that references `stringTable: "eventSwitch"`
will now show meaningful names instead of "Event Switch 123". This includes:
- Event script opcodes at line 8911 (Change Event Switch)
- Trigger script opcodes at line 9336 (Check Event Switch)
- Navigator list "Event Switches" (line 57)

**No JS changes needed.** This is purely a JSON string table expansion.

---

## 2. NPC Switch Names (746 named, replacing 298)

### Current State (ff5u-sfc.json line 9732)
```json
"npcSwitch": {
    "name": "NPC Switch",
    "length": 922,
    "default": "NPC Switch %i",
    "string": {
        "8": "Pyramid of Moore - First Tablet",
        "9": "Castle Tycoon - King's Journal",
        ...  // 298 existing entries
    }
}
```

### Integration
**What**: Merge our 448 new auto-generated names into the existing 298 entries.
Our JSON marks `nameTier: "existing"` for the 298 originals, so they are
preserved exactly as-is.

**How**: For each entry in `ffv_npc_switches_0-921.json` where `nameTier` is NOT
"existing" and NOT "orphan" and `name` exists, add it to the string table.
Existing entries (298) remain untouched.

**Impact**: Same places that reference `stringTable: "npcSwitch"`:
- NPC Properties → Event field (line 6331)
- npcScript stringTable (line 6504, delegates to "npcSwitch")
- Event script opcode "Change NPC Switch" (line 8260)
- Navigator list "NPC Switches" (line 53)

**No JS changes needed.** Pure string table expansion.

---

## 3. Event Script Names (1,940 scripts, replacing 16)

### Current State (ff5u-sfc.json line 2389)
```json
"stringTable": {
    "name": "Event Script",
    "length": 2910,
    "default": "Event %i",
    "string": {
        "0": "No Event",
        "1": "NPC Dialog 1",
        ...  // 16 entries total
    }
}
```

### Integration
**What**: Inject all 1,940 event names from `ffv_event_names_0-1939.json`.

**How**: For each event in our JSON, add `"<id>": "<name>"` to the string table.
Preserve the 16 existing entries (or let ours override if more descriptive — the
existing "NPC Dialog 1..8" map to events 1-8 which our JSON names with actual
dialog text).

**Decision needed**: Our names use dialog snippets like `"Galuf: This is it!"`.
The existing webapp convention uses short descriptive names like "Piano Practice 1".
Both styles work; our names are more informative. We could:
  - (A) Use our names for all 1,940 events, overriding the 16 originals
  - (B) Keep the 16 originals, add our names for the remaining 1,924
  - (C) Curate: keep the original 16 for named events 0-8/16/38/323/1407/1792-1799,
    add ours for everything else

**Impact**: Affects everywhere `stringTable: "eventScript"` is referenced:
- Event script navigator listing (line 42)
- Event script opcode "Execute Event" references (line 8018)
- Trigger script → execute event references
- The FF5Script delegate descriptions

**No JS changes needed.** String table only.

---

## 4. Trigger Script Names (704 scripts, replacing 3)

### Current State (ff5u-sfc.json line 7123)
```json
"stringTable": {
    "name": "Trigger Script",
    "length": 704,
    "default": "Trigger Event %i",
    "string": {
        "17": "Tent",
        "18": "Cabin",
        "255": "Save Point"
    }
}
```

### Integration
**What**: Generate names for trigger scripts from `ffv_trigger_scripts_0-703.json`
cross-reference data. Unlike the other resources, our trigger JSON doesn't
include pre-generated names — it has raw conditions, events, and map placements.
We'd need a naming pass similar to what we did for event switches.

**Naming strategy**: Use map placements + executed events to build names:
- If trigger has 1 map and 1 event: `"<mapName> - <eventName>"`
- If trigger has switch checks: include the switch context
- If trigger has button press: `"<mapName> (button press)"`

**Alternatively**: For a quick first pass, use the map placement alone:
- Trigger 1 placed at Crescent (23,42): `"Crescent - Event 127/129"`

**Impact**: Trigger script names appear in:
- Event Triggers → Event field (line 2451)
- Navigator list "Trigger Script" (line 51)
- FF5Map editor trigger overlay

**Effort**: Low — requires a new naming script (similar to name_event_switches.py).

---

## 5. Map Atlas Data (512 maps — enriching mapProperties)

### Current State
`mapProperties` (line 3990) has 512 entries with raw ROM fields: tileset, song,
battle background, color math, graphics, parallax. No per-map summary of NPCs,
triggers, treasures, or connections.

### Integration Options

#### 5a. Battle Group + Probability (from map atlas)
The existing definition has `battleGroupDungeon` at `$D08000` (line ~3726) and
`battleGroupRandom` but they're defined as separate top-level arrays, not linked
per-map. Our atlas pre-computes `battleGroupId` and `battleProbability` per map.

**How**: Add properties to `mapProperties.assembly`:
```json
"battleGroup": {
    "type": "property",
    "name": "Battle Group",
    "begin": 24,
    "mask": "0xFFFF",
    "link": "battleGroupDungeon[%i]",
    "stringTable": "battleGroupDungeon"
}
```
This may already partially exist. Verify against the full mapProperties assembly.

#### 5b. Treasure Counts (from map atlas)
Our atlas computes per-map treasure lists. The webapp already has treasure data
at `$D13000` but it may not be linked per-map.

**How**: The treasure system uses a pointer table by map index. Check if
`mapProperties` already has a linked treasure view. If not, add a computed
count or link.

#### 5c. NPC/Trigger/Entrance Counts (informational)
These are useful for at-a-glance map browsing but are computed aggregates,
not ROM data. The webapp pattern typically displays ROM-backed properties.
These could be added as read-only computed fields or shown via a custom
editor panel.

**JS changes possibly needed**: A custom "Map Summary" panel extending
FF5Map could display aggregate counts. But the simplest first step is
ensuring the per-map data views (NPCs, triggers, entrances) all have
proper names and links.

---

## 6. Entrance Triggers (already fully defined)

### Current State (ff5u-sfc.json line 2208)
The `entranceTriggers` definition is **already complete** in the JSON. It has
the correct ROM range, field parsing, and even `"link": "mapProperties[%i]"`
on the destination map field.

### Integration
**No changes needed for the definition itself.** The entrance triggers are
already properly parsed by the webapp.

**Enhancement opportunity**: Our `ffv_entrance_triggers_0-510.json` includes
`destMapName` strings that could improve readability, but the webapp already
resolves these via `stringTable: "mapProperties"` + `link: "mapProperties[%i]"`.

---

## Implementation Plan

### Phase 1: String Table Injection (Zero JS changes)
This is the highest-impact, lowest-effort work. Modify only `ff5u-sfc.json`:

1. **Event Switch names**: Replace 8 entries → 464 entries
2. **NPC Switch names**: Add 448 entries to existing 298 → 746 total
3. **Event Script names**: Add ~1,924 entries to existing 16 → ~1,940 total
4. **Trigger Script names**: Generate names + add ~600 entries to existing 3

**Tool**: Write a Python script `inject_string_tables.py` that:
- Reads our 4 JSON resources
- Reads the current `ff5u-sfc.json`
- Merges names into the appropriate `stringTable.*.string` objects
- Writes an updated `ff5u-sfc.json`

**Validation**: Load the modified JSON in the webapp, verify that the navigator
shows named entries and that clicking through event/trigger/NPC references shows
proper names.

### Phase 2: Cross-Reference Links (Minor JSON changes)
Add `"link"` properties where they don't exist yet:

1. **Event switches → setter events**: Currently no link from the Event Switch
   string table entries to the events that set them. Could add a `"link"` to
   the eventSwitch property pointing to eventScript.

2. **Trigger scripts → map context**: The event trigger → trigger script link
   exists (line 2450-2451). But there's no reverse link from trigger scripts
   showing which maps they're placed on.

3. **NPC switches → map context**: The npcProperties → npcSwitch link exists
   (line 6330-6331). No reverse link needed since the navigator already
   shows NPC switches under Event.

### Phase 3: Navigator Hierarchy Enhancements (JSON only)
Add new navigator groupings leveraging our data:

```json
{
    "name": "Cross-Reference",
    "list": [
        { "name": "Event Switches", "path": "stringTable.eventSwitch" },
        { "name": "NPC Switches", "path": "stringTable.npcSwitch" },
        { "name": "Map Atlas", "path": "mapProperties" }
    ]
}
```

This could also reorganize the existing Event hierarchy to make the newly-named
resources more prominent.

### Phase 4: Custom Editor Features (JS changes)
For power-user features that go beyond naming:

1. **Map Atlas Panel**: Extend FF5Map to show a summary sidebar:
   - NPC count, trigger count, entrance count, treasure count
   - Linked battle group with encounter table
   - Incoming/outgoing map connections

2. **Event Switch Cross-Reference View**: A new editor type that shows,
   for a given event switch, all events that set it and all triggers/NPCs
   that check it. Our JSON has this data; the webapp would need a new
   editor class to render it.

3. **Map Connectivity Graph**: Using entrance trigger data to visualize
   the dungeon/overworld connection graph. This would be a significant
   new feature requiring a custom editor.

---

## Field Mapping Reference

### Our JSON → ff5u-sfc.json String Table Keys

| Our JSON file | Target string table key | Current entries | After merge |
|---------------|------------------------|-----------------|-------------|
| ffv_event_switches_0-511.json | `eventSwitch` | 8 | 464 |
| ffv_npc_switches_0-921.json | `npcSwitch` | 298 | 746 |
| ffv_event_names_0-1939.json | `eventScript` (under eventScript def) | 16 | ~1,940 |
| ffv_trigger_scripts_0-703.json | `triggerScript` (under triggerScript def) | 3 | ~600 |

### Where String Tables Are Consumed

| String table | Referenced by | Context |
|-------------|---------------|---------|
| `eventSwitch` | Event script opcode `changeEventSwitch` | Shows switch name when viewing event bytecode |
| `eventSwitch` | Trigger script opcode `checkEventSwitch` | Shows switch name in trigger conditions |
| `npcSwitch` | `npcProperties[].event` | Shows NPC's script name in map editor |
| `npcSwitch` | `npcScript` stringTable | Names NPC scripts in navigator |
| `npcSwitch` | Event opcode `npcSwitch` | Shows switch name when toggling NPC visibility |
| `eventScript` | Event opcode `executeEvent` | Shows target event name in bytecode |
| `eventScript` | Navigator listing | Names events in the Event Script list |
| `triggerScript` | `eventTriggers[].event` | Shows trigger name on map |
| `triggerScript` | Navigator listing | Names trigger scripts in the Trigger Script list |

### Key Definition Locations in ff5u-sfc.json

| Definition | Line | ROM Range |
|-----------|------|-----------|
| `hierarchy` (navigator tree) | 10 | N/A |
| `eventScript` (array def) | 2372 | $C849DC-$C9FF9C |
| `entranceTriggers` (array def) | 2208 | $CE3AC0-$CE58D2 |
| `eventTriggers` (array def) | 2418 | $CE2800-$CE3660 |
| `npcProperties` (array def) | 6311 | $CE5DC2-$CE9BFE |
| `npcScript` (array def) | 6490 | $CE0740-$CE2294 |
| `triggerScript` (array def) | 7109 | $D8E600-$D8FFA8 |
| `mapProperties` (array def) | 3990 | $CE9C00 (26B each) |
| `stringTable` section | 9569 | N/A (naming data) |
| Event encoding (opcodes) | 7269 | N/A |
| Trigger encoding (opcodes) | 9283 | N/A |

---

## Summary

The highest-value, lowest-risk integration is **Phase 1: String Table Injection**.
By merging our named entries into the 4 string tables in `ff5u-sfc.json`, we
immediately upgrade every view in the webapp that references events, triggers,
NPC switches, or event switches — with zero JavaScript changes. This is the
recommended first step.

Phase 2-4 offer progressively richer features but require increasing effort.
Phase 2 (cross-reference links) is still JSON-only. Phase 3 (navigator
hierarchy) is JSON-only. Phase 4 (custom editors) requires JavaScript.
