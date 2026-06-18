"""Phase 1: Inject our crawler-generated names into ff5u-sfc.json string tables.

Merges 4 data sources into the webapp ROM definition:
  1. Event Switch names (8 → ~464)
  2. NPC Switch names (298 → ~746)
  3. Event Script names (16 → ~1940)
  4. Trigger Script names (3 → ~600, with inline naming from cross-refs)

Existing human-authored names always take priority over auto-generated ones.
"""
import json
import copy
from collections import defaultdict

CRAWLER = r"C:\Users\J4cks\Desktop\work5\crawler"
WEBAPP_JSON = rf"{CRAWLER}\tools\ff5\ff5u-sfc.json"

# ══════════════════════════════════════════════════════════════
# LOAD SOURCES
# ══════════════════════════════════════════════════════════════

print("Loading webapp definition...")
with open(WEBAPP_JSON, encoding='utf-8') as f:
    webapp = json.load(f)

print("Loading event switches...")
with open(rf"{CRAWLER}\ffv_event_switches_0-511.json", encoding='utf-8') as f:
    event_switches = json.load(f)

print("Loading NPC switches...")
with open(rf"{CRAWLER}\ffv_npc_switches_0-921.json", encoding='utf-8') as f:
    npc_switches = json.load(f)

print("Loading event names...")
with open(rf"{CRAWLER}\ffv_event_names_0-1939.json", encoding='utf-8') as f:
    event_names = json.load(f)

print("Loading trigger scripts...")
with open(rf"{CRAWLER}\ffv_trigger_scripts_0-703.json", encoding='utf-8') as f:
    trigger_scripts = json.load(f)

# Also load event switch names for trigger naming cross-refs
es_names = {}
for es in event_switches['eventSwitches']:
    if es.get('name'):
        es_names[es['id']] = es['name']

# Also build event name lookup for trigger naming
ev_names = {}
for ev in event_names['events']:
    if ev.get('name') and ev['name'] != '[empty/unused]':
        ev_names[ev['id']] = ev['name']


# ══════════════════════════════════════════════════════════════
# TRIGGER SCRIPT NAMING (inline — the only resource without names)
# ══════════════════════════════════════════════════════════════

def extract_dialog_from_event_name(name, max_len=30):
    """Pull dialog snippet from event name like '"Galuf: text"' or 'NPC: "text"'."""
    if not name:
        return None
    if name.startswith('"'):
        return name.strip('"')[:max_len]
    if name.startswith('NPC: "'):
        return name[6:].strip('"')[:max_len]
    if '": "' in name:
        idx = name.index('": "')
        return name[idx+3:].strip('"')[:max_len]
    return None


def name_trigger_script(trig):
    """Generate a name for a trigger script from its cross-reference data."""
    maps = trig.get('mapPlacements', [])
    events = trig.get('events', [])
    switches = trig.get('eventSwitches', [])
    has_button = trig.get('buttonPress', False)
    directions = trig.get('directions', [])
    size = trig.get('size', 0)

    if size == 0:
        return None

    # Get primary map name
    map_name = None
    if maps:
        # Use the first unique map name
        map_name = maps[0].get('mapName')

    # Get best event name
    best_event_name = None
    best_event_id = None
    for eid in events:
        if eid in ev_names and eid != 0:
            ename = ev_names[eid]
            dialog = extract_dialog_from_event_name(ename)
            if dialog and len(dialog) > 3:
                best_event_name = f'"{dialog}"'
                best_event_id = eid
                break
            elif not best_event_name:
                best_event_name = ename
                best_event_id = eid

    # Get switch context (for descriptive switch-check triggers)
    switch_desc = None
    if switches:
        sw = switches[0]
        sw_name = es_names.get(sw['id'])
        if sw_name and len(sw_name) < 40:
            cond = 'ON' if sw['condition'] == 'checkON' else 'OFF'
            switch_desc = f"if {sw_name} {cond}"

    # Build name with priority tiers
    # Tier 1: Map + event dialog
    if map_name and best_event_name:
        name = best_event_name
        # Truncate if needed
        if len(name) > 35:
            name = name[:35]
        result = f"{map_name} - {name}"
        if has_button:
            result += " (A)"
        return result

    # Tier 2: Map + switch context
    if map_name and switch_desc:
        result = f"{map_name} - {switch_desc}"
        if has_button:
            result += " (A)"
        return result

    # Tier 3: Map + event IDs
    if map_name and events:
        non_zero = [e for e in events if e != 0]
        if non_zero:
            evt_str = '/'.join(str(e) for e in non_zero[:3])
            result = f"{map_name} - event {evt_str}"
            if has_button:
                result += " (A)"
            return result

    # Tier 4: Map + direction/button
    if map_name:
        extras = []
        if has_button:
            extras.append("button")
        if directions:
            extras.append(directions[0].lower())
        if extras:
            return f"{map_name} - {', '.join(extras)} trigger"
        return f"{map_name} - trigger"

    # Tier 5: Event only
    if best_event_name:
        return f"event: {best_event_name[:40]}"

    # Tier 6: Switch only
    if switch_desc:
        return switch_desc

    # Tier 7: Has events but no other context
    if events:
        non_zero = [e for e in events if e != 0]
        if non_zero:
            return f"event {non_zero[0]}"

    return None


# ══════════════════════════════════════════════════════════════
# MERGE INTO WEBAPP JSON
# ══════════════════════════════════════════════════════════════

def rebuild_string_table(originals, new_entries, label):
    """Rebuild string table from original human-authored names + fresh auto-generated names.
    Originals always take priority. Previously-injected names are discarded and replaced."""
    merged = {}
    # Start with originals
    for key, value in originals.items():
        merged[str(key)] = value
    # Add auto-generated (originals take priority)
    added = 0
    for key, value in new_entries.items():
        str_key = str(key)
        if str_key not in merged:
            merged[str_key] = value
            added += 1
    print(f"  {label}: {len(originals)} original + {added} auto-generated = {len(merged)} total")
    return merged


# ── Original human-authored names (hardcoded to avoid re-reading our own output) ──
ORIGINAL_EVENT_SWITCHES = {
    "12": "Obtained Cornago Jar",
    "69": "Defeated Gilgamesh (Big Bridge)",
    "100": "Quelb Gate is Locked",
    "209": "Obtained Requiem Song",
    "273": "Obtained Love Song",
    "507": "Enable Mini-Map",
    "509": "Enable Tent/Save",
    "511": "Disable Random Battles",
}

ORIGINAL_EVENT_SCRIPTS = {
    "0": "No Event",
    "1": "NPC Dialog 1",
    "2": "NPC Dialog 2",
    "3": "NPC Dialog 3",
    "4": "NPC Dialog 4",
    "5": "NPC Dialog 5",
    "6": "NPC Dialog 6",
    "7": "NPC Dialog 7",
    "8": "NPC Dialog 8",
    "16": "Game Start",
    "38": "Intro",
    "323": "Ending",
    "1407": "Restore Party HP/MP/Status",
    "1792": "Piano Practice 1",
    "1793": "Piano Practice 2",
    "1794": "Piano Practice 3",
    "1795": "Piano Practice 4",
    "1796": "Piano Practice 5",
    "1797": "Piano Practice 6",
    "1798": "Piano Practice 7",
    "1799": "Piano Practice 8",
}

ORIGINAL_TRIGGER_SCRIPTS = {
    "17": "Tent",
    "18": "Cabin",
    "255": "Save Point",
}

# Read original NPC switch names from a fresh copy of the definition.
# These 298 entries were human-authored in the original ff6tools JSON.
# Since they're numerous, we extract them from the pre-injection backup.
# We identify originals as any entry present in our crawler JSON with nameTier="existing".
ORIGINAL_NPC_SWITCHES = {}
for npc in npc_switches['npcSwitches']:
    if npc.get('nameTier') == 'existing' and npc.get('name'):
        ORIGINAL_NPC_SWITCHES[str(npc['id'])] = npc['name']
print(f"  {len(ORIGINAL_NPC_SWITCHES)} original NPC switch names identified")


# ── 1. Event Switch names ──
print("\n=== Rebuilding Event Switch Names ===")
es_new = {}
for es in event_switches['eventSwitches']:
    if es.get('name') and es['nameTier'] != 'orphan':
        es_new[es['id']] = es['name']

webapp['stringTable']['eventSwitch']['string'] = rebuild_string_table(
    ORIGINAL_EVENT_SWITCHES, es_new, "eventSwitch")

# ── 2. NPC Switch names ──
print("\n=== Rebuilding NPC Switch Names ===")
npc_new = {}
for npc in npc_switches['npcSwitches']:
    if npc.get('name') and npc['nameTier'] != 'orphan':
        npc_new[npc['id']] = npc['name']

webapp['stringTable']['npcSwitch']['string'] = rebuild_string_table(
    ORIGINAL_NPC_SWITCHES, npc_new, "npcSwitch")

# ── 3. Event Script names ──
print("\n=== Rebuilding Event Script Names ===")
ev_new = {}
for ev in event_names['events']:
    if ev.get('name') and ev['name'] != '[empty/unused]':
        ev_new[ev['id']] = ev['name']

webapp['assembly']['eventScript']['stringTable']['string'] = rebuild_string_table(
    ORIGINAL_EVENT_SCRIPTS, ev_new, "eventScript")

# ── 4. Trigger Script names ──
print("\n=== Generating + Rebuilding Trigger Script Names ===")
trig_new = {}
named_count = 0
for trig in trigger_scripts['triggerScripts']:
    if trig.get('name'):
        continue  # already in originals (Tent, Cabin, Save Point)

    name = name_trigger_script(trig)
    if name:
        trig_new[trig['id']] = name
        named_count += 1

print(f"  Generated {named_count} trigger script names")

webapp['assembly']['triggerScript']['stringTable']['string'] = rebuild_string_table(
    ORIGINAL_TRIGGER_SCRIPTS, trig_new, "triggerScript")


# ══════════════════════════════════════════════════════════════
# WRITE OUTPUT
# ══════════════════════════════════════════════════════════════

output_path = WEBAPP_JSON
print(f"\nWriting updated definition to {output_path}...")
with open(output_path, 'w', encoding='utf-8') as f:
    json.dump(webapp, f, indent=4, ensure_ascii=False)

file_size = __import__('os').path.getsize(output_path)
print(f"Written: {file_size:,} bytes")

# ── Verification stats ──
print("\n=== Final String Table Sizes ===")
es_final = webapp['stringTable']['eventSwitch']['string']
npc_final = webapp['stringTable']['npcSwitch']['string']
ev_final = webapp['assembly']['eventScript']['stringTable']['string']
trig_final = webapp['assembly']['triggerScript']['stringTable']['string']

print(f"  Event Switches:  {len(es_final):4d} / 512  entries")
print(f"  NPC Switches:    {len(npc_final):4d} / 922  entries")
print(f"  Event Scripts:   {len(ev_final):4d} / 1940 entries")
print(f"  Trigger Scripts: {len(trig_final):4d} / 704  entries")

total_before = 8 + 298 + 16 + 3
total_after = len(es_final) + len(npc_final) + len(ev_final) + len(trig_final)
print(f"\n  TOTAL: {total_before} entries before -> {total_after} entries after")
print(f"  Net new names: +{total_after - total_before}")
