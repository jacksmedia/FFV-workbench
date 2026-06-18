"""Extract names for FFV event scripts from ROM data.
v4: Adds JSON output alongside text output."""
import struct, sys, json

ROM_PATH = r"C:\Users\J4cks\Desktop\work5\crawler\_FFV RPGe (CRC32 = 17444605).sfc"
HEADER = 0  # no header, file is exactly 0x280000

NUM_EVENTS = 1940     # all event scripts
MAX_EVENTS = 1940
NUM_NPC_SCRIPTS = 922

def snes_to_file(addr):
    """Convert SNES HiROM address to file offset."""
    return (addr & 0x3FFFFF) + HEADER

# ── Character decoding table (FFV RPGe text encoding) ───────────────
CHAR_TABLE = {}
for i in range(10):
    CHAR_TABLE[0x53 + i] = str(i)
for i in range(26):
    CHAR_TABLE[0x60 + i] = chr(ord('A') + i)
for i in range(26):
    CHAR_TABLE[0x7A + i] = chr(ord('a') + i)
# DTE pairs
CHAR_TABLE[0x94] = 'il'; CHAR_TABLE[0x95] = 'it'; CHAR_TABLE[0x97] = 'li'
CHAR_TABLE[0x98] = 'll'; CHAR_TABLE[0xA4] = 'ti'; CHAR_TABLE[0xA5] = 'fi'
CHAR_TABLE[0xAC] = 'if'; CHAR_TABLE[0xAD] = 'It'; CHAR_TABLE[0xAE] = 'tl'
CHAR_TABLE[0xAF] = 'ir'; CHAR_TABLE[0xB0] = 'tt'
# Punctuation & symbols
CHAR_TABLE[0x96] = ' '; CHAR_TABLE[0xFF] = ' '; CHAR_TABLE[0x99] = "'"
CHAR_TABLE[0x9B] = ':'; CHAR_TABLE[0x9D] = ','; CHAR_TABLE[0x9E] = '('
CHAR_TABLE[0x9F] = ')'; CHAR_TABLE[0xA0] = '/'; CHAR_TABLE[0xA1] = '!'
CHAR_TABLE[0xA2] = '?'; CHAR_TABLE[0xA3] = '.'; CHAR_TABLE[0xC5] = '-'
CHAR_TABLE[0xC7] = '...'; CHAR_TABLE[0xCF] = ':'; CHAR_TABLE[0xE2] = '+'
# Control codes
CTRL_NEWLINE = 0x01
CTRL_CHAR_NAME = {0x02: 'Bartz', 0x03: 'Lenna', 0x04: 'Galuf', 0x05: 'Faris', 0x06: 'Krile'}
CTRL_NULL = 0x00; CTRL_DELAY = 0x0C; CTRL_PAGE = 0x0F; CTRL_WAIT = 0x17

# ── Map name lookup table (from ff5u-sfc.json mapProperties.stringTable) ──
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

def get_map_name(map_id):
    return MAP_NAMES.get(map_id, f"Map {map_id}")


# ── Opcode length table for event script parsing ────────────────────
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
    if op <= 0xCB: return 3       # NPC switch
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


def decode_dialog(rom, dialog_id, max_chars=40):
    """Read dialog text from ROM and decode to ASCII string."""
    ptr_table_offset = snes_to_file(0xE013F0)
    ptr_addr = ptr_table_offset + dialog_id * 3
    if ptr_addr + 3 > len(rom):
        return None
    ptr_bytes = rom[ptr_addr:ptr_addr+3]
    text_snes = ptr_bytes[0] | (ptr_bytes[1] << 8) | (ptr_bytes[2] << 16)
    text_offset = snes_to_file(text_snes)
    if text_offset >= len(rom) or text_offset < 0:
        return None
    result = []
    char_count = 0
    i = text_offset
    while i < len(rom) and char_count < max_chars:
        b = rom[i]
        if b == CTRL_NULL: break
        if b == CTRL_NEWLINE:
            result.append(' '); char_count += 1; i += 1; continue
        if b in CTRL_CHAR_NAME:
            name = CTRL_CHAR_NAME[b]; result.append(name); char_count += len(name); i += 1; continue
        if b in (CTRL_DELAY, CTRL_PAGE): i += 1; continue
        if b == CTRL_WAIT: i += 2; continue
        if b in (0x10, 0x11, 0x12): i += 1; continue
        if b in CHAR_TABLE:
            s = CHAR_TABLE[b]; result.append(s); char_count += len(s); i += 1; continue
        i += 1
    text = ''.join(result).strip()
    while '  ' in text: text = text.replace('  ', ' ')
    if len(text) > max_chars: text = text[:max_chars]
    return text


def parse_event(rom, event_start, event_end):
    """Walk through event script and extract structured info including switch details."""
    i = event_start
    max_search = min(event_end, event_start + 2048)
    info = {
        'dialogs': [],          # (dialog_id, type)
        'maps': [],             # map_id list
        'calls': [],            # subroutine IDs
        'battles': [],          # battle IDs
        'shops': [],            # shop IDs
        'inns': [],             # inn prices
        'event_switches': [],   # (switch_id, 'ON'/'OFF')  *** NEW
        'npc_switches': [],     # (switch_id, 'ON'/'OFF')  *** NEW
        'has_obj': False,
        'has_party': False,
        'has_item': False,
        'has_sound': False,
        'has_fade': False,
        'has_battle_switch': False,
        'has_cutscene': None,
        'size': event_end - event_start,
    }

    while i < max_search:
        op = rom[i]
        if op == 0xFF:
            break

        if op <= 0x6F:
            info['has_party'] = True
        elif 0x80 <= op <= 0x9F:
            info['has_obj'] = True
        elif op == 0xA0 and i + 1 < len(rom):
            dialog_offset = rom[i+1] + 1
            info['dialogs'].append((dialog_offset, 'npc'))
        elif op == 0xA1 and i + 1 < len(rom):
            shop_id = rom[i+1] & 0x3F
            info['shops'].append(shop_id)

        # ─── Event Switches ($A2-$A5) ───
        # JSON: polarity = (op - $A2) & 1 → 0=On, 1=Off
        # Bank = (op - $A2) >> 1 → 0=bank0(0-255), 1=bank1(256-511)
        elif op in (0xA2, 0xA3, 0xA4, 0xA5) and i + 1 < len(rom):
            param = rom[i+1]
            bank = (op - 0xA2) >> 1       # 0 or 1
            polarity = (op - 0xA2) & 1    # 0=On, 1=Off
            switch_id = bank * 256 + param
            state = 'ON' if polarity == 0 else 'OFF'
            info['event_switches'].append((switch_id, state))

        elif op in (0xA6, 0xA7):
            info['has_battle_switch'] = True
        elif op in (0xAA, 0xAB):
            info['has_item'] = True
        elif op == 0xAD and i + 1 < len(rom):
            price = (rom[i+1] + 1) * 10
            info['inns'].append(price)
        elif op in (0xB4, 0xB5):
            info['has_sound'] = True
        elif op == 0xB6 and i + 1 < len(rom):
            info['has_cutscene'] = rom[i+1]
        elif op in (0xBD, 0xE2, 0xE8) and i + 1 < len(rom):
            battle = rom[i+1] | ((rom[i+2] << 8) if op != 0xE8 else 0)
            info['battles'].append(battle & 0x1FF)
        elif op in (0xC3, 0xC4):
            info['has_fade'] = True
        elif op == 0xC8 and i + 2 < len(rom):
            dialog_id = (rom[i+1] | (rom[i+2] << 8)) & 0x7FFF
            info['dialogs'].append((dialog_id, 'dialog'))

        # ─── NPC Switches ($CA=On, $CB=Off) ───
        # 3 bytes total: opcode + 2-byte LE switch_id (mask 0x03FF)
        elif op in (0xCA, 0xCB) and i + 2 < len(rom):
            switch_id = (rom[i+1] | (rom[i+2] << 8)) & 0x03FF
            state = 'ON' if op == 0xCA else 'OFF'
            info['npc_switches'].append((switch_id, state))

        elif op == 0xCD and i + 2 < len(rom):
            sub = rom[i+1] | (rom[i+2] << 8)
            info['calls'].append(sub)
        elif op in (0xE0, 0xE1, 0xE3) and i + 2 < len(rom):
            map_id = (rom[i+1] | (rom[i+2] << 8)) & 0x01FF
            info['maps'].append(map_id)
        elif op == 0xF0 and i + 2 < len(rom):
            dialog_id = (rom[i+1] | (rom[i+2] << 8)) & 0x7FFF
            info['dialogs'].append((dialog_id, 'yesno'))

        length = get_opcode_length(op)
        if length <= 0: break
        i += length

    return info


def parse_npc_scripts(rom):
    """Parse all 922 NPC scripts and build reverse reference: event_id -> [npc_script_ids].
    NPC script pointer table: $CE0000 (2-byte LE pointers within bank $CE).
    NPC script data: $CE0740-$CE2294.
    NPC script opcodes: $F0=end, $F5-$FE=conditions, $FF xx xx=Execute Event."""
    npc_ptr_table = snes_to_file(0xCE0000)
    npc_data_base = snes_to_file(0xCE0000)  # pointers are offsets within bank $CE

    # Read all pointers
    npc_ptrs = []
    for i in range(NUM_NPC_SCRIPTS):
        offset = npc_ptr_table + i * 2
        ptr = rom[offset] | (rom[offset+1] << 8)
        npc_ptrs.append(ptr)

    # Build reverse map: event_id -> [list of npc_script_ids that call it]
    event_to_npc = {}
    # Also collect: npc_script_id -> [event_ids it calls]
    npc_to_events = {}

    for npc_id in range(NUM_NPC_SCRIPTS):
        file_offset = npc_data_base + npc_ptrs[npc_id]
        # Determine end boundary (next script start or data end)
        if npc_id + 1 < NUM_NPC_SCRIPTS:
            end_offset = npc_data_base + npc_ptrs[npc_id + 1]
        else:
            end_offset = snes_to_file(0xCE2294)

        if file_offset >= len(rom) or end_offset > len(rom):
            continue

        events_called = []
        i = file_offset
        while i < end_offset:
            b = rom[i]
            if b == 0xF0:  # end of NPC script
                break
            elif b == 0xFF and i + 2 < end_offset:
                # Execute Event: bytes 1-2 = 16-bit LE event script index
                event_id = rom[i+1] | (rom[i+2] << 8)
                events_called.append(event_id)
                i += 3
            elif b == 0xF5:
                i += 5  # RAM Bool 2-byte
            elif b == 0xF6:
                i += 1  # If Button Pressed
            elif b == 0xF7:
                i += 2  # If Facing Direction
            elif b == 0xF8:
                i += 4  # RAM Bool 1-byte
            elif b == 0xF9:
                i += 5  # RAM Compare 2-byte
            elif b == 0xFA:
                i += 4  # RAM Compare 1-byte
            elif 0xFB <= b <= 0xFE:
                i += 2  # If Switch On/Off
            else:
                # Not a trigger opcode — this is the fallback dialog bytes (2 bytes)
                # We've reached the end of the conditional section
                break

        npc_to_events[npc_id] = events_called
        for eid in events_called:
            if eid not in event_to_npc:
                event_to_npc[eid] = []
            event_to_npc[eid].append(npc_id)

    return event_to_npc, npc_to_events


def name_event(rom, event_id, event_info, all_event_ptrs, map_seq_counters):
    """Generate a name for an event."""
    # Priority 1: Direct dialog
    for dialog_id, dtype in event_info['dialogs']:
        if dtype in ('dialog', 'yesno'):
            text = decode_dialog(rom, dialog_id)
            if text:
                text = text[:32].strip()
                if dtype == 'yesno': return f'"{text}" (Y/N)'
                return f'"{text}"'
        elif dtype == 'npc':
            text = decode_dialog(rom, dialog_id)
            if text:
                return f'NPC: "{text[:32].strip()}"'

    # Priority 2: Follow subroutine calls (1 level deep)
    for sub_id in event_info['calls']:
        if sub_id < len(all_event_ptrs):
            sub_snes = all_event_ptrs[sub_id]
            sub_file = snes_to_file(sub_snes)
            sub_end = snes_to_file(all_event_ptrs[sub_id + 1]) if sub_id + 1 < len(all_event_ptrs) else sub_file + 512
            sub_info = parse_event(rom, sub_file, sub_end)
            for dialog_id, dtype in sub_info['dialogs']:
                if dtype in ('dialog', 'yesno'):
                    text = decode_dialog(rom, dialog_id)
                    if text:
                        text = text[:32].strip()
                        return f'call({sub_id}): "{text}"' + (' (Y/N)' if dtype == 'yesno' else '')
                elif dtype == 'npc':
                    text = decode_dialog(rom, dialog_id)
                    if text:
                        return f'call({sub_id}): NPC: "{text[:32].strip()}"'

    # Priority 3: Shop / Inn
    if event_info['shops']: return f'Shop #{event_info["shops"][0]}'
    if event_info['inns']: return f'Inn ({event_info["inns"][0]}gp)'

    # Priority 4: Map-based name
    if event_info['maps']:
        map_id = event_info['maps'][0]
        map_name = get_map_name(map_id)
        map_seq_counters[map_id] = map_seq_counters.get(map_id, 0) + 1
        return f'[{map_name} #{map_seq_counters[map_id]}]'

    # Priority 5: Content description
    parts = []
    if event_info['battles']: parts.append(f'battle({event_info["battles"][0]})')
    if event_info['has_cutscene'] is not None: parts.append(f'cutscene({event_info["has_cutscene"]})')
    if event_info['calls']:
        for c in event_info['calls'][:2]: parts.append(f'call({c})')
    if event_info['has_item']: parts.append('give_take_item')
    if event_info['has_obj']: parts.append('obj_action')
    if event_info['has_party']: parts.append('party_action')
    if event_info['has_sound']: parts.append('sound')
    if event_info['has_fade']: parts.append('fade')
    if event_info['event_switches']: parts.append('event_switch')
    if event_info['has_battle_switch']: parts.append('battle_switch')
    if event_info['npc_switches']: parts.append('npc_switch')
    if parts: return f'[{", ".join(parts[:4])}]'
    if event_info['size'] <= 1: return '[empty/unused]'
    return '[unknown]'


def fmt_event_switches(switches):
    """Format event switch list for output column."""
    if not switches: return ''
    seen = []
    for sid, state in switches:
        tag = f'ES{sid}={state}'
        if tag not in seen: seen.append(tag)
    return ' '.join(seen)


def fmt_npc_switches(switches):
    """Format NPC switch list for output column."""
    if not switches: return ''
    seen = []
    for sid, state in switches:
        tag = f'NS{sid}={state}'
        if tag not in seen: seen.append(tag)
    return ' '.join(seen)


def fmt_npc_scripts(event_id, event_to_npc):
    """Format NPC script references for output column."""
    npc_ids = event_to_npc.get(event_id, [])
    if not npc_ids: return ''
    return ' '.join(f'npc:{nid}' for nid in sorted(set(npc_ids)))


def main():
    with open(ROM_PATH, 'rb') as f:
        rom = f.read()
    print(f"ROM size: {len(rom)} bytes (0x{len(rom):X})")

    # Read ALL event pointers
    ptr_table = snes_to_file(0xC83320)
    all_event_ptrs = []
    for i in range(MAX_EVENTS):
        offset = ptr_table + i * 3
        p = rom[offset] | (rom[offset+1] << 8) | (rom[offset+2] << 16)
        all_event_ptrs.append(p)

    # Parse NPC scripts for reverse references
    print("Parsing NPC scripts for cross-references...")
    event_to_npc, npc_to_events = parse_npc_scripts(rom)
    npc_refs_count = sum(1 for eid in range(NUM_EVENTS) if eid in event_to_npc)
    print(f"  {npc_refs_count} events have NPC script references")

    # Process all events
    results = []
    map_seq_counters = {}

    for event_id in range(NUM_EVENTS):
        event_snes = all_event_ptrs[event_id]
        event_file = snes_to_file(event_snes)
        next_file = snes_to_file(all_event_ptrs[event_id + 1]) if event_id + 1 < len(all_event_ptrs) else event_file + 512
        event_info = parse_event(rom, event_file, next_file)
        name = name_event(rom, event_id, event_info, all_event_ptrs, map_seq_counters)

        addr_str = f"${event_snes:06X}"
        event_size = next_file - event_file
        es_col = fmt_event_switches(event_info['event_switches'])
        ns_col = fmt_npc_switches(event_info['npc_switches'])
        npc_col = fmt_npc_scripts(event_id, event_to_npc)

        results.append((event_id, addr_str, event_size, name, es_col, ns_col, npc_col))

    # Write results
    outpath = rf"C:\Users\J4cks\Desktop\work5\crawler\event_names_0-{NUM_EVENTS-1}.txt"
    with open(outpath, 'w', encoding='utf-8') as f:
        f.write(f"# FFV Event Script Names (Events 0-{NUM_EVENTS-1})\n")
        f.write("# Naming priority: Dialog > Subroutine dialog > Shop/Inn > Map name > Content\n")
        f.write("# Format: Event# | Address | Size | Name | EventSwitches | NPCSwitches | NPCScript\n")
        f.write("# EventSwitches: ES<id>=ON/OFF  NPCSwitches: NS<id>=ON/OFF  NPCScript: npc:<id>\n\n")
        for event_id, addr, size, name, es, ns, npc in results:
            # Build line with optional columns (only show pipe if column has data)
            line = f"{event_id:4d} | {addr} | {size:5d}B | {name}"
            if es or ns or npc:
                line += f" | {es}" if es else " |"
                line += f" | {ns}" if ns else " |"
                line += f" | {npc}" if npc else " |"
            f.write(line + "\n")
            print(line)

    print(f"\nText results written to {outpath}")

    # Write JSON version
    json_path = rf"C:\Users\J4cks\Desktop\work5\crawler\event_names_0-{NUM_EVENTS-1}.json"
    json_events = []
    for event_id, addr, size, name, es, ns, npc in results:
        entry = {
            "id": event_id,
            "address": addr,
            "size": size,
            "name": name,
        }
        if es:
            entry["eventSwitches"] = [
                {"id": int(s.split('=')[0][2:]), "state": s.split('=')[1]}
                for s in es.split()
            ]
        if ns:
            entry["npcSwitches"] = [
                {"id": int(s.split('=')[0][2:]), "state": s.split('=')[1]}
                for s in ns.split()
            ]
        if npc:
            entry["npcScripts"] = [int(s.split(':')[1]) for s in npc.split()]
        json_events.append(entry)

    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump({"game": "FFV", "version": "RPGe", "eventCount": NUM_EVENTS, "events": json_events}, f, indent=2, ensure_ascii=False)
    print(f"JSON results written to {json_path}")

    # Stats
    es_count = sum(1 for _, _, _, _, es, _, _ in results if es)
    ns_count = sum(1 for _, _, _, _, _, ns, _ in results if ns)
    npc_count = sum(1 for _, _, _, _, _, _, npc in results if npc)
    dialog_count = sum(1 for _, _, _, n, _, _, _ in results if n.startswith('"') or n.startswith('NPC:'))
    call_dialog_count = sum(1 for _, _, _, n, _, _, _ in results if n.startswith('call('))
    map_count = sum(1 for _, _, _, n, _, _, _ in results if n.startswith('[') and '#' in n)
    shop_inn_count = sum(1 for _, _, _, n, _, _, _ in results if n.startswith('Shop') or n.startswith('Inn'))
    print(f"\nNaming: {dialog_count} dialog, {call_dialog_count} via sub, {shop_inn_count} shop/inn, {map_count} map-named")
    print(f"Switches: {es_count} events modify Event Switches, {ns_count} modify NPC Switches")
    print(f"NPC Scripts: {npc_count} events referenced by NPC scripts")


if __name__ == '__main__':
    main()
