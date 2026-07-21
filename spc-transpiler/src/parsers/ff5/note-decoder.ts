/**
 * FF5 Note/Tie/Rest Decoder
 * Converts FF5 note bytes (00-D1) to AST nodes
 */

import type { NoteNode, TieNode, RestNode } from '@/types/ast';
import {
  FF5_TIE_BASE,
  FF5_REST_BASE,
  FF5_DURATION_TICKS,
  decodeFF5Note,
  decodeFF5Tie,
  decodeFF5Rest,
  getFF5Ticks,
} from '@/constants/ff5-tables';

/**
 * Result of decoding a note/tie/rest byte.
 * Returns null if the byte is not a note (>= D2 = command)
 */
export type NoteDecodeResult = NoteNode | TieNode | RestNode | null;

/**
 * Decode a single byte as a note, tie, or rest.
 *
 * FF5 note encoding:
 * - 00-B3: Notes (12 semitones x 15 durations = 180 values)
 * - B4-C2: Ties (15 durations)
 * - C3-D1: Rests (15 durations)
 * - D2+:   Commands (not handled here)
 *
 * @param byte - The byte value to decode
 * @param offset - ROM offset for the source location
 * @param currentOctave - Current octave for note pitch (default 4)
 * @returns NoteNode, TieNode, RestNode, or null if byte >= D2
 */
export function decodeNote(
  byte: number,
  offset: number,
  currentOctave: number = 4
): NoteDecodeResult {
  // Check if it's a command byte (D2+)
  if (byte >= 0xD2) {
    return null;
  }

  // Try to decode as a note (00-B3)
  const noteData = decodeFF5Note(byte);
  if (noteData !== null) {
    const ticks = getFF5Ticks(noteData.durationIndex);
    return {
      type: 'note',
      sourceOffset: offset,
      sourceByte: byte,
      pitch: {
        semitone: noteData.semitone,
        octave: currentOctave,
      },
      duration: ticks,
    };
  }

  // Try to decode as a tie (B4-C2)
  const tieDurationIndex = decodeFF5Tie(byte);
  if (tieDurationIndex !== null) {
    const ticks = getFF5Ticks(tieDurationIndex);
    return {
      type: 'tie',
      sourceOffset: offset,
      sourceByte: byte,
      duration: ticks,
    };
  }

  // Try to decode as a rest (C3-D1)
  const restDurationIndex = decodeFF5Rest(byte);
  if (restDurationIndex !== null) {
    const ticks = getFF5Ticks(restDurationIndex);
    return {
      type: 'rest',
      sourceOffset: offset,
      sourceByte: byte,
      duration: ticks,
    };
  }

  // Should not reach here if byte < D2
  return null;
}

/**
 * Check if a byte is a note (00-B3).
 * @param byte - The byte to check
 * @returns true if byte represents a note
 */
export function isNote(byte: number): boolean {
  return byte <= 0xB3;
}

/**
 * Check if a byte is a tie (B4-C2).
 * @param byte - The byte to check
 * @returns true if byte represents a tie
 */
export function isTie(byte: number): boolean {
  return byte >= FF5_TIE_BASE && byte <= 0xC2;
}

/**
 * Check if a byte is a rest (C3-D1).
 * @param byte - The byte to check
 * @returns true if byte represents a rest
 */
export function isRest(byte: number): boolean {
  return byte >= FF5_REST_BASE && byte <= 0xD1;
}

/**
 * Check if a byte is any note-type (note, tie, or rest).
 * @param byte - The byte to check
 * @returns true if byte is not a command
 */
export function isNoteType(byte: number): boolean {
  return byte < 0xD2;
}

/**
 * Get duration info for display/debugging.
 *
 * @param durationIndex - Duration index (0-14)
 * @returns Object with tick count and note name
 */
export function getDurationInfo(durationIndex: number): { ticks: number; name: string } {
  const ticks = FF5_DURATION_TICKS[durationIndex] ?? 0;
  const names = ['1', '2.', '2', '3', '4.', '4', '6', '8.', '8', '12', '16', '24', '32', '48', '64'];
  const name = names[durationIndex] ?? '?';
  return { ticks, name };
}

/**
 * Get semitone name for display/debugging.
 *
 * @param semitone - Semitone index (0-11)
 * @returns Note name (C, C#, D, etc.)
 */
export function getSemitoneName(semitone: number): string {
  const names = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
  return names[semitone] ?? '?';
}
