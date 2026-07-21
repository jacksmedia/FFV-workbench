/**
 * Encoder Factory
 *
 * Provides the correct bytecode encoder for each target game.
 * Each encoder converts AST nodes back to game-specific bytecode.
 */

import type { GameId, SequenceAst, TrackAst, SequenceNode } from '@/types/ast';

/** Encoded track result */
export interface EncodedTrack {
  channelIndex: number;
  bytecode: Uint8Array;
  length: number;
}

/** Encoded sequence result */
export interface EncodedSequence {
  header: Uint8Array;
  tracks: EncodedTrack[];
  fullData: Uint8Array;
  totalLength: number;
}

/** Encoder interface that each game must implement */
export interface GameEncoder {
  /** Encode a single AST node to bytecode */
  encodeNode(node: SequenceNode): Uint8Array;

  /** Encode a full track */
  encodeTrack(track: TrackAst): EncodedTrack;

  /** Encode a full sequence with header */
  encodeSequence(ast: SequenceAst): EncodedSequence;

  /** Get the header size for this game */
  getHeaderSize(): number;

  /** Get the maximum sequence size supported */
  getMaxSequenceSize(): number;
}

/** Lazy-loaded encoder instances */
const encoderCache: Partial<Record<GameId, GameEncoder>> = {};

/**
 * Get the encoder for a specific game
 */
export async function getEncoder(game: GameId): Promise<GameEncoder> {
  if (encoderCache[game]) {
    return encoderCache[game];
  }

  let encoder: GameEncoder;

  switch (game) {
    case 'ff4':
      encoder = await loadFF4Encoder();
      break;
    case 'ff5':
      encoder = await loadFF5Encoder();
      break;
    case 'ff6':
      encoder = await loadFF6Encoder();
      break;
    case 'ffmq':
      encoder = await loadFFMQEncoder();
      break;
    default:
      throw new Error(`Unknown game: ${game}`);
  }

  encoderCache[game] = encoder;
  return encoder;
}

/**
 * Synchronous encoder getter (throws if not loaded)
 */
export function getEncoderSync(game: GameId): GameEncoder {
  const encoder = encoderCache[game];
  if (!encoder) {
    throw new Error(`Encoder for ${game} not loaded. Call getEncoder() first.`);
  }
  return encoder;
}

async function loadFF4Encoder(): Promise<GameEncoder> {
  const { createFF4Encoder } = await import('./encoders/ff4-encoder');
  return createFF4Encoder();
}

async function loadFF5Encoder(): Promise<GameEncoder> {
  const { createFF5Encoder } = await import('./encoders/ff5-encoder');
  return createFF5Encoder();
}

async function loadFF6Encoder(): Promise<GameEncoder> {
  const { createFF6Encoder } = await import('./encoders/ff6-encoder');
  return createFF6Encoder();
}

async function loadFFMQEncoder(): Promise<GameEncoder> {
  // FFMQ uses same encoding as FF5
  const { createFF5Encoder } = await import('./encoders/ff5-encoder');
  return createFF5Encoder();
}

/**
 * Preload all encoders (useful for faster subsequent calls)
 */
export async function preloadEncoders(): Promise<void> {
  await Promise.all([
    getEncoder('ff4'),
    getEncoder('ff5'),
    getEncoder('ff6'),
    getEncoder('ffmq'),
  ]);
}

/**
 * Get list of supported target games
 */
export function getSupportedTargets(): GameId[] {
  return ['ff4', 'ff5', 'ff6', 'ffmq'];
}

/**
 * Check if encoding from source to target is supported
 */
export function isEncodingSupported(source: GameId, target: GameId): boolean {
  // Currently all combinations are supported (with potential warnings)
  return getSupportedTargets().includes(source) && getSupportedTargets().includes(target);
}

/**
 * Get encoder capabilities/limitations for a game
 */
export interface EncoderCapabilities {
  supportsSlur: boolean;
  supportsLegato: boolean;
  supportsDurationOverride: boolean;
  supportsTriplets: boolean;
  maxTracks: number;
  maxLoopDepth: number;
}

export function getEncoderCapabilities(game: GameId): EncoderCapabilities {
  const capabilities: Record<GameId, EncoderCapabilities> = {
    ff4: {
      supportsSlur: false,
      supportsLegato: false,
      supportsDurationOverride: false,
      supportsTriplets: true,
      maxTracks: 8,
      maxLoopDepth: 4,
    },
    ff5: {
      supportsSlur: false,
      supportsLegato: false,
      supportsDurationOverride: false,
      supportsTriplets: true,
      maxTracks: 8,
      maxLoopDepth: 4,
    },
    ff6: {
      supportsSlur: true,
      supportsLegato: true,
      supportsDurationOverride: true,
      supportsTriplets: false, // Key limitation!
      maxTracks: 8,
      maxLoopDepth: 4,
    },
    ffmq: {
      supportsSlur: false,
      supportsLegato: false,
      supportsDurationOverride: false,
      supportsTriplets: true,
      maxTracks: 8,
      maxLoopDepth: 4,
    },
  };

  return capabilities[game] ?? capabilities.ff5;
}
