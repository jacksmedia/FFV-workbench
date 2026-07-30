;LR switchlead by cubear
hirom


!freespace = $FAF000
!charnum = $1f15
!slotnum = $1f13
!dresscodestart = $f9f070

org $c2feba
jsl switchchar ;lda $010a
nop				;sta $00

org $c2d4f7 ;lda $7e  (this hook is right after each character's data	)
jsl drawbox	;inc      (is read/written to the tilemap, before DMA happens)
nop			;sta $7e

org $c01ce2
jml recovery ;battle/menu recovery

org $c01d6b
bra $0f  ;beq to bra (skip game's default frog/mini check)

org $c2ae8a
jsl loadleader
nop

;org $c0feb0
;hook3:
;jsr $1d1e
;rtl

org !freespace
switchchar:
lda $010a;native
sta $00 ;native code
AND #$0030
beq Exit ;not l or r
lda $0adc
and #$00FF
bne Exit ;vehicle
lda $0ada
and #$00FF
cmp #$0007
bcs Exit;currrent sprite out of bounds (boko,moogle)
;cmp #$0002
;bcc frogmini;frog,mini
lda $0b57 
AND #$0001
bne Exit;nobattle? seems to activate in cutscene
lda $1f03
AND #$00FF
CMP #$00C0 ;map screens
bne Exit ;in menu
phy
phx
php
sep #$20
 lda !charnum
 cmp #$05
 bcc skipreset ;need to initialize our ram...
 lda $0ada
 dec
 dec
 sta !charnum
skipreset:
; lda $0ada ;load incoming character..
; dec
; dec
; tax
 lda $010a ;load "controller input, unique press"
 and #$30 ;filter to just L + R
 beq leavecheck
 ldx #$0000
 bra slotcheck
;else...
 leavecheck:
;plx
;lda $a1
;beq leave
;jml $c003f1
leave:
;jml $c003f9
plp
plx
Exit:
rtl

slotcheck:
lda $0500,x
AND #$07
cmp !charnum
beq thisslot
clc
txa
adc #$50
tax
iny
bra slotcheck
thisslot:
;check L or R here
lda $010A
and #$30 ;filter down to L and R bytes
beq leavecheck ;if result is zero get outta here
cmp #$20 ;l pressed
beq doless
;gotta remember which slot we are in, then go one more or one less, wrapping at value of 4 or FF (valid values 0-3)
domore:
txa
clc
adc #$50
bcc justright ;if FF exceeded, carry set, so we loop back to slot0
lda #$00
bra justright
doless:
txa
sec
sbc #$50
bcs justright;if when going from 00->FF and beyond the Carry is cleared. 
lda #$F0 ;so we should go to slot3
justright:
;okay by now both branches will take us with the correct address loaded in A.. move it to X, do our thing, and then be done.
sta !slotnum ;saves what slot we've loaded for recovery later
stz !slotnum+1
tax
lda $500,x ;get char
BIT #$40
bne thisslot ;if party member not present, check next.
AND #$07   ;clear flags
sta !charnum ;save char for use elsewhere
;check for mini/frog here
lda $51a,x ;status flags (curable)
and #$30
beq notminitoad
cmp #$20
beq is_toad
;else mini
lda #$00
bra doneminitoad
is_toad:
lda #$01
bra doneminitoad
notminitoad:
lda !charnum
inc
inc
doneminitoad:
sta $0ada ;used in DMA for leader sprite
inc $0ba1
plp
plx
ply
rtl




;======================================================
drawbox:
jsr ramcheck
lda $7E ;get slot, native code
 phx
  php
  tax
  sep #$20
  beq skipslotloop
  lda #$00
  clc
slotloop:
  adc #$50
  dex
  bne slotloop
  tax
skipslotloop:
lda !charnum
cmp #$05
bcc continue
stz !charnum
continue:
  lda $0500,x ;load char
  and #$7F ;filter off "back row" bit
  cmp #$40 
  bcs emptyslot
;else
  AND #$07 ;filter out bitwise status
  cmp !charnum
  beq drawlitbox
;else drawdarkbox
  rep #$20
  lda #$0404 ;04 palette (high byte) darkens the line.
  bra drawbox_now
drawlitbox:
  stx !slotnum
  rep #$20
  lda #$0004 ;00 palette is brighter lines
drawbox_now:

;this could almost certainly be rewritten to be done in a loop or use functions already in the game
;but it'd take a bit longer to write that way and it'd probably take more cycles than doing this.

  ldx $2BBA ;contains the "start" address of the current character info panel.
;04 is left side vertical line.
  sta $0100,x ;						|
  sta $0140,x ;						|
  inc; 05 is right size vertical
  sta $010C,x;						|     |
  sta $014C,x;						|     |
  inc; 06 is bottom left corner.
  sta $0180,x;						
  inc; 07 is bottom horizontal line
  sta $0182,x;						
  sta $0184,x;						|     |
  sta $0186,x;						|     |
  sta $0188,x;						L_____
  sta $018a,x;
  inc;08 is bottom right corner
  sta $018c,x
  inc;09
  inc;0a ;none of these are used
  inc;0b
  inc;0c
  inc; 0d is top left corner.
  sta $00c0,x
  inc; 0e is top horizontal.
  sta $00c2,x;						r-----
  sta $00c4,x;						|     |
  sta $00c6,x;						|     |
  sta $00c8,x;						L_____]
  sta $00ca,x;
  inc; 0f is top right corner.
  sta $00cc,x
;DONE DRAWING A BOX!!
  bra exitdrawbox
emptyslot:
;clear out the 4th row and leave
;since the character tile writes skip this one (normally nothing in it)
  lda #$FF ;blank space
  ldx $2BBA  ;starting address for character info box
  sta $0180,x;						
  sta $0182,x;						
  sta $0184,x;					
  sta $0186,x;						
  sta $0188,x;						
  sta $018a,x;
  sta $018c,x;
exitdrawbox:
  plp
 plx
lda $7e
inc		;do nextslot
sta $7e ;native code
rtl

recovery:
jsr ramcheck
  LDY !slotnum
retryload:
  LDA $0500,Y
  and #$07
  sta !charnum
  LDA $0500,Y
  AND #$40
  BNE checknext
  LDA $0500,Y
  AND #$07
  INC
  INC
  STA $0ADA
  LDA $051A,Y
  AND #$20
  BEQ check10
  LDA #$01
  STA $0ADA
  BRA exitrecovery
check10:
  LDA $051A,Y
  AND #$10
  BEQ exitrecovery
  STZ $0ADA
  BRA exitrecovery
checknext:
  REP #$20
  TYA
  CLC
  ADC #$0050
CMP #$0140
bne slot1next ;if FF exceeded, carry set, so we loop back to slot0
lda #$00
slot1next:
sta !slotnum
  TAY
  LDA $06
  SEP #$20
  BRA retryload
exitrecovery:
JML $c01d1d ;exit to rts



ramcheck:
phy
phx
pha
php
sep #$30
lda !charnum
cmp #$05
bcs resetram
lda !slotnum
cmp #$F0
beq noresetram
cmp #$A0
beq noresetram
cmp #$50
beq noresetram
CMP #$00
beq noresetram
resetram:
stz !slotnum
stz !slotnum+1
noresetram:
;time to check slots and see if they match.
ldy #$04
ldx #$00
checkslotloop:
	lda $0500,x
	and #$07
	cmp !charnum
	beq correctslot
	txa
	clc
	adc #$50
	tax
	dey
	bne checkslotloop
ldx #$00
correctslot: ;check if they are in the party...
lda $0500,x
and #%01000000 ;check "not in party bit"
beq inparty ;done!
;okay, so they're not in the party.. let's start from the top and set it to the first "occupied" slot.
ldx #$00
inparty_loop:
	lda $0500,x
	and #%01000000 ;in party?
	beq setnewlead
	txa
	clc
	adc #$50
	tax
	bra inparty_loop
setnewlead:
inparty:
lda $0500,x
and #$07
sta !charnum
stx !slotnum

plp
pla
plx
ply
rts

loadleader:
phb
mvn $00,$30
plb
php
sep #$30
lda $016f
asl
tax
rep #$30
lda.l saveslotptr,x
tax
sep #$20
lda $200000,x
;getslot now
dec #2
sta !charnum
sep #$30
ldy #$04
ldx #$00
-
	lda $0500,x
	and #$07
	cmp !charnum
	beq +
	txa
	clc
	adc #$50
	tax
	dey
	bne -
ldx #$00
+ ;check if they are in the party...
lda $0500,x
and #%01000000 ;check "not in party bit"
beq + ;done!
;okay, so they're not in the party.. let's start from the top and set it to the first "occupied" slot.
ldx #$00
-
	lda $0500,x
	and #%01000000 ;in party?
	beq +
	txa
	clc
	adc #$50
	tax
	bra -
+
lda $0500,x
and #$07
sta !charnum
stx !slotnum
plp
rtl

saveslotptr:
dw $65DA,$6CDA,$73DA,$7ADA
;eof