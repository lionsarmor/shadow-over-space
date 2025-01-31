;***************************************************************
;
;  UFO vs Giant Monster - Batari Basic
;
;***************************************************************

   set tv ntsc
   set kernel score
   const pfscore = 1   ; Enables the score display

; ===========================
; SPRITE GRAPHICS
; ===========================

   player0:  ; UFO (Player)
     %00111100
     %01111110
     %11111111
     %11111111
     %11111111
     %01111110
     %00111100
     %00000000
end

   player1:  ; Giant Monster (Enemy)
     %01101100
     %11111110
     %11111111
     %11111111
     %11111110
     %01101100
     %00000000
     %00000000
end

; ===========================
; VARIABLES
; ===========================

   dim playerX = 70
   dim playerY = 120

   dim monsterX = 70
   dim monsterY = 40

   dim missile0Active = 0

   dim missile1Active = 0

   dim playerHealth = 5
   dim monsterHealth = 10

   score = 0

; ===========================
; TITLE SCREEN
; ===========================

main
   drawscreen
   pfscore1 = 0  ; Clears score display
   pfscore2 = 0
   pfscore2 = score / 10

   COLUBK = $20  ; Background color
   COLUP0 = $CE  ; UFO color
   COLUP1 = $F4  ; Monster color

   ; Fake title screen using playfield
   playfield:
   XXXXXXXXXXXXXXXXXXXXXXXX
   X                      X
   X   UFO VS MONSTER     X
   X                      X
   X  PRESS FIRE TO START X
   XXXXXXXXXXXXXXXXXXXXXXXX
end

   drawscreen

   if joy0fire then goto GameStart
   goto main

; ===========================
; INITIALIZE GAME
; ===========================

GameStart
   playerX = 70
   playerY = 120
   monsterX = 70
   monsterY = 40
   playerHealth = 5
   monsterHealth = 10
   score = 0

   missile0Active = 0
   missile1Active = 0

   missile0y = 200  ; Hide offscreen
   missile1y = 200

; ===========================
; CITY BACKGROUND (PLAYFIELD)
; ===========================

   playfield:
   XXXXXXXXXXXXXXXXXXXXXXXX
   X                     X
   X   XXXX   XXXX   XXXX X
   X   XXXX   XXXX   XXXX X
   X                     X
   XXXXXXXXXXXXXXXXXXXXXXXX
end

   goto GameLoop

; ===========================
; GAME LOOP
; ===========================

GameLoop

   ; Player movement
   if joy0left then playerX = playerX - 1
   if joy0right then playerX = playerX + 1
   if joy0up then playerY = playerY - 1
   if joy0down then playerY = playerY + 1

   ; Keep player inside screen boundaries
   if playerX < 10 then playerX = 10
   if playerX > 150 then playerX = 150
   if playerY < 90 then playerY = 90
   if playerY > 120 then playerY = 120

   ; Player shooting bullets
   if joy0fire && missile0Active = 0 then gosub FireBullet

   ; Move bullet upwards
   if missile0Active = 1 then missile0y = missile0y - 2
   if missile0y < 10 then missile0Active = 0

   ; Monster AI movement
   if monsterX < playerX then monsterX = monsterX + 1
   if monsterX > playerX then monsterX = monsterX - 1

   ; Monster randomly fires laser
   if rand & 15 = 1 && missile1Active = 0 then gosub FireMonsterLaser

   ; Move monster laser downwards
   if missile1Active = 1 then missile1y = missile1y + 2
   if missile1y > 140 then missile1Active = 0

   ; Update missile positions
   missile0x = playerX
   missile1x = monsterX

   ; Check collision with bullets
   if missile0Active = 1 && missile0x > monsterX - 5 && missile0x < monsterX + 5 then gosub HitMonster
   if missile1Active = 1 && missile1x > playerX - 5 && missile1x < playerX + 5 then gosub HitPlayer

   ; Update Score & Health Bars
   pfscore1 = playerHealth
   pfscore2 = monsterHealth
   pfscore2 = score / 10  ; Score simplified to fit in pfscore bar

   drawscreen

   ; Check game over conditions
   if playerHealth = 0 then gosub GameOver
   if monsterHealth = 0 then gosub WinScreen

   goto GameLoop

; ===========================
; SHOOTING FUNCTIONS
; ===========================

FireBullet
   missile0x = playerX
   missile0y = playerY - 5
   missile0Active = 1
   return

FireMonsterLaser
   missile1x = monsterX
   missile1y = monsterY + 5
   missile1Active = 1
   return

; ===========================
; COLLISION HANDLING
; ===========================

HitPlayer
   playerHealth = playerHealth - 1
   missile1Active = 0
   return

HitMonster
   monsterHealth = monsterHealth - 1
   score = score + 10
   missile0Active = 0
   return

; ===========================
; GAME OVER & WIN SCREENS
; ===========================

GameOver
   
   pfscore1 = 0
   pfscore2 = 0
   pfscore2 = score / 10 

   COLUBK = $40  ; Dark background
   playfield:
   XXXXXXXXXXXXXXXXXXXXXXXX
   X                      X
   X      GAME OVER       X
   X  PRESS RESET TO TRY  X
   XXXXXXXXXXXXXXXXXXXXXXXX
end
   drawscreen

   if switchreset then goto main
   goto GameOver

WinScreen
   pfscore1 = 0
   pfscore2 = 0
   pfscore2 = score / 10  ; Use pfscore2 instead of pfscore3

   COLUBK = $40  ; Dark background
   playfield:
   XXXXXXXXXXXXXXXXXXXXXXXX
   X                      X
   X      YOU WIN!        X
   X SCORE:              X
   XXXXXXXXXXXXXXXXXXXXXXXX
end
   drawscreen

   if switchreset then goto main
   goto WinScreen
