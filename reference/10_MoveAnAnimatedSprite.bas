     rem  ---- Sample Program 10 ----

     rem  This program demonstrates how to move an animated sprite.
     rem  It combines Sample Program 3 and Sample Program 5.

     rem  Any non-indented command is taken as a label. This is
     rem  something you can jump to with the 'goto' or 'gosub'
     rem  command.

     rem  Declare Variables:
     rem  I'm going to declare x and y variables for the player's
     rem  position, so I can move him with the joystick later.

  x=50
  y=50

main

     rem  COLUP0=<xx> sets the color of the player 0 sprite. Valid
     rem  range is 0-254.
     rem  Sample Program 3 used 28 (decimal), which is yellow.
     rem  Sample Program 5 used $28 (hexadecimal), which is orange.
     rem  This sample program uses hexadecimal for the color values.

  COLUP0=$28

     rem  Change the background color with COLUBK.

  COLUBK=$02

     rem  f will be used for the frame counter. In Sample Program 5,
     rem  this was y instead of f; but Sample Program 3 uses y for
     rem  the vertical position of player0, so we need to use a
     rem  different variable-- and "f" is a nice little abbreviation
     rem  for "frame"!

  f=f+1

     rem  Here is where you define the shape of the player sprite.
     rem  It's limited to 8 pixels wide, but you can make it as
     rem  tall/long as you want. You have to draw the sprite upside
     rem  down; it's flipped when it's displayed onscreen.

     rem  The 'player0' must be indented, the 'end' must NOT be
     rem  indented.

     rem  The frame counter will be used in animating the sprite.
     rem  We'll draw a different picture for the sprite, depending on
     rem  what the value of f is. Generally, the animation should
     rem  cycle through at least 3 different images to give a decent
     rem  illusion of movement.

  if f=10 then player0:
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

  if f=20 then player0:
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

  if f=30 then player0:
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

     rem  The next statement ensures that f cycles continuously from
     rem  1 to 30 when we perform the "f=f+1" statement up above.

  if f=30 then f=0

     rem  Put the player on the screen at horizontal position x
     rem  (which we initialized to 50). Valid range is 1 to 159.

  player0x=x

     rem  Put the player on the screen at vertical position y (which
     rem  we initialized to 50). Valid range is 1 to ~90.

  player0y=y

     rem  This command instructs the program to write the data for
     rem  the display (picture) to the TV screen.

  drawscreen

     rem  Make the guy move.

  if joy0right then x=x+1
  if joy0left then x=x-1
  if joy0up then y=y-1
  if joy0down then y=y+1

  goto main
