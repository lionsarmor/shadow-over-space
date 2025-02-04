game
.L00 ;  rem ---- Sample Program 2 ----

.
 ; 

.L01 ;  rem This program draws a yellow sprite on a black background, and

.L02 ;  rem adds a simple playfield to the background

.
 ; 

.L03 ;  set romsize 4k

.
 ; 

.titlescreen
 ; titlescreen

.
 ; 

.L04 ;  rem set the playfield color to bright yellow (28)

.
 ; 

.L05 ;  COLUPF = 28

	LDA #28
	STA COLUPF
.
 ; 

.L06 ;  rem the playfield command draws the X's on the screen.  Must use capital X, must be 32x11.

.
 ; 

.L07 ;  playfield:

  ifconst pfres
	  ldx #(11>pfres)*(pfres*pfwidth-1)+(11<=pfres)*43
  else
	  ldx #((11*pfwidth-1)*((11*pfwidth-1)<47))+(47*((11*pfwidth-1)>=47))
  endif
	jmp pflabel0
PF_data0
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %11000000
 endif
	.byte %10001111, %01011110
	if (pfwidth>2)
	.byte %00101111, %10000000
 endif
	.byte %10001000, %11010010
	if (pfwidth>2)
	.byte %01101000, %10000000
 endif
	.byte %11001011, %01011110
	if (pfwidth>2)
	.byte %10101110, %11000000
 endif
	.byte %10001001, %01010010
	if (pfwidth>2)
	.byte %00101000, %10000000
 endif
	.byte %10001111, %01010010
	if (pfwidth>2)
	.byte %00101111, %10000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %11000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %10000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %10000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
pflabel0
	lda PF_data0,x
	sta playfield,x
	dex
	bpl pflabel0
.
 ; 

.
 ; 

.L08 ;  rem the playfield command draws the X's on the screen.  Must use capital X, must be 32x11.

.
 ; 

.L09 ;  l  =  0

	LDA #0
	STA l
.L010 ;  o  =  0

	LDA #0
	STA o
.L011 ;  e  =  0  :  rem  counter for firing gun

	LDA #0
	STA e
.L012 ;  c  =  50  :  rem  player0 x position

	LDA #50
	STA c
.L013 ;  d  =  50  :  rem  player0 y position

	LDA #50
	STA d
.L014 ;  g  =  30

	LDA #30
	STA g
.L015 ;  h  =  90

	LDA #90
	STA h
.L016 ;  m  =  0

	LDA #0
	STA m
.L017 ;  n  =  0

	LDA #0
	STA n
.L018 ;  q  =  10  :  rem Counter number - when to switch to frame 2

	LDA #10
	STA q
.L019 ;  r  =  20  :  rem Counter number - when to switch to frame 3

	LDA #20
	STA r
.L020 ;  t  =  30  :  rem Counter number - when to switch to frame 4

	LDA #30
	STA t
.
 ; 

.
 ; 

.L021 ;  dim fire  =  e

.L022 ;  dim p0y  =  d

.L023 ;  dim p0x  =  c

.
 ; 

.L024 ;  dim p1y  =  g

.L025 ;  dim p1x  =  h

.
 ; 

.L026 ;  dim p0_x  =  i

.L027 ;  dim p0_y  =  o

.
 ; 

.L028 ;  dim monsterSprite  =  m

.L029 ;  dim playerSprite  =  n

.
 ; 

.L030 ;  drawscreen

 jsr drawscreen
.
 ; 

.L031 ;  rem if you press fire on the joystick, you'll leave the title screen and start the main program below

.
 ; 

.L032 ;  if joy0fire then goto main

 bit INPT4
	BMI .skipL032
.condpart0
 jmp .main

.skipL032
.
 ; 

.L033 ;  rem if the joystick button is not pressed, just loop back to the titlescreen again

.
 ; 

.L034 ;  goto titlescreen

 jmp .titlescreen

.
 ; 

.main
 ; main

.
 ; 

.L035 ;  rem  COLUP0=<xx> sets the color of the player 0 sprite. Valid range is 0-254

.L036 ;  COLUP0 = 28

	LDA #28
	STA COLUP0
.L037 ;  COLUP1 = 45

	LDA #45
	STA COLUP1
.L038 ;  rem  You need to set a color for the playfield

.L039 ;  COLUPF = 88

	LDA #88
	STA COLUPF
.L040 ;  rem Change the background color with COLUBK

.L041 ;  COLUBK = 02

	LDA #02
	STA COLUBK
.
 ; 

.L042 ;  rem  Here is where you define the shape of the player sprite.  It's limited to

.L043 ;  rem  8 pixels wide, but you can make it as tall/long as you want.

.
 ; 

.L044 ;  rem  the 'player0' must be indented, the 'end' must NOT be indented.

.
 ; 

.L045 ;  player0y = p0y

	LDA p0y
	STA player0y
.L046 ;  player0x = p0x

	LDA p0x
	STA player0x
.L047 ;  player1y = p1y

	LDA p1y
	STA player1y
.L048 ;  player1x = p1x

	LDA p1x
	STA player1x
.
 ; 

.L049 ;  if collision(missile0,player1) then COLUBK = $28

	bit 	CXM0P
	BPL .skipL049
.condpart1
	LDA #$28
	STA COLUBK
.skipL049
.
 ; 

.
 ; 

.L050 ;  player0:

	LDX #<playerL050_0
	STX player0pointerlo
	LDA #>playerL050_0
	STA player0pointerhi
	LDA #15
	STA player0height
.
 ; 

.L051 ;  monsterSprite = monsterSprite + 1

	INC monsterSprite
.
 ; 

.L052 ;  if monsterSprite = 10 then player1: 

	LDA monsterSprite
	CMP #10
     BNE .skipL052
.condpart2
	LDX #<player2then_1
	STX player1pointerlo
	LDA #>player2then_1
	STA player1pointerhi
	LDA #10
	STA player1height
.skipL052
.L053 ;  if monsterSprite = 20 then player1:

	LDA monsterSprite
	CMP #20
     BNE .skipL053
.condpart3
	LDX #<player3then_1
	STX player1pointerlo
	LDA #>player3then_1
	STA player1pointerhi
	LDA #10
	STA player1height
.skipL053
.L054 ;  if monsterSprite = 30 then player1:

	LDA monsterSprite
	CMP #30
     BNE .skipL054
.condpart4
	LDX #<player4then_1
	STX player1pointerlo
	LDA #>player4then_1
	STA player1pointerhi
	LDA #10
	STA player1height
.skipL054
.
 ; 

.L055 ;  if monsterSprite > 30 then monsterSprite = 0

	LDA #30
	CMP monsterSprite
     BCS .skipL055
.condpart5
	LDA #0
	STA monsterSprite
.skipL055
.
 ; 

.
 ; 

.L056 ;  if l > 140  ||  missile0x > 140 then missile0y = 11

	LDA #140
	CMP l
     BCS .skipL056
.condpart6
 jmp .condpart7
.skipL056
	LDA #140
	CMP missile0x
     BCS .skip0OR
.condpart7
	LDA #11
	STA missile0y
.skip0OR
.L057 ;  if !joy0fire then fire = 0  :  x = p0x  :  missile0x = 0  :  missile0y = 0

 bit INPT4
	BPL .skipL057
.condpart8
	LDA #0
	STA fire
	LDA p0x
	STA x
	LDA #0
	STA missile0x
	STA missile0y
.skipL057
.L058 ;  if joy0fire then missile0x = x + 8 : missile0y = p0y - y - 6

 bit INPT4
	BMI .skipL058
.condpart9
	LDA x
	CLC
	ADC #8
	STA missile0x
; complex statement detected
	LDA p0y
	SEC
	SBC y
	SEC
	SBC #6
	STA missile0y
.skipL058
.
 ; 

.L059 ;  if fire < 60  &&  missile0x > 135 then missile0y = 0

	LDA fire
	CMP #60
     BCS .skipL059
.condpart10
	LDA #135
	CMP missile0x
     BCS .skip10then
.condpart11
	LDA #0
	STA missile0y
.skip10then
.skipL059
.L060 ;  if fire < 60 then x = x + 2 else missile0y = 0

	LDA fire
	CMP #60
     BCS .skipL060
.condpart12
	LDA x
	CLC
	ADC #2
	STA x
 jmp .skipelse0
.skipL060
	LDA #0
	STA missile0y
.skipelse0
.L061 ;  if fire > 250 then fire = 25

	LDA #250
	CMP fire
     BCS .skipL061
.condpart13
	LDA #25
	STA fire
.skipL061
.
 ; 

.L062 ;  fire = fire + 1

	INC fire
.
 ; 

.L063 ;  b = b + 1

	INC b
.
 ; 

.L064 ;  if b > 30 then b = 0

	LDA #30
	CMP b
     BCS .skipL064
.condpart14
	LDA #0
	STA b
.skipL064
.
 ; 

.L065 ;  if b = q then goto frame1

	LDA b
	CMP q
     BNE .skipL065
.condpart15
 jmp .frame1

.skipL065
.L066 ;  if b = r then goto frame2

	LDA b
	CMP r
     BNE .skipL066
.condpart16
 jmp .frame2

.skipL066
.L067 ;  if b = t then goto frame3

	LDA b
	CMP t
     BNE .skipL067
.condpart17
 jmp .frame3

.skipL067
.
 ; 

.L068 ;  rem  this command instructs the program to write data to the TV screen.

.L069 ;  drawscreen

 jsr drawscreen
.framereturn
 ; framereturn

.
 ; 

.L070 ;  if collision(player0,playfield) then gosub knock_player_back

	bit 	CXP0FB
	BPL .skipL070
.condpart18
 jsr .knock_player_back

.skipL070
.
 ; 

.L071 ;  Make the guy move

