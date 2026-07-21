/**
 * Game detection service
 * Identifies FF4, FF5, FF6, or FFMQ from ROM binary
 */

import type { GameId, Region } from '@/types/ast';
import type { GameInfo } from '@/types/rom';
import { GAME_SIGNATURES, GAME_OFFSETS, GAME_FINGERPRINTS, KNOWN_CRC32, getSongNames } from '@/constants/game-signatures';

export type { GameInfo };

/** CRC32 lookup table */
const CRC32_TABLE: number[] = [];
for (let i = 0; i < 256; i++) {
  let c = i;
  for (let j = 0; j < 8; j++) {
    c = (c & 1) ? (0xEDB88320 ^ (c >>> 1)) : (c >>> 1);
  }
  CRC32_TABLE[i] = c;
}

/** Calculate CRC32 of ROM data */
function calculateCRC32(data: Uint8Array): string {
  let crc = 0xFFFFFFFF;
  for (let i = 0; i < data.length; i++) {
    const byte = data[i]!;
    crc = CRC32_TABLE[(crc ^ byte) & 0xFF]! ^ (crc >>> 8);
  }
  return ((crc ^ 0xFFFFFFFF) >>> 0).toString(16).toUpperCase().padStart(8, '0');
}

/** Calculate CRC32 of a region within the (unheadered) ROM data */
export function crc32Region(romData: Uint8Array, offset: number, length: number): string {
  return calculateCRC32(romData.subarray(offset, offset + length));
}

/** Read ASCII string from ROM at offset */
function readString(rom: Uint8Array, offset: number, length: number): string {
  const bytes = rom.slice(offset, offset + length);
  return String.fromCharCode(...bytes).replace(/\0/g, '').trim();
}

/** Check if ROM has $200 SMC header */
function hasHeader(rom: Uint8Array): boolean {
  // SNES ROMs are multiples of $8000; an SMC copier header adds $200.
  // (The old check `(len & 0x1FF) === 0x200` could never be true:
  // a 9-bit mask maxes out at 0x1FF.)
  return (rom.length % 0x8000) === 0x200;
}

/** Get internal ROM name from SNES header */
function getInternalName(rom: Uint8Array, headerOffset: number): string {
  // Internal name at $FFC0 (or $7FC0 for LoROM)
  // With SMC header, add $200
  const nameOffset = headerOffset + 0xFFC0;
  if (nameOffset + 21 > rom.length) {
    // Try LoROM offset
    const loRomOffset = headerOffset + 0x7FC0;
    if (loRomOffset + 21 <= rom.length) {
      return readString(rom, loRomOffset, 21);
    }
    return '';
  }
  return readString(rom, nameOffset, 21);
}

/**
 * Attempt to detect game from ROM.
 *
 * Detection stages, most to least reliable:
 * 1. Whole-ROM CRC32 — identifies pristine dumps exactly (incl. region).
 * 2. Music-table fingerprint — CRC32 of the game's sequence pointer
 *    table; survives translations/hacks/expansion, so it identifies
 *    modified ROMs. Region is then refined from the internal name.
 * 3. Internal header name + size heuristics.
 * 4. Structural byte patterns at known offsets.
 */
export function detectGame(rom: Uint8Array): GameInfo | null {
  const header = hasHeader(rom);
  const headerOffset = header ? 0x200 : 0;
  const romSize = rom.length - headerOffset;

  // Calculate CRC32 (on data without header)
  const romData = header ? rom.subarray(0x200) : rom;
  const crc32 = calculateCRC32(romData);
  console.log(`ROM CRC32: ${crc32}, size: ${romSize.toString(16)}h, header: ${header}`);

  // Stage 1: whole-ROM CRC32 (pristine dumps)
  const knownGame = KNOWN_CRC32[crc32];
  if (knownGame) {
    console.log(`CRC32 match: ${knownGame.name}`);
    return buildGameInfo(knownGame.id, knownGame.region, headerOffset, knownGame.name);
  }

  const internalName = getInternalName(rom, headerOffset);
  console.log(`ROM internal name: "${internalName}" (CRC32 ${crc32} not in known list)`);

  // Stage 2: music-table fingerprint (modified ROMs)
  for (const [id, fp] of Object.entries(GAME_FINGERPRINTS)) {
    if (!fp || fp.offset + fp.length > romData.length) continue;
    const regionCrc = crc32Region(romData, fp.offset, fp.length);
    if (regionCrc === fp.crc32) {
      const gameId = id as GameId;
      const region = guessRegion(gameId, internalName);
      console.log(`Fingerprint match: ${fp.description} (${regionCrc})`);
      return buildGameInfo(gameId, region, headerOffset, undefined, ' (modified)');
    }
  }

  // Stage 3: internal name + size heuristics
  for (const sig of GAME_SIGNATURES) {
    // Partial name match OK — some translations change the name slightly
    const nameMatch = internalName.toUpperCase().includes(sig.internalName.slice(0, 10).toUpperCase());

    // Size within reasonable bounds, allowing for expansion
    const sizeMatch = romSize >= sig.expectedSize && romSize <= sig.expectedSize * 2;

    if (nameMatch && sizeMatch) {
      return buildGameInfo(sig.id, sig.region, headerOffset, sig.name);
    }
  }

  // Stage 4: structural byte patterns
  return detectByPatterns(rom, headerOffset);
}

/** Refine region from the internal header name when only the game is known */
function guessRegion(id: GameId, internalName: string): Region {
  const sig = GAME_SIGNATURES.find(
    s => s.id === id && internalName.toUpperCase().includes(s.internalName.slice(0, 10).toUpperCase())
  );
  if (sig) return sig.region;
  return GAME_SIGNATURES.find(s => s.id === id)?.region ?? 'jp';
}

/** Fallback detection by known byte patterns */
function detectByPatterns(rom: Uint8Array, headerOffset: number): GameInfo | null {
  // FF4: Check for instrument table at expected location
  // With header: $2420F, without: $2400F
  const ff4InstrOffset = 0x2400F + headerOffset;
  if (rom.length > ff4InstrOffset + 0x100) {
    // FF4 instrument entries are 32 bytes each, check pattern
    const byte1 = rom[ff4InstrOffset];
    const byte2 = rom[ff4InstrOffset + 0x20];
    if (byte1 !== undefined && byte2 !== undefined) {
      // Instrument values 01-16, separated by 00
      if (byte1 <= 0x16 && byte2 <= 0x16) {
        console.log('Detected FF4 by instrument table pattern');
        return buildGameInfo('ff4', 'us', headerOffset);
      }
    }
  }

  // FF5: sequence pointer table at $043B97 holds 3-byte SNES addresses
  // into HiROM banks $C5-$C6 (bank byte is $C5/$C6, mirrored at $45/$46)
  const ff5SeqOffset = 0x043B97 + headerOffset;
  if (rom.length > ff5SeqOffset + 0x100) {
    const bank0 = rom[ff5SeqOffset + 2]! & 0x7F;
    const bank1 = rom[ff5SeqOffset + 5]! & 0x7F;
    if ((bank0 === 0x45 || bank0 === 0x46) && (bank1 === 0x45 || bank1 === 0x46)) {
      console.log('Detected FF5 by sequence pointer pattern');
      return buildGameInfo('ff5', 'jp', headerOffset);
    }
  }

  // FFMQ: Check for sequence pointer table at $6BDAE
  const ffmqSeqOffset = 0x6BDAE + headerOffset;
  if (rom.length > ffmqSeqOffset + 0x50) {
    // FFMQ pointers point to $75xxx range
    const ptr0 = rom[ffmqSeqOffset + 2];
    if (ptr0 === 0x07 || ptr0 === 0x0E || ptr0 === 0x0F) {
      console.log('Detected FFMQ by sequence pointer pattern');
      return buildGameInfo('ffmq', 'us', headerOffset);
    }
  }

  return null;
}

/** Build GameInfo from known offsets (single construction point) */
function buildGameInfo(
  id: GameId,
  region: Region,
  headerOffset: number,
  displayName?: string,
  nameSuffix: string = ''
): GameInfo {
  const base = GAME_OFFSETS[id];
  const sig = GAME_SIGNATURES.find(s => s.id === id && s.region === region)
           ?? GAME_SIGNATURES.find(s => s.id === id);

  const trackCount = base?.trackCount ?? 0;
  return {
    id,
    name: (displayName ?? sig?.name ?? id.toUpperCase()) + nameSuffix,
    region,
    mapping: base?.mapping ?? 'lorom',
    hasHeader: headerOffset > 0,
    headerOffset,
    trackCount,
    trackNames: getSongNames(id, trackCount),
    sequencePointerBase: (base?.sequencePointerBase ?? 0) + headerOffset,
    samplePointerBase: (base?.samplePointerBase ?? 0) + headerOffset,
    brrDataBase: (base?.brrDataBase ?? 0) + headerOffset,
  };
}
