data = open('___ff5c.sfc', 'rb').read()
matches = []
for i in range(len(data)-1):
    if data[i] == 0xA9 and data[i+1] == 0x15:
        matches.append(i)
print('Checking LDA #$15 instructions for stores to job ID area ($0501-$0504):')
print()
print('Addr:  A9 15  Next bytes        Store target')
print('-----  -----  ----------------  ------------')
for addr in matches:
    # Check if followed by STA direct (85 xx)
    if addr+2 < len(data) and data[addr+1] == 0x85:
        dp_addr = data[addr+2]
        if dp_addr >= 0x01 and dp_addr <= 0x04:  # Direct page $01-$04 maps to $7E:$xx
            print('{:05X}: A9 15   85 {:02X}         STA ${:02X} (direct page)'.format(addr, data[addr+1], data[addr+2], dp_addr))
    # Check if followed by STA absolute (8D xx xx)
    elif addr+3 < len(data) and data[addr+1] == 0x8D:
        abs_addr = data[addr+3] * 256 + data[addr+2]
        if abs_addr >= 0x0501 and abs_addr <= 0x0504:
            print('{:05X}: A9 15   8D {:02X} {:02X}  STA ${:04X}'.format(addr, data[addr+1], data[addr+2], abs_addr))
    # Check if followed by STA absolute,X (9D xx xx) - could be indexed
    elif addr+3 < len(data) and data[addr+1] == 0x9D:
        base_addr = data[addr+3] * 256 + data[addr+2]
        if base_addr >= 0x0500 and base_addr <= 0x0503:  # Base addr $0500-$0503 + X could hit $0501-$0504
            print('{:05X}: A9 15   9D {:02X} {:02X}  STA ${:04X},X'.format(addr, data[addr+1], data[addr+2], base_addr))
    # Check if followed by STA dir,X (95 xx)
    elif addr+2 < len(data) and data[addr+1] == 0x95:
        dp_addr = data[addr+2]
        if dp_addr >= 0x01 and dp_addr <= 0x04:  # Direct page $01-$04 + X
            print('{:05X}: A9 15   95 {:02X}         STA ${:02X},X'.format(addr, data[addr+1], data[addr+2], dp_addr))