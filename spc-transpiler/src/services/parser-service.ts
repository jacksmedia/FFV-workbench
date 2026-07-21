/**
 * Unified Parser Service
 *
 * Provides a single interface for parsing sequences from any supported game.
 * Routes to game-specific parsers based on GameInfo.id.
 */

import type { SequenceAst } from '@/types/ast';
import type { GameInfo } from '@/types/rom';
import { parseSequence as parseFF5Sequence } from '@/parsers/ff5';
import { parseSequence as parseFF6Sequence } from '@/parsers/ff6';

export interface ParseResult {
  success: boolean;
  ast: SequenceAst | null;
  error?: string;
  warnings: string[];
}

export interface BatchParseResult {
  sequences: SequenceAst[];
  failed: number[];
  errors: Map<number, string>;
}

/**
 * Parse a single sequence from ROM
 */
export function parseSequence(
  rom: Uint8Array,
  gameInfo: GameInfo,
  songIndex: number
): ParseResult {
  const warnings: string[] = [];

  try {
    let ast: SequenceAst | null = null;

    switch (gameInfo.id) {
      case 'ff5':
      case 'ffmq': // FFMQ uses same format as FF5
        ast = parseFF5Sequence(rom, gameInfo, songIndex);
        break;

      case 'ff4':
        // TODO: Implement FF4 parser
        return {
          success: false,
          ast: null,
          error: 'FF4 parser not yet implemented',
          warnings: [],
        };

      case 'ff6':
        ast = parseFF6Sequence(rom, gameInfo, songIndex);
        break;

      default:
        return {
          success: false,
          ast: null,
          error: `Unknown game: ${gameInfo.id}`,
          warnings: [],
        };
    }

    if (!ast) {
      return {
        success: false,
        ast: null,
        error: 'Failed to parse sequence (empty or invalid)',
        warnings,
      };
    }

    // Override sourceGame for FFMQ (parser returns 'ff5')
    if (gameInfo.id === 'ffmq') {
      ast.sourceGame = 'ffmq';
    }

    return {
      success: true,
      ast,
      warnings,
    };
  } catch (err) {
    return {
      success: false,
      ast: null,
      error: err instanceof Error ? err.message : 'Unknown parse error',
      warnings,
    };
  }
}

/**
 * Parse multiple sequences from ROM
 */
export function parseSequences(
  rom: Uint8Array,
  gameInfo: GameInfo,
  songIndices: number[]
): BatchParseResult {
  const sequences: SequenceAst[] = [];
  const failed: number[] = [];
  const errors = new Map<number, string>();

  for (const index of songIndices) {
    const result = parseSequence(rom, gameInfo, index);

    if (result.success && result.ast) {
      sequences.push(result.ast);
    } else {
      failed.push(index);
      errors.set(index, result.error ?? 'Unknown error');
    }
  }

  return { sequences, failed, errors };
}

/**
 * Get quick sequence info without full parsing
 */
export async function getSequenceInfo(
  rom: Uint8Array,
  gameInfo: GameInfo,
  songIndex: number
): Promise<{ name: string; channels: number; length: number } | null> {
  switch (gameInfo.id) {
    case 'ff5':
    case 'ffmq': {
      const { getSequenceInfo: getFF5Info } = await import('@/parsers/ff5');
      const info = getFF5Info(rom, gameInfo, songIndex);
      if (!info) return null;
      return {
        name: info.name,
        channels: info.activeChannels,
        length: info.length,
      };
    }
    case 'ff6': {
      const { getSequenceInfo: getFF6Info } = await import('@/parsers/ff6');
      const info = getFF6Info(rom, gameInfo, songIndex);
      if (!info) return null;
      return {
        name: info.name,
        channels: info.activeChannels,
        length: info.length,
      };
    }
    default:
      return null;
  }
}

/**
 * Count total notes/events in a sequence
 */
export function countSequenceEvents(ast: SequenceAst): {
  notes: number;
  rests: number;
  commands: number;
  total: number;
} {
  let notes = 0;
  let rests = 0;
  let commands = 0;

  for (const track of ast.tracks) {
    for (const node of track.nodes) {
      if (node.type === 'note') {
        notes++;
      } else if (node.type === 'rest' || node.type === 'tie') {
        rests++;
      } else {
        commands++;
      }
    }
  }

  return { notes, rests, commands, total: notes + rests + commands };
}

/**
 * Summarize a parsed sequence for display
 */
export function summarizeSequence(ast: SequenceAst): string {
  const counts = countSequenceEvents(ast);
  const activeChannels = ast.tracks.filter(t => t.nodes.length > 0).length;

  const lines = [
    `Song: ${ast.songName ?? `#${ast.songIndex}`}`,
    `Source: ${ast.sourceGame.toUpperCase()}`,
    `Channels: ${activeChannels}/8 active`,
    `Events: ${counts.notes} notes, ${counts.rests} rests, ${counts.commands} commands`,
    `Instruments: ${ast.instrumentSet.join(', ') || 'none'}`,
  ];

  return lines.join('\n');
}
