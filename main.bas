      rem ---- Sample Program 2 ----
     
     rem This program draws a yellow sprite on a black background, and
     rem adds a simple playfield to the background
    
  set romsize 4k

titlescreen

     rem set the playfield color to bright yellow (28)

 COLUPF=28

     rem the playfield command draws the X's on the screen.  Must use capital X, must be 32x11.

 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XX............................XX
 X...XXXX.XXXX.X...X.XXXX.......X
 X...X....X..X.XX.XX.X..........X
 XX..X.XX.XXXX.X.X.X.XXX.......XX
 X...X..X.X..X.X...X.X..........X
 X...XXXX.X..X.X...X.XXXX.......X
 XX............................XX
 X..............................X
 X..............................X
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

  
     rem the playfield command draws the X's on the screen.  Must use capital X, must be 32x11.
 
  l = 0
 o = 0
 e = 0   : rem  counter for firing gun
 c = 50  : rem  player0 x position
 d = 50  : rem  player0 y position
 g = 30 
 h = 90
 m = 0
 n = 0 
 q = 30 : rem Counter number - when to switch to frame 2
 r = 50 : rem Counter number - when to switch to frame 3
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

     rem  COLUP0=<xx> sets the color of the player 0 sprite. Valid range is 0-254
 COLUP0=28
 COLUP1=45
     rem  You need to set a color for the playfield
 COLUPF=88
     rem Change the background color with COLUBK
 COLUBK=02

     rem  Here is where you define the shape of the player sprite.  It's limited to
     rem  8 pixels wide, but you can make it as tall/long as you want.

     rem  the 'player0' must be indented, the 'end' must NOT be indented.

  player0y=p0y
  player0x=p0x    
  player1y=p1y
  player1x=p1x

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


 if l>140 || missile0x>140 then missile0y=11
 if !joy0fire then fire=0 : x=p0x : missile0x=0 : missile0y=0
 if joy0fire then missile0x=x+8:missile0y=p0y-y-6

 if fire<60 && missile0x>135 then missile0y=0
 if fire<60 then x=x+2 else missile0y=0
 if fire>250 then fire=25

 fire=fire+1

 b=b+1
 
 if b>100 then b=0

 if b=q then goto frame1
 if b=r then goto frame2
 if b=t then goto frame3

 rem  this command instructs the program to write data to the TV screen.
 drawscreen
framereturn

  rem Make the guy move
  if joy0right then p0x=p0x+1
  if joy0left then p0x=p0x-1
  if joy0up then p0y=p0y-1
  if joy0down then p0y=p0y+1

     rem you have to have a game loop, so tell the program to jump back to the beginning.

 goto main

frame1
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 ................................
 ................................
 ................XX..............
 ................XXX.............
 .X.......XX.XX..XXX......X......
 .X.XX....XX.XX..XXX......XX..X..
 .X.XX....XX.XX..XXXXXX...XX.XXX.
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
 goto framereturn


frame2
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 ................................
 ................................
 .X..............................
 .XX.....XX..X....XX.......XXXX..
 .XX.....XX.XX....XX.XX....XXXX.X
 .XX.....XX.XX....XX.XX....XXXX.X
 .XX..XXXXX.XX.XXXXX.XX....XXXX.X
 .XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

 goto framereturn

frame3
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 .XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

 goto framereturn
