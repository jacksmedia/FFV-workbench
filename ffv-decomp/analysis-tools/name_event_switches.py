"""Name all 512 Event Switches by cross-referencing four data sources:
  1. Events that SET/CLEAR each switch (from event_names JSON)
  2. Trigger scripts that CHECK each switch (from trigger_scripts JSON)
  3. NPC scripts that CHECK each switch (from npc_switches JSON)
  4. Map atlas for setter-event-to-map resolution (from map_atlas JSON)
Plus 8 existing human-authored names from ff6tools."""
import json
from collections import defaultdict

# ── Original 8 human-authored names from ff6tools (hardcoded to avoid
#    reading back our own injected names from the modified ff5u-sfc.json) ──
EXISTING_NAMES = {
    12: "Obtained Cornago Jar",
    69: "Defeated Gilgamesh (Big Bridge)",
    100: "Quelb Gate is Locked",
    209: "Obtained Requiem Song",
    273: "Obtained Love Song",
    507: "Enable Mini-Map",
    509: "Enable Tent/Save",
    511: "Disable Random Battles",
}

# ── Load event names + switch modifications ──
with open(r"C:\Users\J4cks\Desktop\work5\crawler\ffv_event_names_0-1939.json", encoding='utf-8') as f:
    event_data = json.load(f)
print(f"Loaded {len(event_data['events'])} events")

# ── Load trigger scripts + switch checks ──
with open(r"C:\Users\J4cks\Desktop\work5\crawler\ffv_trigger_scripts_0-703.json", encoding='utf-8') as f:
    trigger_data = json.load(f)
print(f"Loaded {len(trigger_data['triggerScripts'])} trigger scripts")

# ── Load NPC switches + switch checks ──
with open(r"C:\Users\J4cks\Desktop\work5\crawler\ffv_npc_switches_0-921.json", encoding='utf-8') as f:
    npc_data = json.load(f)
print(f"Loaded {len(npc_data['npcSwitches'])} NPC switches")

# ── Load map atlas for event-to-map resolution ──
with open(r"C:\Users\J4cks\Desktop\work5\crawler\ffv_map_atlas.json", encoding='utf-8') as f:
    atlas_data = json.load(f)
print(f"Loaded {len(atlas_data['maps'])} maps from atlas")

NUM_SWITCHES = 512

# ══════════════════════════════════════════════════════════════
# BUILD CROSS-REFERENCE INDICES
# ══════════════════════════════════════════════════════════════

# event_id -> set of map names where this event is placed as a trigger
# This tells us WHERE an event actually runs (setter location)
event_id_to_maps = defaultdict(set)
for m in atlas_data['maps']:
    for et in m.get('eventTriggers', []):
        for eid in et.get('events', []):
            if eid != 0:
                event_id_to_maps[eid].add(m['name'])
# Also add maps from trigger script placements
for trig in trigger_data['triggerScripts']:
    for eid in trig.get('events', []):
        if eid != 0:
            for mp in trig.get('mapPlacements', []):
                event_id_to_maps[eid].add(mp['mapName'])
# Also add maps from NPC script callers: event.npcScripts[] -> npc.mapPlacements[]
# This resolves subroutine-style events that are called by NPCs, not placed on maps directly
npc_by_id = {n['id']: n for n in npc_data['npcSwitches']}
for evt in event_data['events']:
    eid = evt['id']
    if eid == 0:
        continue
    for npc_id in evt.get('npcScripts', []):
        npc = npc_by_id.get(npc_id)
        if npc:
            for mp in npc.get('mapPlacements', []):
                event_id_to_maps[eid].add(mp['mapName'])

print(f"Built event-to-map index: {len(event_id_to_maps)} events have map placements")

# switch_id -> list of {event_id, event_name, state} for events that SET/CLEAR it
switch_setters = defaultdict(list)
for evt in event_data['events']:
    if 'eventSwitches' not in evt:
        continue
    for sw in evt['eventSwitches']:
        switch_setters[sw['id']].append({
            'eventId': evt['id'],
            'eventName': evt['name'],
            'state': sw['state'],  # "ON" or "OFF"
        })

# switch_id -> list of {triggerId, maps[], events[], condition}
switch_trigger_checks = defaultdict(list)
for trig in trigger_data['triggerScripts']:
    if 'eventSwitches' not in trig:
        continue
    maps = trig.get('mapPlacements', [])
    trig_events = trig.get('events', [])
    for sw in trig['eventSwitches']:
        switch_trigger_checks[sw['id']].append({
            'triggerId': trig['id'],
            'triggerName': trig.get('name'),
            'condition': sw['condition'],  # "checkON" or "checkOFF"
            'maps': [{'mapId': m['mapId'], 'mapName': m['mapName']} for m in maps[:5]],
            'events': trig_events[:3],
        })

# switch_id -> list of {npcId, npcName, condition}
switch_npc_checks = defaultdict(list)
for npc in npc_data['npcSwitches']:
    if 'eventSwitchChecks' not in npc:
        continue
    for sw in npc['eventSwitchChecks']:
        switch_npc_checks[sw['id']].append({
            'npcId': npc['id'],
            'npcName': npc.get('name'),
            'condition': sw['condition'],
        })


# ══════════════════════════════════════════════════════════════
# NAMING LOGIC
# ══════════════════════════════════════════════════════════════

def extract_dialog_snippet(event_name, max_len=40):
    """Extract the dialog text from an event name like '"Galuf: This is it!"' or 'NPC: "hello"'."""
    if not event_name:
        return None
    # Direct dialog
    if event_name.startswith('"'):
        return event_name.strip('"')[:max_len]
    # NPC dialog
    if event_name.startswith('NPC: "'):
        return event_name[6:].strip('"')[:max_len]
    # Subroutine dialog
    if '": "' in event_name:
        idx = event_name.index('": "')
        return event_name[idx+3:].strip('"')[:max_len]
    if event_name.startswith('call(') and '": "' not in event_name and '"' in event_name:
        idx = event_name.index('"')
        return event_name[idx:].strip('"')[:max_len]
    return None


MAX_MAPS_PER_EVENT = 3  # If a setter event runs on more maps than this, it's a
                        # shared subroutine (Inn, Piano, etc.) — skip its maps
                        # to avoid misleading single-map attributions.

GLOBAL_FLAG_THRESHOLD = 5  # If a switch has more total unique setter maps than
                           # this (across all non-subroutine events), it's a
                           # "global flag" and shouldn't be pinned to any map.

def get_setter_maps(setters, state_filter='ON'):
    """Get map names where setter events run, using the event-to-map index.
    This is the PRIMARY map source — it tells us WHERE the switch is set.
    Events placed on too many maps (shared subroutines) are excluded.
    Returns (maps, has_multi_map_setter) — the flag is True if any setter
    was a multi-map subroutine, meaning checker maps should also be skipped."""
    seen = set()
    maps = []
    has_multi_map_setter = False
    for s in setters:
        if s['state'] != state_filter:
            continue
        evt_maps = event_id_to_maps.get(s['eventId'], set())
        if len(evt_maps) > MAX_MAPS_PER_EVENT:
            has_multi_map_setter = True
            continue  # shared subroutine, skip
        for map_name in sorted(evt_maps):
            if map_name not in seen:
                seen.add(map_name)
                maps.append(map_name)
    return maps, has_multi_map_setter


def get_checker_maps_from_triggers(trigger_checks):
    """Get unique map names from trigger checks for this switch.
    This is the SECONDARY map source — where the switch is checked."""
    seen = set()
    maps = []
    for tc in trigger_checks:
        for m in tc['maps']:
            if m['mapName'] not in seen:
                seen.add(m['mapName'])
                maps.append(m['mapName'])
    return maps


def get_checker_maps_from_npcs(npc_checks):
    """Get map context from NPC names like 'Tule - NPC 1'.
    This is the TERTIARY map source."""
    maps = set()
    for nc in npc_checks:
        name = nc.get('npcName', '')
        if name and ' - ' in name:
            location = name.split(' - ')[0]
            maps.add(location)
    return sorted(maps)


def get_setter_events_with_dialog(setters):
    """Find setter events that have dialog text in their names.
    Includes each event's own map placement for proper pairing."""
    results = []
    for s in setters:
        dialog = extract_dialog_snippet(s['eventName'])
        if dialog and len(dialog) > 3:
            evt_maps = event_id_to_maps.get(s['eventId'], set())
            evt_map = sorted(evt_maps)[0] if len(evt_maps) <= MAX_MAPS_PER_EVENT and evt_maps else None
            results.append({
                'eventId': s['eventId'],
                'state': s['state'],
                'dialog': dialog,
                'fullName': s['eventName'],
                'map': evt_map,  # map where THIS event runs (not another setter)
            })
    return results


def get_npc_names_gated(npc_checks):
    """Get informative NPC names that this switch gates."""
    names = []
    for nc in npc_checks:
        name = nc.get('npcName')
        if name and name != '(unnamed)' and 'NPC' not in name.split(' - ')[-1] if ' - ' in name else True:
            names.append(name)
    return names[:5]


def name_event_switch(switch_id, setters, trigger_checks, npc_checks):
    """Generate a name for an event switch from cross-reference data.
    Returns (name, tier, reasoning)."""

    # Tier 1: Existing human-authored name
    if switch_id in EXISTING_NAMES:
        return EXISTING_NAMES[switch_id], 'existing', 'ff6tools stringTable'

    # Gather evidence
    setter_dialogs = get_setter_events_with_dialog(setters)
    gated_npcs = get_npc_names_gated(npc_checks)

    # Map sources: setter maps are WHERE the switch is set (highest trust).
    # Checker maps are where it's checked — only used as fallback when there's
    # a single unique checker location (high confidence), or for map-only tier.
    setter_maps, is_subroutine = get_setter_maps(setters, 'ON')
    checker_trigger_maps = get_checker_maps_from_triggers(trigger_checks)
    checker_npc_maps = get_checker_maps_from_npcs(npc_checks)
    all_checker_maps = list(dict.fromkeys(checker_trigger_maps + checker_npc_maps))
    # Single-checker fallback: only trust checker maps if they all agree AND
    # the setter isn't a multi-map subroutine (where checkers are unrelated locations)
    if is_subroutine:
        single_checker_map = None  # subroutine switch — checker maps are unreliable
    else:
        single_checker_map = all_checker_maps[0] if len(set(all_checker_maps)) == 1 else None

    # Global flag detection: if this switch is set by non-subroutine events
    # across many different maps, it's a game-wide flag (inventory full, story
    # progression, etc.) and shouldn't be pinned to any single map.
    is_global = len(setter_maps) > GLOBAL_FLAG_THRESHOLD

    # Classify setters
    on_setters = [s for s in setters if s['state'] == 'ON']
    off_setters = [s for s in setters if s['state'] == 'OFF']
    on_dialogs = [d for d in setter_dialogs if d['state'] == 'ON']

    # Tier 2: ON setter with dialog
    if on_dialogs:
        # Prefer a dialog event that has its own map
        d_with_map = next((d for d in on_dialogs if d['map']), None)
        d_no_map = on_dialogs[0]

        # Global flag — use dialog only, no map prefix
        if is_global:
            d = d_with_map or d_no_map
            dialog = d['dialog'][:45]
            name = f'"{dialog}"'
            return name, 'global-dialog', f'global flag ({len(setter_maps)} setter maps), event {d["eventId"]}'

        # Normal: pair dialog + map from the SAME event
        if d_with_map:
            d = d_with_map
            loc = d['map']
            dialog = d['dialog'][:35]
            name = f'{loc} - "{dialog}"'
            tier = 'setter-dialog' if len(on_setters) == 1 else 'setter-dialog+map'
            return name, tier, f'ON setter event {d["eventId"]} on {loc}'
        # No dialog event has a map — try single-checker fallback
        if single_checker_map:
            d = d_no_map
            dialog = d['dialog'][:35]
            name = f'{single_checker_map} - "{dialog}"'
            return name, 'setter-dialog+map', f'ON setter event {d["eventId"]}, checker map {single_checker_map}'
        # No map at all — use event name only
        d = d_no_map
        evt_name = d['fullName']
        if evt_name and not evt_name.startswith('"'):
            name = evt_name[:55]
        else:
            dialog = d['dialog'][:35]
            name = f'event {d["eventId"]}: "{dialog}"'
        return name, 'setter-dialog', f'ON setter event {d["eventId"]}, no reliable map'

    # Tier 3: Named NPCs gated by this switch
    if gated_npcs:
        npc_desc = gated_npcs[0]
        name = f'{npc_desc} (gated)'
        return name, 'npc-gated', f'NPC {npc_checks[0]["npcId"]} gated'

    # Tier 6: ON setter event name (non-dialog) + setter map
    if on_setters and setter_maps:
        evt = on_setters[0]
        evt_name = evt['eventName']
        if is_global:
            # Global flag without dialog — use event description, no map
            if evt_name and evt_name not in ('[empty/unused]', '[unknown]'):
                name = f'event {evt["eventId"]}: {evt_name[:40]}'
            else:
                name = f'set by event {evt["eventId"]}'
            return name, 'global-nodialog', f'global flag ({len(setter_maps)} maps), event {evt["eventId"]}'
        loc = setter_maps[0]
        if evt_name.startswith('[') and evt_name.endswith(']'):
            name = f'{loc} - {evt_name}'
        elif evt_name.startswith('Shop') or evt_name.startswith('Inn'):
            name = f'{loc} - {evt_name}'
        else:
            name = f'{loc} - event {evt["eventId"]}'
        return name, 'setter+map', f'event {evt["eventId"]} on {loc}'

    # Tier 7: ON setter event name (non-dialog) + single-checker map
    if on_setters and single_checker_map:
        evt = on_setters[0]
        evt_name = evt['eventName']
        if evt_name.startswith('[') and evt_name.endswith(']'):
            name = f'{single_checker_map} - {evt_name}'
        elif evt_name.startswith('Shop') or evt_name.startswith('Inn'):
            name = f'{single_checker_map} - {evt_name}'
        else:
            name = f'{single_checker_map} - event {evt["eventId"]}'
        return name, 'setter+map', f'event {evt["eventId"]}, checker map {single_checker_map}'

    # Tier 8: ON setter event name (non-dialog), no map
    if on_setters:
        evt = on_setters[0]
        evt_name = evt['eventName']
        if evt_name and evt_name not in ('[empty/unused]', '[unknown]'):
            name = f'event {evt["eventId"]}: {evt_name[:40]}'
            return name, 'setter-only', f'event {evt["eventId"]}'
        else:
            name = f'set by event {evt["eventId"]}'
            return name, 'setter-only', f'event {evt["eventId"]}'

    # Tier 9: Map context only (from checker maps — no setter data at all)
    if all_checker_maps:
        if len(all_checker_maps) == 1:
            name = f'{all_checker_maps[0]} - progress flag'
        else:
            name = f'{all_checker_maps[0]} / {all_checker_maps[1]} - progress flag'
        return name, 'map-only', f'maps: {all_checker_maps[:3]}'

    # Tier 10: Only OFF setters (reset/cleanup switches)
    if off_setters:
        evt = off_setters[0]
        name = f'cleared by event {evt["eventId"]}'
        return name, 'clear-only', f'{len(off_setters)} OFF setters'

    # Tier 11: Only checked by triggers/NPCs but never set
    if trigger_checks or npc_checks:
        if trigger_checks:
            tc = trigger_checks[0]
            if tc['maps']:
                name = f'{tc["maps"][0]["mapName"]} - checked (never set?)'
            else:
                name = f'trigger {tc["triggerId"]} checks this'
            return name, 'check-only', 'checked but never set in events'
        if npc_checks:
            nc = npc_checks[0]
            npc_name = nc.get('npcName', f'NPC {nc["npcId"]}')
            name = f'{npc_name} checks this'
            return name, 'check-only', 'checked by NPC but never set'

    # Tier 12: No data
    return None, 'orphan', 'no cross-references found'


# ══════════════════════════════════════════════════════════════
# MAIN
# ══════════════════════════════════════════════════════════════

def main():
    print("\nNaming event switches...")
    json_entries = []
    tier_counts = defaultdict(int)

    for sw_id in range(NUM_SWITCHES):
        setters = switch_setters.get(sw_id, [])
        trig_checks = switch_trigger_checks.get(sw_id, [])
        npc_checks = switch_npc_checks.get(sw_id, [])

        name, tier, reasoning = name_event_switch(sw_id, setters, trig_checks, npc_checks)
        tier_counts[tier] += 1

        entry = {
            'id': sw_id,
            'nameTier': tier,
        }
        if name:
            entry['name'] = name

        # Cross-reference data: who sets it
        if setters:
            # Deduplicate and summarize
            on_evts = sorted(set(s['eventId'] for s in setters if s['state'] == 'ON'))
            off_evts = sorted(set(s['eventId'] for s in setters if s['state'] == 'OFF'))
            if on_evts:
                entry['setOnBy'] = on_evts
            if off_evts:
                entry['setOffBy'] = off_evts

        # Cross-reference: who checks it (triggers)
        if trig_checks:
            trig_summary = []
            seen_tids = set()
            for tc in trig_checks:
                if tc['triggerId'] in seen_tids:
                    continue
                seen_tids.add(tc['triggerId'])
                t_entry = {
                    'triggerId': tc['triggerId'],
                    'condition': tc['condition'],
                }
                if tc['maps']:
                    t_entry['maps'] = [m['mapName'] for m in tc['maps'][:3]]
                if tc['events']:
                    t_entry['triggeredEvents'] = tc['events'][:3]
                trig_summary.append(t_entry)
            entry['checkedByTriggers'] = trig_summary[:10]

        # Cross-reference: who checks it (NPCs)
        if npc_checks:
            npc_summary = []
            seen_nids = set()
            for nc in npc_checks:
                if nc['npcId'] in seen_nids:
                    continue
                seen_nids.add(nc['npcId'])
                n_entry = {
                    'npcId': nc['npcId'],
                    'condition': nc['condition'],
                }
                if nc.get('npcName'):
                    n_entry['npcName'] = nc['npcName']
                npc_summary.append(n_entry)
            entry['checkedByNPCs'] = npc_summary[:10]

        json_entries.append(entry)

    # ── Write JSON ──
    output = {
        'game': 'FFV',
        'version': 'RPGe',
        'eventSwitchCount': NUM_SWITCHES,
        'namingTiers': {
            'existing': 'Human-authored name from ff6tools (8 total)',
            'global-dialog': 'Global game flag set across many maps, named by dialog only',
            'setter-dialog': 'Named from ON-setter event dialog text',
            'setter-dialog+map': 'Named from ON-setter dialog + map location context',
            'setter+map': 'Named from ON-setter event + map from triggers/NPCs',
            'npc-gated': 'Named from NPC gated by this switch',
            'map-only': 'Location known from triggers/NPCs but no dialog',
            'setter-only': 'Has setter event but no map or dialog context',
            'clear-only': 'Only cleared (set OFF), never set ON in events',
            'check-only': 'Checked by triggers/NPCs but never set in events',
            'orphan': 'No cross-references found',
        },
        'eventSwitches': json_entries,
    }

    json_path = r"C:\Users\J4cks\Desktop\work5\crawler\ffv_event_switches_0-511.json"
    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(output, f, indent=2, ensure_ascii=False)

    print(f"\nJSON written to {json_path}")
    print(f"\n=== Naming Tier Stats ===")
    total_named = 0
    for tier in ['existing', 'global-dialog', 'setter-dialog', 'setter-dialog+map', 'setter+map',
                 'npc-gated', 'map-only', 'setter-only', 'clear-only', 'check-only', 'orphan']:
        count = tier_counts.get(tier, 0)
        if tier != 'orphan':
            total_named += count
        print(f"  {tier:22s}: {count:4d}")
    print(f"  {'TOTAL NAMED':22s}: {total_named:4d} / {NUM_SWITCHES} ({total_named*100//NUM_SWITCHES}%)")

    # Show some samples per tier
    print(f"\n=== Samples ===")
    tier_samples = defaultdict(list)
    for e in json_entries:
        tier_samples[e['nameTier']].append(e)

    for tier in ['existing', 'global-dialog', 'setter-dialog', 'setter-dialog+map', 'setter+map',
                 'npc-gated', 'map-only', 'setter-only', 'clear-only', 'check-only', 'orphan']:
        entries = tier_samples.get(tier, [])
        if entries:
            print(f"\n  --- {tier} ---")
            for e in entries[:3]:
                name = e.get('name', '(unnamed)')
                print(f"    ES{e['id']:3d}: {name[:65]}")


if __name__ == '__main__':
    main()
