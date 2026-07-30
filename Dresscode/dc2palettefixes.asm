
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
