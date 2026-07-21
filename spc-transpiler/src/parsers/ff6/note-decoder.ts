/**
 * FF6 Note Decoder
 *
 * FF6 encoding:
 * - Notes: 00-A7 (12 semitones × 14 durations)
 * - Ties: A8-B5 (14 durations)
 * - Rests: B6-C3 (14 durations)
 * - Commands: C4-FF
 *
 * KEY DIFFERENCE: FF6 has 14 durations (no triplets), not 15 like FF5.
 */

import type { NoteNode, TieNode, RestNode, NotePitch } from '@/types/ast';
import {
  FF6_DURATION_TICKS,
  FF6_MAX_NOTE,
  FF6_TIE_BASE,
  FF6_TIE_END,
  FF6_REST_BASE,
  FF6_REST_END,
  FF6_COMMAND_START,
  decodeFF6Note,
  decodeFF6Tie,
  decodeFF6Rest,
  SEMITONE_NAMES,
} from '@/constants/ff6-tables';

export interface NoteDecodeResult {
  node: NoteNode | TieNode | RestNode;
  bytesConsumed: number;
}

/**
 * Check if byte is a note (00-A7)
 */
export function isNote(byte: number): boolean {
  return byte <= FF6_MAX_NOTE;
}

/**
 * Check if byte is a tie (A8-B5)
 */
export function isTie(byte: number): boolean {
  return byte >= FF6_TIE_BASE && byte <= FF6_TIE_END;
}

/**
 * Check if byte is a rest (B6-C3)
 */
export function isRest(byte: number): boolean {
  return byte >= FF6_REST_BASE && byte <= FF6_REST_END;
}

/**
 * Check if byte is any note-type (note, tie, or rest)
 */
export function isNoteType(byte: number): boolean {
  return byte < FF6_COMMAND_START;
}

/**
 * Decode a note/tie/rest byte into AST node
 */
export function decodeNote(
  byte: number,
  currentOctave: number,
  sourceOffset: number
): NoteDecodeResult | null {
  // Try note (00-A7)
  if (isNote(byte)) {
    const decoded = decodeFF6Note(byte);
    if (!decoded) return null;

    const { semitone, durationIndex } = decoded;
    const ticks = FF6_DURATION_TICKS[durationIndex];
    if (ticks === undefined) return null;

    const pitch: NotePitch = {
      semitone,
      octave: currentOctave,
    };

    const node: NoteNode = {
      type: 'note',
      pitch,
      duration: ticks,
      sourceOffset,
      sourceByte: byte,
    };

    return { node, bytesConsumed: 1 };
  }

  // Try tie (A8-B5)
  if (isTie(byte)) {
    const durationIndex = decodeFF6Tie(byte);
    if (durationIndex === null) return null;

    const ticks = FF6_DURATION_TICKS[durationIndex];
    if (ticks === undefined) return null;

    const node: TieNode = {
      type: 'tie',
      duration: ticks,
      sourceOffset,
      sourceByte: byte,
    };

    return { node, bytesConsumed: 1 };
  }

  // Try rest (B6-C3)
  if (isRest(byte)) {
    const durationIndex = decodeFF6Rest(byte);
    if (durationIndex === null) return null;

    const ticks = FF6_DURATION_TICKS[durationIndex];
    if (ticks === undefined) return null;

    const node: RestNode = {
      type: 'rest',
      duration: ticks,
      sourceOffset,
      sourceByte: byte,
    };

    return { node, bytesConsumed: 1 };
  }

  return null;
}

/**
 * Get duration info for display
 */
export function getDurationInfo(durationIndex: number): {
  ticks: number;
  name: string;
} {
  const ticks = FF6_DURATION_TICKS[durationIndex] ?? 0;
  const names = ['1', '2', '3', '4.', '4', '6', '8.', '8', '12', '16', '24', '32', '48', '64'];
  return {
    ticks,
    name: names[durationIndex] ?? `?${durationIndex}`,
  };
}

/**
 * Get semitone name
 */
export function getSemitoneName(semitone: number): string {
  return SEMITONE_NAMES[semitone] ?? '?';
}
