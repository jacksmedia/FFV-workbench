#!/usr/bin/env python3
"""
IPS Patch Disassembler for 65c816 (SNES)
Generates commented ASM files from binary IPS patches.

For the FFV ROM hacking community archival project.
"""

import os
import sys
from pathlib import Path
from typing import List, Tuple, Optional

# 65c816 Opcode Table
# Format: opcode -> (mnemonic, addressing_mode, base_bytes, description)
# base_bytes is for 8-bit mode; some modes add bytes for 16-bit
OPCODES = {
    0x00: ("BRK", "imp", 2, "Software interrupt"),
    0x01: ("ORA", "dpix", 2, "OR A with (DP,X)"),
    0x02: ("COP", "imm", 2, "Coprocessor interrupt"),
    0x03: ("ORA", "sr", 2, "OR A with Stack Relative"),
    0x04: ("TSB", "dp", 2, "Test and Set Bits in DP"),
    0x05: ("ORA", "dp", 2, "OR A with Direct Page"),
    0x06: ("ASL", "dp", 2, "Shift Left DP"),
    0x07: ("ORA", "dpil", 2, "OR A with [DP]"),
    0x08: ("PHP", "imp", 1, "Push Processor Status"),
    0x09: ("ORA", "imm", 2, "OR A with Immediate"),  # +1 if M=0
    0x0A: ("ASL", "acc", 1, "Shift Left Accumulator"),
    0x0B: ("PHD", "imp", 1, "Push Direct Page Register"),
    0x0C: ("TSB", "abs", 3, "Test and Set Bits Absolute"),
    0x0D: ("ORA", "abs", 3, "OR A with Absolute"),
    0x0E: ("ASL", "abs", 3, "Shift Left Absolute"),
    0x0F: ("ORA", "abl", 4, "OR A with Absolute Long"),

    0x10: ("BPL", "rel", 2, "Branch if Plus"),
    0x11: ("ORA", "dpiy", 2, "OR A with (DP),Y"),
    0x12: ("ORA", "dpi", 2, "OR A with (DP)"),
    0x13: ("ORA", "sriy", 2, "OR A with (SR),Y"),
    0x14: ("TRB", "dp", 2, "Test and Reset Bits DP"),
    0x15: ("ORA", "dpx", 2, "OR A with DP,X"),
    0x16: ("ASL", "dpx", 2, "Shift Left DP,X"),
    0x17: ("ORA", "dpily", 2, "OR A with [DP],Y"),
    0x18: ("CLC", "imp", 1, "Clear Carry Flag"),
    0x19: ("ORA", "absy", 3, "OR A with Absolute,Y"),
    0x1A: ("INC", "acc", 1, "Increment Accumulator"),
    0x1B: ("TCS", "imp", 1, "Transfer A to Stack Pointer"),
    0x1C: ("TRB", "abs", 3, "Test and Reset Bits Absolute"),
    0x1D: ("ORA", "absx", 3, "OR A with Absolute,X"),
    0x1E: ("ASL", "absx", 3, "Shift Left Absolute,X"),
    0x1F: ("ORA", "ablx", 4, "OR A with Absolute Long,X"),

    0x20: ("JSR", "abs", 3, "Jump to Subroutine"),
    0x21: ("AND", "dpix", 2, "AND A with (DP,X)"),
    0x22: ("JSL", "abl", 4, "Jump to Subroutine Long"),
    0x23: ("AND", "sr", 2, "AND A with Stack Relative"),
    0x24: ("BIT", "dp", 2, "Test Bits DP"),
    0x25: ("AND", "dp", 2, "AND A with Direct Page"),
    0x26: ("ROL", "dp", 2, "Rotate Left DP"),
    0x27: ("AND", "dpil", 2, "AND A with [DP]"),
    0x28: ("PLP", "imp", 1, "Pull Processor Status"),
    0x29: ("AND", "imm", 2, "AND A with Immediate"),  # +1 if M=0
    0x2A: ("ROL", "acc", 1, "Rotate Left Accumulator"),
    0x2B: ("PLD", "imp", 1, "Pull Direct Page Register"),
    0x2C: ("BIT", "abs", 3, "Test Bits Absolute"),
    0x2D: ("AND", "abs", 3, "AND A with Absolute"),
    0x2E: ("ROL", "abs", 3, "Rotate Left Absolute"),
    0x2F: ("AND", "abl", 4, "AND A with Absolute Long"),

    0x30: ("BMI", "rel", 2, "Branch if Minus"),
    0x31: ("AND", "dpiy", 2, "AND A with (DP),Y"),
    0x32: ("AND", "dpi", 2, "AND A with (DP)"),
    0x33: ("AND", "sriy", 2, "AND A with (SR),Y"),
    0x34: ("BIT", "dpx", 2, "Test Bits DP,X"),
    0x35: ("AND", "dpx", 2, "AND A with DP,X"),
    0x36: ("ROL", "dpx", 2, "Rotate Left DP,X"),
    0x37: ("AND", "dpily", 2, "AND A with [DP],Y"),
    0x38: ("SEC", "imp", 1, "Set Carry Flag"),
    0x39: ("AND", "absy", 3, "AND A with Absolute,Y"),
    0x3A: ("DEC", "acc", 1, "Decrement Accumulator"),
    0x3B: ("TSC", "imp", 1, "Transfer Stack Pointer to A"),
    0x3C: ("BIT", "absx", 3, "Test Bits Absolute,X"),
    0x3D: ("AND", "absx", 3, "AND A with Absolute,X"),
    0x3E: ("ROL", "absx", 3, "Rotate Left Absolute,X"),
    0x3F: ("AND", "ablx", 4, "AND A with Absolute Long,X"),

    0x40: ("RTI", "imp", 1, "Return from Interrupt"),
    0x41: ("EOR", "dpix", 2, "XOR A with (DP,X)"),
    0x42: ("WDM", "imm", 2, "Reserved (WDM)"),
    0x43: ("EOR", "sr", 2, "XOR A with Stack Relative"),
    0x44: ("MVP", "blk", 3, "Block Move Positive"),
    0x45: ("EOR", "dp", 2, "XOR A with Direct Page"),
    0x46: ("LSR", "dp", 2, "Shift Right DP"),
    0x47: ("EOR", "dpil", 2, "XOR A with [DP]"),
    0x48: ("PHA", "imp", 1, "Push Accumulator"),
    0x49: ("EOR", "imm", 2, "XOR A with Immediate"),  # +1 if M=0
    0x4A: ("LSR", "acc", 1, "Shift Right Accumulator"),
    0x4B: ("PHK", "imp", 1, "Push Program Bank"),
    0x4C: ("JMP", "abs", 3, "Jump Absolute"),
    0x4D: ("EOR", "abs", 3, "XOR A with Absolute"),
    0x4E: ("LSR", "abs", 3, "Shift Right Absolute"),
    0x4F: ("EOR", "abl", 4, "XOR A with Absolute Long"),

    0x50: ("BVC", "rel", 2, "Branch if Overflow Clear"),
    0x51: ("EOR", "dpiy", 2, "XOR A with (DP),Y"),
    0x52: ("EOR", "dpi", 2, "XOR A with (DP)"),
    0x53: ("EOR", "sriy", 2, "XOR A with (SR),Y"),
    0x54: ("MVN", "blk", 3, "Block Move Negative"),
    0x55: ("EOR", "dpx", 2, "XOR A with DP,X"),
    0x56: ("LSR", "dpx", 2, "Shift Right DP,X"),
    0x57: ("EOR", "dpily", 2, "XOR A with [DP],Y"),
    0x58: ("CLI", "imp", 1, "Clear Interrupt Disable"),
    0x59: ("EOR", "absy", 3, "XOR A with Absolute,Y"),
    0x5A: ("PHY", "imp", 1, "Push Y Register"),
    0x5B: ("TCD", "imp", 1, "Transfer A to Direct Page"),
    0x5C: ("JML", "abl", 4, "Jump Long"),
    0x5D: ("EOR", "absx", 3, "XOR A with Absolute,X"),
    0x5E: ("LSR", "absx", 3, "Shift Right Absolute,X"),
    0x5F: ("EOR", "ablx", 4, "XOR A with Absolute Long,X"),

    0x60: ("RTS", "imp", 1, "Return from Subroutine"),
    0x61: ("ADC", "dpix", 2, "Add with Carry (DP,X)"),
    0x62: ("PER", "rell", 3, "Push Effective Relative"),
    0x63: ("ADC", "sr", 2, "Add with Carry Stack Relative"),
    0x64: ("STZ", "dp", 2, "Store Zero to DP"),
    0x65: ("ADC", "dp", 2, "Add with Carry DP"),
    0x66: ("ROR", "dp", 2, "Rotate Right DP"),
    0x67: ("ADC", "dpil", 2, "Add with Carry [DP]"),
    0x68: ("PLA", "imp", 1, "Pull Accumulator"),
    0x69: ("ADC", "imm", 2, "Add with Carry Immediate"),  # +1 if M=0
    0x6A: ("ROR", "acc", 1, "Rotate Right Accumulator"),
    0x6B: ("RTL", "imp", 1, "Return from Subroutine Long"),
    0x6C: ("JMP", "absi", 3, "Jump Indirect"),
    0x6D: ("ADC", "abs", 3, "Add with Carry Absolute"),
    0x6E: ("ROR", "abs", 3, "Rotate Right Absolute"),
    0x6F: ("ADC", "abl", 4, "Add with Carry Absolute Long"),

    0x70: ("BVS", "rel", 2, "Branch if Overflow Set"),
    0x71: ("ADC", "dpiy", 2, "Add with Carry (DP),Y"),
    0x72: ("ADC", "dpi", 2, "Add with Carry (DP)"),
    0x73: ("ADC", "sriy", 2, "Add with Carry (SR),Y"),
    0x74: ("STZ", "dpx", 2, "Store Zero to DP,X"),
    0x75: ("ADC", "dpx", 2, "Add with Carry DP,X"),
    0x76: ("ROR", "dpx", 2, "Rotate Right DP,X"),
    0x77: ("ADC", "dpily", 2, "Add with Carry [DP],Y"),
    0x78: ("SEI", "imp", 1, "Set Interrupt Disable"),
    0x79: ("ADC", "absy", 3, "Add with Carry Absolute,Y"),
    0x7A: ("PLY", "imp", 1, "Pull Y Register"),
    0x7B: ("TDC", "imp", 1, "Transfer Direct Page to A"),
    0x7C: ("JMP", "absix", 3, "Jump Indirect,X"),
    0x7D: ("ADC", "absx", 3, "Add with Carry Absolute,X"),
    0x7E: ("ROR", "absx", 3, "Rotate Right Absolute,X"),
    0x7F: ("ADC", "ablx", 4, "Add with Carry Absolute Long,X"),

    0x80: ("BRA", "rel", 2, "Branch Always"),
    0x81: ("STA", "dpix", 2, "Store A to (DP,X)"),
    0x82: ("BRL", "rell", 3, "Branch Long"),
    0x83: ("STA", "sr", 2, "Store A to Stack Relative"),
    0x84: ("STY", "dp", 2, "Store Y to DP"),
    0x85: ("STA", "dp", 2, "Store A to DP"),
    0x86: ("STX", "dp", 2, "Store X to DP"),
    0x87: ("STA", "dpil", 2, "Store A to [DP]"),
    0x88: ("DEY", "imp", 1, "Decrement Y"),
    0x89: ("BIT", "imm", 2, "Test Bits Immediate"),  # +1 if M=0
    0x8A: ("TXA", "imp", 1, "Transfer X to A"),
    0x8B: ("PHB", "imp", 1, "Push Data Bank"),
    0x8C: ("STY", "abs", 3, "Store Y to Absolute"),
    0x8D: ("STA", "abs", 3, "Store A to Absolute"),
    0x8E: ("STX", "abs", 3, "Store X to Absolute"),
    0x8F: ("STA", "abl", 4, "Store A to Absolute Long"),

    0x90: ("BCC", "rel", 2, "Branch if Carry Clear"),
    0x91: ("STA", "dpiy", 2, "Store A to (DP),Y"),
    0x92: ("STA", "dpi", 2, "Store A to (DP)"),
    0x93: ("STA", "sriy", 2, "Store A to (SR),Y"),
    0x94: ("STY", "dpx", 2, "Store Y to DP,X"),
    0x95: ("STA", "dpx", 2, "Store A to DP,X"),
    0x96: ("STX", "dpy", 2, "Store X to DP,Y"),
    0x97: ("STA", "dpily", 2, "Store A to [DP],Y"),
    0x98: ("TYA", "imp", 1, "Transfer Y to A"),
    0x99: ("STA", "absy", 3, "Store A to Absolute,Y"),
    0x9A: ("TXS", "imp", 1, "Transfer X to Stack Pointer"),
    0x9B: ("TXY", "imp", 1, "Transfer X to Y"),
    0x9C: ("STZ", "abs", 3, "Store Zero to Absolute"),
    0x9D: ("STA", "absx", 3, "Store A to Absolute,X"),
    0x9E: ("STZ", "absx", 3, "Store Zero to Absolute,X"),
    0x9F: ("STA", "ablx", 4, "Store A to Absolute Long,X"),

    0xA0: ("LDY", "imm", 2, "Load Y Immediate"),  # +1 if X=0
    0xA1: ("LDA", "dpix", 2, "Load A from (DP,X)"),
    0xA2: ("LDX", "imm", 2, "Load X Immediate"),  # +1 if X=0
    0xA3: ("LDA", "sr", 2, "Load A from Stack Relative"),
    0xA4: ("LDY", "dp", 2, "Load Y from DP"),
    0xA5: ("LDA", "dp", 2, "Load A from DP"),
    0xA6: ("LDX", "dp", 2, "Load X from DP"),
    0xA7: ("LDA", "dpil", 2, "Load A from [DP]"),
    0xA8: ("TAY", "imp", 1, "Transfer A to Y"),
    0xA9: ("LDA", "imm", 2, "Load A Immediate"),  # +1 if M=0
    0xAA: ("TAX", "imp", 1, "Transfer A to X"),
    0xAB: ("PLB", "imp", 1, "Pull Data Bank"),
    0xAC: ("LDY", "abs", 3, "Load Y from Absolute"),
    0xAD: ("LDA", "abs", 3, "Load A from Absolute"),
    0xAE: ("LDX", "abs", 3, "Load X from Absolute"),
    0xAF: ("LDA", "abl", 4, "Load A from Absolute Long"),

    0xB0: ("BCS", "rel", 2, "Branch if Carry Set"),
    0xB1: ("LDA", "dpiy", 2, "Load A from (DP),Y"),
    0xB2: ("LDA", "dpi", 2, "Load A from (DP)"),
    0xB3: ("LDA", "sriy", 2, "Load A from (SR),Y"),
    0xB4: ("LDY", "dpx", 2, "Load Y from DP,X"),
    0xB5: ("LDA", "dpx", 2, "Load A from DP,X"),
    0xB6: ("LDX", "dpy", 2, "Load X from DP,Y"),
    0xB7: ("LDA", "dpily", 2, "Load A from [DP],Y"),
    0xB8: ("CLV", "imp", 1, "Clear Overflow Flag"),
    0xB9: ("LDA", "absy", 3, "Load A from Absolute,Y"),
    0xBA: ("TSX", "imp", 1, "Transfer Stack Pointer to X"),
    0xBB: ("TYX", "imp", 1, "Transfer Y to X"),
    0xBC: ("LDY", "absx", 3, "Load Y from Absolute,X"),
    0xBD: ("LDA", "absx", 3, "Load A from Absolute,X"),
    0xBE: ("LDX", "absy", 3, "Load X from Absolute,Y"),
    0xBF: ("LDA", "ablx", 4, "Load A from Absolute Long,X"),

    0xC0: ("CPY", "imm", 2, "Compare Y Immediate"),  # +1 if X=0
    0xC1: ("CMP", "dpix", 2, "Compare A with (DP,X)"),
    0xC2: ("REP", "imm", 2, "Reset Processor Status Bits"),
    0xC3: ("CMP", "sr", 2, "Compare A with Stack Relative"),
    0xC4: ("CPY", "dp", 2, "Compare Y with DP"),
    0xC5: ("CMP", "dp", 2, "Compare A with DP"),
    0xC6: ("DEC", "dp", 2, "Decrement DP"),
    0xC7: ("CMP", "dpil", 2, "Compare A with [DP]"),
    0xC8: ("INY", "imp", 1, "Increment Y"),
    0xC9: ("CMP", "imm", 2, "Compare A Immediate"),  # +1 if M=0
    0xCA: ("DEX", "imp", 1, "Decrement X"),
    0xCB: ("WAI", "imp", 1, "Wait for Interrupt"),
    0xCC: ("CPY", "abs", 3, "Compare Y with Absolute"),
    0xCD: ("CMP", "abs", 3, "Compare A with Absolute"),
    0xCE: ("DEC", "abs", 3, "Decrement Absolute"),
    0xCF: ("CMP", "abl", 4, "Compare A with Absolute Long"),

    0xD0: ("BNE", "rel", 2, "Branch if Not Equal"),
    0xD1: ("CMP", "dpiy", 2, "Compare A with (DP),Y"),
    0xD2: ("CMP", "dpi", 2, "Compare A with (DP)"),
    0xD3: ("CMP", "sriy", 2, "Compare A with (SR),Y"),
    0xD4: ("PEI", "dpi", 2, "Push Effective Indirect"),
    0xD5: ("CMP", "dpx", 2, "Compare A with DP,X"),
    0xD6: ("DEC", "dpx", 2, "Decrement DP,X"),
    0xD7: ("CMP", "dpily", 2, "Compare A with [DP],Y"),
    0xD8: ("CLD", "imp", 1, "Clear Decimal Flag"),
    0xD9: ("CMP", "absy", 3, "Compare A with Absolute,Y"),
    0xDA: ("PHX", "imp", 1, "Push X Register"),
    0xDB: ("STP", "imp", 1, "Stop Processor"),
    0xDC: ("JML", "absil", 3, "Jump Long Indirect"),
    0xDD: ("CMP", "absx", 3, "Compare A with Absolute,X"),
    0xDE: ("DEC", "absx", 3, "Decrement Absolute,X"),
    0xDF: ("CMP", "ablx", 4, "Compare A with Absolute Long,X"),

    0xE0: ("CPX", "imm", 2, "Compare X Immediate"),  # +1 if X=0
    0xE1: ("SBC", "dpix", 2, "Subtract with Borrow (DP,X)"),
    0xE2: ("SEP", "imm", 2, "Set Processor Status Bits"),
    0xE3: ("SBC", "sr", 2, "Subtract with Borrow Stack Relative"),
    0xE4: ("CPX", "dp", 2, "Compare X with DP"),
    0xE5: ("SBC", "dp", 2, "Subtract with Borrow DP"),
    0xE6: ("INC", "dp", 2, "Increment DP"),
    0xE7: ("SBC", "dpil", 2, "Subtract with Borrow [DP]"),
    0xE8: ("INX", "imp", 1, "Increment X"),
    0xE9: ("SBC", "imm", 2, "Subtract with Borrow Immediate"),  # +1 if M=0
    0xEA: ("NOP", "imp", 1, "No Operation"),
    0xEB: ("XBA", "imp", 1, "Exchange B and A (high/low bytes)"),
    0xEC: ("CPX", "abs", 3, "Compare X with Absolute"),
    0xED: ("SBC", "abs", 3, "Subtract with Borrow Absolute"),
    0xEE: ("INC", "abs", 3, "Increment Absolute"),
    0xEF: ("SBC", "abl", 4, "Subtract with Borrow Absolute Long"),

    0xF0: ("BEQ", "rel", 2, "Branch if Equal"),
    0xF1: ("SBC", "dpiy", 2, "Subtract with Borrow (DP),Y"),
    0xF2: ("SBC", "dpi", 2, "Subtract with Borrow (DP)"),
    0xF3: ("SBC", "sriy", 2, "Subtract with Borrow (SR),Y"),
    0xF4: ("PEA", "abs", 3, "Push Effective Absolute"),
    0xF5: ("SBC", "dpx", 2, "Subtract with Borrow DP,X"),
    0xF6: ("INC", "dpx", 2, "Increment DP,X"),
    0xF7: ("SBC", "dpily", 2, "Subtract with Borrow [DP],Y"),
    0xF8: ("SED", "imp", 1, "Set Decimal Flag"),
    0xF9: ("SBC", "absy", 3, "Subtract with Borrow Absolute,Y"),
    0xFA: ("PLX", "imp", 1, "Pull X Register"),
    0xFB: ("XCE", "imp", 1, "Exchange Carry and Emulation"),
    0xFC: ("JSR", "absix", 3, "Jump to Subroutine Indirect,X"),
    0xFD: ("SBC", "absx", 3, "Subtract with Borrow Absolute,X"),
    0xFE: ("INC", "absx", 3, "Increment Absolute,X"),
    0xFF: ("SBC", "ablx", 4, "Subtract with Borrow Absolute Long,X"),
}


def parse_ips(filepath: str) -> List[Tuple[int, bytes]]:
    """
    Parse an IPS patch file and return list of (offset, data) tuples.

    IPS Format:
    - "PATCH" header (5 bytes)
    - Records: [offset: 3 bytes BE] [size: 2 bytes BE] [data: size bytes]
      - If size == 0, it's RLE: [run_length: 2 bytes BE] [byte]
    - "EOF" footer (3 bytes)
    """
    records = []

    with open(filepath, 'rb') as f:
        # Check header
        header = f.read(5)
        if header != b'PATCH':
            raise ValueError(f"Invalid IPS header: {header}")

        while True:
            # Read offset (3 bytes, big-endian)
            offset_bytes = f.read(3)
            if offset_bytes == b'EOF' or len(offset_bytes) < 3:
                break

            offset = int.from_bytes(offset_bytes, 'big')

            # Read size (2 bytes, big-endian)
            size_bytes = f.read(2)
            if len(size_bytes) < 2:
                break
            size = int.from_bytes(size_bytes, 'big')

            if size == 0:
                # RLE record
                rle_size_bytes = f.read(2)
                rle_byte = f.read(1)
                if len(rle_size_bytes) < 2 or len(rle_byte) < 1:
                    break
                rle_size = int.from_bytes(rle_size_bytes, 'big')
                data = rle_byte * rle_size
            else:
                # Normal record
                data = f.read(size)
                if len(data) < size:
                    break

            records.append((offset, data))

    return records


def offset_to_snes_addr(offset: int, hirom: bool = True) -> int:
    """Convert file offset to SNES address (HiROM mapping)."""
    if hirom:
        # HiROM: $C00000 + offset (for banks $C0-$FF)
        return 0xC00000 + offset
    else:
        # LoROM: More complex mapping
        bank = (offset // 0x8000) + 0x80
        addr = (offset % 0x8000) + 0x8000
        return (bank << 16) | addr


def format_operand(mode: str, data: bytes, addr: int) -> str:
    """Format the operand based on addressing mode."""
    if mode == "imp" or mode == "acc":
        return ""
    elif mode == "imm":
        if len(data) == 1:
            return f"#${data[0]:02X}"
        else:
            val = int.from_bytes(data[:2], 'little')
            return f"#${val:04X}"
    elif mode == "dp":
        return f"${data[0]:02X}"
    elif mode == "dpx":
        return f"${data[0]:02X},X"
    elif mode == "dpy":
        return f"${data[0]:02X},Y"
    elif mode == "dpi":
        return f"(${data[0]:02X})"
    elif mode == "dpix":
        return f"(${data[0]:02X},X)"
    elif mode == "dpiy":
        return f"(${data[0]:02X}),Y"
    elif mode == "dpil":
        return f"[${data[0]:02X}]"
    elif mode == "dpily":
        return f"[${data[0]:02X}],Y"
    elif mode == "abs":
        val = int.from_bytes(data[:2], 'little')
        return f"${val:04X}"
    elif mode == "absx":
        val = int.from_bytes(data[:2], 'little')
        return f"${val:04X},X"
    elif mode == "absy":
        val = int.from_bytes(data[:2], 'little')
        return f"${val:04X},Y"
    elif mode == "absi":
        val = int.from_bytes(data[:2], 'little')
        return f"(${val:04X})"
    elif mode == "absix":
        val = int.from_bytes(data[:2], 'little')
        return f"(${val:04X},X)"
    elif mode == "absil":
        val = int.from_bytes(data[:2], 'little')
        return f"[${val:04X}]"
    elif mode == "abl":
        val = int.from_bytes(data[:3], 'little')
        return f"${val:06X}"
    elif mode == "ablx":
        val = int.from_bytes(data[:3], 'little')
        return f"${val:06X},X"
    elif mode == "rel":
        # Relative branch (signed 8-bit)
        offset = data[0] if data[0] < 128 else data[0] - 256
        target = addr + 2 + offset  # PC + instruction length + offset
        return f"${target & 0xFFFF:04X}"
    elif mode == "rell":
        # Relative long branch (signed 16-bit)
        offset = int.from_bytes(data[:2], 'little', signed=True)
        target = addr + 3 + offset
        return f"${target & 0xFFFF:04X}"
    elif mode == "sr":
        return f"${data[0]:02X},S"
    elif mode == "sriy":
        return f"(${data[0]:02X},S),Y"
    elif mode == "blk":
        return f"${data[0]:02X},${data[1]:02X}"
    else:
        return f"???"


def disassemble_record(offset: int, data: bytes, hirom: bool = True) -> List[str]:
    """
    Disassemble a patch record into ASM lines.
    Returns list of formatted assembly lines.
    """
    lines = []
    snes_addr = offset_to_snes_addr(offset, hirom)
    bank = (snes_addr >> 16) & 0xFF

    lines.append(f";--- Patch at file offset ${offset:06X} (SNES ${snes_addr:06X}) ---")
    lines.append(f"org ${snes_addr:06X}")
    lines.append("")

    i = 0
    while i < len(data):
        byte = data[i]
        current_addr = snes_addr + i

        if byte in OPCODES:
            mnemonic, mode, length, desc = OPCODES[byte]

            # Get operand bytes
            operand_data = data[i+1:i+length] if i+1 < len(data) else b''

            # Check if we have enough bytes
            if len(operand_data) < length - 1:
                # Not enough bytes for full instruction, output as data
                remaining = data[i:]
                hex_str = ' '.join(f'{b:02X}' for b in remaining)
                lines.append(f"    db ${', $'.join(f'{b:02X}' for b in remaining):<24}; Incomplete/data bytes")
                break

            # Format the instruction
            operand_str = format_operand(mode, operand_data, current_addr)
            hex_bytes = ' '.join(f'{data[i+j]:02X}' for j in range(min(length, len(data)-i)))

            if operand_str:
                instr = f"{mnemonic} {operand_str}"
            else:
                instr = mnemonic

            # Create the line with hex bytes and description
            lines.append(f"    {instr:<24}; [{hex_bytes:<11}] {desc}")

            i += length
        else:
            # Unknown opcode - output as data byte
            lines.append(f"    db ${byte:02X}                    ; [Data byte]")
            i += 1

    lines.append("")
    return lines


def generate_commented_asm(ips_path: str, output_path: str):
    """Generate a commented ASM file from an IPS patch."""

    filename = os.path.basename(ips_path)
    records = parse_ips(ips_path)

    lines = []
    lines.append(";=" * 40)
    lines.append(f"; {filename}.commented.asm")
    lines.append(f";    Disassembled from IPS patch: {filename}")
    lines.append(";    AUTO-GENERATED - May require manual review")
    lines.append(";")
    lines.append("; NOTE: This disassembly assumes:")
    lines.append(";   - HiROM memory mapping (FFV uses HiROM)")
    lines.append(";   - 8-bit accumulator/index modes (default)")
    lines.append(";   - Code (not data) at patched locations")
    lines.append(";   - Some bytes may actually be data, not code")
    lines.append(";=" * 40)
    lines.append("")
    lines.append("hirom")
    lines.append("")
    lines.append(f"; Patch contains {len(records)} record(s)")
    lines.append("")

    for offset, data in records:
        record_lines = disassemble_record(offset, data)
        lines.extend(record_lines)

    lines.append(";--- End of patch ---")

    with open(output_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))


def process_directory(input_dir: str, recursive: bool = True):
    """Process all IPS files in a directory."""

    input_path = Path(input_dir)
    pattern = "**/*.ips" if recursive else "*.ips"

    ips_files = list(input_path.glob(pattern))
    print(f"Found {len(ips_files)} IPS files")

    processed = 0
    errors = 0

    for ips_file in ips_files:
        output_file = ips_file.with_suffix('.ips.commented.asm')

        try:
            generate_commented_asm(str(ips_file), str(output_file))
            processed += 1
            print(f"  [{processed}/{len(ips_files)}] {ips_file.name}")
        except Exception as e:
            errors += 1
            print(f"  [ERROR] {ips_file.name}: {e}")

    print(f"\nComplete: {processed} processed, {errors} errors")
    return processed, errors


if __name__ == "__main__":
    # Fix Windows console encoding
    import io
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
    sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding='utf-8', errors='replace')

    if len(sys.argv) < 2:
        print("Usage: python ips_disassembler.py <directory>")
        print("       Processes all .ips files recursively")
        sys.exit(1)

    process_directory(sys.argv[1])
