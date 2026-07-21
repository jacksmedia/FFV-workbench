/**
 * ROM and game detection types
 */

import type { GameId } from './ast';

export type Region = 'jp' | 'us' | 'eu';

/**
 * SNES cartridge memory mapping mode.
 * Determines how 24-bit SNES addresses convert to ROM file offsets.
 * FF4 and FFMQ are LoROM; FF5 and FF6 are HiROM.
 */
export type MappingMode = 'lorom' | 'hirom';

/**
 * A CRC32 fingerprint of a fixed data region inside the ROM.
 * Unlike a whole-ROM CRC32, this survives unrelated ROM patches
 * (translations, gameplay hacks, expansion), so it can positively
 * identify a game's music engine even in a modified ROM.
 */
export interface RegionFingerprint {
  /** ROM file offset (unheadered) of the region */
  offset: number;
  /** Region length in bytes */
  length: number;
  /** Expected CRC32 as 8-char uppercase hex */
  crc32: string;
  /** What the region is, for diagnostics */
  description: string;
}

export interface GameInfo {
  id: GameId;
  name: string;
  region: Region;
  mapping: MappingMode;      // SNES address mapping (lorom/hirom)
  hasHeader: boolean;        // $200 header present
  headerOffset: number;      // 0 or 0x200
  trackCount: number;        // Number of BGM sequences
  trackNames: string[];      // Human-readable song names
  sequencePointerBase: number;  // ROM offset to sequence pointer table
  samplePointerBase: number;    // ROM offset to sample pointer table
  brrDataBase: number;          // ROM offset to BRR sample data
}

export interface TrackInfo {
  index: number;
  name: string;
  offset: number;     // ROM offset to sequence data
  length: number;     // Sequence length in bytes
  channels: number;   // Number of active channels (1-8)
}

export interface SampleInfo {
  index: number;
  name: string;
  offset: number;     // ROM offset to BRR data
  length: number;     // BRR data length
  loopPoint: number;  // Loop start in samples
  sampleRate: number; // Native sample rate
}

export interface RomState {
  data: Uint8Array;
  gameInfo: GameInfo;
  tracks: TrackInfo[];
  samples: SampleInfo[];
}

/** Game signature for detection */
export interface GameSignature {
  id: GameId;
  name: string;
  region: Region;
  /** Internal ROM name at $FFC0 (or $7FC0 with header) */
  internalName: string;
  /** Expected ROM size in bytes (without header) */
  expectedSize: number;
  /** Checksum at $FFDE (or $7FDE with header) */
  checksum?: number;
  /** Known data at specific offsets for verification */
  knownBytes?: Array<{ offset: number; value: number }>;
}
