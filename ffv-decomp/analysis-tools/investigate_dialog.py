import struct

ROM_PATH = r"C:\Users\J4cks\Desktop\work5\crawler\_FFV RPGe (CRC32 = 17444605).sfc"

# Conversion: file_offset = snes_addr & 0x3FFFFF
# Pointer table at $E013F0 -> file offset = 0xE013F0 & 0x3FFFFF = 0x2013F0

POINTER_TABLE_FILE_OFFSET = 0xE013F0 & 0x3FFFFF  # 0x2013F0

EVENTS = [
    ("Event 347", 0x090781),
    ("Event 440", 0x09130E),
]

def snes_to_file(snes_addr):
    return snes_addr & 0x3FFFFF

def read_dialog_text(rom, dialog_id):
    ptr_offset = POINTER_TABLE_FILE_OFFSET + dialog_id * 3
    b0, b1, b2 = rom[ptr_offset], rom[ptr_offset+1], rom[ptr_offset+2]
    # 3-byte LE pointer - this is a SNES address
    snes_ptr = b0 | (b1 << 8) | (b2 << 16)
    file_offset = snes_to_file(snes_ptr)
    return snes_ptr, file_offset, rom[file_offset:file_offset+30]

with open(ROM_PATH, 'rb') as f:
    rom = f.read()

print(f"ROM size: {len(rom):,} bytes")
print(f"Pointer table at file offset: 0x{POINTER_TABLE_FILE_OFFSET:06X}")
print()

for label, event_offset in EVENTS:
    print(f"{'='*60}")
    print(f"{label} at file offset 0x{event_offset:06X}")

    # Dump first 64 bytes of event script
    event_bytes = rom[event_offset:event_offset+64]
    print(f"Raw event script bytes (first 64):")
    for i in range(0, len(event_bytes), 16):
        chunk = event_bytes[i:i+16]
        hex_str = ' '.join(f'{b:02X}' for b in chunk)
        print(f"  {event_offset+i:06X}: {hex_str}")

    # Search for $C8 or $F0 opcode
    dialog_id = None
    opcode_offset = None
    opcode_byte = None

    # Search in a wider window
    search_bytes = rom[event_offset:event_offset+256]
    for i, b in enumerate(search_bytes):
        if b in (0xC8, 0xF0):
            d_id = search_bytes[i+1] | (search_bytes[i+2] << 8)
            print(f"\nFound 0x{b:02X} opcode at offset +{i} (file 0x{event_offset+i:06X})")
            print(f"  Bytes: {search_bytes[i]:02X} {search_bytes[i+1]:02X} {search_bytes[i+2]:02X}")
            print(f"  Dialog ID: {d_id} (0x{d_id:04X})")
            if dialog_id is None:
                dialog_id = d_id
                opcode_offset = event_offset + i
                opcode_byte = b
            break

    if dialog_id is not None:
        print(f"\nLooking up dialog ID {dialog_id} in pointer table...")
        snes_ptr, file_off, raw_bytes = read_dialog_text(rom, dialog_id)
        ptr_file_off = POINTER_TABLE_FILE_OFFSET + dialog_id * 3
        ptr_bytes = rom[ptr_file_off:ptr_file_off+3]
        print(f"  Pointer table entry at file 0x{ptr_file_off:06X}: {' '.join(f'{b:02X}' for b in ptr_bytes)}")
        print(f"  SNES dialog ptr: 0x{snes_ptr:06X}")
        print(f"  File dialog offset: 0x{file_off:06X}")
        print(f"\n  First 30 raw bytes of dialog text:")
        hex_str = ' '.join(f'{b:02X}' for b in raw_bytes)
        print(f"  {hex_str}")

        # Also show bytes with annotations
        print(f"\n  Byte-by-byte:")
        for idx, b in enumerate(raw_bytes):
            print(f"    [{idx:02d}] 0x{b:02X} = {b}")
    print()
