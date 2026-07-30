;Final Fantasy V: Dress Code - Chocolate

hirom
!bank1 = $f90000
!bank2 = $fa0000
!bank3 = $fb0000
!bank4 = $fc0000

!GFXbank1 = $F9
!GFXbank2 = $FA
!GFXbank3 = $FB
!GFXbank4 = $FC


!job_log_live = $207B40
!currentjobs =  !job_log_live+52
!tempram_krileflag = !job_log_live+56
!endingflag 	= !job_log_live+58
!tempram_formal = !job_log_live+60
!live_CB01 = !job_log_live+62
!statusflags = !job_log_live+64
!tempram_char 	= $1f10 	;might be the top of
							;stack, should never be hit





org $c03dac ;lda $ce59c2,x
;A = character to load
	jml loadmap ;save dest to  
			;$0b23-$0b25
			;and the rest gets handled for us.

;map sprite loader:
org $c01d70 ;toad fix
	db $0f		;increase branch length by 1 to hit our second JML
org $c01d7b ;mini fix
	db $04		;increase branch length by 1 to hit our second JML


;main hook 1, used when the Lead Character is loaded for walking around.
org $c01d7c
	jml loadleader ;lda $0ada (load map leader sprite)
	jml loadleader ;abortloadleader ;move the mini/toad branches here.
	nop
	nop
	nop
	nop
	nop
	nop

org $c071ce		;lda $27
	jsl moatclear 	;sta $80,x
		      
org $c00606 	;event loader
	jsl logJobs 	;LDA $D8E081,x

org $c0a248    	;stz $ba
	jsl setendflag 	;ldx $d4

org $c0008e 	;sta $bd
	jsl newgame 	;sta $bc

org $c002d9 	;lda #$0000
	jsl nmi			;sep #$20
	nop

org $c0bac5 ;sep #$20
	jsl colourpop;lda #$20
		  

org $c2bf02 ;ldx #$0500
			;lda #$05ff
	jsl save
	nop
	nop

org $c2bf55
	jsl load
	nop
	nop

org $c0249B
	jsl fieldpalette

org $c024a3
	jsl fieldpalette

org $c03ee9 ;lda $ce59c6,x
	jsl mapspritepalette

org $c05ba3
	jsl copypalettes	;lda $4a
						;sta $49

org $c05910 ;stop palettes 4-7 from being written
	dex
	bne $f6
	jsr c_pal
;nop #3

org $c0fab0
c_pal:
	jsl copypalettes2
	rts

org $c05b6e
	jsl disablemapmath ;lda $c05bb8,x

org $c0baa1 ;lda #$01
	jsl restorepalette ;sta $a1

org $c02221  
	jsl worldpalette ;LDA $C02A98,X
org $c0222a
	jsl worldpalette2;LDA $C02A9C,X
org $c02233 
	jsl worldpalette3;LDA $C02AA0,X
org $C0223C
	jsl worldpalette4;LDA $C02AA4,X

org $c05532
	jsl WM_palette2
	nop

org $c000b0
	jsl statuspalette1
org $c0a4c7
	jsl statuspalette2
org $c04aca
	jsl statuspalette3

org $c054c7     ;sta $59
	jsl ghidocavefix;sta $c3

org $c01207
	jml bridgecheck

org $c002f7
	jsl layering
	nop

org $c0548f
	jsl clearformalflag ;ldx $af5
	nop #2				;stx $ad6

org $c01d1e
	jsl tornafix ;lda $0ada
	nop			;CMP #$09

;main hook 2. used when loading character sprites per map (for cutscene use)
org !bank1+61440 ;39F000 in prg
loadmap:	;loads a number of sprites for each map.
	lda $ce59c2,x
	cmp #$67 ;dragon
	bcc +
	jml $c03db4 ;exit to do dragon.
+
	cmp #$52 ;special sprites.
	bcc + 
	jml $c03dd8 ;do special sprites
+
	cmp #$4B ;party sprites
	bcs doreplacemap
	cmp #$3A
	beq mogmapcheck

abortloadmap:
	jml $C03E18 ;non party sprites

aborttoadmini:
	jml $c03df4

mogmapcheck:
	php
	rep #$30
mogmaps:
	lda $0AD4
	cmp #$00fd
	beq mogmapfound
	cmp #$0105
	beq mogmapfound
	lda $06
	plp
	lda $ce59c2,x
	jml $C03E18

mogmapfound:
;replace with the lenna paletted sprite.
	stz $0b23				; $____XX of the three byte pointer for DMA
	lda #$FBF0
	sta $0b24				; $XXXX__ of the three byte pointer for DMA
	plp
	rep #$20
	lda $06
	jml $c03e2a

doreplacemap: ;a=char sprite load
	sec
	sbc #$4b
	cmp #$02
	bcs +
	jmp aborttoadmini
+
	pha
	php
	phx
	phy
	dec #2 	;character sprite loads are offset by 2
			;bartz's index in character data is "0"
			;but in sprite loads is after Toad and Mini
	pha
	jsr indexchars
	jsr replacejobs
	pla
	sta !tempram_char
	cmp #$02
	bne +
	lda !tempram_krileflag
	bne notchar
	lda #$02
+
	cmp #$04
	bne +
	lda !tempram_krileflag
	beq notchar
	lda #$02
+
	tax
	lda !currentjobs,x
	bmi +
	and #%01100000
	bne ReplaceMapToadMini
	lda !currentjobs,x
+
	and #%10011111
	bmi notchar
-
	sta $1f16
	asl
	clc
	adc $1f16
	stz $1f16
+
	tax
	lda.l jobtable,x			
	sta $0b25				; $XX____ of the three byte pointer for DMA
	rep #$20 ;16 bit mode
	inx
	lda.l jobtable,x
	sep #$10
	ldy !tempram_char
	rep #$10
	beq skip_charselect_loop ;if bartz nothing needs to be added
charselect_loop:		;load $800 bytes farther in per character.
	clc
	adc #$0800
	dey
	bne charselect_loop
skip_charselect_loop:
	sta $0b23				; $__XXXX of the three byte pointer for DMA
-
	ply
	plx
	plp
	pla
	jml $c03e00
notchar: ;need to exit gracefully, execute native code.
	ply
	plx
	plp
	pla
	jml $c03df4


ReplaceMapToadMini:
	pha
	lda #$FC
	sta $0B25
	stz $0B23
	pla
	cmp #$40
	bcs +
	lda #$f0
	sta $0b24
	bra -
+
	lda #$f8
	sta $0b24
	bra -



indexchars:
	php
	sep #$30
	lda $0842
	cmp #$05
	beq skipindex
	lda !endingflag
	bne skipindex
	lda !tempram_formal
	beq + 
	brl indexformal
+
	lda $0A16 ;event flags
	bmi + ;wind crystal event sets bit 7
	bra indexvanilla
+
	ldy #$00
-
	lda $500,y
	and #$07
	cmp #$04
	beq setkrile
--
	tax
	lda $51a,y
	and #%00110000 ;mini/toad
	asl ;move over one bit to "empty" bits.
	ora $501,y
	sta !currentjobs,x
	tya
	clc
	adc #$50
	bcs +
	tay 
	inx
	bra -
+
	plp
	rts

windcrystal:
	jsl copypalettesfadein
	bra ++

skipindex:
	cmp #$FF
	beq +
	lda $0ad4
	cmp #$1f
	beq windcrystal
	jsl updatepalette
++
	plp
	rts
+
;copy normal palette to slot 4.
	php
	lda $0b53
	beq +
	rep #$30
	ldx #$0d00 ;is where FROM we are transferring
	ldy #$0D80 ;on top of palette 4
	lda #$001F ;transfer $20 bytes
	phb
	mvn $00,$00 
	plb
	rep #$20
	inc
+
	plp
	plp
	rts

setkrile:
	lda #$02
	sta !tempram_krileflag
	bra --

indexvanilla:
	lda #$16
-
	sta !currentjobs
	sta !currentjobs+1
	sta !currentjobs+2
	sta !currentjobs+3
	plp
	rts

indexformal:
	lda $0af5
	cmp #$02
	beq clearformal2
	lda #$17
	bra -
clearformal2:
	lda $ad6
	cmp #$02
	bne +
	lda #$00
	sta !tempram_formal
+
	lda #$17
	bra -

loadleader: ;loads the character in topmost slot. 
			;used for walking around.
	
	jsr mapleaderpalettefix
	php
	rep #$20
	pha
	lda #$FFFF
	sta !statusflags
	sta !statusflags+2
	sta !statusflags+3
	lda !live_CB01
	cmp #$CB01
	beq +
	jsr clearRAM
+
	pla
	plp
	LDA $0ADA ;native code
	cmp #$07 ;up to krile
	bcs abortloadleader ;if higher than krile, abort!
	cmp #$02
	bcc abortloadleader ;if lower than bartz, abort!
	bra doreplaceleader

notcharleader:
	lda $0ADA
abortloadleader:
	ASL
	TAX
	REP #$20
	LDA $C01E02,X
	STA $4302
	jml $C01D8A

	
doreplaceleader: ;a=char sprite load
	dec ;character sprite loads are offset by 2
	dec ;bartz's index in character data is "0"
	;but in sprite loads is after Toad and Mini
	pha
	rep #$20
	lda $0ad4
	cmp #$001f
	bne +
	lda $0842
	and #$0003
	bne ++
+
	jsr indexchars
	jsr replacejobs
++
	lda #$0000
	sep #$20
	pla
	cmp #$04
	bne +
	lda !tempram_krileflag
	bne ++
	bra notcharleader
++
	lda #$04
+
	sta !tempram_char
	cmp #$04
	bne +
	lda #$02
+
	tax
	lda !currentjobs,x
	bmi notcharleader
ischarleader:
	and #%01100000
	bne ReplaceLeaderToadMini
	lda !currentjobs,x
;time to *3 our job num*4
	sta $1f16
	asl
	clc
	adc $1f16
	stz $1f16
+
	tax
	lda.l jobtable,x	
	sta $4304				; $XX____ of the three byte pointer for DMA
	rep #$20 ;16 bit mode
	inx
	lda.l jobtable,x
	sep #$10
	ldy !tempram_char
	rep #$10
	beq skip_charselect_loopleader
charselect_loopleader:
	clc
	adc #$0800
	dey
	bne charselect_loopleader
skip_charselect_loopleader:
-
	sta $4302				; $__XXXX of the three byte pointer for DMA
	jml $c01d8a

ReplaceLeaderToadMini:
	pha
	lda #$FC
	sta $4304
	pla
	cmp #$40
	bcs +
	rep #$20
	lda #$F000
	bra -
+
	rep #$20
	lda #$f800
	bra -

charaddress:
db $00,$50,$A0,$F0
jobtable: ;3 bytes per entry. DATABANK|Address format eg $112233 is $11,$33,$22
;knight
db !GFXbank1,$00,$00 ;390000
;monk
db !GFXbank1,$00,$28 ;392800
;thief
db !GFXbank1,$00,$50 ;395000
;dragoon
db !GFXbank1,$00,$78 ;397800
;ninja
db !GFXbank1,$00,$A0 ;39A000
;samurai
db !GFXbank1,$00,$C8 ;39C800

;berserker
db !GFXbank2,$00,$00
;ranger
db !GFXbank2,$00,$28
;mystic knight
db !GFXbank2,$00,$50
;white mage
db !GFXbank2,$00,$78
;black mage
db !GFXbank2,$00,$A0
;time mage
db !GFXbank2,$00,$C8

;summoner
db !GFXbank3,$00,$00
;blue mage
db !GFXbank3,$00,$28
;red mage
db !GFXbank3,$00,$50
;beastmaster
db !GFXbank3,$00,$78
;chemist
db !GFXbank3,$00,$A0
;geomancer
db !GFXbank3,$00,$C8

;bard
db !GFXbank4,$00,$00
;dancer
db !GFXbank4,$00,$28
;mimic
db !GFXbank4,$00,$50
;freelancer (post crystal)
db !GFXbank4,$00,$78
;freelancer2 (vanilla style)
db !GFXbank4,$00,$A0
;formal wear
db !GFXbank4,$00,$C8
;toad
db !GFXbank4,$00,$F8
;mini
db !GFXbank4,$00,$F0

colourpop:
;	lda $0ada
;	cmp $01ff ;ending stars
;	beq +
	sep #$20
	lda !endingflag
	beq +
	lda #$FF
	sta !currentjobs
	sta !currentjobs+1
	sta !currentjobs+2
	sta !currentjobs+3
	inc $0ba1
+
	lda #$20
	rtl

-
	lda $06
	plb
	rtl

nmi:
	phb
	lda $0AD4
	cmp #$01fD
	bne +
	brl doneformalflag
+
	cmp #$0059
	bne +
	brl doneformalflag
+
	lda #$0000
	sep #$20
	lda #$00
	pha
	plb
	lda !endingflag
	beq ++
	cmp #$02
	bne +
    LDX #$f800                           ;krile
    STX $4372                            ;
    LDX #$7400                           ;
    STX $2116                            ;
	bra finishdma
+
	cmp #$03
	bne +	

    LDX #$F000                 			;faris
    STX $4372                        	;
	LDX #$7800  						;
    STX $2116							;
	bra finishdma
+
	cmp #$04
	bne ++
    LDX #$E000                 			;lenna
    STX $4372                        	;
	LDX #$7100  						;
    STX $2116							;
finishdma:
    sep #$20
    LDA #$9A                             ;Get upper 8-bits of source ptr
    STA $4374                            ;Set source bank
    LDX #$0200                           ;
    STX $4375                            ;Set transfer size in bytes
    LDA #$80 ;port control
    STA $2115;/
    LDA #$01  ;transfer type
    STA $4370 ;/
    LDA #$18 ;dest address (vram input 2118)
    STA $4371
    LDA #$80
    STA $420B ;send dma
++
	rep #$20
	lda $0bd6

	cmp #$c208
	bne +
	brl krilefree
+
	cmp #$6D6A
	bne + 
-
	brl poisonlenna
+
	cmp #$5CDD
	beq -
	cmp #$5D80
	bne +
	brl unpoisonlenna
+
	cmp #$d060
	beq forcebartzlead
	cmp #$1d0e
	beq forcebartzlead
	cmp #$4533
	beq forcebartzlead
	cmp #$DE2F ;set formal flag
	beq setformal
;	cmp #$ad43 ;clear formal flag
;	beq clearformal
	lda $ad4
	cmp #$001f
	bne +
	lda $0bd6
	cmp #$5723 ;faris new freelancer
	beq farisfree
	cmp #$57d9 ;lenna new freelancer
	beq lennafree
	cmp #$588b ;galuf new freelancer
	bne +
	brl galuffree
+
	cmp #$fc87
	bne +
	brl bartzfree
+
-
doneformalflag:
	lda #$0000
	sep #$20
	plb
	rtl

forcebartzlead: ;bartz is forced in the warfleet
	lda $0ad4 ;map
	cmp #$0146 ;war fleet world 2?
	bne -
	lda $0ADA
	AND #$FFF0
	ora #$0002
	sta $0ADA
	inc $0ba1 ;reload leader
	bra -
 
setformal:
 lda #$0001
-
 sta !tempram_formal
 brl doneformalflag
;clearformal:
; lda #$0000
; bra -

farisfree:
	sep #$20
	lda !job_log_live+55
	cmp #$15
	bne +
	brl ++
	+
	lda #$05
	sta $0842
	lda #$15 ;freelancer
	sta !job_log_live+55
	phx
    LDX #$9000                           ;Get lower 16-bits of source ptr
    STX $4372                            ;Set source offset
	LDX #$6C00  
    STX $2116	
	bra finishdmafree
lennafree:
	sep #$20
	lda !job_log_live+53
	cmp #$15
	beq ++
	lda #$15 ;freelancer
	sta !job_log_live+53
	phx
    LDX #$8000  
    STX $4372   
	LDX #$6800  
    STX $2116	
	bra finishdmafree	
galuffree:
	sep #$20
	lda !job_log_live+54
	cmp #$15
	beq ++
	lda #$15 ;freelancer
	sta !job_log_live+54
	phx
    LDX #$8800  
    STX $4372   
	LDX #$7400  
    STX $2116	
finishdmafree:
    sep #$20
    LDA #$FC                             ;Get upper 8-bits of source ptr
    STA $4374                            ;Set source bank
    LDX #$0600                           ;3 rows of sprites needed.
    STX $4375                            ;Set transfer size in bytes
    LDA #$80 ;port control
    STA $2115;/
    LDA #$01  ;transfer type
    STA $4370 ;/
    LDA #$18 ;dest address (vram input 2118)
    STA $4371
    LDA #$80
    STA $420B ;send dma
	plx
	rep #$20
	brl -

++
	rep #$30
	lda #$0000
	sep #$20
	phx
	jsl copypalettesfadein
	plx
	plb
	rtl

bartzfree: ;call leaderswap, set one job... maybe a "blank" one to clear the "always 16 flag"
	sep #$20
	lda $0a16
	bmi ++
	lda $0ad4
	cmp #$1f
	bne ++
	lda $0842
	cmp #$05
	bne +
	lda #$15
	sta !currentjobs
	inc $0ba1 ;do load_leader
+
	rep #$30
	lda #$0000
;do a manual transfer of just bartz' palette here?
	php
	phx
	sep #$20
	ldx #$a660
	ldy #$0D80
	lda #$1f
	phb
    mvn $00,$14 ;from bank 14 INTO 7E
	plb
	rep #$20
	inc
	plx
	plp
	sep #$20
++
	lda #$00
	sta !tempram_formal
	sta !tempram_formal+1
	plb
	rtl
	
krilefree:
;load krile freelancer palette in galuf slot
;change krile to new freelancer sprite.
;set krile's sprite palette to the correct slot.
	lda $0ad4
	cmp #$0167
	bne +
	php
	phx
	sep #$20
	rep #$10
	ldx #$b160
	ldy #$0DC0
	rep #$20
	lda #$001f
	phb
    mvn $00,$14 ;from bank 14 INTO 7E
	plb
	inc
	plx
	plp
	sep #$20
	lda #$15 ;freelancer
	sta !job_log_live+54
	phx
    LDX #$9800  
    STX $4372   
	LDX #$7600  
    STX $2116	
    sep #$20
    LDA #$FC                             ;Get upper 8-bits of source ptr
    STA $4374                            ;Set source bank
    LDX #$0800                           ;4 rows of sprites needed.
    STX $4375                            ;Set transfer size in bytes
    LDA #$80 ;port control
    STA $2115;/
    LDA #$01  ;transfer type
    STA $4370 ;/
    LDA #$18 ;dest address (vram input 2118)
    STA $4371
    LDA #$80
    STA $420B ;send dma
	plx
;	now to set palette bits
	lda #$2D
	sta $1522
	sta $1524
	rep #$20
	plp
+	
	lda $06
	sep #$20
	rtl

poisonlenna: ;lenna is poisoned by dragon grass, north mountain top + castle bal.
	lda $0ad4
	cmp #$003e
	beq +
	cmp #$0109
	bne ++
+
	php
	sep #$30
	ldx #$00
-
	lda $500,x
	and #$07
	cmp #$01
	beq +
	txa
	clc
	adc #$50
	tax
	bcc -
+
	lda #$04
	ora $51a,x
	sta $51a,x
	plp
	brl doneformalflag

unpoisonlenna:
	php
	sep #$30
	ldx #$00
-
	lda $500,x
	and #$07
	cmp #$01
	beq +
	txa
	clc
	adc #$50
	tax
	bcc -
+
	lda #$FB
	AND $51a,x
	sta $51a,x
	plp
++
	brl doneformalflag
	
- ;not set endflag
	cpx #$0105
	bne +
	ldx $0bd6
	cpx #$7880
	bne +
	lda #$c1
	sta $48
+
	stz $ba ;native code
	ldx $d4 ;/
	rtl

skipendflag:
	pla
	stz $ba
	ldx $d4
	rtl
setendflag:
	pha
	lda !endingflag
	cmp #$FF
	beq skipendflag
	pla
	ldx $0AD4 ;map
	cpx #$01FF ;ending
	bne -
	ldx $0bd6 ;eventpointer
	cpx #$8d11 ;shards emerge from character (all 4)
	bne -
	php
	lda !endingflag
	cmp #$01
	bcs +
	rep #$20

;krile:
	SEP #$20	
	lda #$16
	sta !currentjobs+2	
	REP #$20
	lda #$2140
	sta $15fd ;krile
	sta $15ff
	lda #$0002
	sta !endingflag
	lda #$ff00
	sta !job_log_live+69
	lda #$0dc0
	sta !job_log_live+71
	bra finishedflag
+
	cmp #$02
	bne +
;faris
	sep #$20
	lda #$16
	sta !currentjobs+3
	rep #$20
	lda #$2180
    sta $1611 ;faris
    sta $1613
	lda #$0003
	sta !endingflag
	lda #$fee0
	sta !job_log_live+69
	lda #$0DE0
	sta !job_log_live+71
	bra finishedflag
+
	cmp #$03
	bne +
;lenna
	sep #$20
	lda #$16
	sta !currentjobs+1
	rep #$20
	lda #$2110
	sta $15e9 ;lenna
	sta $15eb
	lda #$0004
	sta !endingflag
	lda #$fea0
	sta !job_log_live+69
	lda #$0DA0
	sta !job_log_live+71
	bra finishedflag
+
;bartz
	cmp #$FF
	beq +
	sep #$20
	lda #$FF
	sta !currentjobs
	rep #$20
	lda #$FFFF
	sta !endingflag
finishedflag:
+
	rep #$20
	plp
	inc $0ba1 ;set up leader sprite reload
;done in here.
	stz $ba ;native code
	ldx $d4 ;/
	rtl

newgame:
	sta $bd
	sta $bc
	php
	rep #$30
	jsr clearRAM
	lda #$0000
	plp
	rtl

clearRAM:
phx
	lda #$0000
	ldx #$003E
-
	sta !job_log_live,x
	dex
	dex
	bne -
	sta !job_log_live,x
	lda #$CB01
	sta !live_CB01
	lda #$1616
	sta !currentjobs
	plx
	rts

logJobs:
	lda $0AD4
	cmp #$01fD
	bne ++
	lda $0b53
	bne +
++
	LDA $D8E081,x
	rtl
+ 
	LDA $D8E081,x ;native code
	pha
	phx
	phy

 +
	ldx #$00FF 
	cmp #$04bd ; ghido vs exdeath
	bne +		;log: bartz krile faris
	ldx #$0000	;00
+
	cmp #$00f4 ; bartz fight kelger
	bne +		;log: bartz lenna galuf faris
	ldx #$0004	;03
+
	cmp #$0049 ;faris sleeping
	bne +		;log bartz lenna galuf (faris job sprite not visible)
	ldx #$0008
+
	cmp #$005A ; lenna shot
	bne +		;log bartz, lenna, galuf, faris
	ldx #$000C	;0a
+
	cmp #$005B ;lenna touches grass
	bne +		;log bartz, lenna, galuf , faris
	ldx #$0010	;0e
+
	cmp #$0065 ;lenna and faris on balcony
	bne +		;log lenna, faris
	ldx #$0014	;12
+
	cmp #$0083 ;syldra dies (wals tower sank)
	bne +		;log b l g f
	ldx #$0018	;14
+
	cmp #$0054 ; faris is a girl
	bne +		;log b l g f
	ldx #$001C	;18
+
	cmp #$011d ;bartz krile bodyslam
	bne +		;log b k 
	ldx #$0020	;1c
+
	cmp #$00b4 ;krile casts a spell (earth crystal)
	bne +		;log b l g f
	ldx #$0024	;1e
+
	cmp #$0090 ;galuf is left behind
	bne +		;log b l g f
	ldx #$0028	;22
+
	cmp #$00B7 ;galuf rides hiryuu
	bne +		;log g
	ldx #$002C	;26
+
	cmp #$0441 ;galuf fights exdeath
	bne +		;log b l g f
	ldx #$0030	;27
+ ;total:  $34 / $2a bytes
;now to collect the information.
	phy 
	php
	cpx #$00FF
	beq ++
	lda !live_CB01
	cmp #$CB01
	beq +
	jsr clearRAM
+
;   ldx #$0000
	sep #$20
	lda !job_log_live+52 ;Bartz
	ORA #$80 ;"all knights" prevention part 1 (values are 00 in sram by default)
	sta !job_log_live,x ;X is the charnum + cutscene num*4 at this point, 
						;so each slot gets written to properly.
	inx
	lda !job_log_live+53 ;Lenna
	ORA #$80 ;"all knights" prevention part 1 (values are 00 in sram by default)
	sta !job_log_live,x ;X is the charnum + cutscene num*4 at this point, 
						;so each slot gets written to properly.
	inx	
	lda !job_log_live+54 ;Galuf/Krile
	ORA #$80 ;"all knights" prevention part 1 (values are 00 in sram by default)
	sta !job_log_live,x ;X is the charnum + cutscene num*4 at this point, 
	inx
	lda !job_log_live+55 ;Faris
	ORA #$80 ;"all knights" prevention part 1 (values are 00 in sram by default)
	sta !job_log_live,x ;X is the charnum + cutscene num*4 at this point, 
	rep #$20
++
	plp
	ply
donefadeflag:
	ply
	plx
	pla
	rtl

;DO WE NEED TO LOAD A SPECIAL JOB?
replacejobs:
	php
	rep #$20
	pha
	lda !endingflag
	inc
	beq doending
	lda $0BCE; scene number
;first, flashbacks
	cmp #$0479
	beq checkmap1 ;galuf flashback
	cmp #$00f4
	beq checkmap1 ;galuf flashback
	cmp #$0529
	beq checkmap1 ;lenna flashback (phoenix tower)
	cmp #$0529
	beq checkmap1 ;lenna flashback (phoenix tower2)
	bra dodresscode

checkmap1:
	lda $110c
	cmp #$0109			;galuf 1
	beq grayhair 
	cmp #$0079			;galuf 2
	beq skipdresscode 
	cmp #$004d			;lenna
	beq skipdresscode 
	cmp #$0058			;lenna
	beq skipdresscode
	cmp #$0121			;galuf 1
	beq skipdresscode 
	bra dodresscode
skipdresscode:
;load regular freelancer sprites then
	lda #$FFFF
-
	sta !currentjobs
	sta !currentjobs+2
	lda #$0000
dodresscode:
	pla
	plp
	rts

grayhair:
	lda #$1616
	bra -

;lenna on the balcony when castle attacked
;scene 2301
;map 4800

;ending in the castle: (turn off lenna)
;scene
;8407
;map
;4c00

;RECALL JOBS FROM WRAM FOR ENDING
;check pointerid, default code if doesn't match
;if does match then get from wram jobslist. 
;bit #$80 needs to be checked and filtered off. if bit80 isn't set then this isn't a valid saved job
doending:
	pha
	phx
	ldx #$0000
-
	lda.l pointerID,x
	beq +				;exit if finished checking
	cmp $0BD6 			;(current event pointer)
	beq ++ ;it's our event
	inx
	inx
	bra -
+
	lda !endingflag
	cmp #$1616
	bne +
	sta !currentjobs
	sta !currentjobs+2
+
	plx
	pla
	pla
	plp
	rts

++ ;our event was found, we can take our X value to tell how far in to our list we should load from...
;now we need to load the correct job numbers in the correct order... 
;gotta add in the character number here, then load from another table which index through the saved jobs we need.
	pha
	lda.l pointerchain,x
	tax 
	lda #$0000
	sep #$20
	lda.l loadtable+1,x ;krile in party byte
	sta !tempram_krileflag
	lda.l loadtable,x ;index for this cutscene.
	cmp #$7E
	bcc ++ ;under this num is normal loads
	bne +
	lda #$17 ;formal
	bra floodfillslots
+ ;7f

	lda #$FF ;freelancer (vanilla palette)
	bra floodfillslots
	-
	lda #$16
	bra floodfillslots
++
	tax
	lda !job_log_live,x
	bpl - ;no high bit ($80) set
	and #$7f ;filter off high bit
	sta !currentjobs ;live jobs replace.
	inx

	lda !job_log_live,x
	and #$7f ;filter off high bit
	sta !currentjobs+1 ;live jobs replace.
	inx

	lda !job_log_live,x
	and #$7f ;filter off high bit
	sta !currentjobs+2 ;live jobs replace.
	inx

	lda !job_log_live,x
	and #$7f ;filter off high bit
	sta !currentjobs+3 ;live jobs replace.
-
	rep #$20
	pla
	plx
	pla
	pla
	plp
	rts


floodfillslots:
	sta !currentjobs
	sta !currentjobs+1
	sta !currentjobs+2
	sta !currentjobs+3
	bra -

pointerID:
;BARTZ
dw $CFEB,$D00B,$D021,$D05C
;LENNA
dw $D0A9,$D0DE,$D0FF,$D11D
;FARIS
dw $D170,$D1C5,$D205,$D220,$D23F
;KRILE
dw $D251,$D276,$D27F,$D28F,$D2EA,$D30A
;GALUF 
dw $2ABF,$2AD7,$2AE3,$2B10,$2B6F
;void
dw $ECF1,$f323,$118d,$148d,$F342,$f36a,$f392
;done
dw $0000

pointerchain:
dw $0000,$0000,$0002,$0004 ;bartz
dw $0006,$0008,$0008,$000A ;lenna
dw $000C,$000E,$0010,$0010,$0012 ;faris
dw $0012,$0014,$0014,$0016,$0016,$0012 ;krile
dw $0018,$0018,$001A,$001C,$001C ;galuf
dw $001E,$001E,$001E,$001E,$001E,$001E,$001E ;copy existing.

loadtable:
db $00,$02 ;Bartz 1 Bartz, Lenna Faris and Krile
db $04,$00 ;Bartz 2 BLGF
db $08,$00 ;Bartz 3 BLGF
db $0C,$00 ;Lenna 1 BLGF
db $10,$00 ;Lenna 2 BLGF
db $14,$00 ;Lenna 3 LF
db $7E,$02 ;Faris 1 (all formal wear) BLFK
db $18,$00 ;Faris 2 BLGF
db $1C,$00 ;Faris 3 BGF
db $7F,$02 ;Krile 1 (always freelancer) K
db $20,$02 ;Krile 2 BK
db $24,$00 ;Krile 3 BLGFK (but K is freelancer)
db $28,$00 ;Galuf 1 BLGF
db $2C,$00 ;Galuf 2 GK (K freelancer)
db $30,$00 ;Galuf 3 BLGFK (K freelancer)
db $34,$02 ;load normal jobs (w/krile)

save:
;which slot is in $016f
	phy
	lda $016f
	asl
	tax
	lda.l saveslot_table,x
	tay
	ldx #$7b40
	lda #$003F
	phb
	mvn $20,$20
	plb
	ldx #$0500 ; native code
	lda #$05ff ;/
	ply
	rtl

load:
	phx
	lda $016f
	asl
	tax
	lda.l saveslot_table,x
	tax
	ldy #$7b40
	lda #$003F
	phb
	mvn $20,$20
	plb
	ldy #$0500
	lda #$05ff
	plx
	pha
	lda !live_CB01
	cmp #$CB01
	beq +
	jsr clearRAM
+
	pla
	rtl

saveslot_table:
dw $6600,$6D00,$7400,$7B00

;Includes: This is where you can customize which sprite file is being loaded for what job.
pushpc
org !bank1
;Knight / job 00
incbin ./inj/P_knight.bin
incbin ./inj/L_knight.bin
incbin ./inj/G_knight.bin
incbin ./inj/F_knight.bin
incbin ./inj/K_knight.bin
;Monk / job 01
incbin ./inj/P_monk.bin
incbin ./inj/L_monk.bin
incbin ./inj/G_monk.bin
incbin ./inj/F_monk.bin
incbin ./inj/K_monk.bin
;Thief / job 02
incbin ./inj/P_drk.bin
incbin ./inj/L_drk.bin
incbin ./inj/G_drk.bin
incbin ./inj/F_drk.bin
incbin ./inj/K_drk.bin
;Dragoon / job 03
incbin ./inj/P_dragoon.bin
incbin ./inj/L_dragoon.bin
incbin ./inj/G_dragoon.bin
incbin ./inj/F_dragoon.bin
incbin ./inj/K_dragoon.bin
;Ninja / job 04
incbin ./inj/P_ninja.bin
incbin ./inj/L_ninja.bin
incbin ./inj/G_ninja.bin
incbin ./inj/F_ninja.bin
incbin ./inj/K_ninja.bin
;Samurai / job 05
incbin ./inj/P_samurai.bin
incbin ./inj/L_samurai.bin
incbin ./inj/G_samurai.bin
incbin ./inj/F_samurai.bin
incbin ./inj/K_samurai.bin
org !bank2
;Berserker / job 06
incbin ./inj/P_astrologer.bin
incbin ./inj/L_astrologer.bin
incbin ./inj/G_astrologer.bin
incbin ./inj/F_astrologer.bin
incbin ./inj/K_astrologer.bin
;Ranger / job 07
incbin ./inj/P_ranger.bin
incbin ./inj/L_ranger.bin
incbin ./inj/G_ranger.bin
incbin ./inj/F_ranger.bin
incbin ./inj/K_ranger.bin
;Mystic / job 08
incbin ./inj/P_viking.bin
incbin ./inj/L_viking.bin
incbin ./inj/G_viking.bin
incbin ./inj/F_viking.bin
incbin ./inj/K_viking.bin
;White mage / job 09
incbin ./inj/P_white.bin
incbin ./inj/L_white.bin
incbin ./inj/G_white.bin
incbin ./inj/F_white.bin
incbin ./inj/K_white.bin
;Black mage / job 10/$0A
incbin ./inj/P_black.bin
incbin ./inj/L_black.bin
incbin ./inj/G_black.bin
incbin ./inj/F_black.bin
incbin ./inj/K_black.bin
;Time mage / job 11/$0B
incbin ./inj/P_time.bin
incbin ./inj/L_time.bin
incbin ./inj/G_time.bin
incbin ./inj/F_time.bin
incbin ./inj/K_time.bin
org !bank3
;Summoner / job 12/0C
incbin ./inj/P_summoner.bin
incbin ./inj/L_summoner.bin
incbin ./inj/G_summoner.bin
incbin ./inj/F_summoner.bin
incbin ./inj/K_summoner.bin
;Blue mage / job 13/$0D
incbin ./inj/P_psychic.bin
incbin ./inj/L_psychic.bin
incbin ./inj/G_psychic.bin
incbin ./inj/F_psychic.bin
incbin ./inj/K_psychic.bin
;Red mage / job 14/$0E
incbin ./inj/P_red.bin
incbin ./inj/L_red.bin
incbin ./inj/G_red.bin
incbin ./inj/F_red.bin
incbin ./inj/K_red.bin
;Beastmaster / job 15/$0F
incbin ./inj/P_moogle.bin
incbin ./inj/L_moogle.bin
incbin ./inj/G_moogle.bin
incbin ./inj/F_moogle.bin
incbin ./inj/K_moogle.bin
;Chemist / job 16/$10
incbin ./inj/P_alchemist.bin
incbin ./inj/L_alchemist.bin
incbin ./inj/G_alchemist.bin
incbin ./inj/F_alchemist.bin
incbin ./inj/K_alchemist.bin
;Geomancer / job 17/$11
incbin ./inj/P_imitator.bin
incbin ./inj/L_imitator.bin
incbin ./inj/G_imitator.bin
incbin ./inj/F_imitator.bin
incbin ./inj/K_imitator.bin
;modified palette moogle (outdoors)
mod_moogle:
incbin ./inj/A_moogle.bin
;modified moogle (indoors)
org $DA8400
incbin ./inj/A_moogle_v.bin

org !bank4
;Bard / job 18/$12
incbin ./inj/P_minstrel.bin
incbin ./inj/L_minstrel.bin
incbin ./inj/G_minstrel.bin
incbin ./inj/F_minstrel.bin
incbin ./inj/K_minstrel.bin
;Dancer / job 19/$13
incbin ./inj/P_shaman.bin
incbin ./inj/L_shaman.bin
incbin ./inj/G_shaman.bin
incbin ./inj/F_shaman.bin
incbin ./inj/K_shaman.bin
;Mime / job 20/$14
incbin ./inj/P_holy.bin
incbin ./inj/L_holy.bin
incbin ./inj/G_mime.bin
incbin ./inj/F_holy.bin
incbin ./inj/K_holy.bin
;freelancer
incbin ./inj/P_free.bin
incbin ./inj/L_free.bin
incbin ./inj/G_free.bin
incbin ./inj/F_free.bin
incbin ./inj/K_free.bin
;special sprites
;freelancer "vanilla" style
incbin ./inj/P_vanilla.bin
incbin ./inj/L_vanilla.bin
incbin ./inj/G_vanilla.bin
incbin ./inj/F_vanilla.bin
incbin ./inj/K_vanilla.bin
;formal attire
incbin ./inj/P_formal.bin
incbin ./inj/L_formal.bin
incbin ./inj/G_formal.bin
incbin ./inj/F_formal.bin
incbin ./inj/K_formal.bin
;mini
miniloc:
incbin ./inj/A_mini.bin
;toad
toadloc:
incbin ./inj/A_toad.bin

org $db2800
tiedloc:
incbin ./inj/IC_tied.bin
org $dad000
incbin ./inj/A_npcfrog.bin

org $14fe80
;vanillapalette
vanillapaletteloc:
incbin ./inj/P_vanilla.pal
incbin ./inj/L_vanilla.pal
incbin ./inj/G_vanilla.pal
incbin ./inj/F_vanilla.pal
incbin ./inj/K_vanilla.pal
;formal
formalpaletteloc:
incbin ./inj/P_formal.pal
incbin ./inj/L_formal.pal
incbin ./inj/G_formal.pal
incbin ./inj/F_formal.pal
incbin ./inj/K_formal.pal

org $138000
incbin ./inj/G_mime_B.bin ;mime battle sprites
org $14abc0
incbin ./inj/G_mime.pal


pullpc 

restorepalette:
	lda #$01
	sta $a1
	lda $0b53 ;world map
	bne +;not world
	lda $0ada
	cmp #$07
	bcs ++
	lda #$3e
	sta $028B
	sta $028F
	lda #$0e
	sta $0293
	sta $0297
++
	jml WM_palette3
+
	lda $0ada
	cmp #$07
	bcs +
	phx
	ldx $06
	tax
	lda.l palettetable,x
	ora #$20
	sta $0313
	sta $0317
	sta $03F3
	sta $03f7
	plx
	
+
	rtl

disablemapmath:
	phx

	rep #$20
	pha
	ldx #$0000
-
	lda.l mapmodlist,x ;map
	beq donemapmath
	cmp $0ad4
	beq + ;found it
	inx #2
	bra -
+
	pla
	sep #$20
	plx
	lda $c05bb8,x
	and #%11101111
	rtl

donemapmath:
	pla
	sep #$20
	plx
	lda $c05bb8,x
	rtl

;eventfadein:
;	phx
;	jsr replacejobs
;	jsl copypalettesfadein
;	plx
;	lda $DF
;	sta $43
;	rtl

fieldpalette:
	cpx #$0002
	bcc toadminipalette
	cpx #$0007
	bcc partypalette
	ora $c0256c,x
	and #$F7 ;filter off "high" bit of palette, constrain to 0-3.
	rtl

partypalette:
	pha
	lda !currentjobs
	and #%10011111
	bmi skippartypalette
	lda $0ada
	cmp #$06
	bne +
	lda !tempram_krileflag
	beq skippartypalette
+
	pla
	ora.l palettetable,x
	ora $c0256c,x
	rtl

toadminipalette:
	ora $c0256c,x
	rtl

skippartypalette:
	lda !endingflag
	beq +
	rep #$20
	lda $0AD4
	cmp #$0105
	bne +
	lda #$28D0
	sta $14A9
	sta $14AB
	lda $06
	sep #$20
	pla
	ora $c0256c,x
	rtl
	+
	sep #$20
	lda $06
	pla
	ora $c0256c,x
	AND #$F7
	rtl

palettetable:
db $00,$0E,$08,$0A,$0C,$0E,$0C

mapspritepalette:
	lda $ce59c2,x ;sprite ID
	cmp #$4d ;party sprites low end
	bcc +
	cmp #$52 ;party sprites high end
	bcs +
	phx
	sec
	sbc #$4b
	pha
	phx
	tax
	lda !currentjobs
	AND #%10011111
	bmi skipmapspritepalette
	plx
	pla
	cmp #$04
	bne ++
	pha
	lda !tempram_krileflag
	bne +++
	pla
	bra ++
++
	cmp #$06
	bne ++
	pha
	lda !tempram_krileflag
	beq +++
	pla
	bra ++
+++
	pla
	plx
	bra +
++
	tax 
	lda.l mapspritepl_index,x
	plx
	bra ++
+
	lda $ce59c6,x
	rtl
++
	rtl

skipmapspritepalette:
	plx
	pla
	plx
	lda $ce59c6,x
	rtl

mapspritepl_index:
db $00,$00,$04,$05,$06,$07,$06
;======================================
copy03_47:
	pla
	php
	lda $0b53
	beq +
	rep #$30
	ldx #$0d00 ;is where FROM we are transferring
	ldy #$0D80 ;on top of palette 4
	lda #$007f ;transfer $20 bytes
	phb
	mvn $00,$00 
	plb
	rep #$20
	inc
+
	plp
	plp
	rtl

copypalettes:
	lda $4a
	sta $49
copypalettes2:
	lda #$00
	sta !statusflags
	sta !statusflags+1
	sta !statusflags+2
	sta !statusflags+3
copypalettesfadein:
	lda $0b53 ;world map
	beq ++
	lda !currentjobs
	cmp #$FF
	beq ++
	lda #$00
+
	php
	rep #$30
	pha
	lda $0ad4
	cmp #$00DD
	beq copy03_47
	pla
paletteloop: 
	clc
	sta !tempram_char
	lsr
	tax
-
	lda.l !currentjobs,x ;which job for this character (in x. valid 0-3)
	pha
	txa
	asl
	tax
	pla
	and #%0000000000011111
	cmp #$0016
	bcs dospecial
	clc
	asl #5 ;(palettes are $20 bytes each, this is $20 times the job value.)
;now to add to the characters' base...
	sta !tempram_char ;how many bytes through the list of jobs to load
	cpx #$0004 ;on galuf's turn....
	bne +
	lda.l !tempram_krileflag ;is krile in the party?
	AND #$00FF
	beq +
	ldx #$0008 ;krile's palettes.
+
	lda.l palettebase,x ;the start point of each characters' set of palettes.
	clc
	adc !tempram_char ;how far through to load.
--
	cpx #$0008
	bne + ;is krile
	ldx #$0004 ;galuf's palette slot.
+
	phx ;save it.
	tax ;X is where FROM we are transferring
	pla ;put it back into A
;so now in a... destination slot x2. each slot is $20 large, so we need to 	asl 4 times.
	pha
	asl #4
	clc
	adc #$0D80 ;slot0
	tay ;transfer into the destination.
	lda #$001F ;transfer $20 bytes
	phb
	mvn $00,$14 ;from bank 14 INTO 7E
	plb
	inc
	pla
	cmp #$0006 ;faris is the end of this routine, unintuitively.
	beq donepalettecopy
	inc #2
	bra paletteloop
---
donepaletteloop:
	plp
	jsl statuspalette
++
	rtl

dospecial:
;check if formal or vanilla, get new palettes if so.
	cmp #$0016 ;vanilla
	bne ++
	cpx #$0004
	bne +
	lda.l !tempram_krileflag ;is krile in the party
	AND #$00FF
	beq +
	ldx #$0008 ;krile's palettes.
+
	lda.l vanillapalettepointer,x ;the start point of each characters' set of palettes.
	bra --

++
	cmp #$0017 ;formal
	cpx #$0004
	bne +
	lda.l !tempram_krileflag ;is krile in the party
	AND #$00FF
	beq +
	ldx #$0008 ;krile's palettes.
+
	lda.l formalpalettepointer,x ;the start point of each characters' set of palettes.
	bra --

donepalettecopy:
    bra ---

palettebase:
dw $a3c0,$a680,$a940,$ac00,$aec0
vanillapalettepointer:
dw vanillapaletteloc,vanillapaletteloc+32,vanillapaletteloc+64,vanillapaletteloc+96,vanillapaletteloc+128
formalpalettepointer:
dw formalpaletteloc,formalpaletteloc+32,formalpaletteloc+64,formalpaletteloc+96,formalpaletteloc+128

worldpalette:
	lda $C02A98,X
	jsr worldpalettereal
	rtl

worldpalette2:
	LDA $C02A9C,X
	jsr worldpalettereal
	rtl

worldpalette3:
	LDA $C02AA0,X
	jsr worldpalettereal
	rtl

worldpalette4:
	LDA $C02AA4,X
	jsr worldpalettereal
	rtl

worldpalettereal:
	pha
	lda $0b53
	bne +
	lda $0adc
	bne +
	lda $0ada
	cmp #$07
	bcs + ;not valid
	pla
	ORA #$0E
	rts
+
	pla
	rts

WM_palette2:
	phy
	phx
	pha
	php
	jsr indexchars
	jsr replacejobs
	plp
	pla
	plx
	ply
WM_palette:
	stz $53
	stz $169a
WM_palette3:
	php
	sep #$20
	lda $0ADA
	cmp #$07
	bcs ++
	dec
	dec
	tax
	lda #$FF
	sta !statusflags,x
	rep #$30
	lda !tempram_krileflag
	beq +
	cpx #$0004
	bne +
	ldx #$0002
+
	lda.l !currentjobs,x

	pha
	txa
	asl
	tax
	pla
	AND #%0000000000011111
	cmp #$0016
	bcs dospecialworld
	clc
	asl #5 ;(palettes are $20 bytes each, this is $20 times the job value.)
	sta !tempram_char ;how many bytes through the list of jobs to load
	cpx #$0004 ;on galuf's turn....
	bne +
	lda.l !tempram_krileflag ;is krile in the party?
	AND #$00FF
	beq +
	ldx #$0008 ;krile's palettes.
+
	lda.l palettebase,x ;the start point of each characters' set of palettes.
	clc
	adc !tempram_char ;how far through to load.
--
	tax ;X is where FROM we are transferring
	ldy #$0DE0
	lda #$001F ;transfer $20 bytes
	phb
	mvn $00,$14 ;from bank 14 INTO 7E
	plb
	rep #$20
	inc
++
	plp
-
	bra worldstatus2
	rtl

dospecialworld:
;check if formal or vanilla, get new palettes if so.
	cmp #$0016 ;vanilla
	bne ++
	cpx #$0004
	bne +
	lda.l !tempram_krileflag ;is krile in the party
	AND #$00FF
	beq +
	ldx #$0008 ;krile's palettes.
+
	lda.l vanillapalettepointer,x ;the start point of each characters' set of palettes.
	bra --

++
	cmp #$0017 ;formal
	cpx #$0004
	bne +
	lda.l !tempram_krileflag ;is krile in the party
	AND #$00FF
	beq +
	ldx #$0008 ;krile's palettes.
+
	lda.l vanillapalettepointer,x ;the start point of each characters' set of palettes.
	bra --

pushpc
org $c01cfe ;setfrog
nop #3
org $c01d0a ;setmini
nop #3

pullpc
worldstatus2:
	pha
	php
worldstatus:
	php
	sep #$30
	ldx #$00
	ldy #$00
-
	lda $500,y
	and #$07
	inc #2
	cmp $0ada
	beq charfound_w
	tya
	clc
	adc #$50
	bcc +
	brl leaveworldstatus
+
	tay
	bra -
charfound_w:
	dec #2
	tax
	lda $051a,y
	and #%01000110 ;petrify, poison, zombie. 40, 04, 02
	cmp !statusflags,x
	bne ++
	brl leaveworldstatus
++
	cmp #$00
	beq restore_w
	cmp #$40 ;petrify is most significant
	bcs petrify_w
	and #%00000010
	bne zombie_w
poison_w:;bra poison_w
	rep #$20
	lda #$4dd3
	sta $0dF0
	lda #$7edb
	sta $0dE8
	brl leaveworldstatus
zombie_w:
	rep #$20
	lda #$3210
	sta $0dF0
	lda #$3AF5
	sta $0dE8
	lda #$7fff
	sta $0dE6
brl leaveworldstatus
petrify_w:
	rep #$30
	phx
	phy
	ldy #$0dE0
	ldx #$f807 ;is where FROM we are transferring
	lda #$001F ;transfer $20 bytes
	phb
	mvn $00,$C0
	plb
	inc
	ply
	plx
	brl leaveworldstatus

restore_w:
	php
	rep #$30
	phx
	cpx #$0004
	bne +
	ldx #$0002
+
	phy
	lda.l !currentjobs,x
	pha
	txa
	asl
	tax
	pla
	and #%0000000000011111
	cmp #$0016
	bcs dospecial_w
	clc
	asl #5 ;(palettes are $20 bytes each, this is $20 times the job value.)
	sta !tempram_char ;how many bytes through the list of jobs to load
	cpx #$0004 ;on galuf's turn....
	bne +
	lda.l !tempram_krileflag ;is krile in the party?
	beq +
	ldx #$0008 ;krile's palettes.
+
	lda.l palettebase,x ;the start point of each characters' set of palettes.
	clc
	adc !tempram_char ;how far through to load.
--
	cpx #$0008
	bne + ;is krile
	ldx #$0004 ;galuf's palette slot.
+
	phx ;save it.
	tax ;X is where FROM we are transferring
	pla ;put it back into A
;so now in a... destination slot x2. each slot is $20 large, so we need to asl 4 times.
	pha
	ldy #$0DE0 ;slot4
	lda #$001F ;transfer $20 bytes
	phb
	mvn $00,$14 ;from bank 14 INTO 7E
	plb
	pla
	rep #$30
	ply
	plx
	plp
	brl leaveworldstatus

dospecial_w:
;check if formal or vanilla, get new palettes if so.
	cmp #$0016 ;vanilla
	bne ++
	cpx #$0004
	bne +
	lda.l !tempram_krileflag ;is krile in the party
	AND #$00FF
	beq +
	ldx #$0008 ;krile's palettes.
+
	lda.l vanillapalettepointer,x ;the start point of each characters' set of palettes.
	bra --

++
	cmp #$0017 ;formal
	cpx #$0004
	bne +
	lda.l !tempram_krileflag ;is krile in the party
	AND #$00FF
	beq +
	ldx #$0008 ;krile's palettes.
+
	lda.l formalpalettepointer,x ;the start point of each characters' set of palettes.
	bra --

leaveworldstatus:
	sep #$20
	lda $51A,y
	and #%01000110
	sta !statusflags,x
	plp
	bra +

statuspalette1:
	lda $02
	and #$40
	pha
	php
	lda $0b53 ;world map
	bne ++ 
	brl worldstatus
++
	lda $0A16
	bpl ++
	lda $0842
	AND	#$FE
	sta $0842
++
	jsl statuspalette
+
	plp
	pla
	rtl
statuspalette2:
	lda !endingflag
	cmp #$FF
	beq +
	jsl statuspalette
	+
	lda $be
	and #$7f
	rtl
statuspalette3:
	jsl statuspalette
	lda $02
	and #$cf
	rtl
-
	pla
	rtl

statuspalette:
	pha
	lda !endingflag
	cmp #$FF
	bne +
	brl	donestatus2
+
	lda $1f03
	cmp #$c3
	beq -
	cmp #$7f
	beq -
; brl donestatus2
+
	pla
	phx
	phy
	pha
	php
	sep #$30
	ldx #$00
	ldy #$00
--
	lda $500,y
	and #$07
	tax
	lda $51A,y
	bmi nextchar
	and #%01000110 ;petrify, poison, zombie. 40, 04, 02  
	cmp !statusflags,x
	beq nextchar
;flags dont match, process new status
	and #%01000000 ;petrify
	beq notpetrify
	cmp !statusflags,x
	beq nextchar ;already done the most significant (zombie) and don't do poison/zombie
	brl dopetrify
 
notpetrify:
	lda $51A,y
	and #%00000010 ;zombie
	beq chkpoison
	cpx #$04
	bne +
	ldx #$02
+
	txa
	asl #5 ;multiply by $20 (palette size)
	tax
	rep #$20
	lda #$3210
	sta $0d90,x
	lda #$3AF5
	sta $0d88,x
	lda #$7fff
	sta $0d86,x
	txa
	lsr #5
	tax
	sep #$20
	lda $51A,y
	and #%01000110 ;petrify, poison, zombie. 40, 04, 02
	sta !statusflags,x

nextchar:
	lda $51a,y
	and #%01000110 ;petrify, poison, zombie. 40, 04, 02
	sta !statusflags,x
	inx
	tya
	clc
	adc #$50
	bcs donestatus
	tay
	bra --

;these slots are #$20 apart... but the same otherwise.
;0d86,x 0d88,x 0d90,x

chkpoison:
	lda $51A,y
	and #%00000100 ;poison
	bne +
	lda $51a,y
	and #%01000110
	cmp !statusflags,x
	beq nextchar
	bra restorepal
+
	cpx #$04
	bne +
	ldx #$02
+
	txa
	asl #5 ;multiply by $20 (palette size)
	tax
	rep #$20
	lda #$4dd3
	sta $0d90,x
	lda #$7edb
	sta $0d88,x
	txa
	lsr #5
	tax
	sep #$20
	lda $51A,y
	and #%01000110 ;petrify, poison, zombie. 40, 04, 02
	sta !statusflags,x
	bra nextchar

dopetrify:
	php
	rep #$30
	phx
	phy
	txa
	asl #5
	clc
	adc #$d80
	tay ;this is the destination of the transfer.
petrifyworldmap:
	ldx #$f807 ;is where FROM we are transferring
	lda #$001F ;transfer $20 bytes
	phb
	mvn $00,$C0
	inc
	plb
	ply
	plx
	plp
	brl nextchar
donestatus2:
	pla
	rtl
donestatus:
	plp
	pla
	ply
	plx
	rtl
-
pla
plp
rtl

restorepal:
	php
	rep #$30
	pha
	lda !endingflag
	cmp #$FFFF
	beq -
	pla
	lda $0b53
	beq ++
	phx
	cpx #$0004
	bne +
	ldx #$0002
+
	phy
	lda.l !currentjobs,x ;which job for this character (in x. valid 0-3)
	pha
	txa
	asl ;2 byte x
	tax
	pla
	and #%0000000000011111
	cmp #$0016
	bcs dospecialrestore
	clc
	asl #5 ;(palettes are $20 bytes each, this is $20 times the job value.)
	sta !tempram_char ;how many bytes through the list of jobs to load
	cpx #$0004 ;on galuf's turn....
	bne +
	lda.l !tempram_krileflag ;is krile in the party?
	beq +
	ldx #$0008 ;krile's palettes.
+
	lda.l palettebase,x ;the start point of each characters' set of palettes.
	clc
	adc !tempram_char ;how far through to load.
--
	cpx #$0008
	bne + ;is krile
	ldx #$0004 ;galuf's palette slot.
+
	phx ;save it.
	tax ;X is where FROM we are transferring
	pla ;put it back into A
;so now in a... destination slot x2. each slot is $20 large, so we need to asl 4 times.
	pha
	asl #4
	clc
	adc #$0D80 ;slot0
	tay ;transfer into the destination.
	lda #$001F ;transfer $20 bytes
	phb
	mvn $00,$14 ;from bank 14 INTO 7E
	plb
	pla
	rep #$30
	ply
	plx
++
	plp
	brl nextchar

dospecialrestore:
;check if formal or vanilla, get new palettes if so.
	cmp #$0016 ;vanilla
	bne ++
	cpx #$0004
	bne +
	lda.l !tempram_krileflag ;is krile in the party
	AND #$00FF
	beq +
	ldx #$0008 ;krile's palettes.
+
	lda.l vanillapalettepointer,x ;the start point of each characters' set of palettes.
	bra --

++
	cmp #$0017 ;formal
	cpx #$0004
	bne +
	lda.l !tempram_krileflag ;is krile in the party
	AND #$00FF
	beq +
	ldx #$0008 ;krile's palettes.
+
	lda.l formalpalettepointer,x ;the start point of each characters' set of palettes.
	bra --

forcebartzlead2:
	sep #$20
	lda #$02
	sta $0ADA
	inc $0ba1 ;reload leader
	plp
	rts
	
mapleaderpalettefix:
	php
	rep #$30
	lda $0AD4
	cmp #$0173
	beq forcebartzlead2
+
	phx
	phy
	ldx $06
	
-
	lda.l maplist,x
	beq mapnotfound
	cmp $0ad4
	beq mapfound
	inx #2
	bra -

mapfound:
	lda.l loclist,x
	tay
	sep #$20
	lda $0ada ;leader
	dec #2 ;no mini/toad
	tax
	lda.l pallist,x
	ora $1482,y
	sta $1482,y
	sta $1484,y

mapnotfound:
-
	ply
	plx
	plp
	rts

ghidocavefix:
	sta $59
	rep #$20
	lda $0ad4
	cmp #$015c
	beq +
	lda #$0001
	sep #$20
	sta $c3
	rtl
+
	lda #$0001
	sep #$20
	rtl
	
org $FAF500
tornafix:
 php
 rep #$20
 pha
 lda $0AD4
 cmp #$0028
 bne +
 lda $0b53
 beq +
 sep #$20
 lda #$09
 sta $0ada
 +
 rep #$20
 pla
 plp
 lda $0ada
 cmp #$09
 rtl

bridgecheck:
	phx
	lda !endingflag
	cmp #$FF
	beq ++
	ldx #$0000
-
	lda.l bridgemap,x
	beq donebridgecheck
	cmp $0ad4 ;map
	beq foundbridgemap
	inx #2
	bra -	

foundbridgemap:
	lda $06 ;zero
	sep #$20
	lda $10fa ;"height"
	and #$03
	cmp #$01
	bne underwater
	lda $48
	and #$EF
	sta $48
	bra donebridgecheck
underwater:
	lda $48
	ora #$10
	sta $48
donebridgecheck:	
	sep #$20
++
	plx
skipbridge:
	LDA $10fa
	AND #$03
	CMP #$03
	beq skipset
	jml $c01210
skipset:
	jml $c01212
	

-
	pla
	plp
	lda $49
	sta $212d
	rtl
	

layering:
	php
	rep #$20
	pha
	lda !endingflag
	cmp #$FFFF
	beq -
	pla
	plp
	phx
	php
	rep #$30
	ldx #$0000
-
	lda.l layertable,x
	beq +
	cmp $0ad4 ;map
	beq foundlayer
	inx #2
	bra -

foundlayer:
	sep #$20
	lda #$EF
	and $49
	sta $49
+
	lda $06
	xba
	lda $06
	plp
	plx
	lda $49
	sta $212d
	rtl


clearformalflag:
lda $06
sta !tempram_formal
ldx $0af5
stx $0ad6
rtl

moatclear:
	php
	phx
	rep #$30
	lda !endingflag
	cmp #$FFFF
	beq ++
	lda $0AD4
	cmp #$0109
	bne ++
	lda $0ad8
	cmp #$3214
	bne ++
	ldx #$0000
-
	stz $1803,x
	stz $1843,x
	inx #2
	cpx #$001a
	bcc -
++
	plx
	plp
+
	lda $27
	sta $80,x
	rtl

;which maps to turn OAM color math off on
mapmodlist:
dw $0015,$0016,$0033,$005b,$0062,$0076,$004E,$0069,$000f,$0168,$00ff,$017a,$01a6,$01a8,$01ab

dw $00e0 ;exdeath mirror cutscene
dw $00bf ;black chocobo forest
;done
dw $0000

;correcting maps with water you go in and overtop of (bridge)
bridgemap:
dw $0059,$0103,$0109,$015c,$01a7
;done
dw $0000

;correcting layer issues
layertable:
dw $004e
;done
dw $0000

;correcting "default" palette leaders
maplist:
dw $002B,$00CF,$00D0,$00D1,$009B,$009a,$00C2,$0103,$015A,$015C,$0166,$0182,$017A,$0190,$0181
;done
dw $0000

loclist: ;which "slot" the npc leader is in. +$1482, $1484
dw $00F0,$0000,$0000,$0000,$0000,$0000,$0000,$0064,$0000,$0050,$003c,$003c,$008c,$0000,$0000

pallist:
db $08,$0a,$0c,$0e,$0c

updatepalette:
	php
	rep #$30
	phx
	phy
	pha
	lda !endingflag
	beq +
	phb
	lda !job_log_live+69 ;source
	tax
	lda !job_log_live+71 ;destination
	tay
	lda #$001f
	mvn $00,$14 ;from bank 14 INTO 7E
	plb
+
	pla
	ply
	plx
	plp
	rtl

org $c0c906
	ora #$08

;npc palettes fixes
org $ce6228 ;wind crystal shrine "bartz"
db $04
org $ce622F ;wind crystal shrine "energy"
db $19
org $ce6236 ;wind crystal shrine "king"
db $58
org $CE9B5C ;ending cutscene galuf
db $40		
org $ce6562 ;world map ship graveyard
db $42
org $ce72e4 ;queen karnak in inn
db $80 
org $ce787f ;black choco 1
db $40
org $ce78a9 ;black choco 2
db $00
org $ce7886 ;black choco 3
db $40
org $ce7886 ;black choco 4
db $40
org $ce6d7a ;black choco 5 (tycoon meteor)
db $20
org $ce6d73 ;black choco 6 (tycoon meteor)
db $18
org $ce6cfc ;black choco 7 (walse meteor)
db $20
org $ce6cf5 ;black choco 8 (walse meteor)
db $18
org $ce6e22 ;black choco 9 (karnak meteor)
db $18
org $ce6e29 ;black choco 10 (karnak meteor)
db $20
org $ce6e84 ;black choco 11 (ruins meteor)
db $18
org $ce6e8b ;black choco 12 (ruins meteor)
db $20
org $ce789b ;choco forest cid
db $20
org $ce78a2 ;choco forest mid
db $61
org $ce7cc3 ;earth crystal bartz
db $44
org $ce7e28 ;world2 tent cutscene bartz
db $44
org $ce67c3 ;frog carwen
db $07
org $ce67ca ;frog2 carwen
db $07
org $ce59c6 ;frog istory
db $47
org $ce7e59 ;exdeath
db $58
org $ce881c ;dragon grass
db $20
org $ce8823 ; '
db $40
org $ce882a ; '
db $60
org $ce8831 ;dragon grass
db $00
org $ce6ae8
db $44
org $ce8c36
db $44 ;cutscene bartz (w2 ship fleet)
org $ce8f93
db $40 ;ghido underwater
org $ce5ec4
db $20 ;chocobo forest w2
org $ce9398 
db $1c ;antlion cave
org $ce8f2a
db $44 ;ghido cave w3
org $ce9455
db $5c
org $ce59c6
db $58 ;exdeath guardian tree w3
org $ce9279
db $58 ;xdeaf guard tree w3
org $ce9280
db $58 ;melusine guardian tree
org $ce8a3e
db $43
org $ce78d3 ;cid world3 airship
db $18
org $ce78da ;cid world3 airship
db $38
org $ce7ab6
db $44 ;bartz airship upgrade cutscene.
org $ce6bb3
db $01 ;dorgann void 1
org $ce6bd6
db $04 ;bartz void 1
org $ce6b9e
db $00 ;galuf void 1
org $ce6ba5
db $00 ;kelger void 1
org $ce6bac
db $01 ;xezat void 1
org $ce66b9
db $00
org $ce78b0 ;chocobo forest question mark
db $40

;leviathan fixes
org $c0c8f8
nop #2
org $c0c906
nop #2
org $ce96b6
db $43 ;levi
org $ce96bd
db $63 ;levi
org $ce96c4
db $03 ;levi
org $ce96cb
db $23 ;levi
org $ce96d2
db $43 ;levi
org $ce96d9
db $63 ;levi

;pirate ship tied bartz, galuf, lenna
org $ce60ed ;bartz
db $04
org $ce60f4 ;lenna
db $25
org $ce60fb ;galuf
db $46
org $ce64dd ;bartz (topside)
db $04
org $ce64e4 ;galuf topside
db $46
org $ce64eb ;lenna topside
db $25

;moogle sprite changes
org $ce8115
db $1D
org $ce82ff
db $05
org $ce8306
db $65
org $ce830d
db $45
org $ce8314
db $25
org $ce831b
db $65
org $ce8322
db $45
org $ce8329
db $45
org $ce8330
db $05
org $ce8337
db $65
org $ce833e
db $45
org $ce8345
db $45
org $ce834c
db $45
org $ce82ff
db $05
org $ce8306
db $65
org $ce8353
db $00
org $ce82e3
db $40

;ad4 = 00fd
;moogle sprite change to custom "lenna" moogle
;moogle palette change to "lenna" palette
;lenna black mage palette mod:
org $14a7c8
dw $533f
org $14a7d0 ;adds the skin tones back in, the black ones arent used.
dw $2ddf

;event script modification
org $c86e17 ;lenna unpoison (make earlier)
db $BA,$01,$FB,$CD,$88,$03,$C8,$83,$81

;eof