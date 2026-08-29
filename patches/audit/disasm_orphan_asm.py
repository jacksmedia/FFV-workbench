#!/usr/bin/env python3
"""
Disassemble the largest orphan ASM regions from ffvclean-wip.sfc.
Uses LoROM mapping: file offset maps to bank:addr.
"""

from pathlib import Path
import sys

# Add the analysis-tools to path for the disassembler
sys.path.insert(0, str(Path(__file__).parent.parent.parent / 'ffv-decomp' / 'analysis-tools'))

# Simplified 65816 disassembler inline (to avoid import complexity)
def disasm_region(data: bytes, file_offset: int) -> list[str]:
    """Disassemble bytes starting at file_offset. Returns annotated lines."""

    # LoROM mapping: file_offset -> bank:addr
    # For offsets < 0x400000: bank = (offset >> 15) | 0x80, addr = (offset & 0x7FFF) | 0x8000
    # But for bank $00-$3F code, it's typically mapped as:
    # file_offset = (bank * 0x8000) + (addr - 0x8000) for addr >= 0x8000
    # Inverse: bank = file_offset // 0x8000, addr = (file_offset % 0x8000) + 0x8000

    bank = file_offset // 0x8000
    base_addr = (file_offset % 0x8000) + 0x8000

    # Opcode table: opcode -> (mnemonic, operand_bytes, format_func)
    # Simplified for common FFV code patterns
    OPCODES = {
        0x00: ('BRK', 1, lambda o,pc: f"#${o[0]:02X}"),
        0x18: ('CLC', 0, None),
        0x20: ('JSR', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x22: ('JSL', 3, lambda o,pc: f"${o[2]:02X}{o[1]:02X}{o[0]:02X}"),
        0x28: ('PLP', 0, None),
        0x29: ('AND', 1, lambda o,pc: f"#${o[0]:02X}"),  # 8-bit immediate assumed
        0x2C: ('BIT', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x38: ('SEC', 0, None),
        0x48: ('PHA', 0, None),
        0x4C: ('JMP', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x5C: ('JML', 3, lambda o,pc: f"${o[2]:02X}{o[1]:02X}{o[0]:02X}"),
        0x60: ('RTS', 0, None),
        0x68: ('PLA', 0, None),
        0x69: ('ADC', 1, lambda o,pc: f"#${o[0]:02X}"),
        0x6B: ('RTL', 0, None),
        0x80: ('BRA', 1, lambda o,pc: f"${(pc + 2 + (o[0] - 256 if o[0] > 127 else o[0])) & 0xFFFF:04X}"),
        0x85: ('STA', 1, lambda o,pc: f"${o[0]:02X}"),
        0x86: ('STX', 1, lambda o,pc: f"${o[0]:02X}"),
        0x8D: ('STA', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x8F: ('STA', 3, lambda o,pc: f"${o[2]:02X}{o[1]:02X}{o[0]:02X}"),
        0x99: ('STA', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},Y"),
        0x9D: ('STA', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},X"),
        0xA0: ('LDY', 1, lambda o,pc: f"#${o[0]:02X}"),
        0xA2: ('LDX', 1, lambda o,pc: f"#${o[0]:02X}"),
        0xA5: ('LDA', 1, lambda o,pc: f"${o[0]:02X}"),
        0xA6: ('LDX', 1, lambda o,pc: f"${o[0]:02X}"),
        0xA9: ('LDA', 1, lambda o,pc: f"#${o[0]:02X}"),
        0xAD: ('LDA', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0xAF: ('LDA', 3, lambda o,pc: f"${o[2]:02X}{o[1]:02X}{o[0]:02X}"),
        0xB9: ('LDA', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},Y"),
        0xBD: ('LDA', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},X"),
        0xC2: ('REP', 1, lambda o,pc: f"#${o[0]:02X}"),
        0xC8: ('INY', 0, None),
        0xC9: ('CMP', 1, lambda o,pc: f"#${o[0]:02X}"),
        0xCA: ('DEX', 0, None),
        0xD0: ('BNE', 1, lambda o,pc: f"${(pc + 2 + (o[0] - 256 if o[0] > 127 else o[0])) & 0xFFFF:04X}"),
        0xD8: ('CLD', 0, None),
        0xDA: ('PHX', 0, None),
        0xE0: ('CPX', 1, lambda o,pc: f"#${o[0]:02X}"),
        0xE2: ('SEP', 1, lambda o,pc: f"#${o[0]:02X}"),
        0xE6: ('INC', 1, lambda o,pc: f"${o[0]:02X}"),
        0xE8: ('INX', 0, None),
        0xEA: ('NOP', 0, None),
        0xED: ('SBC', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0xF0: ('BEQ', 1, lambda o,pc: f"${(pc + 2 + (o[0] - 256 if o[0] > 127 else o[0])) & 0xFFFF:04X}"),
        0xFA: ('PLX', 0, None),
        0x7A: ('PLY', 0, None),
        0x5A: ('PHY', 0, None),
        0x08: ('PHP', 0, None),
        0x78: ('SEI', 0, None),
        0x58: ('CLI', 0, None),
        0x10: ('BPL', 1, lambda o,pc: f"${(pc + 2 + (o[0] - 256 if o[0] > 127 else o[0])) & 0xFFFF:04X}"),
        0x30: ('BMI', 1, lambda o,pc: f"${(pc + 2 + (o[0] - 256 if o[0] > 127 else o[0])) & 0xFFFF:04X}"),
        0x90: ('BCC', 1, lambda o,pc: f"${(pc + 2 + (o[0] - 256 if o[0] > 127 else o[0])) & 0xFFFF:04X}"),
        0xB0: ('BCS', 1, lambda o,pc: f"${(pc + 2 + (o[0] - 256 if o[0] > 127 else o[0])) & 0xFFFF:04X}"),
        0x1A: ('INC', 0, None),  # INC A
        0x3A: ('DEC', 0, None),  # DEC A
        0x0A: ('ASL', 0, None),  # ASL A
        0x4A: ('LSR', 0, None),  # LSR A
        0x09: ('ORA', 1, lambda o,pc: f"#${o[0]:02X}"),
        0x49: ('EOR', 1, lambda o,pc: f"#${o[0]:02X}"),
        0x05: ('ORA', 1, lambda o,pc: f"${o[0]:02X}"),
        0x25: ('AND', 1, lambda o,pc: f"${o[0]:02X}"),
        0x45: ('EOR', 1, lambda o,pc: f"${o[0]:02X}"),
        0x65: ('ADC', 1, lambda o,pc: f"${o[0]:02X}"),
        0xE5: ('SBC', 1, lambda o,pc: f"${o[0]:02X}"),
        0xC5: ('CMP', 1, lambda o,pc: f"${o[0]:02X}"),
        0xE4: ('CPX', 1, lambda o,pc: f"${o[0]:02X}"),
        0xC4: ('CPY', 1, lambda o,pc: f"${o[0]:02X}"),
        0x24: ('BIT', 1, lambda o,pc: f"${o[0]:02X}"),
        0x64: ('STZ', 1, lambda o,pc: f"${o[0]:02X}"),
        0x9C: ('STZ', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x84: ('STY', 1, lambda o,pc: f"${o[0]:02X}"),
        0xA4: ('LDY', 1, lambda o,pc: f"${o[0]:02X}"),
        0xAC: ('LDY', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0xAE: ('LDX', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x8E: ('STX', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x8C: ('STY', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0xB5: ('LDA', 1, lambda o,pc: f"${o[0]:02X},X"),
        0x95: ('STA', 1, lambda o,pc: f"${o[0]:02X},X"),
        0xB4: ('LDY', 1, lambda o,pc: f"${o[0]:02X},X"),
        0xB6: ('LDX', 1, lambda o,pc: f"${o[0]:02X},Y"),
        0xB1: ('LDA', 1, lambda o,pc: f"(${o[0]:02X}),Y"),
        0x91: ('STA', 1, lambda o,pc: f"(${o[0]:02X}),Y"),
        0xA1: ('LDA', 1, lambda o,pc: f"(${o[0]:02X},X)"),
        0x81: ('STA', 1, lambda o,pc: f"(${o[0]:02X},X)"),
        0xB7: ('LDA', 1, lambda o,pc: f"[${o[0]:02X}],Y"),
        0x97: ('STA', 1, lambda o,pc: f"[${o[0]:02X}],Y"),
        0x07: ('ORA', 1, lambda o,pc: f"[${o[0]:02X}]"),
        0x27: ('AND', 1, lambda o,pc: f"[${o[0]:02X}]"),
        0x47: ('EOR', 1, lambda o,pc: f"[${o[0]:02X}]"),
        0x67: ('ADC', 1, lambda o,pc: f"[${o[0]:02X}]"),
        0xE7: ('SBC', 1, lambda o,pc: f"[${o[0]:02X}]"),
        0xC7: ('CMP', 1, lambda o,pc: f"[${o[0]:02X}]"),
        0x87: ('STA', 1, lambda o,pc: f"[${o[0]:02X}]"),
        0xA7: ('LDA', 1, lambda o,pc: f"[${o[0]:02X}]"),
        0x3D: ('AND', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},X"),
        0x7D: ('ADC', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},X"),
        0xFD: ('SBC', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},X"),
        0xDD: ('CMP', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},X"),
        0x1D: ('ORA', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},X"),
        0x5D: ('EOR', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},X"),
        0x2D: ('AND', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x0D: ('ORA', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x4D: ('EOR', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x6D: ('ADC', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0xCD: ('CMP', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0xCE: ('DEC', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0xEE: ('INC', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0xDE: ('DEC', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},X"),
        0xFE: ('INC', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},X"),
        0x0E: ('ASL', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x4E: ('LSR', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x2E: ('ROL', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x6E: ('ROR', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
        0x06: ('ASL', 1, lambda o,pc: f"${o[0]:02X}"),
        0x46: ('LSR', 1, lambda o,pc: f"${o[0]:02X}"),
        0x26: ('ROL', 1, lambda o,pc: f"${o[0]:02X}"),
        0x66: ('ROR', 1, lambda o,pc: f"${o[0]:02X}"),
        0x2A: ('ROL', 0, None),  # ROL A
        0x6A: ('ROR', 0, None),  # ROR A
        0xEB: ('XBA', 0, None),
        0xCB: ('WAI', 0, None),
        0xDB: ('STP', 0, None),
        0xFB: ('XCE', 0, None),
        0xBF: ('LDA', 3, lambda o,pc: f"${o[2]:02X}{o[1]:02X}{o[0]:02X},X"),
        0x9F: ('STA', 3, lambda o,pc: f"${o[2]:02X}{o[1]:02X}{o[0]:02X},X"),
        0x79: ('ADC', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},Y"),
        0xF9: ('SBC', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},Y"),
        0xD9: ('CMP', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},Y"),
        0x19: ('ORA', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},Y"),
        0x39: ('AND', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},Y"),
        0x59: ('EOR', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},Y"),
        0xBC: ('LDY', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},X"),
        0xBE: ('LDX', 2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},Y"),
    }

    lines = []
    pos = 0
    while pos < len(data):
        addr = base_addr + pos
        opcode = data[pos]

        if opcode in OPCODES:
            mnemonic, op_len, fmt = OPCODES[opcode]
            if pos + 1 + op_len > len(data):
                # Not enough bytes
                lines.append(f"  C{bank:X}/{addr:04X}: {opcode:02X}           .db ${opcode:02X}  ; truncated")
                break
            operands = data[pos+1:pos+1+op_len]
            hex_bytes = ' '.join(f'{b:02X}' for b in data[pos:pos+1+op_len])
            if fmt:
                operand_str = fmt(operands, addr)
                lines.append(f"  C{bank:X}/{addr:04X}: {hex_bytes:<12} {mnemonic} {operand_str}")
            else:
                lines.append(f"  C{bank:X}/{addr:04X}: {hex_bytes:<12} {mnemonic}")
            pos += 1 + op_len
        else:
            # Unknown opcode - just show as data byte
            lines.append(f"  C{bank:X}/{addr:04X}: {opcode:02X}           .db ${opcode:02X}")
            pos += 1

    return lines


def main():
    base_dir = Path(__file__).parent.parent.parent
    rom_path = base_dir / 'patches' / 'ffvclean-wip.sfc'

    with open(rom_path, 'rb') as f:
        rom = f.read()

    # Top 5 orphan ASM regions from the comparison
    regions = [
        (0x028D35, 0x028DBB, 105, "Unknown routine #1"),
        (0x021DD0, 0x021E16, 61, "Unknown routine #2"),
        (0x028CCB, 0x028D01, 53, "Unknown routine #3"),
        (0x021C04, 0x021C36, 37, "Unknown routine #4"),
        (0x02904B, 0x0290CC, 34, "Unknown routine #5"),
    ]

    print("=" * 78)
    print("ORPHAN ASM DISASSEMBLY — ffvclean-wip.sfc custom code regions")
    print("=" * 78)
    print()

    for start, end, orphan_bytes, desc in regions:
        bank = start // 0x8000
        base_addr = (start % 0x8000) + 0x8000

        print(f"## Region: 0x{start:06X} - 0x{end:06X} ({orphan_bytes} orphan bytes)")
        print(f"## SNES address: C{bank:X}/{base_addr:04X}")
        print(f"## {desc}")
        print()

        data = rom[start:end]
        lines = disasm_region(data, start)
        for line in lines:
            print(line)

        print()
        print("-" * 78)
        print()


if __name__ == '__main__':
    main()
