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
    z = 0    : rem Flag to simulate monster ai
    k = 0    : rem flag for monster missile
    p = 30   : rem flag for monster health
    j = 5    : rem flag for player health
    s = 0    : rem player sprite direction

   rem ---------------------------------------------------------------------------------
  dim p0y =  d : rem player vertical position
  dim p0x =  f : rem player horizontal position

  dim p1y =  g : rem set p1y to g, monster vertical position
  dim p1x =  h : rem set p1x to h, moster horizantal position

  dim monsterSprite = m : rem set variable m, counter fo monster animation frames
  dim playerSprite =  n : rem set variable n, counter fo player animation frames

  dim moved = 0         : rem Flag to check if the player moved

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

   rem ---------------------------------------------------------------------------------
   if p = 0 then goto win    : rem player hits monster 30 times win
   if j = 0 then goto lose   : rem player get hit 5 times lose

     if joy0right then w = 1  : rem Set direction to right
   if joy0left then w = 0   : rem Set direction to left

   playerSprite = playerSprite + 1  : rem Increase animation frame counter

   if playerSprite > 30 then playerSprite = 0  : rem Reset animation cycle

   if joy0right then s = 1  : rem Set direction to right
   if joy0left then s = 0   : rem Set direction to left

   playerSprite = playerSprite + 1  : rem Increase animation frame counter

   if playerSprite > 30 then playerSprite = 0  : rem Reset animation cycle

   if s = 1 then player0:
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

 if s = 0 then player0:         
         %01101110  
         %00100110  
         %00100110  
         %00111100  
         %00111110  
         %11111111  
         %10111101  
         %11111111  
         %00111111  
         %00011100  
         %00100111  
         %00100011  
         %00100011  
         %00111111  
         %00011110  
         %00001100  
end

 monsterSprite = monsterSprite + 1       : rem animation frames for monster
 
 if monsterSprite = 10 then player1: 
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

 if monsterSprite = 20 then player1:
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

 if monsterSprite = 30 then player1:
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

   rem ---------------------------------------------------------------------------------
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X........XX.XX.................X
 X..X.....XX.XX....X.......X....X
 XX.XX.X..XX.XX..X.X.X..X.XX..X.X
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

   rem ---------------------------------------------------------------------------------
    COLUP0= $70 + (rand & 7)   : rem PLAYER COLUP0=<xx> sets the color of the player 0 sprite. Valid range is 0-254 , randomizes colors 
    COLUP1 = $C0 + (rand & 7)  : rem MONSTER COLUP0=<xx> sets the color of the player 0 sprite. Valid range is 0-254 , randomizes colors 
    COLUPF = $A0 + (rand & 7)  : rem PLAYFIELD You need to set a color for the playfield
    COLUBK = 00                : rem BACKGROUND BALCK Change the background color with COLUBK
   rem ---------------------------------------------------------------------------------

   if collision(missile1, player0) then player1x = (rand & 63) + 40 : player0y = (rand & 31) + 30 : COLUBK = $46 + (rand & 2) : j = j - 1 : rem if missile and monster collide monster changes position

   if collision(missile0, player1) then player1x = (rand & 63) + 40 : player1y = (rand & 31) + 30 : missile1y = (rand & 31) + 30 : COLUBK = $46 + (rand & 2) : p = p - 1 : rem if missile and monster collide monster changes position
   if collision(player0, player1) then player1x = (rand & 63) + 40 : player1y = (rand & 31) + 30  : missile1y = (rand & 31) + 30 : COLUBK = $46 + (rand & 2) : j = j - 1 : rem if player and monster collide monster changes position

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

   rem ------------------------------------------------------------------
   rem monster movement logic
   z = z + 1  : rem Counter for movement timing

   if z > 40 then player1x = player1x + p1x  
   if z > 80 then player1y = player1y + p1y : z = 0  : rem Reset movement counter

   rem If Player 1 collides with the playfield, move back and reverse direction
   if collision(player1, playfield) then player1x = player1x - p1x : player1y = player1y - p1y : p1x = -p1x : p1y = -p1y 

   rem Keep Player 1 inside the screen boundaries
   if player1x > 120 then player1x = 120 : p1x = -1
   if player1x < 10 then player1x = 10  : p1x = 1
   if player1y > 80 then player1y = 80  : p1y = -1
   if player1y < 10 then player1y = 10  : p1y = 1

   rem ------------------------------------------------------------------
   rem monster missile logic
   if (rand & 3) = 0 && missile1x = 0 then missile1x = player1x : missile1y = player1y
   if missile1x > 0 then missile1x = missile1x + (rand & 3) - 1 : missile1y = missile1y + (rand & 3) - 1
   if missile1x > 120 then missile1x = 120 : missile1x = missile1x - 1
   if missile1x < 10 then missile1x = 10 : missile1x = missile1x + 1
   if missile1y > 80 then missile1y = 180 : missile1y = missile1y - 1
   if missile1y < 10 then missile1y = 0 : missile1y = missile1y + 1
   if collision(missile1, playfield) then missile1x = missile1x - (rand & 3) + 1 : missile1y = missile1y - (rand & 3) + 1
   if missile1x = player1x && missile1y = player1y then missile1x = 0 : missile1y = 0

   drawscreen

   rem ---------------------------------------------------------------------------------
   if collision(player0,playfield) then gosub knock_player_back : rem if player collides with playfield knockback

   goto main

  rem knockback function
knock_player_back            
   player0x = player0x - p0x
   player0y = player0y - p0y
   return

win
  COLUPF = $1C + (rand & 3)  : rem Set random yellow shades for the playfield

 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 X..............................X
 X.XX....XX.XX.XXXXX......XX.XX.X
 X.XX....XX.XX.XX..XX.....XX.XX.X
 X.XX....XX.XX.XX...XX....XX.XX.X
 X.XX....XX.XX.XX....XX...XX.XX.X
 X.XX....XX.XX.XX.....XX..XX.XX.X
 X.XX.XX.XX.XX.XX......XX.XX....X
 X.XX.XX.XX.XX.XX.......XXXX.XX.X
 X.XXX..XXX.XX.XX........XXX.XX.X
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
 drawscreen
 goto win

lose
  COLUPF = $4C + (rand & 3)  : rem Set random red shades for the playfield

 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 X..............................X
 X.XXXX..X.XXXXX.X..X...........X
 X.X.....X...X...XXXX...........X
 X.XXXX..X...X......X...........X
 X.............XXXXX..XXXXXXXXX.X
 X.X.....XXXXX.X.........XX.....X
 X.X.....X...X.XXXXXX....XX.....X
 X.XXXXX.XXXXX......X....XX.....X
 X............XXXXXXX....XX.....X
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
  drawscreen
  goto lose


