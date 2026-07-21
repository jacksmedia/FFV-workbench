/**
 * Byte manipulation utilities for SPC-700 music transpiler.
 * Handles reading/writing binary data and SNES address conversions.
 */

import type { MappingMode } from '@/types/rom';

/**
 * Read an unsigned 8-bit value from a Uint8Array.
 * @param data - The binary data buffer
 * @param offset - Byte offset to read from
 * @returns The unsigned byte value (0-255)
 */
export function readU8(data: Uint8Array, offset: number): number {
  if (offset < 0 || offset >= data.length) {
    throw new RangeError(`readU8: offset ${offset} out of bounds (length ${data.length})`);
  }
  return data[offset]!;
}

/**
 * Read a 16-bit little-endian unsigned value from a Uint8Array.
 * @param data - The binary data buffer
 * @param offset - Byte offset to read from
 * @returns The unsigned 16-bit value (0-65535)
 */
export function readU16LE(data: Uint8Array, offset: number): number {
  if (offset < 0 || offset + 1 >= data.length) {
    throw new RangeError(`readU16LE: offset ${offset} out of bounds (length ${data.length})`);
  }
  return data[offset]! | (data[offset + 1]! << 8);
}

/**
 * Read a 24-bit little-endian unsigned value from a Uint8Array.
 * Used for SNES 24-bit pointers/addresses.
 * @param data - The binary data buffer
 * @param offset - Byte offset to read from
 * @returns The unsigned 24-bit value (0-16777215)
 */
export function readU24LE(data: Uint8Array, offset: number): number {
  if (offset < 0 || offset + 2 >= data.length) {
    throw new RangeError(`readU24LE: offset ${offset} out of bounds (length ${data.length})`);
  }
  return data[offset]! | (data[offset + 1]! << 8) | (data[offset + 2]! << 16);
}

/**
 * Read a signed 8-bit value from a Uint8Array.
 * @param data - The binary data buffer
 * @param offset - Byte offset to read from
 * @returns The signed byte value (-128 to 127)
 */
export function readI8(data: Uint8Array, offset: number): number {
  if (offset < 0 || offset >= data.length) {
    throw new RangeError(`readI8: offset ${offset} out of bounds (length ${data.length})`);
  }
  const val = data[offset]!;
  return val > 127 ? val - 256 : val;
}

/**
 * Write an unsigned 8-bit value to a Uint8Array.
 * @param data - The binary data buffer
 * @param offset - Byte offset to write to
 * @param value - The unsigned byte value (0-255)
 */
export function writeU8(data: Uint8Array, offset: number, value: number): void {
  if (offset < 0 || offset >= data.length) {
    throw new RangeError(`writeU8: offset ${offset} out of bounds (length ${data.length})`);
  }
  if (value < 0 || value > 255) {
    throw new RangeError(`writeU8: value ${value} out of range (0-255)`);
  }
  data[offset] = value & 0xff;
}

/**
 * Write a 16-bit little-endian value to a Uint8Array.
 * @param data - The binary data buffer
 * @param offset - Byte offset to write to
 * @param value - The unsigned 16-bit value (0-65535)
 */
export function writeU16LE(data: Uint8Array, offset: number, value: number): void {
  if (offset < 0 || offset + 1 >= data.length) {
    throw new RangeError(`writeU16LE: offset ${offset} out of bounds (length ${data.length})`);
  }
  if (value < 0 || value > 65535) {
    throw new RangeError(`writeU16LE: value ${value} out of range (0-65535)`);
  }
  data[offset] = value & 0xff;
  data[offset + 1] = (value >> 8) & 0xff;
}

/**
 * Write a 24-bit little-endian value to a Uint8Array.
 * Used for SNES 24-bit pointers/addresses.
 * @param data - The binary data buffer
 * @param offset - Byte offset to write to
 * @param value - The unsigned 24-bit value (0-16777215)
 */
export function writeU24LE(data: Uint8Array, offset: number, value: number): void {
  if (offset < 0 || offset + 2 >= data.length) {
    throw new RangeError(`writeU24LE: offset ${offset} out of bounds (length ${data.length})`);
  }
  if (value < 0 || value > 16777215) {
    throw new RangeError(`writeU24LE: value ${value} out of range (0-16777215)`);
  }
  data[offset] = value & 0xff;
  data[offset + 1] = (value >> 8) & 0xff;
  data[offset + 2] = (value >> 16) & 0xff;
}

/**
 * Convert a 24-bit SNES address to a ROM file offset (unheadered).
 *
 * HiROM (FF5, FF6): banks $C0-$FF map the full 64KB each onto the ROM
 * linearly, and banks $40-$7D mirror them, so the file offset is simply
 * the address masked to 22 bits: snesAddr & 0x3FFFFF.
 *
 * LoROM (FF4, FFMQ): each bank maps 32KB at $8000-$FFFF, so the file
 * offset interleaves: ((bank & 0x7F) << 15) | (addr & 0x7FFF).
 *
 * @param snesAddr - The SNES 24-bit address
 * @param mapping - Cartridge mapping mode
 * @returns The byte offset in the (unheadered) ROM file
 */
export function snesToRomOffset(snesAddr: number, mapping: MappingMode): number {
  if (mapping === 'hirom') {
    return snesAddr & 0x3fffff;
  }
  const bank = (snesAddr >> 16) & 0x7f;
  return (bank << 15) | (snesAddr & 0x7fff);
}

/**
 * Convert a ROM file offset (unheadered) to a canonical SNES address.
 *
 * HiROM: returns a $C0-$FF bank address (offset | 0xC00000).
 * LoROM: returns an $80-$FF bank address with $8000-$FFFF in-bank range.
 *
 * @param romOffset - The byte offset in the ROM file
 * @param mapping - Cartridge mapping mode
 * @returns The SNES 24-bit address
 */
export function romOffsetToSnes(romOffset: number, mapping: MappingMode): number {
  if (romOffset < 0) {
    throw new RangeError(`romOffsetToSnes: negative offset ${romOffset}`);
  }
  if (mapping === 'hirom') {
    return 0xc00000 | (romOffset & 0x3fffff);
  }
  const bank = ((romOffset >> 15) & 0x7f) + 0x80;
  const addr = (romOffset & 0x7fff) | 0x8000;
  return (bank << 16) | addr;
}

/**
 * Format a slice of binary data as a hex dump string for debugging.
 * Output format: "00 01 02 03 04 05 06 07  08 09 0A 0B 0C 0D 0E 0F"
 * @param data - The binary data buffer
 * @param offset - Starting offset
 * @param length - Number of bytes to dump
 * @returns Formatted hex string
 */
export function hexDump(data: Uint8Array, offset: number, length: number): string {
  const end = Math.min(offset + length, data.length);
  const bytes: string[] = [];

  for (let i = offset; i < end; i++) {
    bytes.push(data[i]!.toString(16).toUpperCase().padStart(2, '0'));
    // Add extra space every 8 bytes for readability
    if ((i - offset + 1) % 8 === 0 && i < end - 1) {
      bytes.push('');
    }
  }

  return bytes.join(' ');
}
