"""Audit event switch names for map discrepancies.

Cross-validates every named switch by checking whether the map in its name
appears in any known context (setter events, trigger checks, NPC checks).
Flags potential mismatches and "global flags" pinned to misleading maps.
"""
import json
from collections import defaultdict

CRAWLER = r"C:\Users\J4cks\Desktop\work5\crawler"

# ── Load all data sources ──
with open(rf"{CRAWLER}\ffv_event_switches_0-511.json", encoding='utf-8') as f:
    es_data = json.load(f)

with open(rf"{CRAWLER}\ffv_event_names_0-1939.json", encoding='utf-8') as f:
    event_data = json.load(f)

with open(rf"{CRAWLER}\ffv_trigger_scripts_0-703.json", encoding='utf-8') as f:
    trigger_data = json.load(f)

with open(rf"{CRAWLER}\ffv_npc_switches_0-921.json", encoding='utf-8') as f:
    npc_data = json.load(f)

with open(rf"{CRAWLER}\ffv_map_atlas.json", encoding='utf-8') as f:
    atlas_data = json.load(f)

# ── Build event-to-map index (same as naming script) ──
event_id_to_maps = defaultdict(set)
for m in atlas_data['maps']:
    for et in m.get('eventTriggers', []):
        for eid in et.get('events', []):
            if eid != 0:
                event_id_to_maps[eid].add(m['name'])
for trig in trigger_data['triggerScripts']:
    for eid in trig.get('events', []):
        if eid != 0:
            for mp in trig.get('mapPlacements', []):
                event_id_to_maps[eid].add(mp['mapName'])
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

# ── Event name lookup ──
event_by_id = {}
for evt in event_data['events']:
    event_by_id[evt['id']] = evt

MAX_MAPS_PER_EVENT = 3
# If total unique setter maps exceeds this, the switch is a "global flag"
# and shouldn't be pinned to any single map
GLOBAL_FLAG_THRESHOLD = 5


# ══════════════════════════════════════════════════════════════
# ANALYSIS FUNCTIONS
# ══════════════════════════════════════════════════════════════

def get_total_setter_maps(es):
    """Count total unique maps across ALL non-subroutine setter events."""
    maps = set()
    for eid in es.get('setOnBy', []):
        evt_maps = event_id_to_maps.get(eid, set())
        if len(evt_maps) <= MAX_MAPS_PER_EVENT:
            maps.update(evt_maps)
    return maps

def get_all_setter_maps_including_subroutines(es):
    """ALL maps from ALL setter events (including subroutines)."""
    maps = set()
    for eid in es.get('setOnBy', []):
        maps.update(event_id_to_maps.get(eid, set()))
    for eid in es.get('setOffBy', []):
        maps.update(event_id_to_maps.get(eid, set()))
    return maps

def get_all_checker_maps(es):
    """All maps where this switch is checked."""
    maps = set()
    for tc in es.get('checkedByTriggers', []):
        for m in tc.get('maps', []):
            maps.add(m)
    for nc in es.get('checkedByNPCs', []):
        npc_name = nc.get('npcName', '')
        if ' - ' in npc_name:
            maps.add(npc_name.split(' - ')[0])
    return maps

def extract_map_from_name(name):
    """Extract the map portion from a switch name like 'MapName - description'."""
    if not name:
        return None
    if name.startswith('event ') or name.startswith('set by') or name.startswith('cleared by'):
        return None
    if name.startswith('call(') or name.startswith('if '):
        return None
    # "MapA / MapB - progress flag" -> [MapA, MapB]
    if ' - progress flag' in name:
        prefix = name.replace(' - progress flag', '')
        return prefix.split(' / ')
    if ' - ' in name:
        return [name.split(' - ')[0].strip()]
    if name.endswith('(gated)'):
        inner = name.replace(' (gated)', '')
        if ' - ' in inner:
            return [inner.split(' - ')[0].strip()]
    return None


# ══════════════════════════════════════════════════════════════
# AUDIT
# ══════════════════════════════════════════════════════════════

global_flags = []     # switches with too many setter maps to pin to one location
map_mismatches = []   # named map not found in any setter/checker context
ambiguous = []        # map is valid but many alternatives exist
ok_count = 0
no_map_count = 0

for es in es_data['eventSwitches']:
    sw_id = es['id']
    name = es.get('name')
    tier = es.get('nameTier', 'orphan')

    if not name or tier == 'orphan':
        continue

    named_maps = extract_map_from_name(name)
    if not named_maps:
        no_map_count += 1
        continue

    setter_maps = get_total_setter_maps(es)
    all_setter_maps = get_all_setter_maps_including_subroutines(es)
    checker_maps = get_all_checker_maps(es)
    all_maps = all_setter_maps | checker_maps

    # Check 1: Is this a GLOBAL flag? (many setter maps -> map prefix is misleading)
    total_setter_map_count = len(all_setter_maps)
    non_sub_setter_count = len(setter_maps)

    if non_sub_setter_count > GLOBAL_FLAG_THRESHOLD:
        on_events = es.get('setOnBy', [])
        on_events_detail = []
        for eid in on_events[:5]:
            evt = event_by_id.get(eid, {})
            on_events_detail.append(f"event {eid} ({evt.get('name', '?')[:40]})")
        global_flags.append({
            'id': sw_id,
            'name': name,
            'tier': tier,
            'non_sub_setter_maps': non_sub_setter_count,
            'total_setter_maps': total_setter_map_count,
            'setter_count': len(es.get('setOnBy', [])),
            'sample_setters': on_events_detail,
        })
        continue

    # Check 2: Is the named map confirmed by any context?
    all_confirmed = True
    for nm in named_maps:
        if nm not in setter_maps and nm not in checker_maps:
            all_confirmed = False
            break

    if all_confirmed:
        ok_count += 1
        # But still flag if there are many alternative setter maps (ambiguity)
        if non_sub_setter_count > 2:
            on_events = es.get('setOnBy', [])
            ambiguous.append({
                'id': sw_id,
                'name': name,
                'tier': tier,
                'named_map': named_maps[0],
                'setter_maps': sorted(setter_maps),
                'setter_count': non_sub_setter_count,
                'checker_maps': sorted(checker_maps),
            })
    else:
        # Named map not in any context — real mismatch
        on_events = es.get('setOnBy', [])
        evt_details = []
        for eid in on_events[:5]:
            evt = event_by_id.get(eid, {})
            evt_maps = event_id_to_maps.get(eid, set())
            evt_details.append({
                'eventId': eid,
                'eventName': evt.get('name', '?')[:50],
                'maps': sorted(evt_maps)[:5],
                'mapCount': len(evt_maps),
            })
        map_mismatches.append({
            'id': sw_id,
            'name': name,
            'tier': tier,
            'named_maps': named_maps,
            'setter_maps': sorted(setter_maps),
            'checker_maps': sorted(checker_maps),
            'setter_events': evt_details,
        })


# ══════════════════════════════════════════════════════════════
# REPORT
# ══════════════════════════════════════════════════════════════

total_named = sum(1 for es in es_data['eventSwitches']
                  if es.get('name') and es.get('nameTier') != 'orphan')
total_with_map = ok_count + len(global_flags) + len(map_mismatches)

print("=" * 70)
print("EVENT SWITCH AUDIT REPORT")
print("=" * 70)

print(f"\n--- Overview ---")
print(f"  Total named:           {total_named}")
print(f"  With map in name:      {total_with_map}")
print(f"  No map in name:        {no_map_count}")
print(f"  Map confirmed (OK):    {ok_count}")
print(f"  GLOBAL FLAGS:          {len(global_flags)}  (>{GLOBAL_FLAG_THRESHOLD} setter maps, map is misleading)")
print(f"  MAP MISMATCHES:        {len(map_mismatches)}  (named map not in any context)")
print(f"  Ambiguous (valid):     {len(ambiguous)}  (>2 setter maps, picked one)")

if global_flags:
    print(f"\n{'=' * 70}")
    print(f"GLOBAL FLAGS: Switches set on too many maps to pin to one ({len(global_flags)})")
    print(f"These should use dialog/description only, no map prefix.")
    print(f"{'=' * 70}")
    for gf in sorted(global_flags, key=lambda x: -x['non_sub_setter_maps']):
        print(f"\n  ES {gf['id']:3d}: {gf['name']}")
        print(f"    Tier: {gf['tier']}")
        print(f"    Setter maps: {gf['non_sub_setter_maps']} non-sub, {gf['total_setter_maps']} total")
        print(f"    ON setters: {gf['setter_count']} events")
        for se in gf['sample_setters'][:3]:
            print(f"      {se}")

if map_mismatches:
    print(f"\n{'=' * 70}")
    print(f"MAP MISMATCHES: Named map not in setter or checker context ({len(map_mismatches)})")
    print(f"{'=' * 70}")
    for mm in map_mismatches:
        print(f"\n  ES {mm['id']:3d}: {mm['name']}")
        print(f"    Tier: {mm['tier']}")
        print(f"    Named maps: {mm['named_maps']}")
        print(f"    Setter maps: {mm['setter_maps'] or '(none)'}")
        print(f"    Checker maps: {mm['checker_maps'] or '(none)'}")
        for se in mm.get('setter_events', []):
            flag = ' [SUBROUTINE]' if se['mapCount'] > MAX_MAPS_PER_EVENT else ''
            print(f"    ON setter: event {se['eventId']} ({se['eventName']}) -> {se['maps']}{flag}")

if ambiguous:
    print(f"\n{'=' * 70}")
    print(f"AMBIGUOUS: Map is valid but >2 setter maps exist ({len(ambiguous)})")
    print(f"{'=' * 70}")
    for a in ambiguous:
        print(f"\n  ES {a['id']:3d}: {a['name']}")
        print(f"    Setter maps ({a['setter_count']}): {a['setter_maps'][:6]}")
        print(f"    Checker maps: {a['checker_maps'][:4]}")

if not global_flags and not map_mismatches:
    print(f"\n  All named maps are confirmed! No issues found.")

print(f"\n{'=' * 70}")
print(f"ACTION ITEMS: {len(global_flags)} global flags to de-map, {len(map_mismatches)} mismatches to fix")
print(f"{'=' * 70}")
