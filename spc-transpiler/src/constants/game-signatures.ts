/**
 * Game signatures for ROM detection
 * Based on documented offsets from chillyfeez, ffbin wiki, datacrystal
 */

import type { GameId, Region } from '@/types/ast';
import type { GameInfo, GameSignature, RegionFingerprint } from '@/types/rom';

/**
 * Known whole-ROM CRC32 values for pristine ROM identification.
 * NOTE: any patch (translation, gameplay hack, expansion) changes the
 * whole-ROM CRC, so this is only the fast path for unmodified dumps.
 * Modified ROMs are identified via GAME_FINGERPRINTS below.
 */
export const KNOWN_CRC32: Record<string, { id: GameId; region: Region; name: string }> = {
  // FF4
  '23084FCD': { id: 'ff4', region: 'us', name: 'Final Fantasy IV (v1.1)' },
  // FF5
  'C1BC267D': { id: 'ff5', region: 'jp', name: 'Final Fantasy V (J)' },
  '17444605': { id: 'ff5', region: 'us', name: 'Final Fantasy V (RPGe)' },
  // FF6
  'A27F1C7A': { id: 'ff6', region: 'us', name: 'Final Fantasy VI (v1.0)' },
  // FFMQ
  '6B19A2C6': { id: 'ffmq', region: 'us', name: 'Final Fantasy Mystic Quest (v1.0)' },
};

/**
 * Per-game fingerprints of the music engine's own data tables.
 * These regions are untouched by typical patches, so a match positively
 * identifies the music engine even in heavily modified ROMs.
 *
 * FF5 value verified 2026-07-06 against four ROMs (pristine J, RPGe,
 * and two patched hacks incl. a 4MB expansion): all share 9B1F9B34.
 */
export const GAME_FINGERPRINTS: Partial<Record<GameId, RegionFingerprint>> = {
  ff5: {
    offset: 0x043b97,
    length: 72 * 3,
    crc32: '9B1F9B34',
    description: 'FF5 BGM sequence pointer table (72 × 3-byte SNES addresses)',
  },
};

/** ROM signatures for fallback detection */
export const GAME_SIGNATURES: GameSignature[] = [
  // FF4 / FF2 US
  {
    id: 'ff4',
    name: 'Final Fantasy IV',
    region: 'us',
    internalName: 'FINAL FANTASY 2',
    expectedSize: 0x100000, // 1MB
    checksum: 0x23084FCD,
  },
  {
    id: 'ff4',
    name: 'Final Fantasy IV',
    region: 'jp',
    internalName: 'FINAL FANTASY 4',
    expectedSize: 0x100000,
  },
  // FF5
  {
    id: 'ff5',
    name: 'Final Fantasy V',
    region: 'jp',
    internalName: 'FINAL FANTASY 5',
    expectedSize: 0x200000, // 2MB
    checksum: 0xC1BC267D,
  },
  {
    id: 'ff5',
    name: 'Final Fantasy V',
    region: 'us', // RPGe translation
    internalName: 'FINAL FANTASY 5',
    expectedSize: 0x200000,
    checksum: 0x17444605,
  },
  // FF6 / FF3 US
  {
    id: 'ff6',
    name: 'Final Fantasy VI',
    region: 'us',
    internalName: 'FINAL FANTASY 3',
    expectedSize: 0x300000, // 3MB
    checksum: 0xA27F1C7A,
  },
  {
    id: 'ff6',
    name: 'Final Fantasy VI',
    region: 'jp',
    internalName: 'FINAL FANTASY 6',
    expectedSize: 0x300000,
  },
  // FFMQ / FF USA
  {
    id: 'ffmq',
    name: 'Final Fantasy Mystic Quest',
    region: 'us',
    internalName: 'MYSTIC QUEST USA',
    expectedSize: 0x080000, // 512KB
    checksum: 0x6B19A2C6,
  },
  {
    id: 'ffmq',
    name: 'Final Fantasy USA',
    region: 'jp',
    internalName: 'FF USA MYSTIC Q',
    expectedSize: 0x080000,
  },
];

/**
 * Game-specific data offsets (without $200 header)
 * From: chillyfeez FF4 guide, ffbin wiki FF5, datacrystal FFMQ
 */
export const GAME_OFFSETS: Record<GameId, Partial<GameInfo>> = {
  ff4: {
    id: 'ff4',
    name: 'Final Fantasy IV',
    mapping: 'lorom',
    trackCount: 56,
    // Instrument Index: $2420F-$2490E (with $200 header, subtract $200 for unheadered)
    // Sequence Data: $3790E-$43AB8
    sequencePointerBase: 0x2400F, // Without header: $2420F - $200
    samplePointerBase: 0x0, // TODO: Find exact offset
    brrDataBase: 0x0, // TODO: Find exact offset
  },
  ff5: {
    id: 'ff5',
    name: 'Final Fantasy V',
    mapping: 'hirom',
    trackCount: 72,
    // BGM Sequence Offsets: $043B97-$043C6E (3 bytes × 72)
    // Sample Offsets: $043C6F-$043CD7 (3 bytes × 35)
    // BRR Data: $0446AA onwards
    sequencePointerBase: 0x043B97,
    samplePointerBase: 0x043C6F,
    brrDataBase: 0x0446AA,
  },
  ff6: {
    id: 'ff6',
    name: 'Final Fantasy VI',
    mapping: 'hirom',
    trackCount: 75, // 75 songs (0x4B)
    // FF6 music data in banks $C5-$C6
    // Sequence pointer table at $C53C5E (unheadered: $053C5E)
    sequencePointerBase: 0x053C5E,
    // Sample pointers at $C50222
    samplePointerBase: 0x050222,
    // BRR data starts around $C51000
    brrDataBase: 0x051000,
  },
  ffmq: {
    id: 'ffmq',
    name: 'Final Fantasy Mystic Quest',
    mapping: 'lorom',
    trackCount: 28,
    // From datacrystal:
    // SPC Pointers: $6BDAE (3 bytes each)
    // BRR Pointers: $6BDFF
    // Sample Indexes: $6BEA1-$6C1E1
    // BRR Data: $6C201
    // Sequence Data: $750FD onwards
    sequencePointerBase: 0x6BDAE,
    samplePointerBase: 0x6BDFF,
    brrDataBase: 0x6C201,
  },
};

/** FF4 song names (from chillyfeez guide) */
export const FF4_SONG_NAMES: Record<number, string> = {
  0x00: 'Nothing',
  0x01: 'Final Fantasy',
  0x02: 'Wishing Tower',
  0x03: 'Fanfare (Dummy)',
  0x04: 'Yellow Chocobo',
  0x05: 'Black Chocobo',
  0x06: 'Underworld',
  0x07: 'Zeromus',
  0x08: 'Victory Fanfare',
  0x09: 'Town',
  0x0A: 'Rydia',
  0x0B: 'Boss Music',
  0x0C: 'Mt. Ordeals',
  0x0D: 'Overworld',
  0x0E: 'Big Whale',
  0x0F: 'Sad Music',
  0x10: 'Tent/Cabin',
  0x11: 'Golbez',
  0x12: 'Sorrow',
  0x13: 'Rosa',
  0x14: 'Baron Castle',
  0x15: 'The Prelude',
  0x16: 'Suspicions',
  0x17: 'Tower of Zot',
  0x18: 'Airship',
  0x19: 'Tower of Bab-il',
  0x1A: 'Fight 2',
  0x1B: 'Within the Giant',
  0x1C: 'Cave of Summoned Monsters',
  0x1D: 'Destruction',
  0x1E: 'Lunar Path',
  0x1F: 'Surprise!',
  0x20: 'Dwarf Castle',
  0x21: 'Palom/Porom',
  0x22: 'Calcobrena',
  0x23: 'Hurry!',
  0x24: 'Cid',
  0x25: 'Into the Darkness',
  0x26: 'Dancing Music',
  0x27: 'Fight 1',
  0x28: 'Castle Eblan',
  0x29: 'Character Joined!',
  0x2A: 'Character Died',
  0x2B: 'Chocobo Forest',
  0x2C: 'Opening',
  0x2D: 'Sad 2',
  0x2E: 'Castle Fabul',
  0x2F: 'Fanfare (Became a Paladin)',
  0x30: 'Lard Ass Chocobo',
  0x31: "Moon's Surface",
  0x32: 'Toroia',
  0x33: 'Mysidia',
  0x34: 'Lunar Subterrane',
  0x35: 'Ending Part 1',
  0x36: 'Ending Part 2',
  0x37: 'Ending Part 3',
};

/**
 * FF5 song names, indexed by BGM ID (the index into the pointer table
 * at $043B97). Verified entry-by-entry against the ffbin wiki listing
 * (FF5_soundo.pdf), which gives BGM ID → Japanese title → file offset.
 */
export const FF5_SONG_NAMES: Record<number, string> = {
  0x00: 'Main Theme (Ahead on Our Way)',
  0x01: 'Battle 2',
  0x02: 'Opening',
  0x03: "Boko's Theme",
  0x04: "We're Pirates",
  0x05: 'Town Theme',
  0x06: 'Dungeon',
  0x07: "Moogle's Theme",
  0x08: 'Prelude',
  0x09: 'The Final Battle',
  0x0A: 'Requiem',
  0x0B: 'Parting Sorrow',
  0x0C: 'Cursed Land',
  0x0D: "Lenna's Theme",
  0x0E: 'Victory Fanfare',
  0x0F: 'Bewildered',
  0x10: 'One Day, Surely',
  0x11: '(Silence)',
  0x12: "Exdeath's Castle",
  0x13: 'Home, Sweet Home',
  0x14: 'Tycoon Waltz',
  0x15: 'The Sealed Ones',
  0x16: 'Warriors of Dawn',
  0x17: 'Close Call!',
  0x18: 'Fire Ship',
  0x19: 'Legend of the Deep Forest',
  0x1A: 'Mambo de Chocobo',
  0x1B: 'Music Box of Memories',
  0x1C: 'Slumber of the Ancient Earth',
  0x1D: 'Spreading Grand Wings',
  0x1E: 'Beyond the Deep Blue Sea',
  0x1F: 'Prelude to the Void',
  0x20: 'In Search of Light',
  0x21: 'Harvest',
  0x22: 'Clash on the Big Bridge',
  0x23: 'Four Hearts',
  0x24: 'Sealed Book',
  0x25: 'Huh?',
  0x26: 'Hurry! Hurry!!',
  0x27: 'Unknown Lands',
  0x28: 'Airship',
  0x29: 'Fanfare 1',
  0x2A: 'Fanfare 2',
  0x2B: 'Battle 1',
  0x2C: 'Walking the Snowy Mountains',
  0x2D: 'Evil Lord Exdeath',
  0x2E: 'Castle of Dawn',
  0x2F: "I'm a Dancer",
  0x30: 'Reminiscence',
  0x31: 'Escape!',
  0x32: 'Ancient Library',
  0x33: 'Royal Palace',
  0x34: 'Inn',
  0x35: 'Piano Lesson 1',
  0x36: 'Piano Lesson 2',
  0x37: 'Piano Lesson 3',
  0x38: 'Piano Lesson 4',
  0x39: 'Piano Lesson 5',
  0x3A: 'Piano Lesson 6',
  0x3B: 'Piano Lesson 7',
  0x3C: 'Piano Lesson 8',
  0x3D: 'Musica Machina',
  0x3E: 'Collapse',
  0x3F: 'A New World',
  0x40: 'The Decisive Battle',
  0x41: 'Beyond the Silence (Ending 1)',
  0x42: 'Dear Friends (Ending 2)',
  0x43: 'Final Fantasy (Ending 3)',
  0x44: 'End Title',
  0x45: 'Night',
  0x46: 'Waterside',
  0x47: 'Waterfall',
};

/** FFMQ song names (from datacrystal) */
export const FFMQ_SONG_NAMES: Record<number, string> = {
  0: 'Silence',
  1: 'Battle 1',
  2: 'Battle 2',
  3: 'Battle 3',
  4: 'Victory!',
  5: 'World',
  6: 'Fossil Labyrinth',
  7: 'Dungeon of Ice',
  8: 'Lava Dome',
  9: 'Mountain Range of Whirlwinds',
  10: 'Dungeon and Waterfall',
  11: 'Middle Tower',
  12: 'Last Castle',
  13: 'Beautiful Forest',
  14: 'Shrine of Light',
  15: 'City of Earth - Foresta',
  16: 'City of Ice - Aquaria',
  17: 'City of Fire - Faeria',
  18: 'City of Wind - Windaria',
  19: "Rock 'n' Roll",
  20: 'Rock Theme',
  21: 'Fanfare of Friendship',
  22: 'Mystic Ballad',
  23: 'Hill of Fate',
  24: 'Mystic Quest',
  25: 'Ending',
  26: 'The Crystal',
};

/** FF6 song names (from Gnilda guide) */
export const FF6_SONG_NAMES: Record<number, string> = {
  0x00: '(Silence)',
  0x01: 'Omen (Opening Part 1)',
  0x02: 'Omen (Opening Part 2)',
  0x03: 'Omen (Opening Part 3)',
  0x04: 'Awakening',
  0x05: 'Terra',
  0x06: 'Shadow',
  0x07: 'Strago',
  0x08: 'Gau',
  0x09: 'Edgar & Sabin',
  0x0A: 'Coin Song',
  0x0B: 'Cyan',
  0x0C: 'Locke',
  0x0D: 'Forever Rachel',
  0x0E: 'Relm',
  0x0F: 'Setzer',
  0x10: 'Celes',
  0x11: 'Techno de Chocobo',
  0x12: 'The Decisive Battle',
  0x13: 'Johnny C. Bad',
  0x14: 'Kefka',
  0x15: 'The Mines of Narshe',
  0x16: 'The Phantom Forest',
  0x17: 'Wild West',
  0x18: 'Save Them!',
  0x19: 'The Serpent Trench',
  0x1A: 'Kids Run Through the City',
  0x1B: 'Under Martial Law',
  0x1C: 'Waterfall',
  0x1D: 'Metamorphosis',
  0x1E: 'The Phantom Train',
  0x1F: "Esper World",
  0x20: 'Grand Finale?',
  0x21: 'Mt. Koltz',
  0x22: 'Battle Theme',
  0x23: 'Fanfare',
  0x24: 'The Wedding',
  0x25: 'Aria di Mezzo Carattere',
  0x26: 'The Gestahl Empire',
  0x27: 'Devil\'s Lab',
  0x28: 'Blackjack',
  0x29: '?? (Unused)',
  0x2A: 'Troops March On',
  0x2B: 'Umaro',
  0x2C: 'Mog',
  0x2D: 'The Fanatics',
  0x2E: 'Last Dungeon',
  0x2F: 'Dancing Mad (1)',
  0x30: 'Dancing Mad (2)',
  0x31: 'Dancing Mad (3)',
  0x32: 'Dancing Mad (4)',
  0x33: 'Ending Theme (1)',
  0x34: 'Ending Theme (2)',
  0x35: 'The Prelude',
  0x36: 'Dark World',
  0x37: 'From That Day On...',
  0x38: 'Spinach Rag',
  0x39: 'Rest in Peace',
  0x3A: 'The Day After',
  0x3B: 'Overture (1)',
  0x3C: 'Overture (2)',
  0x3D: 'Overture (3)',
  0x3E: 'The Dream Oath Opera',
  0x3F: 'The Wedding (Waltz)',
  0x40: 'Slam Shuffle',
  0x41: 'Gogo',
  0x42: 'Returners',
  0x43: 'Veldt',
  0x44: 'Catastrophe',
  0x45: 'The Magic House',
  0x46: 'Narshe',
  0x47: 'The Fierce Battle',
  0x48: 'Unknown (0x48)',
  0x49: 'The Airship',
  0x4A: 'Balance is Restored',
};

/** Get song names array for a game */
export function getSongNames(gameId: GameId, trackCount: number): string[] {
  const nameMap: Record<GameId, Record<number, string>> = {
    ff4: FF4_SONG_NAMES,
    ff5: FF5_SONG_NAMES,
    ff6: FF6_SONG_NAMES,
    ffmq: FFMQ_SONG_NAMES,
  };

  const names = nameMap[gameId] ?? {};
  return Array.from({ length: trackCount }, (_, i) => names[i] ?? `Track ${i + 1}`);
}
