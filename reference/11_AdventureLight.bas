     rem  ---- Adventure 'Light' Sample Program ----

     rem  This program demonstrates how to move an animated sprite.
     rem  It combines previous sample programs I've written, and
     rem  adds an invisible playfield along with the 'light' sprite
     rem  that surrounds the player in the mazes in the original
     rem  Atari adventure game.

     rem  Any non-indented command is taken as a label. This is
     rem  something you can jump to with the 'goto' or 'gosub'
     rem  command.

     rem  Declare Variables:
     rem  I'm going to declare x and y variables for the player's
     rem  position, so I can move him with the joystick later.

  x=50
  y=50
 
     rem Add Static Playfield

 playfield:
 X..............................X
 XXXXXXXXXXXXXXXXXXXX..........XX
 X..................X...........X
 X..............................X
 XX............................XX
 X..............................X
 X..............................X
 XX............................XX
 X.........X....................X
 X.........XXXXXXXXXXXXXXXXXXXXXX
 X..............................X
end

     rem Change the color of the playfield to black to match the 
     rem background color.  We want the walls to be invisible for
     rem this sample.

  COLUPF=0

main

    rem Set NUSIZ to make light sprite quad sized. 
    rem
    rem Value  Effect  
    rem $0x    (x = don't care) missile = 1 pixel wide 
    rem $1x    missile = 2 pixels wide 
    rem $2x    missile = 4 pixels wide 
    rem $3x    missile = 8 pixels wide 
    rem $x0    one copy of player and missile 
    rem $x1    two close copies of player and missile 
    rem $x2    two medium copies of player and missile 
    rem $x3    three close copies of player and missile 
    rem $x4    two wide copies of player and missile 
    rem $x5    double-sized player 
    rem $x6    three medium copies of player and missile 
    rem $x7    quad-sized player 

  NUSIZ0=$07

    rem Set CTRLPF so light sprite moves behind playfield
    rem
    rem Value  Effect  
    rem $0x    (x = don't care) ball = 1 pixel wide 
    rem $1x    ball = 2 pixels wide 
    rem $2x    ball = 4 pixels wide 
    rem $3x    ball = 8 pixels wide 
    rem $x1    none of the below 
    rem $x3    left half of PF gets player0 color, 
    rem        right half gets player1 color 
    rem $x5    players move behind playfield 
    rem $x7    both of the above 

  CTRLPF=$05

    rem position light sprite so it surrounds player sprite
    rem and moves with it

  player0x=player1x-13:player0y=player1y+11

     rem  COLUP0=<xx> sets the color of the player 0 sprite. Valid
     rem  range is 0-254.
     rem  Sample Program 3 used 28 (decimal), which is yellow.
     rem  Sample Program 5 used $28 (hexadecimal), which is orange.
     rem  This sample program uses hexadecimal for the color values.

  COLUP0=$28
  COLUP1=$98

     rem  Change the background color with COLUBK. Changing to same
     rem  color as playfield to make playfield invisible.

  COLUBK=$00

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

  if f=10 then player1:
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

  if f=20 then player1:
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

  if f=30 then player1:
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

 rem This defines the adventure 'light' sprite

light
 player0:
  %01111110
  %11111111
  %11111111
  %11111111
  %11111111
  %11111111
  %11111111
  %11111111
  %11111111
  %11100111
  %11000011
  %11000011
  %11000011
  %11000011
  %11000011
  %11000011
  %11000011
  %11000011
  %11000011
  %11000011
  %11000011
  %11000011
  %11000011
  %11100111
  %11111111
  %11111111
  %11111111
  %11111111
  %11111111
  %11111111
  %11111111
  %01111110
end

     rem  The next statement ensures that f cycles continuously from
     rem  1 to 30 when we perform the "f=f+1" statement up above.

  if f=30 then f=0

     rem  Put the player on the screen at horizontal position x
     rem  (which we initialized to 50). Valid range is 1 to 159.

  player1x=x

     rem  Put the player on the screen at vertical position y (which
     rem  we initialized to 50). Valid range is 1 to ~90.

  player1y=y

     rem  This command instructs the program to write the data for
     rem  the display (picture) to the TV screen.

  drawscreen

     rem  Make the guy move.

  if joy0right then x=x+1
  if joy0left then x=x-1
  if joy0up then y=y-1
  if joy0down then y=y+1

  goto main
