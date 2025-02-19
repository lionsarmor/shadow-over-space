   rem shadow over space a game by james weeks 2025 
    
  set romsize 4k

titlescreen

     rem set the playfield color of title screen 

 COLUPF= $A0 + (rand & 3)

     rem the playfield command draws the X's on the screen.  Must use capital X, must be 32x11.

 playfield:
 XXXXXX.X.XXX.XX..XXX.X...XXXXXXX
 X....X.X.X.X.X.X.X.X.X...X.....X
 XXXX.XXX.XXX.X.X.X.X.X...X.....X
 ...X.X.X.X.X.X.X.X.X.X.X.X.....X
 XXXX.X.X.X.X.XX..XXX.XX.XX.....X
 XXXX.XXX.XXX.XXXX.XXXXXXXX.....X
 X....X.X.X.X.X....X............X
 XXXX.XXX.XXX.X....XXXXX........X
 ...X.X...X.X.X....X............X
 XXXX.X...X.X.XXXX.XXXXXXXX.....X
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
  
     rem the playfield command draws the X's on the screen.  Must use capital X, must be 32x11.
 
  l = 0
 o = 0
 e = 0    : rem  counter for firing gun
 c = 50  : rem  player0 x position
 d = 50  : rem  player0 y position
 g = 30 
 h = 90
 m = 0
 n = 0 
 q = 30  : rem Counter number - when to switch to frame 2
 r = 50   : rem Counter number - when to switch to frame 3
 t = 100 : rem Counter number - when to switch to frame 4

 
  dim fire = e
  dim p0y = d
  dim p0x = c

  dim p1y = g
  dim p1x = h

  dim p0_x = i
  dim p0_y = o

  dim monsterSprite = m
  dim playerSprite = n

 drawscreen

     rem if you press fire on the joystick, you'll leave the title screen and start the main program below

 if joy0fire then goto main

     rem if the joystick button is not pressed, just loop back to the titlescreen again

 goto titlescreen

main

 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 .........XX.XX..................
 ...X.....XX.XX....X.......X.....
 .X.XX.X..XX.XX..X.X.X..X.XX..X.X
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end


    rem sets variables for player and monster 
  player0y=p0y
  player0x=p0x    
  player1y=p1y
  player1x=p1x


     rem  COLUP0=<xx> sets the color of the player 0 sprite. Valid range is 0-254 , randomizes colors 
 COLUP0= $46 + (rand & 2)

 COLUP1 = $86 + (rand & 15)

     rem  You need to set a color for the playfield
 COLUPF = $A0 + (rand & 7)

     rem Change the background color with COLUBK
 COLUBK=00

    rem when bullets collide with monster blink screen background 
 if collision(missile0,player1) then COLUBK=$28 


 player0:
   %01110110 
   %01100100 
   %01100100 
   %00111100 
   %01111100
   %11111111
   %10111101
   %11111111
   %11111100
   %00111000
   %11100100
   %11000100
   %11000100
   %11111100
   %01111000
   %00110000 
end

 monsterSprite=monsterSprite+1
 
  if monsterSprite=10 then player1: 
        %00011100
        %00011000
        %00011000
        %00100000
        %00011000
        %01011111
        %01100100
        %00010000
        %00011000
        %00111100
        %00011000
end
 if monsterSprite=20 then player1:
        %01000011
        %01100010
        %00110110
        %00011100
        %00101000
        %00111100
        %00100100
        %00010000
        %00011000
        %00111100
        %00011000
end
 if monsterSprite=30 then player1:
        %00011100
        %00011000
        %00011000
        %00100000
        %01011010
        %01111100
        %00100100
        %00010000
        %00011000
        %00111100
        %00011000
end

 if monsterSprite>30 then monsterSprite=0

  rem firing code 

 if l>140 || missile0x>140 then missile0y=11
 if !joy0fire then fire=0 : x=p0x : missile0x=0 : missile0y=0
 if joy0fire then missile0x=x+8:missile0y=p0y-y-6

 if fire<60 && missile0x>135 then missile0y=0
 if fire<60 then x=x+2 else missile0y=0
 if fire>250 then fire=25

 fire=fire+1

 rem  this command instructs the program to write data to the TV screen.
 drawscreen

  rem Make the guy move
  if joy0right then p0x=p0x+1
  if joy0left then p0x=p0x-1
  if joy0up then p0y=p0y-1
  if joy0down then p0y=p0y+1

     rem you have to have a game loop, so tell the program to jump back to the beginning.

 goto main