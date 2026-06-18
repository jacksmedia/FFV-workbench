"""SPC700 linear disassembler for the FFV sound-driver quest.

The SPC700 (Sony, in the SNES APU) is NOT a 6502 relative: it has a
MOV-based ISA, direct-page ops, bit ops on 13-bit absolute addresses,
and no M/X width flags (everything is 8-bit; YA pairs for 16-bit word ops).

Usage (driver block 0 of FFV lives at file 0x04064F -> ARAM $0200):
    python disasm_spc700.py ff5c.sfc --fileoff 0x04064F --aram 0x0200 --len 0x17F0
    python disasm_spc700.py ff5c.sfc --fileoff 0x04064F --aram 0x0200 --len 0x17F0 --check
    python disasm_spc700.py ... --start 0x0200 --end 0x0300   (sub-range, ARAM addrs)

Outputs community-doc style lines:   ARAM/0200: E8 00      MOV A,#$00
APU I/O page ($F0-$FF) accesses are annotated with register names, and
writes of immediates to $F2/$F3 are annotated with DSP register names.
"""
import sys

IOREG = {
    0xF0: 'TEST', 0xF1: 'CONTROL', 0xF2: 'DSPADDR', 0xF3: 'DSPDATA',
    0xF4: 'PORT0/$2140', 0xF5: 'PORT1/$2141', 0xF6: 'PORT2/$2142', 0xF7: 'PORT3/$2143',
    0xF8: 'AUXIO4', 0xF9: 'AUXIO5', 0xFA: 'T0TARGET', 0xFB: 'T1TARGET',
    0xFC: 'T2TARGET', 0xFD: 'T0OUT', 0xFE: 'T1OUT', 0xFF: 'T2OUT',
}

DSPREG = {}
for v in range(8):
    base = v << 4
    for off, nm in ((0, 'VOL_L'), (1, 'VOL_R'), (2, 'PITCH_L'), (3, 'PITCH_H'),
                    (4, 'SRCN'), (5, 'ADSR1'), (6, 'ADSR2'), (7, 'GAIN'),
                    (8, 'ENVX'), (9, 'OUTX')):
        DSPREG[base + off] = f'V{v}:{nm}'
for r, nm in ((0x0C, 'MVOL_L'), (0x1C, 'MVOL_R'), (0x2C, 'EVOL_L'), (0x3C, 'EVOL_R'),
              (0x4C, 'KON'), (0x5C, 'KOF'), (0x6C, 'FLG'), (0x7C, 'ENDX'),
              (0x0D, 'EFB'), (0x2D, 'PMON'), (0x3D, 'NON'), (0x4D, 'EON'),
              (0x5D, 'DIR'), (0x6D, 'ESA'), (0x7D, 'EDL')):
    DSPREG[r] = nm
for v in range(8):
    DSPREG[(v << 4) | 0x0F] = f'FIR{v}'


def dp(b):
    s = f"${b:02X}"
    return s

def rel(o, pc, ln):
    d = o - 256 if o > 127 else o
    return f"${(pc + ln + d) & 0xFFFF:04X}"

def membit(o):
    v = o[1] << 8 | o[0]
    return f"${v & 0x1FFF:04X}.{v >> 13}"

# mode -> (operand byte count, formatter(o, pc) -> operand string)
# o = operand bytes, pc = address of opcode byte
M = {
 'imp':      (0, lambda o, pc: ''),
 'A':        (0, lambda o, pc: 'A'),
 'X':        (0, lambda o, pc: 'X'),
 'Y':        (0, lambda o, pc: 'Y'),
 'PSW':      (0, lambda o, pc: 'PSW'),
 'YA':       (0, lambda o, pc: 'YA'),
 'YA_X':     (0, lambda o, pc: 'YA,X'),
 'X_A':      (0, lambda o, pc: 'X,A'),
 'A_X':      (0, lambda o, pc: 'A,X'),
 'Y_A':      (0, lambda o, pc: 'Y,A'),
 'A_Y':      (0, lambda o, pc: 'A,Y'),
 'X_SP':     (0, lambda o, pc: 'X,SP'),
 'SP_X':     (0, lambda o, pc: 'SP,X'),
 'A_ix':     (0, lambda o, pc: 'A,(X)'),
 'ix_A':     (0, lambda o, pc: '(X),A'),
 'A_ixinc':  (0, lambda o, pc: 'A,(X)+'),
 'ixinc_A':  (0, lambda o, pc: '(X)+,A'),
 'ix_iy':    (0, lambda o, pc: '(X),(Y)'),
 'A_imm':    (1, lambda o, pc: f"A,#${o[0]:02X}"),
 'X_imm':    (1, lambda o, pc: f"X,#${o[0]:02X}"),
 'Y_imm':    (1, lambda o, pc: f"Y,#${o[0]:02X}"),
 'A_dp':     (1, lambda o, pc: f"A,{dp(o[0])}"),
 'dp_A':     (1, lambda o, pc: f"{dp(o[0])},A"),
 'X_dp':     (1, lambda o, pc: f"X,{dp(o[0])}"),
 'dp_X':     (1, lambda o, pc: f"{dp(o[0])},X"),
 'Y_dp':     (1, lambda o, pc: f"Y,{dp(o[0])}"),
 'dp_Y':     (1, lambda o, pc: f"{dp(o[0])},Y"),
 'A_dpx':    (1, lambda o, pc: f"A,{dp(o[0])}+X"),
 'dpx_A':    (1, lambda o, pc: f"{dp(o[0])}+X,A"),
 'X_dpy':    (1, lambda o, pc: f"X,{dp(o[0])}+Y"),
 'dpy_X':    (1, lambda o, pc: f"{dp(o[0])}+Y,X"),
 'Y_dpx':    (1, lambda o, pc: f"Y,{dp(o[0])}+X"),
 'dpx_Y':    (1, lambda o, pc: f"{dp(o[0])}+X,Y"),
 'A_idpx':   (1, lambda o, pc: f"A,[{dp(o[0])}+X]"),
 'idpx_A':   (1, lambda o, pc: f"[{dp(o[0])}+X],A"),
 'A_idpy':   (1, lambda o, pc: f"A,[{dp(o[0])}]+Y"),
 'idpy_A':   (1, lambda o, pc: f"[{dp(o[0])}]+Y,A"),
 'dp':       (1, lambda o, pc: dp(o[0])),
 'dpx':      (1, lambda o, pc: f"{dp(o[0])}+X"),
 'YA_dp':    (1, lambda o, pc: f"YA,{dp(o[0])}"),
 'dp_YA':    (1, lambda o, pc: f"{dp(o[0])},YA"),
 'rel':      (1, lambda o, pc: rel(o[0], pc, 2)),
 'Y_rel':    (1, lambda o, pc: f"Y,{rel(o[0], pc, 2)}"),
 'pcall':    (1, lambda o, pc: f"$FF{o[0]:02X}"),
 'A_abs':    (2, lambda o, pc: f"A,${o[1]:02X}{o[0]:02X}"),
 'abs_A':    (2, lambda o, pc: f"${o[1]:02X}{o[0]:02X},A"),
 'X_abs':    (2, lambda o, pc: f"X,${o[1]:02X}{o[0]:02X}"),
 'abs_X':    (2, lambda o, pc: f"${o[1]:02X}{o[0]:02X},X"),
 'Y_abs':    (2, lambda o, pc: f"Y,${o[1]:02X}{o[0]:02X}"),
 'abs_Y':    (2, lambda o, pc: f"${o[1]:02X}{o[0]:02X},Y"),
 'A_absx':   (2, lambda o, pc: f"A,${o[1]:02X}{o[0]:02X}+X"),
 'absx_A':   (2, lambda o, pc: f"${o[1]:02X}{o[0]:02X}+X,A"),
 'A_absy':   (2, lambda o, pc: f"A,${o[1]:02X}{o[0]:02X}+Y"),
 'absy_A':   (2, lambda o, pc: f"${o[1]:02X}{o[0]:02X}+Y,A"),
 'abs':      (2, lambda o, pc: f"${o[1]:02X}{o[0]:02X}"),
 'absjmp':   (2, lambda o, pc: f"${o[1]:02X}{o[0]:02X}"),
 'iabsx':    (2, lambda o, pc: f"[${o[1]:02X}{o[0]:02X}+X]"),
 'dp_dp':    (2, lambda o, pc: f"{dp(o[1])},{dp(o[0])}"),          # bytes: src,dst
 'dp_imm':   (2, lambda o, pc: f"{dp(o[1])},#${o[0]:02X}"),        # bytes: imm,dp
 'dp_rel':   (2, lambda o, pc: f"{dp(o[0])},{rel(o[1], pc, 3)}"),
 'dpx_rel':  (2, lambda o, pc: f"{dp(o[0])}+X,{rel(o[1], pc, 3)}"),
 'C_mb':     (2, lambda o, pc: f"C,{membit(o)}"),
 'C_nmb':    (2, lambda o, pc: f"C,/{membit(o)}"),
 'mb_C':     (2, lambda o, pc: f"{membit(o)},C"),
 'mb':       (2, lambda o, pc: membit(o)),
}

T = {}
def fill(spec):
    for line in spec.strip().splitlines():
        parts = line.split()
        op, mode = parts[0], parts[-1]
        mn = ' '.join(parts[1:-1])
        T[int(op, 16)] = (mn, mode)

# Bit-op families are regular in bits 7-5: SET1/CLR1 at x2/x12, BBS/BBC at x3/x13.
for n in range(8):
    T[0x02 + 0x20 * n] = (f'SET1', 'dpbit')
    T[0x12 + 0x20 * n] = (f'CLR1', 'dpbit')
    T[0x03 + 0x20 * n] = (f'BBS', 'dpbitrel')
    T[0x13 + 0x20 * n] = (f'BBC', 'dpbitrel')
    T[0x01 + 0x10 * (2 * n)] = (f'TCALL {2*n}', 'imp')
    T[0x01 + 0x10 * (2 * n + 1)] = (f'TCALL {2*n+1}', 'imp')
M['dpbit'] = (1, None)     # handled specially (bit number lives in opcode)
M['dpbitrel'] = (2, None)

fill("""
00 NOP imp
04 OR A_dp
05 OR A_abs
06 OR A_ix
07 OR A_idpx
08 OR A_imm
09 OR dp_dp
0A OR1 C_mb
0B ASL dp
0C ASL abs
0D PUSH PSW
0E TSET1 abs
0F BRK imp
10 BPL rel
14 OR A_dpx
15 OR A_absx
16 OR A_absy
17 OR A_idpy
18 OR dp_imm
19 OR ix_iy
1A DECW dp
1B ASL dpx
1C ASL A
1D DEC X
1E CMP X_abs
1F JMP iabsx
20 CLRP imp
24 AND A_dp
25 AND A_abs
26 AND A_ix
27 AND A_idpx
28 AND A_imm
29 AND dp_dp
2A OR1 C_nmb
2B ROL dp
2C ROL abs
2D PUSH A
2E CBNE dp_rel
2F BRA rel
30 BMI rel
34 AND A_dpx
35 AND A_absx
36 AND A_absy
37 AND A_idpy
38 AND dp_imm
39 AND ix_iy
3A INCW dp
3B ROL dpx
3C ROL A
3D INC X
3E CMP X_dp
3F CALL absjmp
40 SETP imp
44 EOR A_dp
45 EOR A_abs
46 EOR A_ix
47 EOR A_idpx
48 EOR A_imm
49 EOR dp_dp
4A AND1 C_mb
4B LSR dp
4C LSR abs
4D PUSH X
4E TCLR1 abs
4F PCALL pcall
50 BVC rel
54 EOR A_dpx
55 EOR A_absx
56 EOR A_absy
57 EOR A_idpy
58 EOR dp_imm
59 EOR ix_iy
5A CMPW YA_dp
5B LSR dpx
5C LSR A
5D MOV X_A
5E CMP Y_abs
5F JMP absjmp
60 CLRC imp
64 CMP A_dp
65 CMP A_abs
66 CMP A_ix
67 CMP A_idpx
68 CMP A_imm
69 CMP dp_dp
6A AND1 C_nmb
6B ROR dp
6C ROR abs
6D PUSH Y
6E DBNZ dp_rel
6F RET imp
70 BVS rel
74 CMP A_dpx
75 CMP A_absx
76 CMP A_absy
77 CMP A_idpy
78 CMP dp_imm
79 CMP ix_iy
7A ADDW YA_dp
7B ROR dpx
7C ROR A
7D MOV A_X
7E CMP Y_dp
7F RETI imp
80 SETC imp
84 ADC A_dp
85 ADC A_abs
86 ADC A_ix
87 ADC A_idpx
88 ADC A_imm
89 ADC dp_dp
8A EOR1 C_mb
8B DEC dp
8C DEC abs
8D MOV Y_imm
8E POP PSW
8F MOV dp_imm
90 BCC rel
94 ADC A_dpx
95 ADC A_absx
96 ADC A_absy
97 ADC A_idpy
98 ADC dp_imm
99 ADC ix_iy
9A SUBW YA_dp
9B DEC dpx
9C DEC A
9D MOV X_SP
9E DIV YA_X
9F XCN A
A0 EI imp
A4 SBC A_dp
A5 SBC A_abs
A6 SBC A_ix
A7 SBC A_idpx
A8 SBC A_imm
A9 SBC dp_dp
AA MOV1 C_mb
AB INC dp
AC INC abs
AD CMP Y_imm
AE POP A
AF MOV ixinc_A
B0 BCS rel
B4 SBC A_dpx
B5 SBC A_absx
B6 SBC A_absy
B7 SBC A_idpy
B8 SBC dp_imm
B9 SBC ix_iy
BA MOVW YA_dp
BB INC dpx
BC INC A
BD MOV SP_X
BE DAS A
BF MOV A_ixinc
C0 DI imp
C4 MOV dp_A
C5 MOV abs_A
C6 MOV ix_A
C7 MOV idpx_A
C8 CMP X_imm
C9 MOV abs_X
CA MOV1 mb_C
CB MOV dp_Y
CC MOV abs_Y
CD MOV X_imm
CE POP X
CF MUL YA
D0 BNE rel
D4 MOV dpx_A
D5 MOV absx_A
D6 MOV absy_A
D7 MOV idpy_A
D8 MOV dp_X
D9 MOV dpy_X
DA MOVW dp_YA
DB MOV dpx_Y
DC DEC Y
DD MOV A_Y
DE CBNE dpx_rel
DF DAA A
E0 CLRV imp
E4 MOV A_dp
E5 MOV A_abs
E6 MOV A_ix
E7 MOV A_idpx
E8 MOV A_imm
E9 MOV X_abs
EA NOT1 mb
EB MOV Y_dp
EC MOV Y_abs
ED NOTC imp
EE POP Y
EF SLEEP imp
F0 BEQ rel
F4 MOV A_dpx
F5 MOV A_absx
F6 MOV A_absy
F7 MOV A_idpy
F8 MOV X_dp
F9 MOV X_dpy
FA MOV dp_dp
FB MOV Y_dpx
FC INC Y
FD MOV Y_A
FE DBNZ Y_rel
FF STOP imp
""")
assert len(T) == 256, len(T)

BRANCH_OPS = {0x10, 0x30, 0x50, 0x70, 0x90, 0xB0, 0xD0, 0xF0, 0x2F}  # rel
DP_REL_OPS = {0x2E, 0x6E, 0xDE}   # dp,rel / dp+X,rel
DPBITREL_OPS = {0x03 + 0x20 * n for n in range(8)} | {0x13 + 0x20 * n for n in range(8)}
ABS_FLOW = {0x3F, 0x5F}           # CALL abs, JMP abs


def annotate(op, opers, text):
    """Append APU/DSP register comments for I/O-page direct-page accesses."""
    notes = []
    mn, mode = T[op]
    nb = M[mode][0] if mode in M else 0
    # any 1-byte dp operand in $F0-$FF
    if mode in ('A_dp', 'dp_A', 'X_dp', 'dp_X', 'Y_dp', 'dp_Y', 'dp', 'dpx',
                'A_dpx', 'dpx_A', 'YA_dp', 'dp_YA', 'A_idpy', 'idpy_A'):
        if opers and opers[0] >= 0xF0:
            notes.append(IOREG[opers[0]])
    elif mode == 'dp_imm' and opers[1] >= 0xF0:
        notes.append(IOREG[opers[1]])
        if opers[1] == 0xF2 and opers[0] in DSPREG:
            notes.append(f'DSP:{DSPREG[opers[0]]}')
    elif mode == 'dp_dp':
        for b in (opers[0], opers[1]):
            if b >= 0xF0:
                notes.append(IOREG[b])
    elif mode in ('dp_rel', 'dpx_rel') and opers[0] >= 0xF0:
        notes.append(IOREG[opers[0]])
    return f"{text}   ; {', '.join(notes)}" if notes else text


def disasm(mem, start, end, out=sys.stdout, collect=None, targets=None):
    """mem is a dict-like (ARAM image): mem[addr] -> byte. Disassemble [start,end)."""
    pc = start
    while pc < end:
        op = mem[pc]
        mn, mode = T[op]
        if mode == 'dpbit':
            nb = 1
            o = [mem[pc + 1]]
            text = f"{mn} ${o[0]:02X}.{(op >> 5) & 7}"
        elif mode == 'dpbitrel':
            nb = 2
            o = [mem[pc + 1], mem[pc + 2]]
            text = f"{mn} ${o[0]:02X}.{(op >> 5) & 7},{rel(o[1], pc, 3)}"
        else:
            nb, fmt = M[mode]
            o = [mem[pc + 1 + i] for i in range(nb)]
            text = f"{mn} {fmt(o, pc)}".strip()
        text = annotate(op, o, text)
        raw = ' '.join(f"{b:02X}" for b in [op] + o)
        out.write(f"ARAM/{pc:04X}: {raw:<9} {text}\n")
        if collect is not None:
            collect.add(pc)
        if targets is not None:
            if op in BRANCH_OPS:
                d = o[0] - 256 if o[0] > 127 else o[0]
                targets.add((pc, (pc + 2 + d) & 0xFFFF))
            elif op in DP_REL_OPS or op in DPBITREL_OPS:
                d = o[1] - 256 if o[1] > 127 else o[1]
                targets.add((pc, (pc + 3 + d) & 0xFFFF))
            elif op == 0xFE:  # DBNZ Y,rel
                d = o[0] - 256 if o[0] > 127 else o[0]
                targets.add((pc, (pc + 2 + d) & 0xFFFF))
            elif op in ABS_FLOW:
                targets.add((pc, o[1] << 8 | o[0]))
        pc += 1 + nb


def main():
    args = sys.argv[1:]
    def grab(flag, default=None):
        if flag in args:
            i = args.index(flag)
            v = args[i + 1]
            del args[i:i + 2]
            return int(v, 0)
        return default
    fileoff = grab('--fileoff')
    aram = grab('--aram', 0x0200)
    length = grab('--len')
    start = grab('--start', aram)
    end = grab('--end', aram + (length or 0))
    check = '--check' in args
    if check:
        args.remove('--check')
    rom = open(args[0], 'rb').read()
    mem = {}
    for i in range(length):
        mem[aram + i] = rom[fileoff + i]
    for i in range(3):  # pad so a final instruction can read operands past block end
        mem.setdefault(aram + length + i, 0)
    if check:
        starts, targs = set(), set()
        import io
        disasm(mem, start, end, out=io.StringIO(), collect=starts, targets=targs)
        in_range = [(s, t) for (s, t) in targs if start <= t < end]
        miss = [(s, t) for (s, t) in in_range if t not in starts]
        print(f"instructions decoded : {len(starts)}")
        print(f"flow targets in range: {len(in_range)}")
        print(f"targets NOT on an instruction boundary: {len(miss)}")
        for s, t in sorted(miss)[:40]:
            print(f"  from ARAM/{s:04X} -> ARAM/{t:04X}")
    else:
        disasm(mem, start, end)


if __name__ == '__main__':
    main()
