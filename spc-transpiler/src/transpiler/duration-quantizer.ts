/**
 * Duration Quantizer
 *
 * Handles the critical challenge of transpiling between games with
 * different duration grids:
 *
 * - FF4/FF5/FFMQ: 15 durations including triplets (1/3, 1/6, 1/12, 1/24, 1/48)
 * - FF6: 14 durations, NO triplets
 *
 * When transpiling FF5 → FF6, triplet notes must be quantized to the
 * nearest supported duration, which is lossy.
 */

import type { GameId, Ticks } from '@/types/ast';

/** Standard ticks per whole note */
export const TICKS_PER_WHOLE = 192;

/** Duration grids per game (in ticks) */
export const DURATION_GRIDS: Record<GameId, readonly number[]> = {
  ff4: [
    192, // 1/1 whole
    144, // 3/4 dotted half
    96,  // 1/2 half
    72,  // 3/8 dotted quarter
    64,  // 1/3 half triplet
    48,  // 1/4 quarter
    36,  // 3/16 dotted eighth
    32,  // 1/6 quarter triplet
    24,  // 1/8 eighth
    16,  // 1/12 eighth triplet
    12,  // 1/16 sixteenth
    8,   // 1/24 sixteenth triplet
    6,   // 1/32 thirty-second
    4,   // 1/48 thirty-second triplet
    3,   // 1/64 sixty-fourth
  ],
  ff5: [
    192, // 1 whole
    144, // 2. dotted half
    96,  // 2 half
    64,  // 3 half triplet
    72,  // 4. dotted quarter
    48,  // 4 quarter
    32,  // 6 quarter triplet
    36,  // 8. dotted eighth
    24,  // 8 eighth
    16,  // 12 eighth triplet
    12,  // 16 sixteenth
    8,   // 24 sixteenth triplet
    6,   // 32 thirty-second
    4,   // 48 thirty-second triplet
    3,   // 64 sixty-fourth
  ],
  ff6: [
    192, // 1 whole
    96,  // 2 half
    64,  // 3 (this is NOT triplet, it's 64 ticks)
    72,  // 4. dotted quarter
    48,  // 4 quarter
    32,  // 6 (32 ticks)
    36,  // 8. dotted eighth
    24,  // 8 eighth
    16,  // 12 (16 ticks)
    12,  // 16 sixteenth
    8,   // 24 (8 ticks)
    6,   // 32 thirty-second
    4,   // 48 (4 ticks)
    3,   // 64 sixty-fourth
  ],
  ffmq: [
    // FFMQ uses same grid as FF5
    192, 144, 96, 64, 72, 48, 32, 36, 24, 16, 12, 8, 6, 4, 3,
  ],
};

/** Triplet tick values (present in FF4/FF5/FFMQ, NOT in FF6) */
export const TRIPLET_TICKS = new Set([64, 32, 16, 8, 4]);

/** Check if a tick duration is a triplet */
export function isTriplet(ticks: Ticks): boolean {
  return TRIPLET_TICKS.has(ticks);
}

/** Check if target game supports this duration exactly */
export function isExactDuration(ticks: Ticks, targetGame: GameId): boolean {
  return DURATION_GRIDS[targetGame]?.includes(ticks) ?? false;
}

/** Quantization result */
export interface QuantizeResult {
  /** Quantized tick value */
  ticks: Ticks;
  /** Index in target game's duration array */
  durationIndex: number;
  /** Whether quantization was exact (no loss) */
  exact: boolean;
  /** Error in ticks (positive = longer, negative = shorter) */
  error: number;
  /** Error as percentage of original */
  errorPercent: number;
}

/**
 * Find the closest valid duration in the target game's grid
 */
export function quantizeDuration(ticks: Ticks, targetGame: GameId): QuantizeResult {
  const grid = DURATION_GRIDS[targetGame];
  if (!grid) {
    throw new Error(`Unknown game: ${targetGame}`);
  }

  // Check for exact match first
  const exactIndex = grid.indexOf(ticks);
  if (exactIndex !== -1) {
    return {
      ticks,
      durationIndex: exactIndex,
      exact: true,
      error: 0,
      errorPercent: 0,
    };
  }

  // Find closest
  let closestIndex = 0;
  let closestDiff = Math.abs(ticks - grid[0]!);

  for (let i = 1; i < grid.length; i++) {
    const diff = Math.abs(ticks - grid[i]!);
    if (diff < closestDiff) {
      closestDiff = diff;
      closestIndex = i;
    }
  }

  const quantized = grid[closestIndex]!;
  const error = quantized - ticks;

  return {
    ticks: quantized,
    durationIndex: closestIndex,
    exact: false,
    error,
    errorPercent: (error / ticks) * 100,
  };
}

/**
 * Split a duration into multiple valid durations if it can't be
 * represented exactly. Returns array of durations that sum to
 * approximately the original.
 *
 * Example: 40 ticks (not in FF6) → [36, 4] (close to 40)
 */
export function splitDuration(ticks: Ticks, targetGame: GameId): Ticks[] {
  const grid = DURATION_GRIDS[targetGame];
  if (!grid) return [ticks];

  // Check for exact match
  if (grid.includes(ticks)) {
    return [ticks];
  }

  // Try to find a combination of durations that sums to ticks
  const result: Ticks[] = [];
  let remaining = ticks;

  // Greedy approach: use largest fitting duration first
  const sortedGrid = [...grid].sort((a, b) => b - a);

  while (remaining > 0) {
    let found = false;

    for (const dur of sortedGrid) {
      if (dur <= remaining) {
        result.push(dur);
        remaining -= dur;
        found = true;
        break;
      }
    }

    if (!found) {
      // Remaining is smaller than smallest duration
      // Add smallest and accept the overshoot
      const smallest = sortedGrid[sortedGrid.length - 1]!;
      result.push(smallest);
      break;
    }
  }

  return result;
}

/**
 * Calculate total quantization error for a sequence
 */
export interface QuantizationReport {
  totalTicks: number;
  totalError: number;
  totalErrorPercent: number;
  exactCount: number;
  quantizedCount: number;
  worstError: { original: Ticks; quantized: Ticks; error: number } | null;
}

export function analyzeQuantization(
  durations: Ticks[],
  targetGame: GameId
): QuantizationReport {
  let totalTicks = 0;
  let totalError = 0;
  let exactCount = 0;
  let quantizedCount = 0;
  let worstError: QuantizationReport['worstError'] = null;

  for (const ticks of durations) {
    totalTicks += ticks;
    const result = quantizeDuration(ticks, targetGame);

    if (result.exact) {
      exactCount++;
    } else {
      quantizedCount++;
      totalError += Math.abs(result.error);

      if (!worstError || Math.abs(result.error) > Math.abs(worstError.error)) {
        worstError = {
          original: ticks,
          quantized: result.ticks,
          error: result.error,
        };
      }
    }
  }

  return {
    totalTicks,
    totalError,
    totalErrorPercent: totalTicks > 0 ? (totalError / totalTicks) * 100 : 0,
    exactCount,
    quantizedCount,
    worstError,
  };
}

/**
 * Get human-readable duration name
 */
export function getDurationName(ticks: Ticks): string {
  const names: Record<number, string> = {
    192: 'whole',
    144: 'dotted half',
    96: 'half',
    72: 'dotted quarter',
    64: 'half triplet',
    48: 'quarter',
    36: 'dotted eighth',
    32: 'quarter triplet',
    24: 'eighth',
    16: 'eighth triplet',
    12: 'sixteenth',
    8: 'sixteenth triplet',
    6: 'thirty-second',
    4: '32nd triplet',
    3: 'sixty-fourth',
  };

  return names[ticks] ?? `${ticks} ticks`;
}

/**
 * Format quantization warning message
 */
export function formatQuantizationWarning(
  original: Ticks,
  quantized: Ticks
): string {
  const origName = getDurationName(original);
  const quantName = getDurationName(quantized);
  const diff = quantized - original;
  const direction = diff > 0 ? 'longer' : 'shorter';
  const percent = Math.abs((diff / original) * 100).toFixed(1);

  return `${origName} → ${quantName} (${percent}% ${direction})`;
}
