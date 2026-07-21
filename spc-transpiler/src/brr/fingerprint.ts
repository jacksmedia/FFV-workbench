/**
 * BRR Sample Fingerprinting
 *
 * Generates hashes for sample identification and matching.
 * Useful for:
 * - Identifying samples reused across different games
 * - Detecting duplicate samples in a ROM
 * - Building a sample library with deduplication
 */

import type { SampleFingerprint, BrrSample } from '../types/brr';

/** Number of PCM samples to use for fingerprinting */
const FINGERPRINT_SAMPLE_COUNT = 1024;

/** Number of spectral bins for frequency fingerprinting */
const SPECTRAL_BINS = 32;

/**
 * Compute a fingerprint for a PCM sample.
 * Uses spectral characteristics for robust matching.
 *
 * @param pcm - Float32Array of PCM samples (-1.0 to 1.0)
 * @returns Hex string hash for the sample
 */
export function computeFingerprint(pcm: Float32Array): string {
  // Use first N samples (or all if shorter)
  const sampleCount = Math.min(pcm.length, FINGERPRINT_SAMPLE_COUNT);
  const samples = pcm.slice(0, sampleCount);

  // Compute spectral hash using simple DFT bins
  const spectralHash = computeSpectralHash(samples);

  // Compute amplitude envelope hash
  const envelopeHash = computeEnvelopeHash(samples);

  // Combine hashes
  return spectralHash + envelopeHash;
}

/**
 * Compute spectral characteristics using a simple DFT approximation.
 * We divide the frequency range into bins and compute energy in each.
 *
 * @param samples - PCM samples
 * @returns Hex string representing spectral fingerprint
 */
function computeSpectralHash(samples: Float32Array): string {
  const bins = new Float32Array(SPECTRAL_BINS);
  const n = samples.length;

  // Simple DFT-like frequency analysis
  // For each bin, compute correlation with that frequency
  for (let bin = 0; bin < SPECTRAL_BINS; bin++) {
    // Frequency for this bin (normalized)
    const freq = (bin + 1) / SPECTRAL_BINS;

    let sumCos = 0;
    let sumSin = 0;

    for (let i = 0; i < n; i++) {
      const angle = 2 * Math.PI * freq * i;
      sumCos += samples[i]! * Math.cos(angle);
      sumSin += samples[i]! * Math.sin(angle);
    }

    // Energy in this bin
    bins[bin] = Math.sqrt(sumCos * sumCos + sumSin * sumSin) / n;
  }

  // Normalize bins to max
  const maxBin = Math.max(...bins, 0.001);
  for (let i = 0; i < SPECTRAL_BINS; i++) {
    bins[i]! /= maxBin;
  }

  // Quantize to 4-bit values and pack into hex
  let hash = '';
  for (let i = 0; i < SPECTRAL_BINS; i += 2) {
    const v1 = Math.floor(bins[i]! * 15) & 0x0F;
    const v2 = Math.floor(bins[i + 1]! * 15) & 0x0F;
    hash += ((v1 << 4) | v2).toString(16).padStart(2, '0');
  }

  return hash;
}

/**
 * Compute amplitude envelope characteristics.
 * Divides sample into chunks and computes RMS energy for each.
 *
 * @param samples - PCM samples
 * @returns Hex string representing envelope fingerprint
 */
function computeEnvelopeHash(samples: Float32Array): string {
  const ENVELOPE_CHUNKS = 8;
  const chunkSize = Math.floor(samples.length / ENVELOPE_CHUNKS);

  if (chunkSize === 0) {
    return '00000000';
  }

  const envelope = new Float32Array(ENVELOPE_CHUNKS);

  for (let chunk = 0; chunk < ENVELOPE_CHUNKS; chunk++) {
    const start = chunk * chunkSize;
    const end = Math.min(start + chunkSize, samples.length);

    let sumSquares = 0;
    for (let i = start; i < end; i++) {
      sumSquares += samples[i]! * samples[i]!;
    }

    // RMS energy
    envelope[chunk] = Math.sqrt(sumSquares / (end - start));
  }

  // Normalize
  const maxEnv = Math.max(...envelope, 0.001);
  for (let i = 0; i < ENVELOPE_CHUNKS; i++) {
    envelope[i]! /= maxEnv;
  }

  // Quantize to 4-bit values
  let hash = '';
  for (let i = 0; i < ENVELOPE_CHUNKS; i += 2) {
    const v1 = Math.floor(envelope[i]! * 15) & 0x0F;
    const v2 = Math.floor(envelope[i + 1]! * 15) & 0x0F;
    hash += ((v1 << 4) | v2).toString(16).padStart(2, '0');
  }

  return hash;
}

/**
 * Create a full fingerprint object from a decoded sample.
 *
 * @param pcm - Float32Array of PCM samples
 * @param brrSample - Optional BRR sample for additional metadata
 * @returns Complete fingerprint object
 */
export function createSampleFingerprint(
  pcm: Float32Array,
  brrSample?: BrrSample
): SampleFingerprint {
  const hash = computeFingerprint(pcm);

  // Extract filter pattern from first few blocks
  const filterPattern: number[] = [];
  if (brrSample) {
    const patternLength = Math.min(8, brrSample.blocks.length);
    for (let i = 0; i < patternLength; i++) {
      filterPattern.push(brrSample.blocks[i]!.headerParsed.filter);
    }
  }

  return {
    hash,
    blockCount: brrSample?.blocks.length ?? Math.ceil(pcm.length / 16),
    hasLoop: brrSample?.loopStart !== undefined && brrSample.loopStart >= 0,
    filterPattern,
  };
}

/**
 * Compute a quick hash directly from raw BRR data.
 * Faster than full decoding when you just need to identify samples.
 *
 * @param data - Raw BRR data bytes
 * @param startOffset - Starting offset in data
 * @returns Quick hash string
 */
export function computeQuickHash(
  data: Uint8Array,
  startOffset: number = 0
): string {
  // Use first 64 bytes (7 blocks + partial) for quick hash
  const hashLength = Math.min(64, data.length - startOffset);
  const bytes = data.slice(startOffset, startOffset + hashLength);

  // Simple hash: XOR rotation + addition
  let hash = 0;
  for (let i = 0; i < bytes.length; i++) {
    hash = ((hash << 5) - hash + bytes[i]!) | 0;
    hash = (hash ^ (hash >>> 19)) | 0;
  }

  // Convert to hex, ensure positive
  return (hash >>> 0).toString(16).padStart(8, '0');
}

/**
 * Compare two fingerprints and return a similarity score.
 *
 * @param fp1 - First fingerprint hash
 * @param fp2 - Second fingerprint hash
 * @returns Similarity score from 0.0 (different) to 1.0 (identical)
 */
export function compareFingerprints(fp1: string, fp2: string): number {
  if (fp1.length !== fp2.length) {
    return 0;
  }

  if (fp1 === fp2) {
    return 1.0;
  }

  // Count matching nibbles
  let matches = 0;
  for (let i = 0; i < fp1.length; i++) {
    if (fp1[i] === fp2[i]) {
      matches++;
    }
  }

  return matches / fp1.length;
}

/**
 * Check if two fingerprints are similar enough to be considered the same sample.
 *
 * @param fp1 - First fingerprint hash
 * @param fp2 - Second fingerprint hash
 * @param threshold - Minimum similarity (default 0.9)
 * @returns True if fingerprints match above threshold
 */
export function fingerprintsMatch(
  fp1: string,
  fp2: string,
  threshold: number = 0.9
): boolean {
  return compareFingerprints(fp1, fp2) >= threshold;
}

/**
 * Build a fingerprint index from multiple samples.
 * Returns a map from fingerprint hash to sample indices.
 *
 * @param fingerprints - Array of fingerprint objects
 * @returns Map from hash to array of sample indices
 */
export function buildFingerprintIndex(
  fingerprints: SampleFingerprint[]
): Map<string, number[]> {
  const index = new Map<string, number[]>();

  for (let i = 0; i < fingerprints.length; i++) {
    const hash = fingerprints[i]!.hash;
    const existing = index.get(hash);

    if (existing) {
      existing.push(i);
    } else {
      index.set(hash, [i]);
    }
  }

  return index;
}

/**
 * Find duplicate samples by fingerprint.
 *
 * @param fingerprints - Array of fingerprint objects
 * @returns Array of duplicate groups (arrays of sample indices)
 */
export function findDuplicates(
  fingerprints: SampleFingerprint[]
): number[][] {
  const index = buildFingerprintIndex(fingerprints);
  const duplicates: number[][] = [];

  for (const indices of index.values()) {
    if (indices.length > 1) {
      duplicates.push(indices);
    }
  }

  return duplicates;
}
