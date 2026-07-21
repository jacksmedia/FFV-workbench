/**
 * BRR (Bit Rate Reduction) audio format types
 *
 * BRR is the SNES/SPC-700 audio sample format.
 * Each block is 9 bytes that decode to 16 PCM samples.
 */

/** Header byte bit layout: [range:4][filter:2][loop:1][end:1] */
export interface BrrHeader {
  /** Shift amount for samples (0-12, values 13-15 treated as 12) */
  range: number;
  /** Prediction filter type (0-3) */
  filter: number;
  /** This block is a loop point target */
  loop: boolean;
  /** This is the last block of the sample */
  end: boolean;
}

/** A single BRR block: 1 header byte + 8 data bytes = 16 PCM samples */
export interface BrrBlock {
  /** Raw header byte */
  header: number;
  /** Parsed header fields */
  headerParsed: BrrHeader;
  /** Decoded 16 PCM samples as 16-bit signed integers */
  samples: Int16Array;
  /** Block index in sample */
  blockIndex: number;
}

/** A complete BRR sample (multiple blocks) */
export interface BrrSample {
  /** All decoded blocks */
  blocks: BrrBlock[];
  /** Block index where loop starts (or -1 if no loop) */
  loopStart: number;
  /** Block index where sample ends (last block index) */
  loopEnd: number;
  /** Total sample count (blocks.length * 16) */
  sampleCount: number;
  /** Raw BRR data bytes */
  rawData: Uint8Array;
}

/** Decoded PCM sample ready for playback */
export interface DecodedSample {
  /** PCM samples normalized to -1.0 to 1.0 range */
  pcm: Float32Array;
  /** Sample rate in Hz (typically 32000 for SNES native) */
  sampleRate: number;
  /** Loop start point in samples (or -1 if no loop) */
  loopStart: number;
  /** Loop end point in samples */
  loopEnd: number;
  /** Original BRR sample for reference */
  source?: BrrSample;
}

/** Sample fingerprint for identification/matching */
export interface SampleFingerprint {
  /** Short hash for quick comparison */
  hash: string;
  /** Sample length in blocks */
  blockCount: number;
  /** Has loop point */
  hasLoop: boolean;
  /** First few filter values (for pattern matching) */
  filterPattern: number[];
}

/** WAV export options */
export interface WavExportOptions {
  /** Output sample rate (default: 32000) */
  sampleRate?: number;
  /** Bit depth (default: 16) */
  bitDepth?: 8 | 16 | 24 | 32;
  /** Include loop point metadata in smpl chunk */
  includeLoopMetadata?: boolean;
}
