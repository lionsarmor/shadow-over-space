   rem ----------------------------------------------------------------------------
   rem Demo for moving an animated sprite that can fire a missile in any direction
   rem   
   rem   You can move around your sprite and fire in any direction.
   rem
   rem  In trying to keep this code as short as possible, I left out the following:
   rem   There is no collision detection
   rem   There are no enemies to shoot at
   rem   player movement is not restricted, you can move off of the screen
   rem   There is no defined playfield
   rem ----------------------------------------------------------------------------
 
   rem ----------------------------------------------------------------------------
   rem  Variables
   rem
   rem     I set the inital direction of the joystick to RIGHT, so when you start
   rem     the game for the first time you're able to fire the gun before you move
   rem
   rem ----------------------------------------------------------------------------
   a=76   :rem player1x location
   b=50   :rem player1y location
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
   e=20   :rem Counter for limiting travel of fired missile
   w=0    :rem Used to determine player reflection (REFP1) 
   rem ----------------------------------------------------------------------------

start

   drawscreen

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
   rem  Set color of player sprites and missiles
   rem ------------------------------------------------------------------
   COLUP1=28
   COLUP0=28

   rem ------------------------------------------------------------------
   rem  Set initial location of player sprite
   rem ------------------------------------------------------------------
   player1x=a:player1y=b

   rem ------------------------------------------------------------------
   rem  Increase 20 to a larger number to make the bullets travel farther
   rem ------------------------------------------------------------------
   e=e+1
   if e>20 then e=0

   rem ------------------------------------------------------------------
   rem  Player Movement
   rem ------------------------------------------------------------------
   if joy0up then b=b-1
   if joy0down then b=b+1
   if joy0left then a=a-1
   if joy0right then a=a+1

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
   if joy0fire && c{0} then missile0x=player1x+7+e:missile0y=player1y-3+e
   if joy0fire && c{5} then missile0x=player1x-e:missile0y=player1y-7-e
   if joy0fire && c{7} then missile0x=player1x-e:missile0y=player1y+1+e
   if joy0fire && c{6} then missile0x=player1x+7+e:missile0y=player1y-7-e

   rem left and right shots
   if joy0fire && c{3} then missile0x=player1x-e:missile0y=player1y-5
   if joy0fire && c{4} then missile0x=player1x+8+e:missile0y=player1y-5

   rem up and down shots
   if joy0fire && c{1} then missile0x=player1x+5:missile0y=player1y-10-e
   if joy0fire && c{2} then missile0x=player1x+5:missile0y=player1y+3+e

   rem ------------------------------------------------------------------
   rem This stops the animation and shows a still sprite when you're 
   rem not moving.
   rem ------------------------------------------------------------------
   if !joy0up && !joy0down && !joy0left && !joy0right then y=30 :goto still 

   rem ------------------------------------------------------------------
   rem stillreturn is put in as a marker to return back from the sub
   rem that changes the sprite to a still, non moving image.
   rem ------------------------------------------------------------------
stillreturn

   rem ------------------------------------------------------------------
   rem Player Animation
   rem   Y is the counter for the player animation.  You can change the
   rem   animation rate by changing the 30,20,10 to a different 
   rem   sequence of numbers.
   rem ------------------------------------------------------------------

   y=y+1
 
   if y=30 then player1: 
        %00000110
        %00100100
        %00110100
        %00011000
        %00000000
        %10011110
        %01100100
        %00010000
        %00011000
        %00111100
        %00011000
end
  if y=20 then player1:
        %01000000
        %01100011
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
  if y=10 then player1:
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

   if y>30 then y=0 

   rem ------------------------------------------------------------------
   rem This will make the player face left when moving left.
   rem ------------------------------------------------------------------
   if !joy0left && !joy0right then skipref
   if joy0left then w=8:REFP1=8
   if joy0right then w=0:REFP1=0
skipref

 goto start 

   rem ------------------------------------------------------------------
   rem Display a "still" sprite when the player is not moving.
   rem ------------------------------------------------------------------
still
    player1:
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
    goto stillreturn


