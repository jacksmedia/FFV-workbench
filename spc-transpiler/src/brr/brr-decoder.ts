/**
 * BRR (Bit Rate Reduction) Sample Decoder
 *
 * Decodes SNES BRR-encoded audio samples to PCM.
 * Each BRR block (9 bytes) decodes to 16 PCM samples.
 *
 * The decoder implements the SPC700 BRR algorithm:
 * 1. Extract 4-bit nibbles from each byte (2 samples per byte)
 * 2. Scale by the range value (shift left by range+1)
 * 3. Apply prediction filter using previous samples
 * 4. Clamp to 16-bit range
 */

import type { BrrBlock, BrrSample, DecodedSample } from '../types/brr';
import {
  BRR_BLOCK_SIZE,
  SAMPLES_PER_BLOCK,
  parseBrrHeader,
  extractNibbles,
} from './brr-block';

/** Default sample rate for SNES audio (32 kHz) */
export const SNES_SAMPLE_RATE = 32000;

/**
 * Filter coefficients expressed as fractions.
 * These are the exact values from the SPC700 DSP.
 *
 * Filter 0: out = sample
 * Filter 1: out = sample + prev1 * 15/16
 * Filter 2: out = sample + prev1 * 61/32 - prev2 * 15/16
 * Filter 3: out = sample + prev1 * 115/64 - prev2 * 13/16
 */
export const FILTER_COEFFICIENTS = {
  0: { p1Num: 0, p1Den: 1, p2Num: 0, p2Den: 1 },
  1: { p1Num: 15, p1Den: 16, p2Num: 0, p2Den: 1 },
  2: { p1Num: 61, p1Den: 32, p2Num: -15, p2Den: 16 },
  3: { p1Num: 115, p1Den: 64, p2Num: -13, p2Den: 16 },
} as const;

/**
 * Decode a single BRR block to 16 PCM samples.
 *
 * @param headerByte - The header byte (contains range, filter, loop, end flags)
 * @param data8bytes - The 8 data bytes containing compressed samples
 * @param prev1 - Previous sample value (for prediction filter)
 * @param prev2 - Second previous sample value (for prediction filter)
 * @returns Object containing decoded samples and updated history values
 */
export function decodeBrrBlock(
  headerByte: number,
  data8bytes: Uint8Array,
  prev1: number = 0,
  prev2: number = 0
): { samples: Int16Array; newPrev1: number; newPrev2: number } {
  if (data8bytes.length !== 8) {
    throw new Error(`BRR data must be exactly 8 bytes, got ${data8bytes.length}`);
  }

  const header = parseBrrHeader(headerByte);
  const nibbles = extractNibbles(data8bytes);
  const samples = new Int16Array(SAMPLES_PER_BLOCK);

  const { range, filter } = header;
  let p1 = prev1;
  let p2 = prev2;

  for (let i = 0; i < SAMPLES_PER_BLOCK; i++) {
    // Scale the 4-bit sample by the range
    // Shift left by (range + 1), where range is 0-12
    // This gives a range of 1-13 bits of shift
    let sample = nibbles[i]! << (range + 1);

    // Apply the prediction filter
    sample = applyFilter(sample, filter, p1, p2);

    // Clamp to 16-bit signed range
    sample = clamp16(sample);

    samples[i] = sample;

    // Update history
    p2 = p1;
    p1 = sample;
  }

  return {
    samples,
    newPrev1: p1,
    newPrev2: p2,
  };
}

/**
 * Apply the BRR prediction filter to a sample.
 *
 * @param sample - The scaled input sample
 * @param filter - Filter type (0-3)
 * @param prev1 - Previous sample value
 * @param prev2 - Second previous sample value
 * @returns Filtered sample value
 */
function applyFilter(
  sample: number,
  filter: number,
  prev1: number,
  prev2: number
): number {
  switch (filter) {
    case 0:
      // Filter 0: Direct output, no prediction
      return sample;

    case 1:
      // Filter 1: out = sample + prev1 * 15/16
      // Use bit manipulation for efficiency: prev1 - (prev1 >> 4)
      return sample + prev1 - (prev1 >> 4);

    case 2:
      // Filter 2: out = sample + prev1 * 61/32 - prev2 * 15/16
      // prev1 * 61/32 = (prev1 * 61) >> 5
      // prev2 * 15/16 = prev2 - (prev2 >> 4)
      return sample + ((prev1 * 61) >> 5) - (prev2 - (prev2 >> 4));

    case 3:
      // Filter 3: out = sample + prev1 * 115/64 - prev2 * 13/16
      // prev1 * 115/64 = (prev1 * 115) >> 6
      // prev2 * 13/16 = (prev2 * 13) >> 4
      return sample + ((prev1 * 115) >> 6) - ((prev2 * 13) >> 4);

    default:
      return sample;
  }
}

/**
 * Clamp a value to 16-bit signed range.
 */
function clamp16(value: number): number {
  if (value < -32768) return -32768;
  if (value > 32767) return 32767;
  return value | 0; // Ensure integer
}

/**
 * Decode a complete BRR sample from raw bytes.
 * Reads blocks until an end flag is encountered.
 *
 * @param data - Raw BRR data buffer
 * @param startOffset - Starting offset in the data buffer
 * @param maxBlocks - Maximum blocks to decode (safety limit, default 256)
 * @returns Decoded BRR sample structure
 */
export function decodeBrrSample(
  data: Uint8Array,
  startOffset: number = 0,
  maxBlocks: number = 256
): BrrSample {
  const blocks: BrrBlock[] = [];
  let loopStart = -1;
  let offset = startOffset;
  let prev1 = 0;
  let prev2 = 0;
  let blockIndex = 0;

  while (offset + BRR_BLOCK_SIZE <= data.length && blockIndex < maxBlocks) {
    const blockData = data.slice(offset, offset + BRR_BLOCK_SIZE);
    const headerByte = blockData[0]!;
    const header = parseBrrHeader(headerByte);

    // Mark loop start
    if (header.loop && loopStart === -1) {
      loopStart = blockIndex;
    }

    // Decode the block
    const { samples, newPrev1, newPrev2 } = decodeBrrBlock(
      headerByte,
      blockData.slice(1),
      prev1,
      prev2
    );

    blocks.push({
      header: headerByte,
      headerParsed: header,
      samples,
      blockIndex,
    });

    prev1 = newPrev1;
    prev2 = newPrev2;
    offset += BRR_BLOCK_SIZE;
    blockIndex++;

    // Stop at end flag
    if (header.end) {
      break;
    }
  }

  const rawData = data.slice(startOffset, offset);

  return {
    blocks,
    loopStart,
    loopEnd: blocks.length - 1,
    sampleCount: blocks.length * SAMPLES_PER_BLOCK,
    rawData,
  };
}

/**
 * Decode BRR sample to a Float32Array of PCM samples.
 * Output is normalized to -1.0 to 1.0 range.
 *
 * @param data - Raw BRR data buffer
 * @param startOffset - Starting offset in the data buffer
 * @param maxBlocks - Maximum blocks to decode (safety limit)
 * @returns DecodedSample with normalized PCM data
 */
export function decodeBrrToFloat(
  data: Uint8Array,
  startOffset: number = 0,
  maxBlocks: number = 256
): DecodedSample {
  const brrSample = decodeBrrSample(data, startOffset, maxBlocks);
  return convertBrrSampleToFloat(brrSample);
}

/**
 * Convert a decoded BRR sample to Float32Array PCM.
 *
 * @param brrSample - Decoded BRR sample structure
 * @param sampleRate - Output sample rate (default: SNES native 32kHz)
 * @returns DecodedSample with normalized PCM data
 */
export function convertBrrSampleToFloat(
  brrSample: BrrSample,
  sampleRate: number = SNES_SAMPLE_RATE
): DecodedSample {
  const pcm = new Float32Array(brrSample.sampleCount);
  const scale = 1 / 32768;

  let pcmIndex = 0;
  for (const block of brrSample.blocks) {
    for (let i = 0; i < block.samples.length; i++) {
      // Normalize from Int16 (-32768 to 32767) to Float32 (-1.0 to 1.0)
      pcm[pcmIndex++] = block.samples[i]! * scale;
    }
  }

  return {
    pcm,
    sampleRate,
    loopStart: brrSample.loopStart >= 0
      ? brrSample.loopStart * SAMPLES_PER_BLOCK
      : -1,
    loopEnd: brrSample.loopEnd * SAMPLES_PER_BLOCK + SAMPLES_PER_BLOCK - 1,
    source: brrSample,
  };
}

/**
 * Calculate the total size in bytes of a BRR sample.
 *
 * @param data - Raw BRR data buffer
 * @param startOffset - Starting offset
 * @returns Size in bytes, or -1 if end flag not found within reasonable limit
 */
export function getBrrSampleSize(
  data: Uint8Array,
  startOffset: number = 0,
  maxBlocks: number = 256
): number {
  let offset = startOffset;
  let blockCount = 0;

  while (offset < data.length && blockCount < maxBlocks) {
    const headerByte = data[offset]!;
    const isEnd = (headerByte & 0x01) !== 0;

    offset += BRR_BLOCK_SIZE;
    blockCount++;

    if (isEnd) {
      return offset - startOffset;
    }
  }

  return -1; // End not found
}

/**
 * Find the loop point block index in a BRR sample.
 *
 * @param data - Raw BRR data buffer
 * @param startOffset - Starting offset
 * @returns Loop block index, or -1 if no loop flag found
 */
export function findLoopPoint(
  data: Uint8Array,
  startOffset: number = 0,
  maxBlocks: number = 256
): number {
  let offset = startOffset;
  let blockIndex = 0;

  while (offset < data.length && blockIndex < maxBlocks) {
    const headerByte = data[offset]!;
    const hasLoop = (headerByte & 0x02) !== 0;
    const isEnd = (headerByte & 0x01) !== 0;

    if (hasLoop) {
      return blockIndex;
    }

    offset += BRR_BLOCK_SIZE;
    blockIndex++;

    if (isEnd) {
      break;
    }
  }

  return -1;
}

/**
 * Decode multiple samples from a sample table.
 * Useful when processing an entire sample bank.
 *
 * @param data - Raw BRR data buffer
 * @param pointers - Array of offsets to each sample
 * @returns Array of decoded samples
 */
export function decodeSampleBank(
  data: Uint8Array,
  pointers: number[]
): DecodedSample[] {
  return pointers.map((offset) => decodeBrrToFloat(data, offset));
}

/**
 * Re-decode a sample with custom initial history values.
 * Useful for testing or simulating different playback contexts.
 *
 * @param data - Raw BRR data for a single sample
 * @param initialPrev1 - Initial previous sample value
 * @param initialPrev2 - Initial second previous sample value
 * @returns Decoded sample with custom history
 */
export function decodeBrrWithHistory(
  data: Uint8Array,
  initialPrev1: number = 0,
  initialPrev2: number = 0
): DecodedSample {
  const blocks: BrrBlock[] = [];
  let loopStart = -1;
  let offset = 0;
  let prev1 = initialPrev1;
  let prev2 = initialPrev2;
  let blockIndex = 0;

  while (offset + BRR_BLOCK_SIZE <= data.length) {
    const blockData = data.slice(offset, offset + BRR_BLOCK_SIZE);
    const headerByte = blockData[0]!;
    const header = parseBrrHeader(headerByte);

    if (header.loop && loopStart === -1) {
      loopStart = blockIndex;
    }

    const { samples, newPrev1, newPrev2 } = decodeBrrBlock(
      headerByte,
      blockData.slice(1),
      prev1,
      prev2
    );

    blocks.push({
      header: headerByte,
      headerParsed: header,
      samples,
      blockIndex,
    });

    prev1 = newPrev1;
    prev2 = newPrev2;
    offset += BRR_BLOCK_SIZE;
    blockIndex++;

    if (header.end) {
      break;
    }
  }

  const brrSample: BrrSample = {
    blocks,
    loopStart,
    loopEnd: blocks.length - 1,
    sampleCount: blocks.length * SAMPLES_PER_BLOCK,
    rawData: data.slice(0, offset),
  };

  return convertBrrSampleToFloat(brrSample);
}
