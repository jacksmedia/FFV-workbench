"""Post-processing pass to improve event script names.

Enhancements:
  1. Add map prefix to bracket-desc names that have known map placements
  2. Resolve call() targets to named events where possible
  3. Leave dialog-based, shop, inn, and map-ref names untouched

Reads ffv_event_names_0-1939.json, writes back to the same file.
"""
import json
import re
from collections import defaultdict

CRAWLER = r"C:\Users\J4cks\Desktop\work5\crawler"

# ── Load data ──
print("Loading event names...")
with open(rf"{CRAWLER}\ffv_event_names_0-1939.json", encoding='utf-8') as f:
    ev_data = json.load(f)

print("Loading map atlas...")
with open(rf"{CRAWLER}\ffv_map_atlas.json", encoding='utf-8') as f:
    atlas_data = json.load(f)

print("Loading trigger scripts...")
with open(rf"{CRAWLER}\ffv_trigger_scripts_0-703.json", encoding='utf-8') as f:
    trigger_data = json.load(f)

print("Loading NPC switches...")
with open(rf"{CRAWLER}\ffv_npc_switches_0-921.json", encoding='utf-8') as f:
    npc_data = json.load(f)

# ── Build event-to-map index ──
event_to_maps = defaultdict(set)
for m in atlas_data['maps']:
    for et in m.get('eventTriggers', []):
        for eid in et.get('events', []):
            if eid != 0:
                event_to_maps[eid].add(m['name'])
for trig in trigger_data['triggerScripts']:
    for eid in trig.get('events', []):
        if eid != 0:
            for mp in trig.get('mapPlacements', []):
                event_to_maps[eid].add(mp['mapName'])
npc_by_id = {n['id']: n for n in npc_data['npcSwitches']}
for evt in ev_data['events']:
    eid = evt['id']
    for npc_id in evt.get('npcScripts', []):
        npc = npc_by_id.get(npc_id)
        if npc:
            for mp in npc.get('mapPlacements', []):
                event_to_maps[eid].add(mp['mapName'])

print(f"Event-to-map index: {len(event_to_maps)} events have map placements")

# ── Build event name lookup for call resolution ──
ev_names = {}
for e in ev_data['events']:
    name = e.get('name', '')
    if name and name != '[empty/unused]' and name != '[unknown]':
        ev_names[e['id']] = name

# Original 21 human-authored names (best targets for call resolution)
ORIGINAL_NAMES = {
    0: "No Event", 1: "NPC Dialog 1", 2: "NPC Dialog 2", 3: "NPC Dialog 3",
    4: "NPC Dialog 4", 5: "NPC Dialog 5", 6: "NPC Dialog 6", 7: "NPC Dialog 7",
    8: "NPC Dialog 8", 16: "Game Start", 38: "Intro", 323: "Ending",
    1407: "Restore Party HP/MP/Status",
    1792: "Piano Practice 1", 1793: "Piano Practice 2", 1794: "Piano Practice 3",
    1795: "Piano Practice 4", 1796: "Piano Practice 5", 1797: "Piano Practice 6",
    1798: "Piano Practice 7", 1799: "Piano Practice 8",
}

MAX_MAPS = 3  # Only add map prefix if event has <= this many maps
CALL_PATTERN = re.compile(r'call\((\d+)\)')


# ══════════════════════════════════════════════════════════════
# IMPROVEMENT PASSES
# ══════════════════════════════════════════════════════════════

stats = {
    'map_added': 0,
    'call_resolved': 0,
    'unchanged': 0,
    'already_good': 0,
}


def resolve_call_name(call_id):
    """Try to resolve a call target to a meaningful name."""
    # Priority 1: original human-authored names
    if call_id in ORIGINAL_NAMES:
        return ORIGINAL_NAMES[call_id]
    # Priority 2: dialog-based names (starts with quote or NPC:)
    name = ev_names.get(call_id, '')
    if name.startswith('"') or name.startswith('NPC: "'):
        # Extract just the dialog text, trimmed
        if name.startswith('"'):
            dialog = name.strip('"')[:25]
        elif name.startswith('NPC: "'):
            dialog = name[6:].strip('"')[:25]
        else:
            dialog = name[:25]
        return f'"{dialog}"'
    # Priority 3: Shop/Inn names
    if name.startswith('Shop') or name.startswith('Inn'):
        return name
    return None


def improve_bracket_name(event_id, name):
    """Improve a bracket-desc name like [call(N), event_switch].
    Returns (new_name, what_changed)."""
    if not name.startswith('['):
        return name, None

    # Skip [empty/unused] and [unknown]
    if name in ('[empty/unused]', '[unknown]'):
        return name, None

    # Skip if already has map ref like [Map Name #N]
    inner = name[1:].rstrip(']')
    if ' #' in inner and any(c.isalpha() for c in inner.split('#')[0]):
        return name, None

    changed = False
    new_inner = inner

    # Pass 1: Resolve call() targets
    calls = CALL_PATTERN.findall(inner)
    for cid_str in calls:
        cid = int(cid_str)
        resolved = resolve_call_name(cid)
        if resolved:
            new_inner = new_inner.replace(f'call({cid_str})', f'call: {resolved}', 1)
            changed = True

    # Rebuild bracket name
    new_name = f'[{new_inner}]'

    # Pass 2: Add map prefix
    maps = event_to_maps.get(event_id, set())
    if maps and len(maps) <= MAX_MAPS:
        map_name = sorted(maps)[0]
        new_name = f'{map_name} - {new_name}'
        changed = True

    if changed:
        return new_name, 'improved'
    return name, None


def improve_call_dialog_name(event_id, name):
    """Improve a call-dialog name like 'call(N): "dialog"'.
    Add map prefix if available."""
    if not name.startswith('call('):
        return name, None
    # Already has good dialog, just check for map
    maps = event_to_maps.get(event_id, set())
    if maps and len(maps) <= MAX_MAPS:
        map_name = sorted(maps)[0]
        return f'{map_name} - {name}', 'map_added'
    return name, None


# ── Process all events ──
print("\nImproving event names...")
for evt in ev_data['events']:
    eid = evt['id']
    name = evt.get('name', '')
    if not name:
        stats['unchanged'] += 1
        continue

    # Skip names that are already good (dialog, shop, inn, map-ref, NPC dialog)
    if name.startswith('"') or name.startswith('NPC: "') or name.startswith('Shop') or name.startswith('Inn'):
        stats['already_good'] += 1
        continue

    # Improve bracket-desc names
    if name.startswith('['):
        new_name, change = improve_bracket_name(eid, name)
        if change:
            evt['name'] = new_name
            if 'call: ' in new_name and new_name.split(' - ')[0] != name:
                stats['call_resolved'] += 1
                stats['map_added'] += 1
            elif 'call: ' in new_name:
                stats['call_resolved'] += 1
            else:
                stats['map_added'] += 1
        else:
            stats['unchanged'] += 1
        continue

    # Improve call-dialog names (add map prefix)
    if name.startswith('call('):
        new_name, change = improve_call_dialog_name(eid, name)
        if change:
            evt['name'] = new_name
            stats['map_added'] += 1
        else:
            stats['unchanged'] += 1
        continue

    stats['unchanged'] += 1


# ── Write back ──
print("\nWriting improved names...")
with open(rf"{CRAWLER}\ffv_event_names_0-1939.json", 'w', encoding='utf-8') as f:
    json.dump(ev_data, f, indent=2, ensure_ascii=False)

print(f"\n=== Improvement Stats ===")
print(f"  Map prefix added:    {stats['map_added']}")
print(f"  Call targets resolved:{stats['call_resolved']}")
print(f"  Already good:        {stats['already_good']}")
print(f"  Unchanged:           {stats['unchanged']}")
print(f"  Total events:        {len(ev_data['events'])}")

# Show some samples
print(f"\n=== Samples of improved names ===")
sample_count = 0
for evt in ev_data['events']:
    name = evt.get('name', '')
    eid = evt['id']
    if name.startswith('[') or name.startswith('call('):
        continue
    # Find bracket-desc with map prefix (our improvements)
    if ' - [' in name and not name.startswith('"'):
        print(f"  Event {eid:4d}: {name[:75]}")
        sample_count += 1
        if sample_count >= 10:
            break

print(f"\n=== Samples of resolved calls ===")
sample_count = 0
for evt in ev_data['events']:
    name = evt.get('name', '')
    eid = evt['id']
    if 'call: ' in name:
        print(f"  Event {eid:4d}: {name[:75]}")
        sample_count += 1
        if sample_count >= 10:
            break
