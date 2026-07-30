;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RoSoDude's ATB menu improvement
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; While generally well-implemented, FF5's ATB feels more "stop and start" than later entries
; This is principally because the menu and animation systems are tied directly to the ATB tick system
; Every ATB tick updates the menu queue, updates timers, and then updates the action queue (during which commands can animate)
; When a player character gets full ATB (timer = 0), the action queue puts a request on the menu queue to open their menu in the next tick
; The menu queue opens the menu if none are currently open, and also sets ATB to pause due to Wait mode or Battle Speed > 1, if applicable
; When the player inputs a command, on the next available tick the menu queue sets the command along with the execution delay
; When the execution delay timer reaches zero, the command executes (animating in full before continuing to the next tick)
; The problem is when multiple characters have full ATB; the second character's menu will not open until the first character's command is done animating
; Almost all commands have only 1 tick of execution delay, which is not enough to allow the menu close animation to finish for the first character
; By adding +1 to all execution delays, the player can use the animation time for the first character's command to select a command for the second character
; This has the most relevance for Battle Speed 1, which offers no pause for the player to buffer inputs during animations unlike in other ATB games
; This has virtually no effect on balance other than making the menus more forgiving (and thereby speeding up battles)

hirom  ; don't change this
;header  ; comment out if your rom has no header
	
org $C21C04
	C21C04: INC							; RSD: add +1 to delay (adds 1 byte)
	C21C05: STA $3D7F,Y
	C21C08: LDA #$41
	C21C0A: STA $3CFB,Y
	C21C0D: LDA #$80
	C21C0F: STA $41BF
	C21C12: REP #$20
	C21C14: STZ $41C0
	C21C17: STZ $41C2
	C21C1A: STZ $41C4
	C21C1D: STZ $41C6
	C21C20: STZ $41C8
	C21C23: STZ $41CA
	C21C26: SEP #$20
	C21C28: RTS 
	C21C29: NOP #13
