/**
 * BRR Block Structure and Header Parsing
 *
 * BRR (Bit Rate Reduction) is the SNES audio compression format.
 * Each block is exactly 9 bytes and decodes to 16 PCM samples.
 *
 * Block structure:
 * - Byte 0: Header byte
 * - Bytes 1-8: Compressed sample data (4 bits per sample, 2 samples per byte)
 *
 * Header byte layout (MSB to LSB):
 * - Bits 7-4: Range (shift amount, 0-12)
 * - Bits 3-2: Filter type (0-3)
 * - Bit 1: Loop flag (1 = this block is a loop point)
 * - Bit 0: End flag (1 = last block of sample)
 *
 * Range values 13-15 behave the same as 12 on real hardware.
 */

import type { BrrHeader, BrrBlock } from '../types/brr';

/** BRR block size in bytes (1 header + 8 data) */
export const BRR_BLOCK_SIZE = 9;

/** Number of PCM samples per BRR block */
export const SAMPLES_PER_BLOCK = 16;

/** Maximum valid range value (13-15 clamp to 12) */
export const MAX_RANGE = 12;

/**
 * Parse a BRR header byte into its component fields.
 *
 * @param headerByte - The raw header byte value (0-255)
 * @returns Parsed header fields
 */
export function parseBrrHeader(headerByte: number): BrrHeader {
  // Range is upper 4 bits, clamp to max of 12
  let range = (headerByte >> 4) & 0x0F;
  if (range > MAX_RANGE) {
    range = MAX_RANGE;
  }

  return {
    range,
    filter: (headerByte >> 2) & 0x03,
    loop: (headerByte & 0x02) !== 0,
    end: (headerByte & 0x01) !== 0,
  };
}

/**
 * Encode header fields back to a byte value.
 *
 * @param header - Parsed header fields
 * @returns Raw header byte
 */
export function encodeBrrHeader(header: BrrHeader): number {
  const range = Math.min(Math.max(0, header.range), 15);
  const filter = header.filter & 0x03;
  const loop = header.loop ? 0x02 : 0x00;
  const end = header.end ? 0x01 : 0x00;

  return (range << 4) | (filter << 2) | loop | end;
}

/**
 * Extract the 16 nibbles (4-bit samples) from the 8 data bytes.
 * Each byte contains two nibbles: high nibble first, then low nibble.
 *
 * @param data - 8 bytes of compressed sample data
 * @returns Array of 16 signed 4-bit values (-8 to 7)
 */
export function extractNibbles(data: Uint8Array): Int8Array {
  if (data.length !== 8) {
    throw new Error(`BRR data must be exactly 8 bytes, got ${data.length}`);
  }

  const nibbles = new Int8Array(16);

  for (let i = 0; i < 8; i++) {
    const byte = data[i]!;
    // High nibble first (bits 7-4)
    let highNibble = (byte >> 4) & 0x0F;
    // Low nibble second (bits 3-0)
    let lowNibble = byte & 0x0F;

    // Sign-extend from 4-bit to 8-bit (-8 to 7)
    if (highNibble >= 8) highNibble -= 16;
    if (lowNibble >= 8) lowNibble -= 16;

    nibbles[i * 2] = highNibble;
    nibbles[i * 2 + 1] = lowNibble;
  }

  return nibbles;
}

/**
 * Create a BRR block structure from raw bytes.
 *
 * @param data - 9 bytes (1 header + 8 data)
 * @param blockIndex - Index of this block in the sample
 * @param prev1 - Previous sample value (for filter)
 * @param prev2 - Second previous sample value (for filter)
 * @returns BRR block with decoded samples
 */
export function createBrrBlock(
  data: Uint8Array,
  blockIndex: number,
  prev1: number,
  prev2: number
): BrrBlock {
  if (data.length !== BRR_BLOCK_SIZE) {
    throw new Error(`BRR block must be exactly ${BRR_BLOCK_SIZE} bytes, got ${data.length}`);
  }

  const header = data[0]!;
  const headerParsed = parseBrrHeader(header);
  const samples = decodeBrrBlockSamples(headerParsed, data.slice(1), prev1, prev2);

  return {
    header,
    headerParsed,
    samples,
    blockIndex,
  };
}

/**
 * Decode the 16 samples from a BRR block's data bytes.
 * This is an internal function - use decodeBrrBlock from brr-decoder.ts for the public API.
 *
 * @param header - Parsed header fields
 * @param data - 8 data bytes
 * @param prev1 - Previous sample value
 * @param prev2 - Second previous sample value
 * @returns 16 decoded PCM samples as Int16Array
 */
function decodeBrrBlockSamples(
  header: BrrHeader,
  data: Uint8Array,
  prev1: number,
  prev2: number
): Int16Array {
  const nibbles = extractNibbles(data);
  const samples = new Int16Array(16);

  const { range, filter } = header;
  let p1 = prev1;
  let p2 = prev2;

  for (let i = 0; i < 16; i++) {
    // Scale the 4-bit sample by the range
    // Range 0 = shift left 1, range 12 = shift left 13
    let sample = nibbles[i]! << (range + 1);

    // Apply the prediction filter
    switch (filter) {
      case 0:
        // No filter: output = sample
        break;

      case 1:
        // Filter 1: out = sample + prev1 * 15/16
        // Approximation: (prev1 * 15) >> 4 = prev1 - (prev1 >> 4)
        sample += p1 - (p1 >> 4);
        break;

      case 2:
        // Filter 2: out = sample + prev1 * 61/32 - prev2 * 15/16
        // 61/32 ~ 1.90625
        // prev1 * 61/32 = (prev1 * 61) >> 5
        sample += (p1 * 61 >> 5) - (p2 * 15 >> 4);
        break;

      case 3:
        // Filter 3: out = sample + prev1 * 115/64 - prev2 * 13/16
        // 115/64 ~ 1.796875
        // prev1 * 115/64 = (prev1 * 115) >> 6
        sample += (p1 * 115 >> 6) - (p2 * 13 >> 4);
        break;
    }

    // Clamp to 16-bit signed range
    sample = clamp16(sample);

    samples[i] = sample;

    // Shift history
    p2 = p1;
    p1 = sample;
  }

  return samples;
}

/**
 * Clamp a value to 16-bit signed range (-32768 to 32767).
 */
function clamp16(value: number): number {
  if (value < -32768) return -32768;
  if (value > 32767) return 32767;
  return value;
}

/**
 * Check if a block header indicates the end of a sample.
 */
export function isEndBlock(headerByte: number): boolean {
  return (headerByte & 0x01) !== 0;
}

/**
 * Check if a block header indicates a loop point.
 */
export function isLoopBlock(headerByte: number): boolean {
  return (headerByte & 0x02) !== 0;
}

/**
 * Get the filter type from a header byte.
 */
export function getFilterType(headerByte: number): number {
  return (headerByte >> 2) & 0x03;
}

/**
 * Get the range value from a header byte.
 */
export function getRangeValue(headerByte: number): number {
  const range = (headerByte >> 4) & 0x0F;
  return range > MAX_RANGE ? MAX_RANGE : range;
}

/**
 * Filter type names for debugging/display.
 */
export const FILTER_NAMES = [
  'Direct',      // Filter 0: No prediction
  'Linear 1',    // Filter 1: prev1 * 15/16
  'Linear 2',    // Filter 2: prev1 * 61/32 - prev2 * 15/16
  'Linear 3',    // Filter 3: prev1 * 115/64 - prev2 * 13/16
] as const;
