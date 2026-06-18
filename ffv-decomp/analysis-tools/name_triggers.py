"""Extract metadata for FFV trigger scripts from ROM data.
Produces a JSON resource cataloguing all 704 trigger scripts with:
  - Event switches checked (conditions)
  - Events executed
  - Button press conditions
  - Map tile placements (from event triggers table)
"""
import struct, json

ROM_PATH = r"C:\Users\J4cks\Desktop\work5\crawler\_FFV RPGe (CRC32 = 17444605).sfc"
HEADER = 0

NUM_TRIGGER_SCRIPTS = 704
NUM_MAPS = 511  # event trigger sets (one per map)

def snes_to_file(addr):
    return (addr & 0x3FFFFF) + HEADER

# ── Map names (from ff5u-sfc.json mapProperties.stringTable) ──
MAP_NAMES = {
    0: "World Map (Bartz' World)", 1: "World Map (Galuf's World)", 2: "World Map (Combined World)",
    3: "Sea Floor (Galuf's World)", 4: "Sea Floor (Combined World)",
    5: "Airship", 6: "Airship", 7: "Tycoon Castle Tower (Opening)", 8: "Tycoon Castle Tower (Opening)",
    9: "Pirate Ship", 10: "Wind Shrine", 11: "Greenhorn's Club 1F", 12: "Greenhorn's Club 2F",
    13: "Chocobo Ability tutorial", 14: "Wind Shrine", 15: "Chocobo Forest", 16: "Chocobo Forest",
    17: "Western Valley", 18: "Cave Entrance", 19: "Cave Lv1", 20: "Cave Lv2", 21: "Cave Lv3",
    22: "Pirates' Hideout", 23: "Pirates' Hideout", 24: "Pirate Ship", 25: "Pirate Ship Below Deck",
    26: "Pirate Ship Below Deck", 27: "Wind Shrine 1F", 28: "Wind Shrine 2F", 29: "Wind Shrine 3F",
    30: "Wind Shrine 4F", 31: "Wind Shrine Crystal Chamber", 32: "Tule", 33: "Tule Pub",
    34: "Tule Pub 2F", 35: "Tule Inn", 36: "Tule Magic Shop", 37: "Tule Weapons Shop",
    38: "Tule Armor Shop", 39: "Tule Zok's House", 40: "Torna Canal",
    41: "Pirate's Ship (Opening)", 42: "Pirate's Ship (Opening)",
    43: "Ship Graveyard", 44: "Shipwreck", 45: "Shipwreck", 46: "Shipwreck", 47: "Shipwreck",
    48: "Shipwreck", 49: "Shipwreck", 50: "Pirate Ship Below Deck",
    51: "Carwen", 52: "Carwen Magic Shop", 53: "Carwen Item Shop", 54: "Carwen Inn",
    55: "Carwen Pub", 56: "Carwen Equipment Shop", 57: "Carwen Room",
    58: "Nort Mountain Rest Area", 59: "Nort Mountain Entrance", 60: "Nort Mountain Cave",
    61: "Nort Mountain 8th Station", 62: "Nort Mountain Summit", 63: "Nort Mountain 5th Station",
    64: "Walse", 65: "Walse House", 66: "Walse Weapon Shop", 67: "Walse Inn",
    68: "Walse Magic Shop", 69: "Walse Armor Shop", 70: "Walse", 71: "Sea Floor",
    72: "Castle Tycoon", 73: "Castle Tycoon 1F", 74: "Castle Tycoon 1F", 75: "Castle Tycoon 2F",
    76: "Castle Tycoon Throne Room", 77: "Castle Tycoon King's Chamber", 78: "Castle Tycoon Lenna's Room",
    79: "Castle Tycoon Room", 80: "Castle Tycoon 3F", 81: "Castle Tycoon 4F", 82: "Castle Tycoon 5F",
    83: "Castle Tycoon Storehouse", 84: "Castle Tycoon East Tower", 85: "Castle Tycoon Storehouse",
    86: "Castle Tycoon Jail", 87: "Karnak Castle B5", 88: "Castle Tycoon Wind Drake Tower",
    89: "Castle Walse", 90: "Castle Walse 2F", 91: "Castle Walse B1", 92: "Castle Walse",
    93: "Watertower 1F", 94: "Watertower 2F", 95: "Watertower 3F", 96: "Watertower 4F",
    97: "Castle Walse 2F", 98: "Castle Walse Throne Room", 99: "Castle Walse King's Chamber",
    100: "Castle Walse", 101: "Castle Walse Storehouse", 102: "Castle Walse 3F",
    103: "Castle Walse 1F", 104: "Castle Walse 3F", 105: "Ghido's Cave Ocean",
    106: "Tower of Walse 1F", 107: "Tower of Walse 2F", 108: "Tower of Walse 3F",
    109: "Tower of Walse 4F", 110: "Tower of Walse 5F", 111: "Tower of Walse 6F",
    112: "Tower of Walse 7F", 113: "Tower of Walse 8F", 114: "Tower of Walse 9F",
    115: "Tower of Walse Crystal Chamber", 116: "Inside the Void", 117: "Syldra (Walse Ocean)",
    118: "Syldra (Walse Beach)", 119: "Walse Meteorite", 120: "Inside Walse Meteorite",
    121: "Inside Walse Meteorite", 122: "Tycoon Meteorite", 123: "Inside Tycoon Meteorite",
    124: "The Rift Cave", 125: "Karnak Meteorite", 126: "Inside Karnak Meteorite",
    127: "Inside Karnak Meteorite", 128: "Gohn Meteorite", 129: "Inside Gohn Meteorite",
    130: "Inside Gohn Meteorite",
    131: "Karnak Castle", 132: "Karnak Castle 1F", 133: "Karnak Castle Queen's Chamber",
    134: "Karnak Castle 2F", 135: "Karnak Castle B1", 136: "Karnak Castle B2",
    137: "Karnak Castle B3", 138: "Karnak Castle B4", 139: "Karnak Castle 2F",
    140: "Karnak Castle 1F", 141: "Karnak Castle B1", 142: "Karnak Castle 2F",
    143: "Karnak Castle 1F", 144: "Karnak Castle B1", 145: "Karnak Castle Crystal Chamber",
    146: "Karnak Castle B6",
    147: "Karnak", 148: "Karnak Pub", 149: "Karnak Inn", 150: "Karnak Magic Shop",
    151: "Karnak House", 152: "Karnak Equipment Shop", 153: "Karnak Room 2F",
    154: "Fire-Powered Ship Bulkhead", 155: "Fire-Powered Ship Bulkhead",
    156: "Above Deck", 157: "Fire-Powered Ship Below Deck",
    158: "Fire-Powered Ship Bulkhead", 159: "Fire-Powered Ship Bulkhead",
    160: "Fire-Powered Ship Bulkhead", 161: "Fire-Powered Ship Bulkhead",
    162: "Fire-Powered Ship Boiler Room", 163: "Karnak Crystals",
    164: "Library of the Ancients", 165: "Library of the Ancients B1",
    166: "Library of the Ancients B1", 167: "Library of the Ancients B1",
    168: "Library of the Ancients B1", 169: "Library of the Ancients 2F",
    170: "Istory", 171: "Istory Inn", 172: "Istory Items Shop",
    173: "Istory Armor Shop", 174: "Istory Magic Shop", 175: "Library of the Ancients Roof",
    176: "Jachol", 177: "Jachol Magic Shop", 178: "Jachol Inn",
    179: "Jachol Equipment Shop", 180: "Jachol Pub", 181: "Jachol Items Shop",
    182: "Jachol Cave B1", 183: "Jachol Cave B2",
    184: "Crescent", 185: "Crescent Armor Shop", 186: "Crescent Weapons Shop",
    187: "Minstrel's House", 188: "Crescent Magic Shop", 189: "Crescent Inn",
    190: "Airship", 191: "Black Chocobo Forest",
    192: "Catapult Passageway", 193: "Catapult Passageway", 194: "Catapult Living Quarters",
    195: "Ronka Ruins Lv1", 196: "Ronka Ruins Lv2", 197: "Ronka Ruins Lv3", 198: "Ronka Ruins Lv2",
    199: "Desert of Shifting Sands",
    200: "Lix", 201: "Lix Magic Shop", 202: "Lix Butz's House", 203: "Lix Inn",
    204: "Lix Item Shop", 205: "Lix Equipment Shop",
    206: "Gohn Town of Ruin", 207: "Fire-Powered Ship Elevator", 208: "Fire-Powered Ship Elevator",
    209: "Fire-Powered Ship Elevator", 210: "Catapult Storeroom", 211: "Catapult",
    212: "Guardian Tree", 213: "Gohn B1", 214: "Gohn B1",
    215: "Ronka Ruins Lv4", 216: "Ronka Ruins Lv5", 217: "Ronka Ruins Lv4", 218: "Ronka Ruins Lv5",
    219: "Ronka Ruins Lv4", 220: "Ronka Ruins Crystal Chamber", 221: "Ronka Ruins Flying Fortress",
    222: "Catapult", 223: "Deserted Island",
    224: "Castle Exdeath Air Projection", 225: "Castle Exdeath", 226: "Castle Exdeath B3",
    227: "Castle Exdeath 2F", 228: "Castle Exdeath 3F", 229: "Castle Exdeath 1F",
    230: "Castle Exdeath B1", 231: "Castle Exdeath B2", 232: "Outside Castle Exdeath",
    233: "Castle Exdeath", 234: "Castle Exdeath B3", 235: "Castle Exdeath 2F",
    236: "Castle Exdeath 3F", 237: "Castle Exdeath 1F", 238: "Castle Exdeath B1",
    239: "Castle Exdeath B2", 240: "Castle Exdeath 4F", 241: "Castle Exdeath 5F",
    242: "Castle Exdeath 6F", 243: "Castle Exdeath 7F", 244: "Castle Exdeath 8F",
    245: "Castle Exdeath 9F", 246: "Interdimensional Warp",
    247: "Regole", 248: "Regole Pub", 249: "Regole Magic Shop", 250: "Regole Items Shop",
    251: "Regole Equipment Shop", 252: "Regole Inn", 253: "Moogle Forest",
    254: "Ronka Ruins Exdeath Appears", 255: "Castle Exdeath Keep",
    256: "Castle Exdeath Keep", 257: "Castle Exdeath Keep", 258: "Castle Exdeath Keep",
    259: "Underground Waterway", 260: "Underground Waterway",
    261: "Moogle Village", 262: "Moogle Village House",
    263: "Castle Exdeath 1F", 264: "Castle Exdeath 1F",
    265: "Castle of Bal", 266: "Castle of Bal Inn", 267: "Castle of Bal 1F",
    268: "Castle of Bal 2F", 269: "Castle of Bal 1F", 270: "Castle of Bal Throne Room",
    271: "Castle of Bal 3F", 272: "Castle of Bal 4F", 273: "Castle of Bal B1",
    274: "Castle of Bal", 275: "Moogle Village Sky", 276: "Castle Exdeath",
    277: "Great Sea Trench", 278: "Kingdom of Dwarves", 279: "Dwarven Armor Shop",
    280: "Castle of Bal B2",
    281: "Quelb", 282: "Kelger's House 1F", 283: "Kelger's House 2F",
    284: "Quelb Inn", 285: "Quelb Equipment Shop", 286: "Quelb Magic Shop",
    287: "Istory Falls B6", 288: "Drakenvale Shack", 289: "Exdeath Tomb",
    290: "Barrier Tower", 291: "Drakenvale Trail", 292: "Drakenvale Trail",
    293: "Drakenvale Trail", 294: "Drakenvale Trail", 295: "Drakenvale Cave", 296: "Drakenvale Cave",
    297: "Guardian Tree", 298: "Ghido's Cave Entrance",
    299: "Surgate Castle", 300: "Surgate Castle Throne Room", 301: "Surgate Castle King's Chamber",
    302: "Surgate Castle B1", 303: "Surgate Castle B2", 304: "Surgate Castle 3F",
    305: "Surgate Castle Library", 306: "Surgate Castle Library",
    307: "Kuza Sealed Castle", 308: "Kuza Sealed Castle", 309: "Kuza Sealed Castle", 310: "Sealed Room",
    311: "Tower of Walse Crystal Chamber", 312: "Tower of Walse 9F", 313: "Tower of Walse 8F",
    314: "Big Bridge", 315: "Big Bridge", 316: "Big Bridge", 317: "Kingdom of Dwarves House",
    318: "Great Sea Trench", 319: "Kuza Sealed Castle", 320: "Kuza Sealed Castle",
    321: "Kuza Sealed Castle", 322: "Sealed Room",
    323: "Tower of Walse 7F", 324: "Tower of Walse 6F", 325: "Tower of Walse 5F",
    326: "Xezat's Fleet", 327: "Xezat's Fleet Below Deck",
    328: "Barrier Tower 2F", 329: "Barrier Tower 2F", 330: "Sea Floor",
    331: "Barrier Tower 1F", 332: "Barrier Tower B1", 333: "Barrier Tower Antenna",
    334: "Barrier Tower 3F", 335: "Barrier Tower 4F", 336: "Barrier Tower 5F",
    337: "Barrier Tower 6F", 338: "Barrier Tower 7F", 339: "Barrier Tower 8F",
    340: "Barrier Tower 9F", 341: "Barrier Tower 10F", 342: "Barrier Tower",
    343: "Submarine", 344: "Sea Floor",
    345: "Ghido's Cave B2", 346: "Ghido's Cave B3", 347: "Ghido's Cave B4", 348: "Ghido's Cave B5",
    349: "Island Shrine 6F",
    350: "Moore", 351: "Moore Magic Shop", 352: "Moore Weapons Shop",
    353: "Moore Armor Shop", 354: "Moore Inn", 355: "Moore Pub",
    356: "Great Forest of Moore", 357: "Great Forest of Moore", 358: "Moogle Cave",
    359: "Great Forest of Moore", 360: "Guardian Tree Inside", 361: "Gil Cave",
    362: "Great Forest of Moore", 363: "Great Forest of Moore", 364: "Guardian Tree",
    365: "Guardian Tree Inside", 366: "Great Forest of Moore",
    367: "Island Shrine 3F", 368: "Island Shrine 4F", 369: "Island Shrine 5F",
    370: "Death Valley", 371: "Antlion's Nest", 372: "?",
    373: "Pyramid Inside", 374: "Pyramid Inside", 375: "Pyramid Inside", 376: "Pyramid Inside",
    377: "Pyramid Inside", 378: "Pyramid of Moore", 379: "Pyramid Inside",
    380: "Pyramid Inside", 381: "Pyramid Inside", 382: "Pyramid Inside",
    383: "Pyramid Inside", 384: "Pyramid Inside", 385: "Pyramid Inside", 386: "Pyramid Inside",
    387: "Island Shrine", 388: "Island Shrine", 389: "Island Shrine",
    390: "Island Shrine 2F", 391: "Island Shrine", 392: "Island Shrine 7F",
    393: "Fork Tower Entrance", 394: "Fork Tower Black Tower",
    395: "Black Tower 2F", 396: "Black Tower 3F", 397: "Black Tower 4F",
    398: "Black Tower 5F", 399: "Black Tower 6F", 400: "Fork Tower Black Tower",
    401: "Black Tower 7F", 402: "Black Tower 8F", 403: "Black Tower 9F",
    404: "Fork Tower White Tower", 405: "White Tower 2F", 406: "White Tower 3F",
    407: "White Tower 4F", 408: "White Tower 5F", 409: "White Tower 6F",
    410: "Fork Tower White Tower", 411: "White Tower 7F", 412: "White Tower 8F", 413: "White Tower 9F",
    414: "Great Sea Trench", 415: "Great Sea Trench", 416: "Great Sea Trench",
    417: "Great Sea Trench", 418: "Great Sea Trench", 419: "Great Sea Trench",
    420: "Great Sea Trench", 421: "Great Sea Trench",
    422: "Istory Falls B1", 423: "Istory Falls B2", 424: "Istory Falls B3",
    425: "Istory Falls B4", 426: "Istory Falls B5", 427: "Istory Falls B6",
    428: "Sea Floor", 429: "Istory Falls B4",
    430: "Tower of Walse 4F", 431: "Tower of Walse 3F", 432: "Tower of Walse 2F", 433: "Tower of Walse 1F",
    434: "Phoenix Tower 1F", 435: "Phoenix Tower 2F", 436: "Phoenix Tower 3F",
    437: "Phoenix Tower 4F", 438: "Phoenix Tower 5F", 439: "Phoenix Tower 6F",
    440: "Phoenix Tower 7F", 441: "Phoenix Tower 8F", 442: "Phoenix Tower 9F",
    443: "Phoenix Tower 10F", 444: "Phoenix Tower 11F", 445: "Phoenix Tower 12F",
    446: "Phoenix Tower 13F", 447: "Phoenix Tower 14F", 448: "Phoenix Tower 15F",
    449: "Phoenix Tower 16F", 450: "Phoenix Tower 17F", 451: "Phoenix Tower 18F",
    452: "Phoenix Tower 19F", 453: "Phoenix Tower 20F", 454: "Phoenix Tower 21F",
    455: "Phoenix Tower 22F", 456: "Phoenix Tower 23F", 457: "Phoenix Tower 24F",
    458: "Phoenix Tower 25F", 459: "Phoenix Tower 26F", 460: "Phoenix Tower 27F",
    461: "Phoenix Tower 28F", 462: "Phoenix Tower 29F", 463: "Phoenix Tower 30F",
    464: "Castle Tycoon", 465: "Castle Tycoon",
    466: "Mirage Town", 467: "Mirage Town House", 468: "Mirage Town Weapons Shop",
    469: "Mirage Town Inn", 470: "Mirage Town Items Shop",
    471: "Mirage Town B1", 472: "Mirage Town Secret Passage", 473: "Mirage Town Pub",
    474: "Mirage Town Armor Shop", 475: "Mirage Town Magic Shop",
    476: "The Void Desert", 477: "The Void Ruins", 478: "The Void Ruins",
    479: "The Void Ruins", 480: "The Void Ruins",
    481: "The Void Mirage Town", 482: "The Void Mirage Town", 483: "The Void Mirage Town",
    484: "The Void Mirage Town", 485: "The Void Mirage Town", 486: "The Void Mirage Town",
    487: "The Void Mirage Town", 488: "The Void Mirage Town",
    489: "The Void Forest", 490: "The Void Cave", 491: "The Void Cave", 492: "The Void Cave",
    493: "The Void Library", 494: "The Void Tower",
    495: "The Void Dimension Castle", 496: "The Void Dimension Castle",
    497: "The Void Dimension Castle", 498: "The Void Dimension Castle",
    499: "The Void Dimension Castle", 500: "The Void Dimension Castle",
    501: "The Void Dimension Castle", 502: "The Void Dimension Castle",
    503: "The Void Dimension Castle",
    504: "The Void Last Floor", 505: "The Void Last Floor", 506: "The Void Last Floor",
    507: "The Void Last Floor", 508: "The Void Last Floor", 509: "The Void Last Floor",
    510: "Space part 2", 511: "Space part 1",
}

# Known trigger names from the JSON stringTable
TRIGGER_NAMES = {17: "Tent", 18: "Cabin", 255: "Save Point"}

DIRECTION_NAMES = {0: "Up", 1: "Right", 2: "Down", 3: "Left"}
COMPARE_NAMES = {0: "Equal", 1: "Greater", 2: "Less"}


def parse_trigger_script(rom, start, end):
    """Parse a single trigger script and extract all conditions + actions."""
    info = {
        'eventSwitches': [],    # (switch_id, "checkON"/"checkOFF")
        'events': [],           # event script IDs executed
        'buttonPress': False,   # has $F6 opcode
        'directions': [],       # facing direction conditions
        'ramChecks': [],        # RAM-based conditions (for completeness)
    }

    i = start
    while i < end:
        b = rom[i]

        if b == 0xF0:  # End of script
            break

        elif b == 0xF5 and i + 4 < end:
            # RAM Bool 2-byte: addr(14-bit) + mask(16-bit)
            ram_addr = (rom[i+1] | (rom[i+2] << 8)) & 0x3FFF
            mask = rom[i+3] | (rom[i+4] << 8)
            info['ramChecks'].append({
                'type': 'ramBool2', 'address': f"${ram_addr + 0x0500:04X}", 'mask': f"0x{mask:04X}"
            })
            i += 5

        elif b == 0xF6:
            # If Button Pressed
            info['buttonPress'] = True
            i += 1

        elif b == 0xF7 and i + 1 < end:
            # If Facing Direction
            direction = rom[i+1] & 0x03
            info['directions'].append(DIRECTION_NAMES.get(direction, str(direction)))
            i += 2

        elif b == 0xF8 and i + 3 < end:
            # RAM Bool 1-byte: addr(14-bit) + mask(8-bit)
            ram_addr = (rom[i+1] | (rom[i+2] << 8)) & 0x3FFF
            mask = rom[i+3]
            info['ramChecks'].append({
                'type': 'ramBool1', 'address': f"${ram_addr + 0x0500:04X}", 'mask': f"0x{mask:02X}"
            })
            i += 4

        elif b == 0xF9 and i + 4 < end:
            # RAM Compare 2-byte: addr(14-bit), compare(2-bit), value(16-bit)
            raw = rom[i+1] | (rom[i+2] << 8)
            ram_addr = raw & 0x3FFF
            compare = (rom[i+2] >> 6) & 0x03
            value = rom[i+3] | (rom[i+4] << 8)
            info['ramChecks'].append({
                'type': 'ramCmp2', 'address': f"${ram_addr + 0x0500:04X}",
                'compare': COMPARE_NAMES.get(compare, str(compare)), 'value': value
            })
            i += 5

        elif b == 0xFA and i + 3 < end:
            # RAM Compare 1-byte: addr(14-bit), compare(2-bit), value(8-bit)
            raw = rom[i+1] | (rom[i+2] << 8)
            ram_addr = raw & 0x3FFF
            compare = (rom[i+2] >> 6) & 0x03
            value = rom[i+3]
            info['ramChecks'].append({
                'type': 'ramCmp1', 'address': f"${ram_addr + 0x0500:04X}",
                'compare': COMPARE_NAMES.get(compare, str(compare)), 'value': value
            })
            i += 4

        elif 0xFB <= b <= 0xFE and i + 1 < end:
            # If Switch On/Off: bank = (op-$FB)>>1, polarity = (op-$FB)&1
            # JSON: 0=On, 1=Off (condition: check if switch IS in this state)
            bank = (b - 0xFB) >> 1
            polarity = (b - 0xFB) & 1
            switch_id = bank * 256 + rom[i+1]
            state = "checkON" if polarity == 0 else "checkOFF"
            info['eventSwitches'].append({'id': switch_id, 'condition': state})
            i += 2

        elif b == 0xFF and i + 2 < end:
            # Execute Event
            event_id = rom[i+1] | (rom[i+2] << 8)
            info['events'].append(event_id)
            i += 3

        else:
            # Unknown or we've hit non-trigger data — stop parsing
            break

    return info


def parse_event_triggers(rom):
    """Parse the event triggers table ($CE2400/$CE2800) to build
    trigger_script_id -> [(map_id, x, y), ...] reverse map."""
    et_ptr_table = snes_to_file(0xCE2400)
    et_data_base = snes_to_file(0xCE2400)  # pointers offset from $CE2400

    # Read pointer table (511 maps + 1 end pointer = 512 entries)
    et_ptrs = []
    for i in range(NUM_MAPS + 1):
        offset = et_ptr_table + i * 2
        ptr = rom[offset] | (rom[offset+1] << 8)
        et_ptrs.append(ptr)

    trigger_to_maps = {}  # trigger_script_id -> [(map_id, map_name, x, y), ...]

    for map_id in range(NUM_MAPS):
        data_start = et_data_base + et_ptrs[map_id]
        data_end = et_data_base + et_ptrs[map_id + 1]

        i = data_start
        while i + 3 < data_end:
            x = rom[i]
            y = rom[i+1]
            trigger_id = rom[i+2] | (rom[i+3] << 8)
            i += 4

            if trigger_id not in trigger_to_maps:
                trigger_to_maps[trigger_id] = []
            map_name = MAP_NAMES.get(map_id, f"Map {map_id}")
            trigger_to_maps[trigger_id].append({
                'mapId': map_id, 'mapName': map_name, 'x': x, 'y': y
            })

    return trigger_to_maps


def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()
    print(f"ROM size: {len(rom)} bytes (0x{len(rom):X})")

    # ── Parse event triggers for map placement data ──
    print("Parsing event triggers for map placements...")
    trigger_to_maps = parse_event_triggers(rom)
    placed_count = sum(1 for tid in range(NUM_TRIGGER_SCRIPTS) if tid in trigger_to_maps)
    print(f"  {placed_count} trigger scripts have map placements")

    # ── Read trigger script pointer table ──
    # Ptr table: $D8E080-$D8E600, 2-byte LE, offset from $D8E080
    # Data: $D8E600-$D8FFA8
    ts_ptr_table = snes_to_file(0xD8E080)
    ts_data_base = snes_to_file(0xD8E080)

    ts_ptrs = []
    for i in range(NUM_TRIGGER_SCRIPTS):
        offset = ts_ptr_table + i * 2
        ptr = rom[offset] | (rom[offset+1] << 8)
        ts_ptrs.append(ptr)

    # ── Parse each trigger script ──
    print("Parsing trigger scripts...")
    json_triggers = []
    stats = {'switches': 0, 'events': 0, 'buttons': 0, 'placed': 0, 'directions': 0, 'ram': 0}

    for tid in range(NUM_TRIGGER_SCRIPTS):
        file_start = ts_data_base + ts_ptrs[tid]
        if tid + 1 < NUM_TRIGGER_SCRIPTS:
            file_end = ts_data_base + ts_ptrs[tid + 1]
        else:
            file_end = snes_to_file(0xD8FFA8)

        # SNES address for display
        snes_addr = 0xD8E080 + ts_ptrs[tid]

        info = parse_trigger_script(rom, file_start, file_end)
        size = file_end - file_start

        entry = {
            'id': tid,
            'address': f"${snes_addr:06X}",
            'size': size,
        }

        # Named triggers from JSON stringTable
        if tid in TRIGGER_NAMES:
            entry['name'] = TRIGGER_NAMES[tid]

        # 1. Event switches checked
        if info['eventSwitches']:
            entry['eventSwitches'] = info['eventSwitches']
            stats['switches'] += 1

        # 2. Events executed
        if info['events']:
            entry['events'] = info['events']
            stats['events'] += 1

        # 3. Button press
        if info['buttonPress']:
            entry['buttonPress'] = True
            stats['buttons'] += 1

        # 4. Map placements (from event triggers table)
        if tid in trigger_to_maps:
            entry['mapPlacements'] = trigger_to_maps[tid]
            stats['placed'] += 1

        # Bonus: direction checks
        if info['directions']:
            entry['directions'] = info['directions']
            stats['directions'] += 1

        # Bonus: RAM checks
        if info['ramChecks']:
            entry['ramChecks'] = info['ramChecks']
            stats['ram'] += 1

        json_triggers.append(entry)

    # ── Write JSON ──
    output = {
        'game': 'FFV',
        'version': 'RPGe',
        'triggerScriptCount': NUM_TRIGGER_SCRIPTS,
        'triggerScripts': json_triggers,
    }
    json_path = r"C:\Users\J4cks\Desktop\work5\crawler\trigger_scripts_0-703.json"
    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(output, f, indent=2, ensure_ascii=False)

    print(f"\nJSON written to {json_path}")
    print(f"\nStats across {NUM_TRIGGER_SCRIPTS} trigger scripts:")
    print(f"  {stats['switches']} check Event Switches")
    print(f"  {stats['events']} execute Events")
    print(f"  {stats['buttons']} check Button Press")
    print(f"  {stats['placed']} have map placements (from event triggers table)")
    print(f"  {stats['directions']} check Facing Direction")
    print(f"  {stats['ram']} have RAM checks")


if __name__ == '__main__':
    main()
