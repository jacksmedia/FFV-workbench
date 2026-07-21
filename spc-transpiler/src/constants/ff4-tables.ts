/**
 * FF4 Note Tables and Duration Constants
 * Source: chillyfeez-FF4-music-hacking.txt
 *
 * Note encoding: 00-B3 = notes, B4-C2 = rests, C3-D1 = ties
 * FF4 uses the same 12 semitones x 15 durations grid as FF5,
 * but with a DIFFERENT duration mapping!
 */

/** Number of semitones (12 = C through B) */
export const SEMITONE_COUNT = 12;

/** Number of duration columns */
export const DURATION_COUNT = 15;

/**
 * Duration ticks indexed by column (0-14)
 * FF4 duration grid differs from FF5!
 *
 * Column headers: 1/1, 3/4, 1/2, 3/8, 1/3, 1/4, 3/16, 1/6, 1/8, 1/12, 1/16, 1/24, 1/32, 1/48, 1/64
 * - 3/4 (dotted half), 3/8 (dotted quarter), 3/16 (dotted eighth) are dotted notes
 * - 1/3, 1/6, 1/12, 1/24, 1/48 are triplet durations
 *
 * Tick values (192 = whole note):
 * 1/1=192, 3/4=144, 1/2=96, 3/8=72, 1/3=64, 1/4=48,
 * 3/16=36, 1/6=32, 1/8=24, 1/12=16, 1/16=12,
 * 1/24=8, 1/32=6, 1/48=4, 1/64=3
 */
export const FF4_DURATION_TICKS: readonly number[] = [
  0xC0, // 192 - whole (1/1)
  0x90, // 144 - dotted half (3/4)
  0x60, // 96  - half (1/2)
  0x48, // 72  - dotted quarter (3/8)
  0x40, // 64  - half triplet (1/3)
  0x30, // 48  - quarter (1/4)
  0x24, // 36  - dotted eighth (3/16)
  0x20, // 32  - quarter triplet (1/6)
  0x18, // 24  - eighth (1/8)
  0x10, // 16  - eighth triplet (1/12)
  0x0C, // 12  - sixteenth (1/16)
  0x08, // 8   - sixteenth triplet (1/24)
  0x06, // 6   - thirty-second (1/32)
  0x04, // 4   - thirty-second triplet (1/48)
  0x03, // 3   - sixty-fourth (1/64)
] as const;

/**
 * Note byte ranges (same as FF5):
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
export const FF4_NOTE_BASE: readonly number[] = [
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

/** Rest byte range: B4-C2 (15 durations) - NOTE: FF4 has rests BEFORE ties! */
export const FF4_REST_BASE = 0xB4;

/** Tie byte range: C3-D1 (15 durations) */
export const FF4_TIE_BASE = 0xC3;

/** First command opcode (D2+) */
export const FF4_COMMAND_START = 0xD2;

/** Decode a note byte into semitone (0-11) and duration index (0-14) */
export function decodeFF4Note(byte: number): { semitone: number; durationIndex: number } | null {
  if (byte > 0xB3) return null; // Not a note

  const semitone = Math.floor(byte / DURATION_COUNT);
  const durationIndex = byte % DURATION_COUNT;

  return { semitone, durationIndex };
}

/** Decode a rest byte into duration index */
export function decodeFF4Rest(byte: number): number | null {
  if (byte < FF4_REST_BASE || byte > 0xC2) return null;
  return byte - FF4_REST_BASE;
}

/** Decode a tie byte into duration index */
export function decodeFF4Tie(byte: number): number | null {
  if (byte < FF4_TIE_BASE || byte > 0xD1) return null;
  return byte - FF4_TIE_BASE;
}

/** Get tick count for a duration index */
export function getFF4Ticks(durationIndex: number): number {
  return FF4_DURATION_TICKS[durationIndex] ?? 0;
}

/** Encode semitone (0-11) and duration index (0-14) into note byte */
export function encodeFF4Note(semitone: number, durationIndex: number): number {
  return (FF4_NOTE_BASE[semitone] ?? 0) + durationIndex;
}

/** Encode rest with duration index */
export function encodeFF4Rest(durationIndex: number): number {
  return FF4_REST_BASE + durationIndex;
}

/** Encode tie with duration index */
export function encodeFF4Tie(durationIndex: number): number {
  return FF4_TIE_BASE + durationIndex;
}

/** Find closest duration index for a given tick count */
export function findClosestFF4Duration(ticks: number): number {
  let closestIndex = 0;
  let closestDiff = Math.abs(ticks - FF4_DURATION_TICKS[0]!);

  for (let i = 1; i < FF4_DURATION_TICKS.length; i++) {
    const diff = Math.abs(ticks - FF4_DURATION_TICKS[i]!);
    if (diff < closestDiff) {
      closestDiff = diff;
      closestIndex = i;
    }
  }

  return closestIndex;
}

/** Semitone names for display */
export const SEMITONE_NAMES = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'] as const;

/**
 * Duration names for display (FF4 notation)
 * Uses fraction notation to distinguish from FF5's beat notation
 */
export const FF4_DURATION_NAMES = [
  '1/1',   // whole
  '3/4',   // dotted half
  '1/2',   // half
  '3/8',   // dotted quarter
  '1/3',   // half triplet
  '1/4',   // quarter
  '3/16',  // dotted eighth
  '1/6',   // quarter triplet
  '1/8',   // eighth
  '1/12',  // eighth triplet
  '1/16',  // sixteenth
  '1/24',  // sixteenth triplet
  '1/32',  // thirty-second
  '1/48',  // thirty-second triplet
  '1/64',  // sixty-fourth
] as const;
