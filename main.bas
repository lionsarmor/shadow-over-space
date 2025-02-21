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
    p = 10    : rem flag for monster health
    j = 4  : rem flag for player health
    s = 0    : rem player sprite direction
    u = 0    : rem win or leveling flag

   rem ---------------------------------------------------------------------------------
  dim p0y =  d            : rem player vertical position
  dim p0x =  f            : rem player horizontal position
  dim p1y =  g            : rem set p1y to g, monster vertical position
  dim p1x =  h            : rem set p1x to h, moster horizantal position
  dim monsterSprite = m   : rem set variable m, counter fo monster animation frames
  dim playerSprite =  n   : rem set variable n, counter fo player animation frames
  dim moved = 0           : rem Flag to check if the player moved
  dim winflag = u         : rem win or leveling flag
  dim playerHealth = j    : rem player health
  dim monsterHealth = p   : rem player health
  const pfscore = 1       : rem enables health bars
  dim explosion_timer = a : rem sound, explosion timer
  dim missile1dist = 0


   
  scorecolor = 00     : rem set the score counter color

    rem ---------------------------------------------------------------------------------
  player0x = p0x        : rem set player position x
  player0y = p0y        : rem set player position y
  player1y = p1y        : rem set monster position y
  player1x = p1x        : rem set monster position x

  pfscore1 = %10101010 : rem Full health (4 pills)
  pfscore2 = %10101010 : rem monster health bar

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

   playerSprite = playerSprite + 1  : rem Increase animation frame counter
   if playerSprite > 30 then playerSprite = 0  : rem Reset animation cycle

   if joy0right then s = 1  : rem Set direction to right
   if joy0left then s = 0   : rem Set direction to left

    rem idle player sprite           
   if !joy0left && !joy0right && !joy0up && !joy0down && !joy0fire then player0:
    %00011100
    %00011000
    %00011000
    %00100000
    %00011000
    %01011111
    %01100100
    %00010000
    %00011000
    %00011000
    %00000000
end

    rem  player sprite animation left
      if playerSprite = 10 && joy0left then player0: 
    %00111000
    %00011000
    %00011000
    %00000100
    %00011000
    %11111010
    %00100110
    %00001000
    %00011000
    %00011000
    %00000000
end

   if playerSprite = 20 && joy0left then player0: 
    %11000010
    %01000110
    %01101100
    %00111000
    %00010100
    %00111100
    %00100100
    %00001000
    %00011000
    %00011000
    %00000000
end


   if playerSprite = 30 && joy0left then player0: 
    %00111000
    %00011000
    %00011000
    %00000100
    %01011010
    %00111110
    %00100100
    %00001000
    %00011000
    %00011000
    %00000000
end

    rem player sprtite animation left
   if playerSprite = 10 && joy0right then player0: 
    %00011100
    %00011000
    %00011000
    %00100000
    %00011000
    %01011111
    %01100100
    %00010000
    %00011000
    %00011000
    %00000000
end

   if playerSprite = 20 && joy0right then player0: 
    %01000011
    %01100010
    %00110110
    %00011100
    %00101000
    %00111100
    %00100100
    %00010000
    %00011000
    %00011000
    %00000000
end

   if playerSprite = 30 && joy0right then player0: 
    %00011100
    %00011000
    %00011000
    %00100000
    %01011010
    %01111100
    %00100100
    %00010000
    %00011000
    %00011000
    %00000000
end


 monsterSprite = monsterSprite + 1             : rem animation frames for monster
 if monsterSprite > 30 then monsterSprite = 0  : rem Reset animation cycle

   rem monster stage 1
 if monsterSprite = 10 && winflag = 0 then player1: 
    %00011000
    %00011000
    %00011100
    %00111110
    %01111111
    %11111111
    %11011011
    %11011011
    %11111111
    %01111110
    %00111100
    %00111100
    %01111110
    %01111110
    %11111111
    %01101110
    %00100100
    %00100100
    %00011000
    %00011000
    %00011000
    %00010000
    %00010000
    %00000000
end

 if monsterSprite = 20 && winflag = 0 then player1:
    %00011000
    %00011000
    %00011100
    %00111110
    %01111111
    %11111111
    %11011011
    %11011011
    %11111111
    %01111110
    %00111100
    %00111100
    %01111110
    %01101110
    %11011111
    %01101110
    %00100100
    %00100100
    %00011000
    %00011000
    %00011000
    %00010000
    %00010000
    %00000000
end

 if monsterSprite = 30 && winflag = 0 then player1:
    %00011000
    %00011000
    %00011100
    %00111110
    %01111111
    %11111111
    %11011011
    %11011011
    %11111111
    %01111110
    %00111100
    %00111100
    %01111110
    %01111110
    %10111111
    %01101110
    %00100100
    %00100100
    %00011000
    %00011000
    %00011000
    %00011000
    %00011000
    %00000000
end
   rem monster stage 2
 if monsterSprite = 10 && winflag = 1 then player1: 
    %00011000
    %00011000
    %00011000
    %00011000
    %00111100
    %00111100
    %00011000
    %00011000
    %00011000
    %00111100
    %01111110
    %01100110
    %00111100
    %00011000
    %00011000
    %00100100
    %00100100
    %00100100
    %01100110
    %01100110
    %00100100
    %00100100
    %01000010
    %00000000
end

 if monsterSprite = 20 && winflag = 1 then player1:
    %00011000
    %00011000
    %00011000
    %00011000
    %00111100
    %00111100
    %00011000
    %00011000
    %00011000
    %00111100
    %01111110
    %01100110
    %00111100
    %00011000
    %00011000
    %00100100
    %00100100
    %00100100
    %01100110
    %01100110
    %00000100
    %00001000
    %00010000
    %00000000
end

 if monsterSprite = 30 && winflag = 1 then player1:
    %00011000
    %00011000
    %00011000
    %00011000
    %00111100
    %00111100
    %00011000
    %00011000
    %00011000
    %00111100
    %01111110
    %01100110
    %00111100
    %00011000
    %00011000
    %00100100
    %00100100
    %00100100
    %01100110
    %01100110
    %00100000
    %00010000
    %00001000
    %00000000
end

    rem monster stage 3
 if monsterSprite = 10 && winflag = 2 then player1: 
    %00011000
    %00111100
    %01111110
    %11100111
    %11011011
    %11000011
    %01111110
    %00100100
    %00100100
    %00111100
    %01111110
    %01111110
    %01100110
    %00100100
    %00100100
    %01000010
    %00011000
    %00011000
    %00011000
    %00010000
    %00010000
    %00010000
    %00001000
    %00000000
end

 if monsterSprite = 20 && winflag = 2 then player1:
    %00011000
    %00111100
    %01111110
    %11100111
    %11011011
    %11000011
    %01111110
    %00100100
    %00100100
    %00111100
    %01111110
    %01111110
    %01100110
    %00100100
    %00100100
    %01000010
    %00011000
    %00011000
    %00011000
    %00010000
    %00010000
    %00010000
    %00001000
    %00000000
end

 if monsterSprite = 30 && winflag = 2 then player1:
    %00011000
    %00111100
    %01111110
    %11100111
    %11011011
    %11000011
    %01111110
    %00100100
    %01100110
    %01111110
    %11111111
    %11111111
    %01111110
    %01100110
    %00100100
    %00100100
    %00100100
    %00011000
    %00011000
    %00011000
    %00011000
    %00010000
    %00010000
    %00001000
end


   rem ---------------------------------------------------------------------------------
  if winflag = 0 then playfield:
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


  if winflag = 1 then playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X......X.X..........X..........X
 X.X.X..X.X..X.X....XXX........XX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

  if winflag = 2 then playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 X.......................XXX....X
 X..X.......XXX............X....X
 X.........X...X...........X....X
 X.........X...X................X
 X..........XXX.................X
 X...X..........................X
 X..XX................XXXX......X
 X....................XXXX......X
 X....................XXXX......X
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end


   rem ---------------------------------------------------------------------------------
    COLUP0= $70 + (rand & 7)   : rem PLAYER COLUP0=<xx> sets the color of the player 0 sprite. Valid range is 0-254 , randomizes colors 
    COLUP1 = $C0 + (rand & 7)  : rem MONSTER COLUP0=<xx> sets the color of the player 0 sprite. Valid range is 0-254 , randomizes colors 
    COLUPF = $A0 + (rand & 7)  : rem PLAYFIELD You need to set a color for the playfield
    COLUBK = 00                : rem BACKGROUND BALCK Change the background color with COLUBK
    pfscorecolor = 65 + (rand & 7)  : rem Set the health bar color to green   
   rem ---------------------------------------------------------------------------------

   if collision(missile1, player0) then player1x = (rand & 63) + 40 : player0y = (rand & 31) + 30 : COLUBK = $46 + (rand & 2) : playerHealth = playerHealth - 1  :    AUDV0 = 15 : AUDC0 = 10 : AUDF0 = 6 : explosion_timer = 30
   if collision(missile0, player1) then player1x = (rand & 63) + 40 : player1y = (rand & 31) + 30 : missile1y = (rand & 31) + 30 : COLUBK = $46 + (rand & 2) :    AUDV0 = 15 : AUDC0 = 10 : AUDF0 = 6 : explosion_timer = 30

   rem ---------------------------------------------------------------------------------
   if collision(player0,playfield) then gosub knock_player_back : rem if player collides with playfield knockback

   rem ---------------------------------------------------------------------------------
   if joy0fire then AUDV0 = 12 : AUDC0 = 10 : AUDF0 = 19 : rem Play a sound
   if !joy0fire then AUDV0 = 0 : rem Stop the sound when fire is released
   if collision(player0, player1) then player1x = (rand & 63) + 40 : player1y = (rand & 31) + 30 : missile1y = (rand & 31) + 30 : COLUBK = $46 + (rand & 2) : playerHealth = playerHealth - 1  : AUDV0 = 15 : AUDC0 = 10 : AUDF0 = 6 : explosion_timer = 30

   rem ---------------------------------------------------------------------------------
   if explosion_timer > 0 then explosion_timer = explosion_timer - 1 : if explosion_timer = 20 then AUDF0 = 8 : if explosion_timer = 10 then AUDF0 = 12
   if explosion_timer = 0 then AUDV0 = 0

   rem pill removal logic
   if playerHealth = 3 then pfscore1 = %00101010 
   if playerHealth = 2 then pfscore1 = %00001010 
   if playerHealth = 1 then pfscore1 = %00000010 
   if playerHealth = 0 then pfscore1 = %00000000  
   
   rem monster health bar
   if monsterHealth = 3 then pfscore2 = %00101010  
   if monsterHealth = 2 then pfscore2 = %00001010  
   if monsterHealth = 1 then pfscore2 = %00000010  
   if monsterHealth = 0 then pfscore2 = %00000000  : winflag = winflag + 1 : monsterHealth = 10 : playerHealth = 4 : rem iterate levels and reset player health
 rem ---------------------------------------------------------------------------------
   if winflag = 3 then AUDV0 = 0 : explosion_timer = 0 : goto win : rem if beaten 3rd monster win the game
   if playerHealth = 0 then AUDV0 = 0 : goto lose                 : rem player get hit 5 times lose
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
   rem Monster AI: Moves randomly every 40 frames
    if z = 0 then p1x = (rand & 2) - 1 : p1y = (rand & 2) - 1 : z = 30
    if z < 10 then player1x = player1x + p1x : player1y = player1y + p1y
    z = z - 1
    if collision(player1, playfield) then player1x = player1x - p1x * 2 : player1y = player1y - p1y * 2 : p1x = -p1x : p1y = -p1y


   rem ------------------------------------------------------------------
   rem Monster AI: fires randomly left
    if missile1x = 0 then missile1x = player1x : missile1y = player1y : AUDV0 = 10 : AUDC0 = 8 : AUDF0 = 4
    missile1x = missile1x - 1
    if missile1x < 0 then missile1x = 0 : AUDV0 = 0

   drawscreen

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


