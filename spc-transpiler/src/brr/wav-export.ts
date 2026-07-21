/**
 * WAV File Export for BRR Samples
 *
 * Creates standard WAV files from decoded PCM data.
 * Supports loop point metadata via the 'smpl' chunk.
 */

import type { WavExportOptions, DecodedSample } from '../types/brr';
import { SNES_SAMPLE_RATE } from './brr-decoder';

/** Default WAV export options */
const DEFAULT_OPTIONS: Required<WavExportOptions> = {
  sampleRate: SNES_SAMPLE_RATE,
  bitDepth: 16,
  includeLoopMetadata: true,
};

/**
 * Create a WAV file blob from PCM audio data.
 *
 * @param pcm - Float32Array of PCM samples (-1.0 to 1.0)
 * @param sampleRate - Sample rate in Hz
 * @param options - Optional export settings
 * @returns Blob containing WAV file data
 */
export function createWavBlob(
  pcm: Float32Array,
  sampleRate: number = SNES_SAMPLE_RATE,
  options?: Partial<WavExportOptions>
): Blob {
  const opts = { ...DEFAULT_OPTIONS, ...options, sampleRate };
  const wavData = createWavData(pcm, opts);
  return new Blob([wavData], { type: 'audio/wav' });
}

/**
 * Create a WAV file blob from a DecodedSample.
 * Automatically includes loop point metadata if available.
 *
 * @param sample - DecodedSample object
 * @param options - Optional export settings
 * @returns Blob containing WAV file data
 */
export function createWavBlobFromSample(
  sample: DecodedSample,
  options?: Partial<WavExportOptions>
): Blob {
  const opts = {
    ...DEFAULT_OPTIONS,
    sampleRate: sample.sampleRate,
    ...options,
  };

  const wavData = createWavDataWithLoop(
    sample.pcm,
    sample.loopStart,
    sample.loopEnd,
    opts
  );

  return new Blob([wavData], { type: 'audio/wav' });
}

/**
 * Create WAV file data as an ArrayBuffer.
 *
 * @param pcm - Float32Array of PCM samples
 * @param options - Export options
 * @returns ArrayBuffer containing WAV data
 */
export function createWavData(
  pcm: Float32Array,
  options: Required<WavExportOptions>
): ArrayBuffer {
  return createWavDataWithLoop(pcm, -1, -1, options);
}

/**
 * Create WAV file data with loop point metadata.
 *
 * @param pcm - Float32Array of PCM samples
 * @param loopStart - Loop start sample index (-1 for no loop)
 * @param loopEnd - Loop end sample index (-1 for no loop)
 * @param options - Export options
 * @returns ArrayBuffer containing WAV data
 */
export function createWavDataWithLoop(
  pcm: Float32Array,
  loopStart: number,
  loopEnd: number,
  options: Required<WavExportOptions>
): ArrayBuffer {
  const { sampleRate, bitDepth, includeLoopMetadata } = options;

  const numChannels = 1; // Mono
  const bytesPerSample = bitDepth / 8;
  const blockAlign = numChannels * bytesPerSample;
  const byteRate = sampleRate * blockAlign;

  // Convert PCM to the target bit depth
  const sampleData = convertPcmToBytes(pcm, bitDepth);
  const dataSize = sampleData.byteLength;

  // Calculate if we need the smpl chunk
  const hasLoop = includeLoopMetadata && loopStart >= 0 && loopEnd > loopStart;
  const smplChunkSize = hasLoop ? 60 : 0; // 36 bytes header + 24 bytes per loop

  // Total file size: RIFF header (8) + fmt chunk (24) + data chunk (8 + data) + optional smpl
  const totalSize = 12 + 24 + 8 + dataSize + (hasLoop ? 8 + smplChunkSize : 0);
  const buffer = new ArrayBuffer(totalSize);
  const view = new DataView(buffer);

  let offset = 0;

  // RIFF header
  writeString(view, offset, 'RIFF'); offset += 4;
  view.setUint32(offset, totalSize - 8, true); offset += 4;
  writeString(view, offset, 'WAVE'); offset += 4;

  // fmt chunk
  writeString(view, offset, 'fmt '); offset += 4;
  view.setUint32(offset, 16, true); offset += 4; // Chunk size (16 for PCM)
  view.setUint16(offset, 1, true); offset += 2; // Audio format (1 = PCM)
  view.setUint16(offset, numChannels, true); offset += 2;
  view.setUint32(offset, sampleRate, true); offset += 4;
  view.setUint32(offset, byteRate, true); offset += 4;
  view.setUint16(offset, blockAlign, true); offset += 2;
  view.setUint16(offset, bitDepth, true); offset += 2;

  // smpl chunk (if we have loop points)
  if (hasLoop) {
    writeString(view, offset, 'smpl'); offset += 4;
    view.setUint32(offset, smplChunkSize, true); offset += 4;

    // smpl chunk header
    view.setUint32(offset, 0, true); offset += 4; // Manufacturer
    view.setUint32(offset, 0, true); offset += 4; // Product
    view.setUint32(offset, Math.floor(1e9 / sampleRate), true); offset += 4; // Sample period (ns)
    view.setUint32(offset, 60, true); offset += 4; // MIDI unity note (middle C)
    view.setUint32(offset, 0, true); offset += 4; // MIDI pitch fraction
    view.setUint32(offset, 0, true); offset += 4; // SMPTE format
    view.setUint32(offset, 0, true); offset += 4; // SMPTE offset
    view.setUint32(offset, 1, true); offset += 4; // Number of sample loops
    view.setUint32(offset, 0, true); offset += 4; // Sampler data size

    // Loop definition
    view.setUint32(offset, 0, true); offset += 4; // Cue point ID
    view.setUint32(offset, 0, true); offset += 4; // Type (0 = forward loop)
    view.setUint32(offset, loopStart, true); offset += 4; // Start sample
    view.setUint32(offset, loopEnd, true); offset += 4; // End sample
    view.setUint32(offset, 0, true); offset += 4; // Fraction
    view.setUint32(offset, 0, true); offset += 4; // Play count (0 = infinite)
  }

  // data chunk
  writeString(view, offset, 'data'); offset += 4;
  view.setUint32(offset, dataSize, true); offset += 4;

  // Copy sample data
  const dataArray = new Uint8Array(buffer, offset);
  dataArray.set(new Uint8Array(sampleData));

  return buffer;
}

/**
 * Write a string to a DataView at the specified offset.
 */
function writeString(view: DataView, offset: number, str: string): void {
  for (let i = 0; i < str.length; i++) {
    view.setUint8(offset + i, str.charCodeAt(i));
  }
}

/**
 * Convert Float32 PCM (-1.0 to 1.0) to the specified bit depth.
 *
 * @param pcm - Float32Array of normalized samples
 * @param bitDepth - Target bit depth (8, 16, 24, or 32)
 * @returns ArrayBuffer with converted samples
 */
function convertPcmToBytes(
  pcm: Float32Array,
  bitDepth: 8 | 16 | 24 | 32
): ArrayBuffer {
  const bytesPerSample = bitDepth / 8;
  const buffer = new ArrayBuffer(pcm.length * bytesPerSample);

  switch (bitDepth) {
    case 8:
      return convertPcmTo8Bit(pcm, buffer);
    case 16:
      return convertPcmTo16Bit(pcm, buffer);
    case 24:
      return convertPcmTo24Bit(pcm, buffer);
    case 32:
      return convertPcmTo32Bit(pcm, buffer);
    default:
      throw new Error(`Unsupported bit depth: ${bitDepth}`);
  }
}

/**
 * Convert to 8-bit unsigned PCM.
 */
function convertPcmTo8Bit(pcm: Float32Array, buffer: ArrayBuffer): ArrayBuffer {
  const view = new Uint8Array(buffer);

  for (let i = 0; i < pcm.length; i++) {
    // 8-bit WAV is unsigned (0-255, center at 128)
    const sample = Math.max(-1, Math.min(1, pcm[i]!));
    view[i] = Math.floor((sample + 1) * 127.5);
  }

  return buffer;
}

/**
 * Convert to 16-bit signed PCM.
 */
function convertPcmTo16Bit(pcm: Float32Array, buffer: ArrayBuffer): ArrayBuffer {
  const view = new DataView(buffer);

  for (let i = 0; i < pcm.length; i++) {
    const sample = Math.max(-1, Math.min(1, pcm[i]!));
    const value = Math.floor(sample * 32767);
    view.setInt16(i * 2, value, true); // Little-endian
  }

  return buffer;
}

/**
 * Convert to 24-bit signed PCM.
 */
function convertPcmTo24Bit(pcm: Float32Array, buffer: ArrayBuffer): ArrayBuffer {
  const view = new DataView(buffer);

  for (let i = 0; i < pcm.length; i++) {
    const sample = Math.max(-1, Math.min(1, pcm[i]!));
    const value = Math.floor(sample * 8388607);

    // 24-bit little-endian (3 bytes)
    const offset = i * 3;
    view.setUint8(offset, value & 0xFF);
    view.setUint8(offset + 1, (value >> 8) & 0xFF);
    view.setUint8(offset + 2, (value >> 16) & 0xFF);
  }

  return buffer;
}

/**
 * Convert to 32-bit signed PCM.
 */
function convertPcmTo32Bit(pcm: Float32Array, buffer: ArrayBuffer): ArrayBuffer {
  const view = new DataView(buffer);

  for (let i = 0; i < pcm.length; i++) {
    const sample = Math.max(-1, Math.min(1, pcm[i]!));
    const value = Math.floor(sample * 2147483647);
    view.setInt32(i * 4, value, true); // Little-endian
  }

  return buffer;
}

/**
 * Create a download URL for a WAV blob.
 * Remember to revoke the URL when done!
 *
 * @param blob - WAV blob
 * @returns Object URL for download
 */
export function createWavDownloadUrl(blob: Blob): string {
  return URL.createObjectURL(blob);
}

/**
 * Trigger a download of a WAV file in the browser.
 *
 * @param pcm - Float32Array of PCM samples
 * @param filename - Desired filename (without extension)
 * @param sampleRate - Sample rate in Hz
 * @param options - Export options
 */
export function downloadWav(
  pcm: Float32Array,
  filename: string,
  sampleRate: number = SNES_SAMPLE_RATE,
  options?: Partial<WavExportOptions>
): void {
  const blob = createWavBlob(pcm, sampleRate, options);
  const url = createWavDownloadUrl(blob);

  const link = document.createElement('a');
  link.href = url;
  link.download = filename.endsWith('.wav') ? filename : `${filename}.wav`;
  link.click();

  // Clean up
  setTimeout(() => URL.revokeObjectURL(url), 1000);
}

/**
 * Download a DecodedSample as a WAV file.
 *
 * @param sample - DecodedSample object
 * @param filename - Desired filename (without extension)
 * @param options - Export options
 */
export function downloadSampleAsWav(
  sample: DecodedSample,
  filename: string,
  options?: Partial<WavExportOptions>
): void {
  const blob = createWavBlobFromSample(sample, options);
  const url = createWavDownloadUrl(blob);

  const link = document.createElement('a');
  link.href = url;
  link.download = filename.endsWith('.wav') ? filename : `${filename}.wav`;
  link.click();

  setTimeout(() => URL.revokeObjectURL(url), 1000);
}

/**
 * Calculate the file size of a WAV export.
 *
 * @param sampleCount - Number of PCM samples
 * @param options - Export options
 * @returns File size in bytes
 */
export function calculateWavSize(
  sampleCount: number,
  options?: Partial<WavExportOptions>
): number {
  const opts = { ...DEFAULT_OPTIONS, ...options };
  const bytesPerSample = opts.bitDepth / 8;
  const dataSize = sampleCount * bytesPerSample;

  // RIFF header (12) + fmt chunk (24) + data chunk header (8) + data
  return 12 + 24 + 8 + dataSize;
}

/**
 * Calculate the duration of a WAV file.
 *
 * @param sampleCount - Number of PCM samples
 * @param sampleRate - Sample rate in Hz
 * @returns Duration in seconds
 */
export function calculateDuration(
  sampleCount: number,
  sampleRate: number = SNES_SAMPLE_RATE
): number {
  return sampleCount / sampleRate;
}
