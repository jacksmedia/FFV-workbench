"""Parse FFV entrance triggers to produce a map connectivity JSON.
511 map sets at $CE3AC0, pointer table at $CE36C0.
Each trigger: 6 bytes (srcX, srcY, destMap+flags, destX/Y+direction)."""
import json

ROM_PATH = r"C:\Users\J4cks\Desktop\work5\crawler\_FFV RPGe (CRC32 = 17444605).sfc"
HEADER = 0
NUM_MAPS = 511  # 511 sets in the pointer table (maps 0-510; map 511 has no data)

def snes_to_file(addr):
    return (addr & 0x3FFFFF) + HEADER

# Map names (reused from prior scripts)
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

DIRECTION_NAMES = {0: "Up", 1: "Right", 2: "Down", 3: "Left"}


def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()
    print(f"ROM size: {len(rom)} bytes")

    # Read entrance trigger pointer table
    ptr_table = snes_to_file(0xCE36C0)
    data_base = snes_to_file(0xCE36C0)

    ptrs = []
    for i in range(NUM_MAPS + 1):  # 512 entries (511 maps + end pointer)
        offset = ptr_table + i * 2
        ptr = rom[offset] | (rom[offset+1] << 8)
        ptrs.append(ptr)

    # Parse all entrance triggers per map
    total_triggers = 0
    maps_with_exits = 0
    all_map_entries = []  # one entry per source map

    for map_id in range(NUM_MAPS):
        data_start = data_base + ptrs[map_id]
        data_end = data_base + ptrs[map_id + 1]
        src_name = MAP_NAMES.get(map_id, f"Map {map_id}")

        triggers = []
        i = data_start
        while i + 5 <= data_end:
            src_x = rom[i]
            src_y = rom[i+1]
            raw23 = rom[i+2] | (rom[i+3] << 8)
            dest_map = raw23 & 0x03FF
            show_title = bool(rom[i+3] & 0x20)
            set_parent = bool(rom[i+3] & 0x40)
            unknown_flag = bool(rom[i+3] & 0x80)

            dest_name = MAP_NAMES.get(dest_map, f"Map {dest_map}")

            # Destination coordinates depend on whether target is a world map
            if dest_map < 5:
                # World map: full 8-bit X and Y
                dest_x = rom[i+4]
                dest_y = rom[i+5]
                direction = None
            else:
                # Dungeon: 6-bit X/Y + 2-bit direction
                dest_x = rom[i+4] & 0x3F
                dest_y = rom[i+5] & 0x3F
                direction = (rom[i+4] >> 6) & 0x03

            trigger = {
                'srcX': src_x,
                'srcY': src_y,
                'destMapId': dest_map,
                'destMapName': dest_name,
                'destX': dest_x,
                'destY': dest_y,
            }
            if direction is not None:
                trigger['direction'] = DIRECTION_NAMES.get(direction, str(direction))
            if show_title:
                trigger['showTitle'] = True
            if set_parent:
                trigger['setParent'] = True
            if unknown_flag:
                trigger['unknownFlag'] = True

            triggers.append(trigger)
            i += 6

        total_triggers += len(triggers)
        if triggers:
            maps_with_exits += 1

        map_entry = {
            'mapId': map_id,
            'mapName': src_name,
            'entranceCount': len(triggers),
        }
        if triggers:
            map_entry['entrances'] = triggers
        all_map_entries.append(map_entry)

    # Write JSON
    output = {
        'game': 'FFV',
        'version': 'RPGe',
        'mapCount': NUM_MAPS,
        'totalEntranceTriggers': total_triggers,
        'mapsWithExits': maps_with_exits,
        'maps': all_map_entries,
    }

    json_path = r"C:\Users\J4cks\Desktop\work5\crawler\entrance_triggers_0-510.json"
    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(output, f, indent=2, ensure_ascii=False)

    print(f"\nJSON written to {json_path}")
    print(f"Total entrance triggers: {total_triggers}")
    print(f"Maps with exits: {maps_with_exits} / {NUM_MAPS}")

    # Show some samples
    print(f"\n=== Samples ===")
    for me in all_map_entries:
        if me['entranceCount'] > 0 and me['entranceCount'] <= 4:
            print(f"\n  Map {me['mapId']}: {me['mapName']} ({me['entranceCount']} exits)")
            for t in me['entrances']:
                flags = []
                if t.get('showTitle'): flags.append('title')
                if t.get('setParent'): flags.append('parent')
                dir_str = f" facing {t['direction']}" if 'direction' in t else ""
                flag_str = f" [{','.join(flags)}]" if flags else ""
                print(f"    ({t['srcX']},{t['srcY']}) -> {t['destMapName']} ({t['destX']},{t['destY']}){dir_str}{flag_str}")
            break
    # Show a bigger map
    for me in all_map_entries:
        if me['entranceCount'] >= 6:
            print(f"\n  Map {me['mapId']}: {me['mapName']} ({me['entranceCount']} exits)")
            for t in me['entrances'][:6]:
                flags = []
                if t.get('showTitle'): flags.append('title')
                if t.get('setParent'): flags.append('parent')
                dir_str = f" facing {t['direction']}" if 'direction' in t else ""
                flag_str = f" [{','.join(flags)}]" if flags else ""
                print(f"    ({t['srcX']},{t['srcY']}) -> {t['destMapName']} ({t['destX']},{t['destY']}){dir_str}{flag_str}")
            if me['entranceCount'] > 6:
                print(f"    ... and {me['entranceCount'] - 6} more")
            break


if __name__ == '__main__':
    main()
