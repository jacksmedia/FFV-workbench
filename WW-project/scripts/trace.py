data = open('___ff5c.sfc', 'rb').read()
offset = 0xE2C7A

print('Hex dump around offset {:04X}:'.format(offset))
for i in range(-10, 10):
    addr = offset + i
    if 0 <= addr < len(data):
        marker = ' <-- STA $0501,X' if i == 0 else ''
        print('{:04X}: {:02X}{}'.format(addr, data[addr], marker))

print()
print('Now let\\'s try to disassemble backwards from the STA to see what loads A:')

# Go backwards and look for instructions that affect A
addr = offset - 1
found_lda = False
while addr >= offset - 20 and not found_lda:  # Look up to 20 bytes back
    if addr < 0:
        break
    b1 = data[addr]
    length = 1
    
    # Check if this is an instruction that loads accumulator
    if b1 == 0xA5 and addr+1 < len(data):  # LDA direct
        length = 2
        dp_addr = data[addr+1]
        dp_val = data[dp_addr] if dp_addr < len(data) else 0
        print('{:04X}: A5 {:02X} LDA ${:02X} <- Loads {:02X} from direct page'.format(addr, data[addr+1], dp_addr, dp_val))
        found_lda = True
        break
    elif b1 == 0xA9 and addr+1 < len(data):  # LDA immediate
        length = 2
        imm_val = data[addr+1]
        print('{:04X}: A9 {:02X} LDA #${:02X} <- Loads immediate {:02X}'.format(addr, data[addr+1], imm_val))
        found_lda = True
        break
    elif b1 == 0xB5 and addr+1 < len(data):  # LDA direct,X
        length = 2
        print('{:04X}: B5 {:02X} LDA ${:02X},X <- Loads from direct page+X'.format(addr, data[addr+1]))
        found_lda = True
        break
    elif b1 == 0xBD and addr+2 < len(data):  # LDA absolute,X
        length = 3
        abs_addr = data[addr+2] * 256 + data[addr+1]
        abs_val = data[abs_addr] if abs_addr < len(data) else 0
        print('{:04X}: BD {:02X} {:02X} LDA ${:02X}{:02X},X <- Loads {:02X} from absolute+X'.format(addr, data[addr+1], data[addr+2], data[addr+2], data[addr+1], abs_val))
        found_lda = True
        break
    elif b1 == 0xAA:  # TAX
        length = 1
        print('{:04X}: AA TAX'.format(addr))
    elif b1 == 0xA8:  # TAY
        length = 1
        print('{:04X}: A8 TAY'.format(addr))
    elif b1 == 0x8A:  # TXA
        length = 1
        print('{:04X}: 8A TXA <- Transfers X to A'.format(addr))
        # When we see TXA, we need to find what loaded X
        found_lda = True  # We'll stop here for now and note we need to trace X
        break
    elif b1 == 0x98:  # TYA
        length = 1
        print('{:04X}: 98 TYA <- Transfers Y to A'.format(addr))
        found_lda = True  # We'll stop here for now and note we need to trace Y
        break
    elif b1 == 0x60:  # RTS
        length = 1
        print('{:04X}: 60 RTS'.format(addr))
        break  # Stop at RTS - end of subroutine
    elif b1 == 0xEA:  # NOP
        length = 1
        print('{:04X}: EA NOP'.format(addr))
    else:
        # Other instruction
        print('{:04X}: {:02X} ???'.format(addr, b1))
        length = 1
        
    addr -= length
    
if not found_lda:
    print('Did not find obvious A-loading instruction in the last 20 bytes')