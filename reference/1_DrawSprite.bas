     rem  ---- Sample Program 1 ----
     
     rem  This program simply draws a yellow sprite on a black background 
  
     rem  any non-indented command is taken as a label.  This is something you can jump to with
     rem  the 'goto' or 'gosub' command.

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

 player0x=50

     rem  Put the player on the screen at Y position 50.  Valid Range is 1 to ~90

 player0y=50

     rem  this command instructs the program to write data to the TV screen.

 drawscreen

     rem you have to have a game loop, so tell the program to jump back to the beginning.

 goto main

     rem ----------------------------------------------------------------------------
     rem here's what the entire program looks like with no comments cluttering it up: 
     rem ----------------------------------------------------------------------------

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

 player0x=50
 player0y=50

 drawscreen

 goto main2