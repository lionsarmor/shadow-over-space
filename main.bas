  rem ---------------------------------------------------------------------------------
  rem Shadow Over Space an Atari Game by James Weeks 2025 
    
  rem ---------------------------------------------------------------------------------  
  set romsize 4k : rem set rom size for cartridge and IDE

   rem variables
   rem ----------------------------------------------------------------------------
   c{1}=0 :rem Turned on if the last location of the joystick was UP
   c{2}=0 :rem Turned on if the last location of the joystick was DOWN
   c{3}=0 :rem Turned on if the last location of the joystick was LEFT
   c{4}=1 :rem Turned on if the last location of the joystick was RIGHT
   c{5}=0 :rem Turned on if the last location of the joystick was UP+LEFT
   c{6}=0 :rem Turned on if the last location of the joystick was UP+RIGHT
   c{7}=0 :rem Turned on if the last location of the joystick was DOWN+LEFT
   c{0}=0 :rem Turned on if the last location of the joystick was DOWN+RIGHT
   rem ----------------------------------------------------------------------------
    e=20    :rem Counter for limiting travel of fired missile
    w=0     :rem Used to determine player reflection (REFP1)
   rem ----------------------------------------------------------------------------
    f = 50   : rem variable for player horizontal position
    d = 50   : rem variable for player vertical position
    g = 30   : rem monster position vertical
    h = 90   : rem monster position horizontal
    m = 0    : rem counter for monster animation frames
    n = 0    : rem counter for player animation frames

   rem ---------------------------------------------------------------------------------
  dim p0y =  d : rem player vertical position
  dim p0x =  f : rem player horizontal position

  dim p1y =  g : rem set p1y to g, monster vertical position
  dim p1x =  h : rem set p1x to h, moster horizantal position

  dim monsterSprite = m : rem set variable m, counter fo monster animation frames
  dim playerSprite =  n : rem set variable n, counter fo player animation frames

   rem ---------------------------------------------------------------------------------
  player0x = p0x : rem set player position x
  player0y = p0y : rem set player position y
  player1y = p1y : rem set monster position y
  player1x = p1x : rem set monster position x

titlescreen
   rem ---------------------------------------------------------------------------------
  COLUPF= $A0 + (rand & 3) : rem set the playfield color of title screen 
    
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

  drawscreen

 if joy0fire then goto main : rem if you press fire on the joystick, you'll leave the title screen and start the main program below

 goto titlescreen : rem if the joystick button is not pressed, just loop back to the titlescreen again

   rem ---------------------------------------------------------------------------------
main

 playerSprite=playerSprite+1       : rem animation frames for player
 
  if playerSprite=10 then player0: 
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
 if playerSprite=20 then player0:
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
 if playerSprite=30 then player0:
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

 monsterSprite=monsterSprite+1       : rem animation frames for monster
 
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

   rem ---------------------------------------------------------------------------------
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
   rem ---------------------------------------------------------------------------------
    COLUP0= $70 + (rand & 7)   : rem PLAYER COLUP0=<xx> sets the color of the player 0 sprite. Valid range is 0-254 , randomizes colors 
    COLUP1 = $C0 + (rand & 7)  : rem MONSTER COLUP0=<xx> sets the color of the player 0 sprite. Valid range is 0-254 , randomizes colors 
    COLUPF = $A0 + (rand & 7)  : rem PLAYFIELD You need to set a color for the playfield
    COLUBK = 00                : rem BACKGROUND BALCK Change the background color with COLUBK
   rem ---------------------------------------------------------------------------------
   if collision(missile0,player1) then COLUBK = $46 + (rand & 2) : rem when bullets collide with monster blink screen background
   if collision(player0,player1) then COLUBK =  $46 + (rand & 2) : rem when player collide with monster blink screen background

   rem ---------------------------------------------------------------------------------
   p0x = 0                   : rem player movement sprite left & right
   if joy0left then p0x = 255
   if joy0right then p0x = 1
   player0x = player0x + p0x

   p0y = 0                   : rem player movement sprite up & down
   if joy0up then p0y = 255
   if joy0down then p0y = 1
   player0y = player0y + p0y

   rem ---------------------------------------------------------------------------------
   rem This section sets a value for the last direction the joystick was pushed
   rem
   rem  This determines the direction the bullet will be fired later, and also
   rem  allows you to keep firing the bullet in the same direction after you
   rem  have stopped moving.
   rem
   rem  Each time you move, each of the eight possible directions of the joystick is
   rem  marked as on or off with a bit variable.
   rem ---------------------------------------------------------------------------------

   if joy0up then                c{1}=1:c{2}=0:c{3}=0:c{4}=0:c{5}=0:c{6}=0:c{7}=0:c{0}=0
   if joy0down then              c{1}=0:c{2}=1:c{3}=0:c{4}=0:c{5}=0:c{6}=0:c{7}=0:c{0}=0
   if joy0left then              c{1}=0:c{2}=0:c{3}=1:c{4}=0:c{5}=0:c{6}=0:c{7}=0:c{0}=0
   if joy0right then             c{1}=0:c{2}=0:c{3}=0:c{4}=1:c{5}=0:c{6}=0:c{7}=0:c{0}=0
   if joy0up && joy0left then    c{1}=0:c{2}=0:c{3}=0:c{4}=0:c{5}=1:c{6}=0:c{7}=0:c{0}=0
   if joy0up && joy0right then   c{1}=0:c{2}=0:c{3}=0:c{4}=0:c{5}=0:c{6}=1:c{7}=0:c{0}=0
   if joy0down && joy0left then  c{1}=0:c{2}=0:c{3}=0:c{4}=0:c{5}=0:c{6}=0:c{7}=1:c{0}=0
   if joy0down && joy0right then c{1}=0:c{2}=0:c{3}=0:c{4}=0:c{5}=0:c{6}=0:c{7}=0:c{0}=1

   rem ------------------------------------------------------------------
   rem  Increase 20 to a larger number to make the bullets travel farther
   rem ------------------------------------------------------------------
   e=e+1
   if e>50 then e=0
      rem ------------------------------------------------------------------
   rem  if you let go of the fire button, the missile shot is turned off,
   rem  and the gunshot travel length variable (e) is reset to 0.
   rem ------------------------------------------------------------------
   if !joy0fire then missile0x=0:missile0y=0:e=0

      rem ------------------------------------------------------------------
   rem  Fire the Missile
   rem    This code is what actually fires the missile.
   rem  
   rem  It checks for a combination of pressing the fire button and
   rem    the direction the joystick was most recently moved in to
   rem    determine which direction to fire the missile.
   rem
   rem  the E variable determines the length of the shot
   rem ------------------------------------------------------------------

   rem diagonal shots
   if joy0fire && c{0} then missile0x=player0x+7+e:missile0y=player0y-3+e
   if joy0fire && c{5} then missile0x=player0x-e:missile0y=player0y-7-e
   if joy0fire && c{7} then missile0x=player0x-e:missile0y=player0y+1+e
   if joy0fire && c{6} then missile0x=player0x+7+e:missile0y=player0y-7-e

   rem left and right shots
   if joy0fire && c{3} then missile0x=player0x-e:missile0y=player0y-5
   if joy0fire && c{4} then missile0x=player0x+8+e:missile0y=player0y-5

   rem up and down shots
   if joy0fire && c{1} then missile0x=player0x+5:missile0y=player0y-10-e
   if joy0fire && c{2} then missile0x=player0x+5:missile0y=player0y+3+e

   rem ------------------------------------------------------------------
   rem This stops the animation and shows a still sprite when you're 
   rem not moving.
   rem ------------------------------------------------------------------
   if !joy0up && !joy0down && !joy0left && !joy0right then y=30 


   drawscreen

   rem ---------------------------------------------------------------------------------
   if collision(player0,playfield) then gosub knock_player_back : rem if player collides with playfield knockback

   goto main

  rem knockback function
knock_player_back            
   player0x = player0x - p0x
   player0y = player0y - p0y
   return

