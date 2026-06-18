"""Enrich all string table labels with resolved cross-reference data,
then deduplicate with (n) numbering.

Transforms opaque references into human-readable inline annotations:
  battle(264)      -> Sekmet(Bat.264)
  event_switch     -> ESw.12:Obtained Cornago Jar
  npc_switch       -> NSw.8:Pyramid First Tablet
  call(1407)       -> call:Restore HP/MP(Ev.1407)
  Shop #12         -> Shop:Karnak Equipment(Sh.12)

Then adds (n) prefix to any remaining duplicate names.

Operates on ffv_event_names, ffv_event_switches, ffv_npc_switches JSONs,
and rebuilds the trigger script names inline during injection.
"""
import json
import re
import struct
from collections import defaultdict, Counter

CRAWLER = r"C:\Users\J4cks\Desktop\work5\crawler"
ROM_PATH = rf"{CRAWLER}\_FFV RPGe (CRC32 = 17444605).sfc"

# ══════════════════════════════════════════════════════════════
# 1. EXTRACT ROM DATA (monster names, battle formations)
# ══════════════════════════════════════════════════════════════

def snes_to_file(addr):
    return addr & 0x3FFFFF

# Full FFV text decoding table (including 2-byte DTE pairs)
CHAR_TABLE = {}
for i in range(10): CHAR_TABLE[0x53 + i] = str(i)
for i in range(26): CHAR_TABLE[0x60 + i] = chr(ord('A') + i)
for i in range(26): CHAR_TABLE[0x7A + i] = chr(ord('a') + i)
# Single-byte DTE
CHAR_TABLE[0x94] = 'il'; CHAR_TABLE[0x95] = 'it'; CHAR_TABLE[0x97] = 'li'
CHAR_TABLE[0x98] = 'll'; CHAR_TABLE[0xA4] = 'ti'; CHAR_TABLE[0xA5] = 'fi'
CHAR_TABLE[0xAC] = 'if'; CHAR_TABLE[0xAD] = 'It'; CHAR_TABLE[0xAE] = 'tl'
CHAR_TABLE[0xAF] = 'ir'; CHAR_TABLE[0xB0] = 'tt'
# Punctuation
CHAR_TABLE[0x96] = ' '; CHAR_TABLE[0xFE] = ' '; CHAR_TABLE[0xFF] = ''  # pad
CHAR_TABLE[0x99] = "'"; CHAR_TABLE[0x9B] = ':'; CHAR_TABLE[0x9D] = ','
CHAR_TABLE[0x9E] = '('; CHAR_TABLE[0x9F] = ')'; CHAR_TABLE[0xA0] = '/'
CHAR_TABLE[0xA1] = '!'; CHAR_TABLE[0xA2] = '?'; CHAR_TABLE[0xA3] = '.'
CHAR_TABLE[0xC5] = '-'; CHAR_TABLE[0xC7] = '...'; CHAR_TABLE[0xCF] = ':'
CHAR_TABLE[0xE2] = '+'; CHAR_TABLE[0xCD] = '%'
# 2-byte DTE pairs (must check before single-byte)
DTE_PAIRS = {
    (0xA6, 0xA7): 'Bla',
    (0xA8, 0xA9): 'pel',
}

def decode_monster_name(rom, offset, length=10):
    """Decode a fixed-length monster name from ROM bytes."""
    raw = rom[offset:offset + length]
    result = []
    i = 0
    while i < len(raw):
        # Check 2-byte DTE pairs first
        if i + 1 < len(raw) and (raw[i], raw[i+1]) in DTE_PAIRS:
            result.append(DTE_PAIRS[(raw[i], raw[i+1])])
            i += 2
            continue
        b = raw[i]
        if b in CHAR_TABLE:
            result.append(CHAR_TABLE[b])
        i += 1
    return ''.join(result).strip()


def extract_monster_names(rom):
    """Extract all 384 monster names from ROM."""
    base = snes_to_file(0xE00050)
    names = {}
    for i in range(384):
        name = decode_monster_name(rom, base + i * 10)
        if name:
            names[i] = name
    return names


def extract_battle_formations(rom, monster_names):
    """Extract battle formations: battle_id -> list of unique monster names."""
    base = snes_to_file(0xD03000)
    formations = {}
    for i in range(512):
        offset = base + i * 16
        data = rom[offset:offset + 16]
        flags = data[15]
        is_boss = bool(flags & 0x20)
        present_mask = data[3]
        monsters = []
        for slot in range(8):
            bit = 7 - slot
            if present_mask & (1 << bit):
                mid = data[4 + slot]
                if is_boss:
                    mid += 256
                mname = monster_names.get(mid, f'Mon.{mid}')
                if mname not in monsters:
                    monsters.append(mname)
        formations[i] = monsters
    return formations


print("Loading ROM...")
with open(ROM_PATH, 'rb') as f:
    rom = f.read()

monster_names = extract_monster_names(rom)
print(f"  {len(monster_names)} monster names extracted")
battle_formations = extract_battle_formations(rom, monster_names)
print(f"  {len(battle_formations)} battle formations extracted")

# Verify the Bla fix
print(f"  Monster 7: {monster_names.get(7, '?')} (should be BlackGoblin)")
print(f"  Battle 264: {battle_formations.get(264, [])} (should be [Sekmet])")

# ── Extract battle groups from ROM ──
# Random Battle Groups: $D06800, 256 entries x 8 bytes (4 x 16-bit LE formation IDs)
base_rbg = snes_to_file(0xD06800)
random_groups = {}
for i in range(256):
    off = base_rbg + i * 8
    formations = []
    for s in range(4):
        fid = struct.unpack_from('<H', rom, off + s * 2)[0] & 0x03FF
        formations.append(fid)
    random_groups[i] = formations

# Event Battle Groups: $D07800, 256 entries x 4 bytes (2 x 16-bit LE formation IDs)
base_ebg = snes_to_file(0xD07800)
event_groups = {}
for i in range(256):
    off = base_ebg + i * 4
    formations = []
    for s in range(2):
        fid = struct.unpack_from('<H', rom, off + s * 2)[0] & 0x03FF
        formations.append(fid)
    event_groups[i] = formations

print(f"  {len(random_groups)} random battle groups extracted")
print(f"  {len(event_groups)} event battle groups extracted")


# ══════════════════════════════════════════════════════════════
# 2. LOAD ALL CROSS-REFERENCE DATA
# ══════════════════════════════════════════════════════════════

print("\nLoading cross-reference data...")

with open(rf"{CRAWLER}\ffv_event_names_0-1939.json", encoding='utf-8') as f:
    event_data = json.load(f)

with open(rf"{CRAWLER}\ffv_event_switches_0-511.json", encoding='utf-8') as f:
    es_data = json.load(f)

with open(rf"{CRAWLER}\ffv_npc_switches_0-921.json", encoding='utf-8') as f:
    npc_data = json.load(f)

with open(rf"{CRAWLER}\ffv_trigger_scripts_0-703.json", encoding='utf-8') as f:
    trigger_data = json.load(f)

with open(rf"{CRAWLER}\tools\ff5\ff5u-sfc.json", encoding='utf-8') as f:
    webapp = json.load(f)

# Build lookup tables
event_names_by_id = {}
for ev in event_data['events']:
    name = ev.get('name', '')
    if name and name != '[empty/unused]' and name != '[unknown]':
        event_names_by_id[ev['id']] = name

es_names_by_id = {}
for es in es_data['eventSwitches']:
    if es.get('name') and es.get('nameTier') != 'orphan':
        es_names_by_id[es['id']] = es['name']

npc_names_by_id = {}
for npc in npc_data['npcSwitches']:
    if npc.get('name') and npc.get('nameTier') != 'orphan':
        npc_names_by_id[npc['id']] = npc['name']

shop_names = webapp['assembly']['shopProperties']['stringTable'].get('string', {})
print(f"  {len(event_names_by_id)} event names, {len(es_names_by_id)} ES names, "
      f"{len(npc_names_by_id)} NPC names, {len(shop_names)} shop names")


# ══════════════════════════════════════════════════════════════
# 2b. BUILD MAP LOOKUP TABLES (event/trigger -> mapId)
# ══════════════════════════════════════════════════════════════

print("\nBuilding map lookup tables...")

# Load map atlas
with open(rf"{CRAWLER}\ffv_map_atlas.json", encoding='utf-8') as f:
    atlas_data = json.load(f)

# ── Step 1a: Direct map associations (3 sources) ──
event_to_map_ids = defaultdict(list)  # event_id -> [mapId, ...] in encounter order

# Source 1: Atlas eventTriggers
for m in atlas_data['maps']:
    map_id = m['mapId']
    for et in m.get('eventTriggers', []):
        for eid in et.get('events', []):
            if eid != 0 and map_id not in event_to_map_ids[eid]:
                event_to_map_ids[eid].append(map_id)

# Source 2: Trigger script mapPlacements -> events
for trig in trigger_data['triggerScripts']:
    for mp in trig.get('mapPlacements', []):
        map_id = mp['mapId']
        for eid in trig.get('events', []):
            if eid != 0 and map_id not in event_to_map_ids[eid]:
                event_to_map_ids[eid].append(map_id)

# Source 3: NPC caller chains (event's npcScripts -> NPC's mapPlacements)
npc_by_id = {n['id']: n for n in npc_data['npcSwitches']}
for evt in event_data['events']:
    eid = evt['id']
    for npc_id in evt.get('npcScripts', []):
        npc = npc_by_id.get(npc_id)
        if npc:
            for mp in npc.get('mapPlacements', []):
                map_id = mp['mapId']
                if map_id not in event_to_map_ids[eid]:
                    event_to_map_ids[eid].append(map_id)

direct_count = len(event_to_map_ids)
print(f"  Direct map associations: {direct_count} events")

# ── Step 1b: Reverse call-graph for unmapped events ──
# Parse all event scripts to extract call targets (opcode 0xCD)
def get_opcode_length(op):
    if op <= 0x6F: return 1
    if op <= 0x7F: return 1
    if op <= 0x9F: return 2
    if op == 0xA0: return 2
    if op == 0xA1: return 2
    if op <= 0xA5: return 2
    if op <= 0xA7: return 2
    if op <= 0xA9: return 2
    if op <= 0xAB: return 2
    if op == 0xAC: return 2
    if op == 0xAD: return 2
    if op == 0xAE: return 2
    if op <= 0xB0: return 2
    if op <= 0xB3: return 2
    if op <= 0xB5: return 2
    if op <= 0xB7: return 2
    if op <= 0xB9: return 2
    if op <= 0xBC: return 3
    if op == 0xBD: return 3
    if op <= 0xBF: return 2
    if op <= 0xC2: return 2
    if op <= 0xC4: return 2
    if op <= 0xC7: return 2
    if op == 0xC8: return 3
    if op == 0xC9: return 3
    if op <= 0xCB: return 3
    if op == 0xCC: return 1
    if op == 0xCD: return 3
    if op <= 0xCF: return 3
    if op == 0xD0: return 3
    if op == 0xD1: return 4
    if op == 0xD2: return 5
    if op == 0xD3: return 4
    if op <= 0xD5: return 4
    if op == 0xD6: return 4
    if op == 0xD7: return 4
    if op == 0xD8: return 3
    if op == 0xD9: return 3
    if op == 0xDA: return 4
    if op == 0xDB: return 1
    if op == 0xDC: return 2
    if op == 0xDD: return 3
    if op <= 0xDF: return 1
    if op <= 0xE1: return 6
    if op == 0xE2: return 3
    if op == 0xE3: return 6
    if op <= 0xE7: return 1
    if op == 0xE8: return 3
    if op <= 0xEB: return 1
    if op <= 0xEF: return 1
    if op == 0xF0: return 3
    if op == 0xF1: return 2
    if op == 0xF2: return 1
    if op <= 0xF4: return 4
    if op <= 0xFE: return 1
    if op == 0xFF: return 1
    return 1

# Read event pointer table
ptr_table = snes_to_file(0xC83320)
all_event_ptrs = []
for i in range(1940):
    offset = ptr_table + i * 3
    p = rom[offset] | (rom[offset+1] << 8) | (rom[offset+2] << 16)
    all_event_ptrs.append(p)

# Build caller -> callee and reverse callee -> [callers] maps
callee_to_callers = defaultdict(list)  # callee_id -> [caller_ids]
for eid in range(1940):
    event_snes = all_event_ptrs[eid]
    event_file = snes_to_file(event_snes)
    next_file = snes_to_file(all_event_ptrs[eid + 1]) if eid + 1 < 1940 else event_file + 512
    i = event_file
    max_search = min(next_file, event_file + 2048)
    while i < max_search:
        op = rom[i]
        if op == 0xFF:
            break
        if op == 0xCD and i + 2 < len(rom):
            sub = rom[i+1] | (rom[i+2] << 8)
            if sub < 1940 and eid not in callee_to_callers[sub]:
                callee_to_callers[sub].append(eid)
        length = get_opcode_length(op)
        if length <= 0:
            break
        i += length

# BFS up caller chain for unmapped events (max depth 3)
reverse_resolved = 0
for eid in range(1940):
    if eid in event_to_map_ids:
        continue  # already has a direct map
    # BFS
    visited = {eid}
    queue = list(callee_to_callers.get(eid, []))
    depth = 0
    found = False
    while queue and depth < 3 and not found:
        next_queue = []
        for caller_id in queue:
            if caller_id in visited:
                continue
            visited.add(caller_id)
            if caller_id in event_to_map_ids:
                event_to_map_ids[eid] = [event_to_map_ids[caller_id][0]]
                reverse_resolved += 1
                found = True
                break
            next_queue.extend(c for c in callee_to_callers.get(caller_id, []) if c not in visited)
        queue = next_queue
        depth += 1

print(f"  Reverse call-graph resolved: {reverse_resolved} additional events")

# ── Step 1c: Build trigger lookup ──
trigger_to_map_id = {}
for trig in trigger_data['triggerScripts']:
    tid = trig['id']
    maps = trig.get('mapPlacements', [])
    if maps:
        trigger_to_map_id[tid] = maps[0]['mapId']

print(f"  Trigger map associations: {len(trigger_to_map_id)} triggers")

# Build final event lookup (first mapId = primary)
event_map_lookup = {}
for eid, map_ids in event_to_map_ids.items():
    if map_ids:
        event_map_lookup[str(eid)] = map_ids[0]

print(f"  Total event mapLookup entries: {len(event_map_lookup)}")
print(f"  Total trigger mapLookup entries: {len(trigger_to_map_id)}")

# ── Step 1d: Build battle group reverse lookups ──
print("\nBuilding battle group reverse lookups...")

# Map name lookup from atlas
atlas_map_names = {}
for m in atlas_data['maps']:
    if m.get('name'):
        atlas_map_names[m['mapId']] = m['name']

# Random group -> maps (from ROM mapBattleGroups table)
base_mbg = snes_to_file(0xD08000)
rand_group_to_maps = defaultdict(list)
for map_id in range(512):
    grp = struct.unpack_from('<H', rom, base_mbg + map_id * 2)[0]
    if grp < 256 and grp > 0:
        rand_group_to_maps[grp].append(map_id)

print(f"  Random groups with map refs: {len(rand_group_to_maps)}")

# Event group -> events (scan event scripts for opcodes 0xBD, 0xE2, 0xE8)
evt_group_to_events = defaultdict(list)
for eid in range(1940):
    event_snes = all_event_ptrs[eid]
    event_file = snes_to_file(event_snes)
    next_file = snes_to_file(all_event_ptrs[eid + 1]) if eid + 1 < 1940 else event_file + 512
    pos = event_file
    max_search = min(next_file, event_file + 2048)
    while pos < max_search:
        op = rom[pos]
        if op == 0xFF:
            break
        if op in (0xBD, 0xE2, 0xE8) and pos + 1 < len(rom):
            group_id = rom[pos + 1] & 0x7F
            if eid not in evt_group_to_events[group_id]:
                evt_group_to_events[group_id].append(eid)
        length = get_opcode_length(op)
        if length <= 0:
            break
        pos += length

print(f"  Event groups with script refs: {len(evt_group_to_events)}")

# ── Step 1e: Name battle groups ──
print("\nNaming battle groups...")


def get_group_monsters(formation_ids):
    """Collect unique monster names across multiple formation slots."""
    monsters = []
    for fid in formation_ids:
        for m in battle_formations.get(fid, []):
            if m not in monsters:
                monsters.append(m)
    return monsters


def name_random_group(group_id):
    """Generate a name for a random battle group."""
    fids = random_groups[group_id]
    # Skip all-zero groups
    if all(f == 0 for f in fids):
        return None
    monsters = get_group_monsters(fids)
    if not monsters:
        return None
    # Monster part: unique names joined with /, max 3, truncated to 12 chars each
    monster_part = '/'.join(m[:12] for m in monsters[:3])
    if len(monsters) > 3:
        monster_part += '/...'
    # Map context: if used by 1-3 maps, prepend first map name
    map_ids = rand_group_to_maps.get(group_id, [])
    if 1 <= len(map_ids) <= 3:
        map_name = atlas_map_names.get(map_ids[0], '')
        if map_name:
            # Shorten map name if too long
            if len(map_name) > 25:
                map_name = map_name[:25].rstrip(' -')
            return f'{map_name}, {monster_part}'
    return monster_part


def name_event_group(group_id):
    """Generate a name for an event battle group."""
    fids = event_groups[group_id]
    if all(f == 0 for f in fids):
        return None
    # Check for boss flag on any referenced formation
    is_boss = False
    base_bf = snes_to_file(0xD03000)
    for fid in fids:
        flags = rom[base_bf + fid * 16 + 15]
        if flags & 0x20:
            is_boss = True
            break
    # Get monsters for each formation slot separately
    monsters_1 = battle_formations.get(fids[0], [])
    monsters_2 = battle_formations.get(fids[1], [])
    # Build monster part
    if monsters_1 == monsters_2:
        monster_part = '/'.join(m[:12] for m in monsters_1[:3])
    else:
        part_1 = '/'.join(m[:12] for m in monsters_1[:2]) if monsters_1 else '?'
        part_2 = '/'.join(m[:12] for m in monsters_2[:2]) if monsters_2 else '?'
        monster_part = f'{part_1} / {part_2}'
    if not monster_part:
        return None
    # Event context: prefer events with map/location prefixes over dialog-only
    event_ids = evt_group_to_events.get(group_id, [])
    event_context = None
    if event_ids:
        # First pass: look for events with map prefix (has ' - ' or ', ' with location)
        for ref_eid in event_ids:
            ename = event_names_by_id.get(ref_eid)
            if not ename or ename in ('[empty/unused]', '[unknown]'):
                continue
            if ename.startswith('"') or ename.startswith('call('):
                continue  # skip dialog-only / call-only names
            if ' - ' in ename:
                event_context = ename.split(' - ', 1)[0]
                break
            elif ', ' in ename:
                first = ename.split(', ', 1)[0]
                if len(first) <= 30 and not first.startswith('"'):
                    event_context = first
                    break
    if event_context:
        return f'{event_context}, {monster_part}'
    return monster_part


# Generate names
rbg_names = {}
rbg_named = 0
for i in range(256):
    name = name_random_group(i)
    if name:
        rbg_names[i] = name
        rbg_named += 1

ebg_names = {}
ebg_named = 0
for i in range(256):
    name = name_event_group(i)
    if name:
        ebg_names[i] = name
        ebg_named += 1

print(f"  Random Battle Groups named: {rbg_named} / 256")
print(f"  Event Battle Groups named: {ebg_named} / 256")


# ══════════════════════════════════════════════════════════════
# 3. ENRICHMENT FUNCTIONS
# ══════════════════════════════════════════════════════════════

def shorten_es_name(name, max_len=25):
    """Shorten an event switch name for compact inline use.
    Strips map prefix, quotes, enrichment artifacts."""
    if not name:
        return ''
    # Strip map prefix (before dash or comma)
    if ' - ' in name:
        name = name.split(' - ', 1)[1]
    if ', ' in name and not name.startswith('"'):
        # Could be "MapName, enriched stuff" — take first meaningful part
        parts = name.split(', ', 1)
        # If first part looks like a map, skip it
        if any(w in parts[0] for w in ['Castle', 'Tower', 'Cave', 'Inn', 'Pub', 'Forest',
               'Shrine', 'Village', 'Ship', 'Island', 'Bridge', 'Ruins', 'World Map']):
            name = parts[1]
    # Strip quotes and brackets
    name = name.strip('"').strip('[]')
    # Remove (Bat.N), (Ev.N), (ESw.N) annotations from enriched names
    name = re.sub(r'\([A-Z][a-z]*\.\d+\)', '', name).strip()
    # Remove call: prefix
    if name.startswith('call:'):
        name = name[5:]
    if len(name) > max_len:
        name = name[:max_len].rstrip(' ,')
    return name


def shorten_npc_name(name, max_len=25):
    """Shorten an NPC switch name for compact inline use."""
    if not name:
        return ''
    if ' - ' in name:
        name = name.split(' - ', 1)[1]
    if ', ' in name and not name.startswith('"'):
        parts = name.split(', ', 1)
        if any(w in parts[0] for w in ['Castle', 'Tower', 'Cave', 'Inn', 'Pub', 'Forest',
               'Shrine', 'Village', 'Ship', 'Island', 'Bridge', 'Ruins', 'World Map']):
            name = parts[1]
    name = name.strip('"').strip('[]')
    name = re.sub(r'\([A-Z][a-z]*\.\d+\)', '', name).strip()
    if len(name) > max_len:
        name = name[:max_len].rstrip(' ,')
    return name


def shorten_event_name(name, max_len=30):
    """Shorten an event name for inline call resolution."""
    # Strip map prefix if present (from our quality pass)
    if ' - [' in name:
        name = name.split(' - ', 1)[1]
    if ' - "' in name:
        name = name.split(' - ', 1)[1]
    # Use dialog text if available
    if name.startswith('"'):
        return name.strip('"')[:max_len]
    if name.startswith('NPC: "'):
        return name[6:].strip('"')[:max_len]
    # Strip leading call() prefix
    if name.startswith('call('):
        m = re.match(r'call\(\d+\):\s*(.*)', name)
        if m:
            return m.group(1).strip('"')[:max_len]
    return name[:max_len]


def battle_label(battle_id):
    """Resolve a battle ID to a monster name label."""
    monsters = battle_formations.get(battle_id, [])
    if monsters:
        # Use first unique monster, abbreviated
        label = '/'.join(m[:12] for m in monsters[:2])
        return f'{label}(Bat.{battle_id})'
    return f'Bat.{battle_id}'


def resolve_call(call_id):
    """Resolve a call() target to a descriptive label."""
    name = event_names_by_id.get(call_id)
    if not name:
        return f'Ev.{call_id}'
    short = shorten_event_name(name)
    if short:
        return f'{short}(Ev.{call_id})'
    return f'Ev.{call_id}'


# Patterns for matching references in bracket-desc names
CALL_PAT = re.compile(r'call\((\d+)\)')
BATTLE_PAT = re.compile(r'battle\((\d+)\)')


def enrich_bracket_name(name):
    """Enrich a bracket-desc name by resolving all opaque references.
    '[call(1407), battle(264), event_switch]'
    -> '[call:Restore HP/MP(Ev.1407), Sekmet(Bat.264), event_switch]'
    """
    if not name.startswith('[') or name in ('[empty/unused]', '[unknown]'):
        return name

    inner = name[1:].rstrip(']')

    # Resolve call() targets
    def replace_call(m):
        cid = int(m.group(1))
        resolved = resolve_call(cid)
        return f'call:{resolved}'
    inner = CALL_PAT.sub(replace_call, inner)

    # Resolve battle() IDs
    def replace_battle(m):
        bid = int(m.group(1))
        return battle_label(bid)
    inner = BATTLE_PAT.sub(replace_battle, inner)

    return f'[{inner}]'


def enrich_call_dialog_name(name):
    """Enrich a 'call(N): "dialog"' name.
    'call(44): "Are you okay?"' -> 'call:Are you okay?(Ev.44): "Are you okay?"'
    Actually, simplify: just keep the dialog, add (Ev.N) annotation.
    """
    m = re.match(r'call\((\d+)\):\s*(.*)', name)
    if m:
        cid = int(m.group(1))
        rest = m.group(2)
        return f'call(Ev.{cid}): {rest}'
    return name


def enrich_event_name(eid, name):
    """Full enrichment pass for an event script name."""
    if not name or name in ('[empty/unused]', '[unknown]'):
        return name

    # Bracket-desc names: resolve inline references
    if name.startswith('[') or ((' - [' in name) and name.endswith(']')):
        # Split map prefix from bracket part
        if ' - [' in name:
            map_part, bracket_part = name.split(' - [', 1)
            bracket_part = '[' + bracket_part
            enriched_bracket = enrich_bracket_name(bracket_part)
            return f'{map_part}, {enriched_bracket[1:-1]}'  # comma-sep, no brackets
        else:
            enriched = enrich_bracket_name(name)
            # Remove brackets for cleaner look
            return enriched[1:-1] if enriched.startswith('[') else enriched

    # call(N): "dialog" names
    if name.startswith('call('):
        return enrich_call_dialog_name(name)

    # Map + call(N): "dialog" (from quality pass)
    if ' - call(' in name:
        parts = name.split(' - ', 1)
        return f'{parts[0]}, {enrich_call_dialog_name(parts[1])}'

    # Shop names: resolve shop ID
    m = re.match(r'Shop #(\d+)', name)
    if m:
        sid = m.group(1)
        sname = shop_names.get(sid, '')
        if sname:
            return f'{sname}(Sh.{sid})'
        return f'Shop(Sh.{sid})'

    # Inn names: keep as-is but annotate
    if name.startswith('Inn ('):
        return name

    # Dialog and NPC dialog names: keep as-is (already good)
    return name


def enrich_event_switch_name(es):
    """Enrich an event switch name with resolved cross-refs."""
    name = es.get('name', '')
    if not name:
        return name
    tier = es.get('nameTier', '')
    if tier == 'existing':
        return name  # preserve originals

    # For bracket-desc parts within ES names
    if ' - [' in name and name.endswith(']'):
        map_part, bracket_part = name.split(' - [', 1)
        bracket_part = '[' + bracket_part
        enriched = enrich_bracket_name(bracket_part)
        return f'{map_part}, {enriched[1:-1]}'

    # Resolve event IDs in setter-only names
    m = re.match(r'event (\d+): (.+)', name)
    if m:
        eid = int(m.group(1))
        rest = m.group(2)
        if rest.startswith('['):
            enriched = enrich_bracket_name(rest)
            return f'Ev.{eid}: {enriched[1:-1]}'
        return name

    # "(gated)" names: keep
    # "progress flag" names: keep
    # Dialog names: keep
    return name


def enrich_npc_switch_name(npc):
    """Enrich an NPC switch name with resolved cross-refs."""
    name = npc.get('name', '')
    if not name:
        return name
    tier = npc.get('nameTier', '')
    if tier == 'existing':
        return name

    # Bracket-desc parts
    if ' - [' in name and name.endswith(']'):
        map_part, bracket_part = name.split(' - [', 1)
        bracket_part = '[' + bracket_part
        enriched = enrich_bracket_name(bracket_part)
        return f'{map_part}, {enriched[1:-1]}'

    return name


# ══════════════════════════════════════════════════════════════
# 4. ENRICH EVENT SWITCH NAMES (inline in JSON)
# ══════════════════════════════════════════════════════════════

print("\n=== Enriching Event Switch Names ===")
es_enriched = 0
for es in es_data['eventSwitches']:
    old = es.get('name', '')
    if not old:
        continue
    new = enrich_event_switch_name(es)
    if new != old:
        es['name'] = new
        es_enriched += 1
print(f"  {es_enriched} event switch names enriched")

# Also enrich the es_names lookup so trigger naming uses enriched names
es_names_by_id = {}
for es in es_data['eventSwitches']:
    if es.get('name') and es.get('nameTier') != 'orphan':
        es_names_by_id[es['id']] = es['name']


# ══════════════════════════════════════════════════════════════
# 5. ENRICH EVENT SCRIPT NAMES (inline in JSON)
# ══════════════════════════════════════════════════════════════

print("\n=== Enriching Event Script Names ===")
ev_enriched = 0
for ev in event_data['events']:
    old = ev.get('name', '')
    if not old:
        continue
    new = enrich_event_name(ev['id'], old)
    if new != old:
        ev['name'] = new
        ev_enriched += 1
print(f"  {ev_enriched} event script names enriched")


# ══════════════════════════════════════════════════════════════
# 6. ENRICH NPC SWITCH NAMES (inline in JSON)
# ══════════════════════════════════════════════════════════════

print("\n=== Enriching NPC Switch Names ===")
npc_enriched = 0
for npc in npc_data['npcSwitches']:
    old = npc.get('name', '')
    if not old:
        continue
    new = enrich_npc_switch_name(npc)
    if new != old:
        npc['name'] = new
        npc_enriched += 1
print(f"  {npc_enriched} NPC switch names enriched")


# ══════════════════════════════════════════════════════════════
# 7. ENRICH EVENT SWITCH NAMES WITH INLINE ES/NS DATA
# ══════════════════════════════════════════════════════════════
# Now that event names are enriched, do a second pass on event names
# to resolve the generic "event_switch" and "npc_switch" tags with
# actual switch names from the event's cross-ref data.

# Save pre-enrichment switch names for compact inline use
# (enriched names contain map/battle data that would be redundant inline)
pre_enrich_es = {}
for es in es_data['eventSwitches']:
    if es.get('name') and es.get('nameTier') != 'orphan':
        # Use the raw name but strip map prefix for compactness
        raw = es['name']
        if ' - ' in raw:
            raw = raw.split(' - ', 1)[1]
        pre_enrich_es[es['id']] = raw.strip('"')

pre_enrich_npc = {}
for npc in npc_data['npcSwitches']:
    if npc.get('name') and npc.get('nameTier') != 'orphan':
        raw = npc['name']
        if ' - ' in raw:
            raw = raw.split(' - ', 1)[1]
        pre_enrich_npc[npc['id']] = raw.strip('"')

print("\n=== Resolving inline switch references in event names ===")
sw_resolved = 0
for ev in event_data['events']:
    name = ev.get('name', '')
    if not name:
        continue
    new_name = name

    # Resolve "event_switch" -> compact switch annotations
    if 'event_switch' in new_name and ev.get('eventSwitches'):
        sw_labels = []
        for sw in ev['eventSwitches'][:2]:  # max 2 inline
            sid = sw['id']
            state = sw['state']
            short = pre_enrich_es.get(sid, '')
            # Avoid circular refs (switch named after this event)
            if short and f'event {ev["id"]}' not in short and f'Ev.{ev["id"]}' not in short:
                short = short[:18].rstrip(' ,')
                sw_labels.append(f'ESw.{sid}:{short}={state}')
            else:
                sw_labels.append(f'ESw.{sid}={state}')
        sw_str = ', '.join(sw_labels)
        new_name = new_name.replace('event_switch', sw_str)

    # Resolve "npc_switch" -> compact switch annotations
    if 'npc_switch' in new_name and ev.get('npcSwitches'):
        ns_labels = []
        for sw in ev['npcSwitches'][:2]:
            sid = sw['id']
            state = sw['state']
            short = pre_enrich_npc.get(sid, '')
            if short and f'event {ev["id"]}' not in short:
                short = short[:18].rstrip(' ,')
                ns_labels.append(f'NSw.{sid}:{short}={state}')
            else:
                ns_labels.append(f'NSw.{sid}={state}')
        ns_str = ', '.join(ns_labels)
        new_name = new_name.replace('npc_switch', ns_str)

    if new_name != name:
        ev['name'] = new_name
        sw_resolved += 1

print(f"  {sw_resolved} event names got inline switch resolution")


# ══════════════════════════════════════════════════════════════
# 8. WRITE ENRICHED SOURCE JSONS
# ══════════════════════════════════════════════════════════════

print("\n=== Writing enriched source JSONs ===")
with open(rf"{CRAWLER}\ffv_event_names_0-1939.json", 'w', encoding='utf-8') as f:
    json.dump(event_data, f, indent=2, ensure_ascii=False)
print(f"  Written: ffv_event_names_0-1939.json")

with open(rf"{CRAWLER}\ffv_event_switches_0-511.json", 'w', encoding='utf-8') as f:
    json.dump(es_data, f, indent=2, ensure_ascii=False)
print(f"  Written: ffv_event_switches_0-511.json")

with open(rf"{CRAWLER}\ffv_npc_switches_0-921.json", 'w', encoding='utf-8') as f:
    json.dump(npc_data, f, indent=2, ensure_ascii=False)
print(f"  Written: ffv_npc_switches_0-921.json")


# ══════════════════════════════════════════════════════════════
# 9. REBUILD + INJECT STRING TABLES (with trigger enrichment + dedup)
# ══════════════════════════════════════════════════════════════

# Re-read enriched event names for trigger naming
ev_names_for_triggers = {}
for ev in event_data['events']:
    if ev.get('name') and ev['name'] != '[empty/unused]':
        ev_names_for_triggers[ev['id']] = ev['name']

# ── Original human-authored names (hardcoded) ──
ORIGINAL_EVENT_SWITCHES = {
    "12": "Obtained Cornago Jar", "69": "Defeated Gilgamesh (Big Bridge)",
    "100": "Quelb Gate is Locked", "209": "Obtained Requiem Song",
    "273": "Obtained Love Song", "507": "Enable Mini-Map",
    "509": "Enable Tent/Save", "511": "Disable Random Battles",
}
ORIGINAL_EVENT_SCRIPTS = {
    "0": "No Event", "1": "NPC Dialog 1", "2": "NPC Dialog 2",
    "3": "NPC Dialog 3", "4": "NPC Dialog 4", "5": "NPC Dialog 5",
    "6": "NPC Dialog 6", "7": "NPC Dialog 7", "8": "NPC Dialog 8",
    "16": "Game Start", "38": "Intro", "323": "Ending",
    "1407": "Restore Party HP/MP/Status",
    "1792": "Piano Practice 1", "1793": "Piano Practice 2",
    "1794": "Piano Practice 3", "1795": "Piano Practice 4",
    "1796": "Piano Practice 5", "1797": "Piano Practice 6",
    "1798": "Piano Practice 7", "1799": "Piano Practice 8",
}
ORIGINAL_TRIGGER_SCRIPTS = {"17": "Tent", "18": "Cabin", "255": "Save Point"}
ORIGINAL_NPC_SWITCHES = {}
for npc in npc_data['npcSwitches']:
    if npc.get('nameTier') == 'existing' and npc.get('name'):
        ORIGINAL_NPC_SWITCHES[str(npc['id'])] = npc['name']


def rebuild_string_table(originals, new_entries, label):
    """Rebuild string table, originals take priority."""
    merged = {}
    for key, value in originals.items():
        merged[str(key)] = value
    added = 0
    for key, value in new_entries.items():
        str_key = str(key)
        if str_key not in merged:
            merged[str_key] = value
            added += 1
    print(f"  {label}: {len(originals)} original + {added} auto = {len(merged)} total")
    return merged


def dedup_string_table(table, label):
    """Add (n) prefix to duplicate names within a string table."""
    name_counts = Counter(table.values())
    dupes = {name for name, cnt in name_counts.items() if cnt > 1}
    if not dupes:
        print(f"  {label}: no duplicates")
        return table

    # For each duplicate name, number the occurrences
    name_seq = defaultdict(int)
    total_deduped = 0
    # Process in key order so numbering is stable
    for key in sorted(table.keys(), key=int):
        name = table[key]
        if name in dupes:
            name_seq[name] += 1
            n = name_seq[name]
            table[key] = f'({n}) {name}'
            total_deduped += 1

    dupe_groups = len(dupes)
    print(f"  {label}: {total_deduped} entries renumbered across {dupe_groups} duplicate groups")
    return table


# ── Trigger script naming (enriched version) ──
def extract_dialog_from_event_name(name, max_len=30):
    if not name: return None
    if name.startswith('"'): return name.strip('"')[:max_len]
    if name.startswith('NPC: "'): return name[6:].strip('"')[:max_len]
    if '": "' in name:
        idx = name.index('": "')
        return name[idx+3:].strip('"')[:max_len]
    return None


def name_trigger_script_enriched(trig):
    """Generate an enriched name for a trigger script."""
    maps = trig.get('mapPlacements', [])
    events = trig.get('events', [])
    switches = trig.get('eventSwitches', [])
    has_button = trig.get('buttonPress', False)
    size = trig.get('size', 0)
    if size == 0: return None

    map_name = maps[0].get('mapName') if maps else None

    # Get best event name (strip map prefix to avoid doubling)
    best_event_name = None
    best_event_id = None
    for eid in events:
        if eid in ev_names_for_triggers and eid != 0:
            ename = ev_names_for_triggers[eid]
            # Strip map prefix if it matches trigger's own map
            if map_name and ename.startswith(f'{map_name}, '):
                ename = ename[len(map_name) + 2:]
            elif map_name and ename.startswith(f'{map_name} - '):
                ename = ename[len(map_name) + 3:]
            dialog = extract_dialog_from_event_name(ename)
            if dialog and len(dialog) > 3:
                best_event_name = f'"{dialog}"'
                best_event_id = eid
                break
            elif not best_event_name:
                best_event_name = ename
                best_event_id = eid

    # Switch context
    switch_desc = None
    if switches:
        sw = switches[0]
        sw_name = es_names_by_id.get(sw['id'])
        if sw_name:
            short = shorten_es_name(sw_name, 25)
            cond = 'ON' if sw['condition'] == 'checkON' else 'OFF'
            switch_desc = f'if {short} {cond}(ESw.{sw["id"]})'

    # Build name
    if map_name and best_event_name:
        name = best_event_name[:40]
        result = f'{map_name}, {name}'
        if has_button: result += ' (A)'
        return result

    if map_name and switch_desc:
        result = f'{map_name}, {switch_desc}'
        if has_button: result += ' (A)'
        return result

    if map_name and events:
        non_zero = [e for e in events if e != 0]
        if non_zero:
            # Try to get event description
            eid = non_zero[0]
            ename = ev_names_for_triggers.get(eid, '')
            if ename and not ename.startswith('['):
                short = shorten_event_name(ename)[:30]
                result = f'{map_name}, {short}(Ev.{eid})'
            else:
                result = f'{map_name}, Ev.{eid}'
            if has_button: result += ' (A)'
            return result

    if map_name:
        extras = []
        if has_button: extras.append('button')
        if extras:
            return f'{map_name}, {", ".join(extras)} trigger'
        return f'{map_name}, trigger'

    if best_event_name:
        return f'Ev: {best_event_name[:40]}'
    if switch_desc:
        return switch_desc

    if events:
        non_zero = [e for e in events if e != 0]
        if non_zero: return f'Ev.{non_zero[0]}'

    return None


# ── Build all 4 tables ──
print("\n=== Building String Tables ===")

# 1. Event Switches
es_new = {}
for es in es_data['eventSwitches']:
    if es.get('name') and es['nameTier'] != 'orphan':
        es_new[es['id']] = es['name']
es_table = rebuild_string_table(ORIGINAL_EVENT_SWITCHES, es_new, "eventSwitch")

# 2. NPC Switches
npc_new = {}
for npc in npc_data['npcSwitches']:
    if npc.get('name') and npc['nameTier'] != 'orphan':
        npc_new[npc['id']] = npc['name']
npc_table = rebuild_string_table(ORIGINAL_NPC_SWITCHES, npc_new, "npcSwitch")

# 3. Event Scripts
ev_new = {}
for ev in event_data['events']:
    if ev.get('name') and ev['name'] != '[empty/unused]':
        ev_new[ev['id']] = ev['name']
ev_table = rebuild_string_table(ORIGINAL_EVENT_SCRIPTS, ev_new, "eventScript")

# 4. Trigger Scripts (generate enriched names inline)
print("\n  Generating enriched trigger script names...")
trig_new = {}
named_count = 0
for trig in trigger_data['triggerScripts']:
    if trig.get('name'):
        continue  # already in originals
    name = name_trigger_script_enriched(trig)
    if name:
        trig_new[trig['id']] = name
        named_count += 1
print(f"  Generated {named_count} trigger script names")
trig_table = rebuild_string_table(ORIGINAL_TRIGGER_SCRIPTS, trig_new, "triggerScript")

# 5. Random Battle Groups
rbg_table = rebuild_string_table({}, rbg_names, "battleGroupRandom")

# 6. Event Battle Groups
ebg_table = rebuild_string_table({}, ebg_names, "battleGroupEvent")


# ══════════════════════════════════════════════════════════════
# 10. STRIP <CharName> ANGLE BRACKETS (webapp interprets <> as links)
# ══════════════════════════════════════════════════════════════

CHAR_NAME_PAT = re.compile(r'<(Bartz|Lenna|Galuf|Faris|Krile)>')

def strip_char_brackets(table, label):
    """Remove <CharName> angle brackets that the webapp misinterprets as links."""
    fixed = 0
    for key in table:
        new_val = CHAR_NAME_PAT.sub(r'\1', table[key])
        if new_val != table[key]:
            table[key] = new_val
            fixed += 1
    if fixed:
        print(f"  {label}: stripped {fixed} <CharName> brackets")
    return table

print("\n=== Stripping <CharName> brackets ===")
es_table = strip_char_brackets(es_table, "eventSwitch")
npc_table = strip_char_brackets(npc_table, "npcSwitch")
ev_table = strip_char_brackets(ev_table, "eventScript")
trig_table = strip_char_brackets(trig_table, "triggerScript")
rbg_table = strip_char_brackets(rbg_table, "battleGroupRandom")
ebg_table = strip_char_brackets(ebg_table, "battleGroupEvent")


# ══════════════════════════════════════════════════════════════
# 11. DEDUPLICATE ALL TABLES
# ══════════════════════════════════════════════════════════════

print("\n=== Deduplicating ===")
es_table = dedup_string_table(es_table, "eventSwitch")
npc_table = dedup_string_table(npc_table, "npcSwitch")
ev_table = dedup_string_table(ev_table, "eventScript")
trig_table = dedup_string_table(trig_table, "triggerScript")
rbg_table = dedup_string_table(rbg_table, "battleGroupRandom")
ebg_table = dedup_string_table(ebg_table, "battleGroupEvent")


# ══════════════════════════════════════════════════════════════
# 11. INJECT INTO WEBAPP JSON + WRITE
# ══════════════════════════════════════════════════════════════

print("\n=== Injecting into webapp JSON ===")
webapp['stringTable']['eventSwitch']['string'] = es_table
webapp['stringTable']['npcSwitch']['string'] = npc_table
webapp['assembly']['eventScript']['stringTable']['string'] = ev_table
webapp['assembly']['triggerScript']['stringTable']['string'] = trig_table
webapp['assembly']['battleGroupRandom']['stringTable']['string'] = rbg_table
webapp['assembly']['battleGroupEvent']['stringTable']['string'] = ebg_table
print(f"  Injected battle group names: {len(rbg_table)} random, {len(ebg_table)} event")

# Inject mapLookup tables
webapp['assembly']['eventScript']['mapLookup'] = event_map_lookup
trigger_map_lookup_str = {str(k): v for k, v in trigger_to_map_id.items()}
webapp['assembly']['triggerScript']['mapLookup'] = trigger_map_lookup_str
print(f"  Injected mapLookup: {len(event_map_lookup)} events, {len(trigger_map_lookup_str)} triggers")

output_path = rf"{CRAWLER}\tools\ff5\ff5u-sfc.json"
with open(output_path, 'w', encoding='utf-8') as f:
    json.dump(webapp, f, indent=4, ensure_ascii=False)

file_size = __import__('os').path.getsize(output_path)
print(f"Written: {file_size:,} bytes")

# ── Final stats ──
print(f"\n=== Final String Table Sizes ===")
print(f"  Event Switches:      {len(es_table):4d} / 512")
print(f"  NPC Switches:        {len(npc_table):4d} / 922")
print(f"  Event Scripts:       {len(ev_table):4d} / 1940")
print(f"  Trigger Scripts:     {len(trig_table):4d} / 704")
print(f"  Random Battle Groups:{len(rbg_table):4d} / 256")
print(f"  Event Battle Groups: {len(ebg_table):4d} / 256")
total = len(es_table) + len(npc_table) + len(ev_table) + len(trig_table) + len(rbg_table) + len(ebg_table)
print(f"  TOTAL:               {total}")

# Show duplicate counts after dedup
print(f"\n=== Post-Dedup Uniqueness ===")
for tname, tdata in [("eventSwitch", es_table), ("npcSwitch", npc_table),
                      ("eventScript", ev_table), ("triggerScript", trig_table),
                      ("battleGroupRandom", rbg_table), ("battleGroupEvent", ebg_table)]:
    unique = len(set(tdata.values()))
    print(f"  {tname}: {unique} unique / {len(tdata)} total ({unique*100//len(tdata)}%)")

# Show samples
print(f"\n=== Enriched Samples ===")
print(f"\n  --- Event Scripts ---")
for key in ['35', '57', '114', '173', '182', '825', '270', '1139']:
    if key in ev_table:
        print(f"    Ev.{key:>4s}: {ev_table[key][:80]}")

print(f"\n  --- Event Switches ---")
for key in ['2', '69', '256', '258', '384']:
    if key in es_table:
        print(f"    ESw.{key:>3s}: {es_table[key][:80]}")

print(f"\n  --- Trigger Scripts ---")
for key in ['1', '103', '206', '507']:
    if key in trig_table:
        print(f"    Trig.{key:>3s}: {trig_table[key][:80]}")

print(f"\n  --- NPC Switches ---")
for key in ['8', '70', '596']:
    if key in npc_table:
        print(f"    NSw.{key:>3s}: {npc_table[key][:80]}")

print(f"\n  --- Random Battle Groups ---")
for key in ['1', '5', '133', '135', '200']:
    if key in rbg_table:
        print(f"    RBG.{key:>3s}: {rbg_table[key][:80]}")

print(f"\n  --- Event Battle Groups ---")
for key in ['0', '1', '5', '10', '64']:
    if key in ebg_table:
        print(f"    EBG.{key:>3s}: {ebg_table[key][:80]}")
