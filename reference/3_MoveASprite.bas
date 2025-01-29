     rem  ---- Sample Program 3 ----
     
     rem  This program demonstrates how to move a sprite 
  
     rem  any non-indented command is taken as a label.  This is something you can jump to with
     rem  the 'goto' or 'gosub' command.

     rem  Declare Variables
     rem   I'm going to declare X and Y variables for the player's position, so I can move him with 
     rem   the joystick later.

     x=50
     y=50

main

     rem  COLUP0=<xx> sets the color of the player 0 sprite. Valid range is 0-254

 COLUP0=28

     rem  Change the background color with COLUBK

 COLUBK=02

     rem  Here is where you define the shape of the player sprite.  It's limited to
     rem  8 pixels wide, but you can make it as tall/long as you want.
     rem  You have to draw the sprite upside down, it's flipped when it's displayed onscreen.

     rem  the 'player0' must be indented, the 'end' must NOT be indented.

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

     rem  Put the player on the screen at X position 50.  Valid Range is 1 to 159

 player0x=x

     rem  Put the player on the screen at Y position 50.  Valid Range is 1 to ~90

 player0y=y

     rem  this command instructs the program to write data to the TV screen.

 drawscreen


     rem Make the guy move

 if joy0right then x=x+1
 if joy0left then x=x-1
 if joy0up then y=y-1
 if joy0down then y=y+1

  goto main

 

     rem ----------------------------------------------------------------------------
     rem here's what the entire program looks like with no comments cluttering it up: 
     rem ----------------------------------------------------------------------------

 x=50
 y=50

main2

 COLUP0=28
 COLUBK=02

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

 player0x=x
 player0y=y

 drawscreen

 if joy0right then x=x+1
 if joy0left then x=x-1
 if joy0up then y=y-1
 if joy0down then y=y+1

 goto main2
