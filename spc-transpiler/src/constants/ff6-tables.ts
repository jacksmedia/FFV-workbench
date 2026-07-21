/**
 * FF6 Note Tables and Duration Constants
 * Source: Gnilda-guide-FF6.pdf
 *
 * Note encoding: 00-A7 = notes, A8-B5 = ties, B6-C3 = rests
 * FF6 uses 14 durations (NO triplets) vs FF5's 15 durations
 *
 * Key difference from FF5: FF6 lacks triplet durations entirely.
 * This is a major transpilation challenge when converting from FF5.
 */

/** Number of semitones (12 = C through B) */
export const SEMITONE_COUNT = 12;

/** Number of duration columns (FF6 has 14, not 15 like FF5) */
export const FF6_DURATION_COUNT = 14;

/**
 * Duration ticks indexed by column (0-13)
 * Column headers from docs: 1, 2, 3, 4., 4, 6, 8., 8, 12, 16, 24, 32, 48, 64
 *
 * Tick values (192 = whole note):
 * 1=192(C0), 2=96(60), 3=64(40), 4.=72(48), 4=48(30), 6=32(20),
 * 8.=36(24), 8=24(18), 12=16(10), 16=12(0C), 24=8(08), 32=6(06), 48=4(04), 64=3(03)
 *
 * NOTE: FF6 has NO dotted half (2.) and NO triplet durations!
 * The "3" here is a half-note triplet equivalent (64 ticks), NOT a triplet marker.
 */
export const FF6_DURATION_TICKS: readonly number[] = [
  0xC0, // 192 - whole (1)
  0x60, // 96  - half (2)
  0x40, // 64  - "3" (half triplet equivalent, but not true triplet)
  0x48, // 72  - dotted quarter (4.)
  0x30, // 48  - quarter (4)
  0x20, // 32  - "6" (quarter triplet equivalent)
  0x24, // 36  - dotted eighth (8.)
  0x18, // 24  - eighth (8)
  0x10, // 16  - "12" (eighth triplet equivalent)
  0x0C, // 12  - sixteenth (16)
  0x08, // 8   - "24" (sixteenth triplet equivalent)
  0x06, // 6   - thirty-second (32)
  0x04, // 4   - "48" (thirty-second triplet equivalent)
  0x03, // 3   - sixty-fourth (64)
] as const;

/**
 * Note byte ranges (14 durations per semitone):
 * - 00-0D: C (durations 0-13)
 * - 0E-1B: C#
 * - 1C-29: D
 * - 2A-37: D#
 * - 38-45: E
 * - 46-53: F
 * - 54-61: F#
 * - 62-6F: G
 * - 70-7D: G#
 * - 7E-8B: A
 * - 8C-99: A#
 * - 9A-A7: B
 */
export const FF6_NOTE_BASE: readonly number[] = [
  0x00, // C
  0x0E, // C#
  0x1C, // D
  0x2A, // D#
  0x38, // E
  0x46, // F
  0x54, // F#
  0x62, // G
  0x70, // G#
  0x7E, // A
  0x8C, // A#
  0x9A, // B
] as const;

/** Tie byte range: A8-B5 (14 durations) */
export const FF6_TIE_BASE = 0xA8;
export const FF6_TIE_END = 0xB5;

/** Rest byte range: B6-C3 (14 durations) */
export const FF6_REST_BASE = 0xB6;
export const FF6_REST_END = 0xC3;

/** First command opcode (C4+) */
export const FF6_COMMAND_START = 0xC4;

/** Maximum note byte value */
export const FF6_MAX_NOTE = 0xA7;

/** Decode a note byte into semitone (0-11) and duration index (0-13) */
export function decodeFF6Note(byte: number): { semitone: number; durationIndex: number } | null {
  if (byte > FF6_MAX_NOTE) return null; // Not a note

  const semitone = Math.floor(byte / FF6_DURATION_COUNT);
  const durationIndex = byte % FF6_DURATION_COUNT;

  return { semitone, durationIndex };
}

/** Decode a tie byte into duration index */
export function decodeFF6Tie(byte: number): number | null {
  if (byte < FF6_TIE_BASE || byte > FF6_TIE_END) return null;
  return byte - FF6_TIE_BASE;
}

/** Decode a rest byte into duration index */
export function decodeFF6Rest(byte: number): number | null {
  if (byte < FF6_REST_BASE || byte > FF6_REST_END) return null;
  return byte - FF6_REST_BASE;
}

/** Get tick count for a duration index */
export function getFF6Ticks(durationIndex: number): number {
  return FF6_DURATION_TICKS[durationIndex] ?? 0;
}

/** Encode semitone (0-11) and duration index (0-13) into note byte */
export function encodeFF6Note(semitone: number, durationIndex: number): number {
  if (semitone < 0 || semitone >= SEMITONE_COUNT) {
    throw new Error(`Invalid semitone: ${semitone}`);
  }
  if (durationIndex < 0 || durationIndex >= FF6_DURATION_COUNT) {
    throw new Error(`Invalid duration index: ${durationIndex}`);
  }
  return (FF6_NOTE_BASE[semitone] ?? 0) + durationIndex;
}

/** Encode tie with duration index */
export function encodeFF6Tie(durationIndex: number): number {
  if (durationIndex < 0 || durationIndex >= FF6_DURATION_COUNT) {
    throw new Error(`Invalid duration index for tie: ${durationIndex}`);
  }
  return FF6_TIE_BASE + durationIndex;
}

/** Encode rest with duration index */
export function encodeFF6Rest(durationIndex: number): number {
  if (durationIndex < 0 || durationIndex >= FF6_DURATION_COUNT) {
    throw new Error(`Invalid duration index for rest: ${durationIndex}`);
  }
  return FF6_REST_BASE + durationIndex;
}

/** Find closest duration index for a given tick count */
export function findClosestFF6Duration(ticks: number): number {
  let closestIndex = 0;
  let closestDiff = Math.abs(ticks - FF6_DURATION_TICKS[0]!);

  for (let i = 1; i < FF6_DURATION_TICKS.length; i++) {
    const diff = Math.abs(ticks - FF6_DURATION_TICKS[i]!);
    if (diff < closestDiff) {
      closestDiff = diff;
      closestIndex = i;
    }
  }

  return closestIndex;
}

/**
 * Find exact duration match, or return null if no exact match exists.
 * Useful for detecting when triplet approximation is needed.
 */
export function findExactFF6Duration(ticks: number): number | null {
  const index = FF6_DURATION_TICKS.indexOf(ticks);
  return index >= 0 ? index : null;
}

/**
 * Check if a tick value requires approximation (no exact FF6 match).
 * FF5 triplet ticks that have no FF6 equivalent: 144 (dotted half), and
 * any true triplet values that don't align with FF6's grid.
 */
export function requiresApproximation(ticks: number): boolean {
  return findExactFF6Duration(ticks) === null;
}

/** Check if byte is a note (00-A7) */
export function isFF6Note(byte: number): boolean {
  return byte <= FF6_MAX_NOTE;
}

/** Check if byte is a tie (A8-B5) */
export function isFF6Tie(byte: number): boolean {
  return byte >= FF6_TIE_BASE && byte <= FF6_TIE_END;
}

/** Check if byte is a rest (B6-C3) */
export function isFF6Rest(byte: number): boolean {
  return byte >= FF6_REST_BASE && byte <= FF6_REST_END;
}

/** Semitone names for display */
export const SEMITONE_NAMES = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'] as const;

/** Duration names for display (FF6's 14 columns) */
export const FF6_DURATION_NAMES = ['1', '2', '3', '4.', '4', '6', '8.', '8', '12', '16', '24', '32', '48', '64'] as const;

/**
 * Mapping of FF5 duration indices to closest FF6 equivalents.
 * FF5 has 15 durations, FF6 has 14 - the dotted half (2.) is missing.
 *
 * FF5 indices: 0=1, 1=2., 2=2, 3=3, 4=4., 5=4, 6=6, 7=8., 8=8, 9=12, 10=16, 11=24, 12=32, 13=48, 14=64
 * FF6 indices: 0=1, 1=2, 2=3, 3=4., 4=4, 5=6, 6=8., 7=8, 8=12, 9=16, 10=24, 11=32, 12=48, 13=64
 */
export const FF5_TO_FF6_DURATION_MAP: readonly number[] = [
  0,  // FF5[0] 1 (192) -> FF6[0] 1 (192)
  1,  // FF5[1] 2. (144) -> FF6[1] 2 (96) - APPROXIMATION! Dotted half maps to half
  1,  // FF5[2] 2 (96) -> FF6[1] 2 (96)
  2,  // FF5[3] 3 (64) -> FF6[2] 3 (64)
  3,  // FF5[4] 4. (72) -> FF6[3] 4. (72)
  4,  // FF5[5] 4 (48) -> FF6[4] 4 (48)
  5,  // FF5[6] 6 (32) -> FF6[5] 6 (32)
  6,  // FF5[7] 8. (36) -> FF6[6] 8. (36)
  7,  // FF5[8] 8 (24) -> FF6[7] 8 (24)
  8,  // FF5[9] 12 (16) -> FF6[8] 12 (16)
  9,  // FF5[10] 16 (12) -> FF6[9] 16 (12)
  10, // FF5[11] 24 (8) -> FF6[10] 24 (8)
  11, // FF5[12] 32 (6) -> FF6[11] 32 (6)
  12, // FF5[13] 48 (4) -> FF6[12] 48 (4)
  13, // FF5[14] 64 (3) -> FF6[13] 64 (3)
] as const;

/** Convert FF5 duration index to FF6 duration index */
export function convertFF5ToFF6Duration(ff5DurationIndex: number): number {
  return FF5_TO_FF6_DURATION_MAP[ff5DurationIndex] ?? 0;
}

/** Reverse lookup: tick value → duration index */
export const FF6_DURATION_INDICES: Record<number, number> = {
  192: 0,  // whole
  96: 1,   // half
  64: 2,   // "3" (64 ticks)
  72: 3,   // dotted quarter
  48: 4,   // quarter
  32: 5,   // "6" (32 ticks)
  36: 6,   // dotted eighth
  24: 7,   // eighth
  16: 8,   // "12" (16 ticks)
  12: 9,   // sixteenth
  8: 10,   // "24" (8 ticks)
  6: 11,   // thirty-second
  4: 12,   // "48" (4 ticks)
  3: 13,   // sixty-fourth
};
