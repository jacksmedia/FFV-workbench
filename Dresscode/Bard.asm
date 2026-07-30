hirom

; FREE SPACE USED
songStatBonus         = $E066D0
setMaxSongBonus       = $E06750
checkRemoveSingStatus = $E067A0
getNextCharacter      = $E06740        
clearSongBits         = $E06790
removeSingStatus      = $E06800 

; VARIABLES USED
!songBonusAddress = $2074
!permanentStatus  = $201D
!songBeingSung    = $206F

!songBonusAmount  = #$05
!maxBonusAmount   = #$63


; Sing timer
org $C225AF  
LDA #$05 ; default: #$1E


; Songs stat increase mod & stop singing when max bonus reached
; $C2/2363 BD 74 20    LDA $2074,x
; $C2/2366 1A          INC A                
; $C2/2367 C9 64       CMP #$64
; $C2/2369 B0 03       BCS $236E
; $C2/236B 9D 74 20    STA $2074,x

org $C22363
{
	JSL songStatBonus
	NOP #7 

	org songStatBonus
	LDA !songBonusAddress,X 
	CLC
	ADC !songBonusAmount
	STA !songBonusAddress,X

	CMP !maxBonusAmount
	BCC endSongBonus ; if max stat, then stop singing
	{
		JSL setMaxSongBonus
		JSL checkRemoveSingStatus
	}
	
	endSongBonus:
	RTL


	org getNextCharacter ; Adds 0x80 to X without changing the value of A
	{
		PHA
		REP #$20
		CLC
		TXA
		ADC #$0080
		TAX
		TDC
		SEP #$20
		PLA
		RTL
	}

	org setMaxSongBonus
	{
		LDA !maxBonusAmount
		PHX

		STA !songBonusAddress,X ; Bartz bonus
		JSL getNextCharacter

		STA !songBonusAddress,X ; Lenna bonus
		JSL getNextCharacter

		STA !songBonusAddress,X ; Galuf bonus
		JSL getNextCharacter

		STA !songBonusAddress,X ; Ferris bonus
		
		PLX
		RTL
	}



	org clearSongBits
	{
		REP #$20
		TXA
		AND #$FFF8
		TAX
		SEP #$20
		RTL
	}


		org checkRemoveSingStatus
	{	
		PHX
		JSL clearSongBits
		LDA !permanentStatus,X
		CMP #$04                ; is Singing Bit
		BEQ singTypeCheck       ; continue if singing
		{
			PLX
			RTL
		}
		
		singTypeCheck:
		LDA !songBeingSung,X    ; Power song is default index

		checkSpeedSong:
		CMP #$40                ; Speed Song
		BNE checkMagicSong      ; if Speed Song, inc index
		INX
		
		checkMagicSong:
		CMP #$10                ; Magic Song
		BNE checkHeroSong       ; if Magic Song, inc index
		INX #3
		
		checkHeroSong:
		CMP #$08                ; Hero Song
		BNE afterHeroSong       ; if Hero Song, inc index
		INX #4
		
		afterHeroSong:
		LDA !songBonusAddress,X ; chooses index of specific song's bonus
		
		CMP !maxBonusAmount
		BCC endcheckRemoveSingStatus
		JSL removeSingStatus
		
		endcheckRemoveSingStatus:
		PLX                   
		RTL
	}

	org removeSingStatus
	{
		JSL clearSongBits
		LDA !permanentStatus,X
		EOR #$04                ; Clear Sing Status
		STA !permanentStatus,X
		STZ $206F,X             ; Remove song sung
		STZ $3CF9,X             ; Sing control flag

		REP #$20
		TXA
		LSR #7                  ; Divide by 0x80
		TAX
		LDA #$000B              ; Song index diff
		JSL $E04CA0             ; Multiply A by X
		TAX
		SEP #$20
		LDA #$01
		STA	$3CFB,X             ; Reset ATB gauge
		RTL
	}

}

; indexing data
; X: 0x80 per char
; bytes between atb: 0xB

; Relevant ram addresses
; 7E3CF9 P1 timer control flag sing? (value is 0x01 when singing)
; 7E3CFB P1 timer control flag (atb gauge)
; 7E3D7D P1 sing timer
; 7E3E01 P1 sing timer initial value
; 7E3E85 P1 Timer-related value (Sing)?



; (song being sung)
; 80 power
; 40 speed
; 10 magic
; 08 hero

; song status sets permant status 0x04, remove to stop
; $12 holds the index of the song bonus
; 00 power
; 01 speed
; 03 magic
; 04 hero



; bonus per tick   tick timer  ticks until max    time until max
; 10                30         10                 300
; 10                10         10                 100
; 05                02         20                 40
; 05                04         20                 80
; 05                10         20                 200
; 05                05         20                 100