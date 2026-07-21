/**
 * Duration conversion utilities for SPC-700 music transpiler.
 * Handles tick/millisecond conversions and duration quantization.
 */

/**
 * Standard ticks per whole note (192 = divisible by 2,3,4,6,8,12,16,24,32,48,64,96).
 * This allows clean representation of most common note durations.
 */
export const TICKS_PER_WHOLE = 192;

/** Ticks per quarter note */
export const TICKS_PER_QUARTER = TICKS_PER_WHOLE / 4; // 48

/** Ticks per eighth note */
export const TICKS_PER_EIGHTH = TICKS_PER_WHOLE / 8; // 24

/** Ticks per sixteenth note */
export const TICKS_PER_SIXTEENTH = TICKS_PER_WHOLE / 16; // 12

/**
 * Standard valid durations in ticks (common note values).
 * Includes dotted and triplet values.
 */
export const STANDARD_DURATIONS: readonly number[] = [
  192,  // whole
  144,  // dotted half
  128,  // whole triplet (2/3 of whole)
  96,   // half
  72,   // dotted quarter
  64,   // half triplet
  48,   // quarter
  36,   // dotted eighth
  32,   // quarter triplet
  24,   // eighth
  18,   // dotted sixteenth
  16,   // eighth triplet
  12,   // sixteenth
  8,    // sixteenth triplet
  6,    // thirty-second
  4,    // thirty-second triplet
  3,    // sixty-fourth
  2,    // sixty-fourth triplet
  1,    // 128th (minimum)
] as const;

/**
 * Convert ticks to milliseconds given a tempo.
 * Formula: ms = (ticks / TICKS_PER_QUARTER) * (60000 / bpm)
 * @param ticks - Duration in ticks
 * @param tempo - Tempo in BPM (beats per minute, where beat = quarter note)
 * @returns Duration in milliseconds
 */
export function ticksToMs(ticks: number, tempo: number): number {
  if (tempo <= 0) {
    throw new RangeError(`ticksToMs: tempo must be positive, got ${tempo}`);
  }
  const msPerQuarter = 60000 / tempo;
  return (ticks / TICKS_PER_QUARTER) * msPerQuarter;
}

/**
 * Convert milliseconds to ticks given a tempo.
 * @param ms - Duration in milliseconds
 * @param tempo - Tempo in BPM
 * @returns Duration in ticks
 */
export function msToTicks(ms: number, tempo: number): number {
  if (tempo <= 0) {
    throw new RangeError(`msToTicks: tempo must be positive, got ${tempo}`);
  }
  const msPerQuarter = 60000 / tempo;
  return (ms / msPerQuarter) * TICKS_PER_QUARTER;
}

/**
 * Find the closest valid duration from a list of valid durations.
 * @param ticks - The duration to quantize
 * @param validDurations - Array of valid duration values in ticks (defaults to STANDARD_DURATIONS)
 * @returns The closest valid duration
 */
export function quantizeTicks(
  ticks: number,
  validDurations: readonly number[] = STANDARD_DURATIONS
): number {
  if (validDurations.length === 0) {
    throw new Error('quantizeTicks: validDurations array is empty');
  }

  let closest = validDurations[0]!;
  let minDiff = Math.abs(ticks - closest);

  for (let i = 1; i < validDurations.length; i++) {
    const diff = Math.abs(ticks - validDurations[i]!);
    if (diff < minDiff) {
      minDiff = diff;
      closest = validDurations[i]!;
    }
  }

  return closest;
}

/**
 * Split a long duration into multiple valid durations that sum to the original.
 * Uses a greedy algorithm, taking the largest valid duration that fits.
 * @param ticks - The total duration to split
 * @param validDurations - Array of valid duration values in ticks (should be sorted descending)
 * @returns Array of durations that sum to approximately the input
 */
export function splitDuration(
  ticks: number,
  validDurations: readonly number[] = STANDARD_DURATIONS
): number[] {
  if (validDurations.length === 0) {
    throw new Error('splitDuration: validDurations array is empty');
  }

  // Sort descending to use greedy approach
  const sorted = [...validDurations].sort((a, b) => b - a);
  const result: number[] = [];
  let remaining = ticks;

  while (remaining > 0) {
    // Find largest duration that fits
    let found = false;
    for (const dur of sorted) {
      if (dur <= remaining) {
        result.push(dur);
        remaining -= dur;
        found = true;
        break;
      }
    }

    // If no duration fits, use the smallest one and accept the overshoot
    if (!found) {
      const smallest = sorted[sorted.length - 1]!;
      result.push(smallest);
      break;
    }
  }

  return result;
}

/**
 * Game-specific duration resolution info.
 */
export interface GameDurationInfo {
  /** Minimum tick resolution the game supports */
  minTicks: number;
  /** Maximum single note duration in ticks */
  maxTicks: number;
  /** Name of the game for error messages */
  name: string;
}

/** Known game duration specifications */
export const GAME_DURATIONS: Record<string, GameDurationInfo> = {
  ffv: {
    minTicks: 1,
    maxTicks: 255, // Single byte duration in FFV sound driver
    name: 'Final Fantasy V',
  },
  ffvi: {
    minTicks: 1,
    maxTicks: 255,
    name: 'Final Fantasy VI',
  },
  ct: {
    minTicks: 1,
    maxTicks: 255,
    name: 'Chrono Trigger',
  },
};

/**
 * Check if a duration can be represented exactly in the target game.
 * @param ticks - Duration in ticks
 * @param game - Game identifier (e.g., 'ffv', 'ffvi', 'ct')
 * @returns True if the duration can be represented exactly
 */
export function canRepresentExactly(ticks: number, game: string): boolean {
  const info = GAME_DURATIONS[game.toLowerCase()];
  if (!info) {
    // Unknown game - assume any integer tick value is valid
    return Number.isInteger(ticks) && ticks > 0;
  }

  return (
    Number.isInteger(ticks) &&
    ticks >= info.minTicks &&
    ticks <= info.maxTicks
  );
}

/**
 * Calculate the quantization error when rounding to the nearest valid duration.
 * @param ticks - The original duration
 * @param game - Game identifier, or undefined to use standard durations
 * @returns Error as a percentage (0-100), where 0 means exact match
 */
export function getQuantizationError(ticks: number, game?: string): number {
  if (ticks === 0) return 0;

  let validDurations = STANDARD_DURATIONS;

  // For specific games, filter durations to what the game supports
  if (game) {
    const info = GAME_DURATIONS[game.toLowerCase()];
    if (info) {
      validDurations = STANDARD_DURATIONS.filter(
        d => d >= info.minTicks && d <= info.maxTicks
      );
    }
  }

  const quantized = quantizeTicks(ticks, validDurations);
  const error = Math.abs(ticks - quantized) / ticks * 100;

  return Math.round(error * 100) / 100; // Round to 2 decimal places
}
