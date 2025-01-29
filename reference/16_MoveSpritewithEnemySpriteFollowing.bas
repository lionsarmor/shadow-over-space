     rem  ---- Sample Program 16 ----
     
     rem  This program demonstrates how to move a sprite and how to have a second ('enemy') sprite follow it.
  
     rem  any non-indented command is taken as a label.  This is something you can jump to with
     rem  the 'goto' or 'gosub' command.

     rem  Declare Variables
     rem   I'm going to declare X and Y variables for the player's position, so I can move him with 
     rem   the joystick later.
     rem   The V and W variables will be the X and Y locations for the enemy sprite

     v=130 :rem enemy X position
     w=20  :rem enemy Y position

     x=50  :rem player X position
     y=50  :rem player Y position

     t=0   :rem I'm including a timer to slow down the movement of the enemy sprite

main

     rem  COLUP0=<xx> sets the color of the sprite. Valid range is 0-254.

 COLUP0=28 :rem Color of player sprite
 COLUP1=66 :rem Color of enemy sprite

     rem  Change the background color with COLUBK

 COLUBK=02

     rem  Here is where you define the shape of the player sprite.  It's limited to
     rem  8 pixels wide, but you can make it as tall/long as you want.
     rem  You have to draw the sprite upside down, it's flipped when it's displayed onscreen.

     rem  the 'player0' must be indented, the 'end' must NOT be indented.

     rem player sprite:

 player0:
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

    rem enemy sprite:

 player1:
 %00011000
 %00100100
 %01000010
 %10111100
 %10000001
 %10100101
 %01000010
 %00100100
 %00011000
end

     rem  Put the player sprite on the screen at X position 50.  Valid Range is 1 to 159

 player0x=x

     rem  Put the player sprite on the screen at Y position 50.  Valid Range is 1 to ~90

 player0y=y

     rem  Put the enemy sprite on the screen at X position 130.  Valid Range is 1 to 159

 player1x=v

     rem  Put the enemy sprite on the screen at Y position 20.  Valid Range is 1 to ~90

 player1y=w

     rem  this command instructs the program to write data to the TV screen.

 drawscreen

     rem Make the player sprite move with the joystick

 if joy0right then x=x+1
 if joy0left then x=x-1
 if joy0up then y=y-1
 if joy0down then y=y+1

     rem Next, we want to make the enemy sprite follow the player sprite.

     rem First, I'm going to use the T variable as a timer and make it count to 10 and then start over

 t=t+1
 if t>10 then t=1

     rem Next, I'm going to have the routine that moves the enemy be skipped if t is less than 7.
     rem The number can be reduced to speed up enemy movement.

 if t<7 then goto skipmovement

 if v < x then v=v+1
 if v > x then v=v-1
 if w < y then w=w+1
 if w > y then w=w-1

skipmovement

  goto main

 