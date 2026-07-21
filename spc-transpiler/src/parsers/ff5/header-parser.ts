/**
 * FF5 Sequence Header Parser
 * Parses the 22-byte header that precedes each BGM sequence
 */

import { readU16LE } from '@/utils/bytes';

/** Parsed sequence header structure */
export interface SequenceHeader {
  /** Total length of sequence data in bytes */
  length: number;
  /** SPC-700 RAM address where sequence starts */
  startAddr: number;
  /** Array of 8 channel pointers (SPC addresses, 0 = unused) */
  channels: readonly number[];
  /** SPC-700 RAM address where sequence ends */
  endAddr: number;
}

/** Size of FF5 sequence header in bytes */
export const FF5_HEADER_SIZE = 22;

/** Number of channels per sequence */
export const FF5_CHANNEL_COUNT = 8;

/**
 * Parse a 22-byte FF5 sequence header.
 *
 * Header layout:
 * - Bytes 0-1:   Sequence length (LE) - total size of sequence data
 * - Bytes 2-3:   Start address (LE) - where to load in SPC RAM
 * - Bytes 4-5:   Channel 0 pointer (LE) - SPC address or 0 if unused
 * - Bytes 6-7:   Channel 1 pointer (LE)
 * - Bytes 8-9:   Channel 2 pointer (LE)
 * - Bytes 10-11: Channel 3 pointer (LE)
 * - Bytes 12-13: Channel 4 pointer (LE)
 * - Bytes 14-15: Channel 5 pointer (LE)
 * - Bytes 16-17: Channel 6 pointer (LE)
 * - Bytes 18-19: Channel 7 pointer (LE)
 * - Bytes 20-21: End address (LE) - points past last byte of sequence
 *
 * @param rom - The ROM data buffer
 * @param offset - ROM offset to start of header
 * @returns Parsed header structure
 */
export function parseSequenceHeader(rom: Uint8Array, offset: number): SequenceHeader {
  // Read sequence length
  const length = readU16LE(rom, offset);

  // Read start address in SPC RAM
  const startAddr = readU16LE(rom, offset + 2);

  // Read 8 channel pointers
  const channels: number[] = [];
  for (let ch = 0; ch < FF5_CHANNEL_COUNT; ch++) {
    const channelOffset = offset + 4 + (ch * 2);
    const channelPtr = readU16LE(rom, channelOffset);
    channels.push(channelPtr);
  }

  // Read end address
  const endAddr = readU16LE(rom, offset + 20);

  return {
    length,
    startAddr,
    channels,
    endAddr,
  };
}

/**
 * Convert an SPC RAM address to a ROM offset within the sequence.
 *
 * The sequence is loaded at startAddr in SPC RAM, so:
 * romOffset = headerRomOffset + FF5_HEADER_SIZE + (spcAddr - startAddr)
 *
 * @param spcAddr - The SPC RAM address (from channel pointer)
 * @param header - Parsed sequence header
 * @param headerRomOffset - ROM offset where the header starts
 * @returns ROM offset for the SPC address
 */
export function spcToRomOffset(
  spcAddr: number,
  header: SequenceHeader,
  headerRomOffset: number
): number {
  const relativeOffset = spcAddr - header.startAddr;
  return headerRomOffset + FF5_HEADER_SIZE + relativeOffset;
}

/**
 * Check if a channel is active (has a non-zero pointer).
 *
 * @param header - Parsed sequence header
 * @param channel - Channel index (0-7)
 * @returns true if the channel has sequence data
 */
export function isChannelActive(header: SequenceHeader, channel: number): boolean {
  const ptr = header.channels[channel];
  return ptr !== undefined && ptr !== 0;
}

/**
 * Get the count of active channels in a sequence.
 *
 * @param header - Parsed sequence header
 * @returns Number of channels with non-zero pointers
 */
export function getActiveChannelCount(header: SequenceHeader): number {
  return header.channels.filter(ptr => ptr !== 0).length;
}

/**
 * Calculate the end offset for a channel's data.
 *
 * The end of a channel's data is either:
 * - The start of the next active channel, or
 * - The sequence end address
 *
 * @param header - Parsed sequence header
 * @param channelIndex - Channel index (0-7)
 * @param headerRomOffset - ROM offset where the header starts
 * @returns ROM offset where this channel's data ends
 */
export function getChannelEndOffset(
  header: SequenceHeader,
  channelIndex: number,
  headerRomOffset: number
): number {
  const channelStart = header.channels[channelIndex];
  if (channelStart === undefined || channelStart === 0) {
    return headerRomOffset + FF5_HEADER_SIZE; // Empty channel
  }

  // Find the next active channel pointer that's higher than ours
  let nextStart = header.endAddr;

  for (let i = 0; i < FF5_CHANNEL_COUNT; i++) {
    const ptr = header.channels[i];
    if (ptr !== undefined && ptr > channelStart && ptr < nextStart) {
      nextStart = ptr;
    }
  }

  return spcToRomOffset(nextStart, header, headerRomOffset);
}
