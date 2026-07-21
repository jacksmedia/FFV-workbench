/**
 * FF5 / FFMQ Note Tables and Duration Constants
 * Source: FF5_soundo.pdf, Gnilda-guide-FFV.pdf
 *
 * Note encoding: 00-B3 = notes, B4-C2 = ties, C3-D1 = rests
 * Same encoding used by FFMQ (Mystic Quest) and Seiken Densetsu 2
 */

/** Number of semitones (12 = C through B) */
export const SEMITONE_COUNT = 12;

/** Number of duration columns */
export const DURATION_COUNT = 15;

/**
 * Duration ticks indexed by column (0-14)
 * Column headers from docs: 1, 2., 2, 3, 4., 4, 6, 8., 8, 12, 16, 24, 32, 48, 64
 *
 * Tick values (192 = whole note):
 * 1=192, 2.=144(dotted half), 2=96, 3=64(triplet), 4.=72, 4=48,
 * 6=32(triplet qtr), 8.=36, 8=24, 12=16(triplet 8th), 16=12,
 * 24=8(triplet 16th), 32=6, 48=4(triplet 32nd), 64=3
 */
export const FF5_DURATION_TICKS: readonly number[] = [
  0xC0, // 192 - whole (1)
  0x90, // 144 - dotted half (2.)
  0x60, // 96  - half (2)
  0x40, // 64  - half triplet (3)
  0x48, // 72  - dotted quarter (4.)
  0x30, // 48  - quarter (4)
  0x20, // 32  - quarter triplet (6)
  0x24, // 36  - dotted eighth (8.)
  0x18, // 24  - eighth (8)
  0x10, // 16  - eighth triplet (12)
  0x0C, // 12  - sixteenth (16)
  0x08, // 8   - sixteenth triplet (24)
  0x06, // 6   - thirty-second (32)
  0x04, // 4   - thirty-second triplet (48)
  0x03, // 3   - sixty-fourth (64)
] as const;

/**
 * Note byte ranges:
 * - 00-0E: C (durations 0-14)
 * - 0F-1D: C#
 * - 1E-2C: D
 * - 2D-3B: D#
 * - 3C-4A: E
 * - 4B-59: F
 * - 5A-68: F#
 * - 69-77: G
 * - 78-86: G#
 * - 87-95: A
 * - 96-A4: A#
 * - A5-B3: B
 */
export const FF5_NOTE_BASE: readonly number[] = [
  0x00, // C
  0x0F, // C#
  0x1E, // D
  0x2D, // D#
  0x3C, // E
  0x4B, // F
  0x5A, // F#
  0x69, // G
  0x78, // G#
  0x87, // A
  0x96, // A#
  0xA5, // B
] as const;

/** Tie byte range: B4-C2 (15 durations) */
export const FF5_TIE_BASE = 0xB4;

/** Rest byte range: C3-D1 (15 durations) */
export const FF5_REST_BASE = 0xC3;

/** First command opcode (D2+) */
export const FF5_COMMAND_START = 0xD2;

/** Decode a note byte into semitone (0-11) and duration index (0-14) */
export function decodeFF5Note(byte: number): { semitone: number; durationIndex: number } | null {
  if (byte > 0xB3) return null; // Not a note

  const semitone = Math.floor(byte / DURATION_COUNT);
  const durationIndex = byte % DURATION_COUNT;

  return { semitone, durationIndex };
}

/** Decode a tie byte into duration index */
export function decodeFF5Tie(byte: number): number | null {
  if (byte < FF5_TIE_BASE || byte > 0xC2) return null;
  return byte - FF5_TIE_BASE;
}

/** Decode a rest byte into duration index */
export function decodeFF5Rest(byte: number): number | null {
  if (byte < FF5_REST_BASE || byte > 0xD1) return null;
  return byte - FF5_REST_BASE;
}

/** Get tick count for a duration index */
export function getFF5Ticks(durationIndex: number): number {
  return FF5_DURATION_TICKS[durationIndex] ?? 0;
}

/** Encode semitone (0-11) and duration index (0-14) into note byte */
export function encodeFF5Note(semitone: number, durationIndex: number): number {
  return (FF5_NOTE_BASE[semitone] ?? 0) + durationIndex;
}

/** Encode tie with duration index */
export function encodeFF5Tie(durationIndex: number): number {
  return FF5_TIE_BASE + durationIndex;
}

/** Encode rest with duration index */
export function encodeFF5Rest(durationIndex: number): number {
  return FF5_REST_BASE + durationIndex;
}

/** Find closest duration index for a given tick count */
export function findClosestFF5Duration(ticks: number): number {
  let closestIndex = 0;
  let closestDiff = Math.abs(ticks - FF5_DURATION_TICKS[0]!);

  for (let i = 1; i < FF5_DURATION_TICKS.length; i++) {
    const diff = Math.abs(ticks - FF5_DURATION_TICKS[i]!);
    if (diff < closestDiff) {
      closestDiff = diff;
      closestIndex = i;
    }
  }

  return closestIndex;
}

/** Semitone names for display */
export const SEMITONE_NAMES = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'] as const;

/** Duration names for display */
export const DURATION_NAMES = ['1', '2.', '2', '3', '4.', '4', '6', '8.', '8', '12', '16', '24', '32', '48', '64'] as const;

/** Reverse lookup: tick value → duration index */
export const FF5_DURATION_INDICES: Record<number, number> = {
  192: 0,  // whole
  144: 1,  // dotted half
  96: 2,   // half
  64: 3,   // half triplet
  72: 4,   // dotted quarter
  48: 5,   // quarter
  32: 6,   // quarter triplet
  36: 7,   // dotted eighth
  24: 8,   // eighth
  16: 9,   // eighth triplet
  12: 10,  // sixteenth
  8: 11,   // sixteenth triplet
  6: 12,   // thirty-second
  4: 13,   // thirty-second triplet
  3: 14,   // sixty-fourth
};
