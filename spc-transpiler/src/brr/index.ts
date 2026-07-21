/**
 * BRR (Bit Rate Reduction) Audio Module
 *
 * This module provides tools for working with SNES BRR audio samples:
 * - Decode BRR data to PCM
 * - Fingerprint samples for identification
 * - Export to WAV format
 */

// Block-level utilities
export {
  BRR_BLOCK_SIZE,
  SAMPLES_PER_BLOCK,
  MAX_RANGE,
  parseBrrHeader,
  encodeBrrHeader,
  extractNibbles,
  createBrrBlock,
  isEndBlock,
  isLoopBlock,
  getFilterType,
  getRangeValue,
  FILTER_NAMES,
} from './brr-block';

// Decoder
export {
  SNES_SAMPLE_RATE,
  FILTER_COEFFICIENTS,
  decodeBrrBlock,
  decodeBrrSample,
  decodeBrrToFloat,
  convertBrrSampleToFloat,
  getBrrSampleSize,
  findLoopPoint,
  decodeSampleBank,
  decodeBrrWithHistory,
} from './brr-decoder';

// Fingerprinting
export {
  computeFingerprint,
  createSampleFingerprint,
  computeQuickHash,
  compareFingerprints,
  fingerprintsMatch,
  buildFingerprintIndex,
  findDuplicates,
} from './fingerprint';

// WAV export
export {
  createWavBlob,
  createWavBlobFromSample,
  createWavData,
  createWavDataWithLoop,
  createWavDownloadUrl,
  downloadWav,
  downloadSampleAsWav,
  calculateWavSize,
  calculateDuration,
} from './wav-export';

// Re-export types
export type {
  BrrHeader,
  BrrBlock,
  BrrSample,
  DecodedSample,
  SampleFingerprint,
  WavExportOptions,
} from '../types/brr';
