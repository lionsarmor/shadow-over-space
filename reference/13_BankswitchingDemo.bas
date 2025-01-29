 rem ------------------------------------------------------------------------
 rem Bankswitching Demo
 rem ------------------------------------------------------------------------
 rem
 rem  This program shows how to use bankswitching.  It runs a playfield
 rem  animation with each playfield change being stored in a different bank.
 rem
 rem  When you jump to another bank, you need to specify the bank number
 rem     goto subroutine bank2
 rem     gosub subroutine bank2
 rem 
 rem  When you return to the original bank from the called subroutine,
 rem  you need to specify the bank with a goto, and specify
 rem  if you're returning to the same bank or not with a gosub.
 rem  Be careful with gosub, if you put in the wrong paramater your
 rem  game could crash.
 rem
 rem  Specify the bank number with a simple "bank #" statement. It
 rem  should be indented.  You get 2 banks in 8K, 4 banks in 16k, and
 rem  8 banks in 32k.  This sample uses 4 banks/16k.
 rem
 rem  Here are some samples, assume your original call to the sub is in
 rem  bank 1:
 rem
 rem  ---Using Goto---
 rem    
 rem     goto subroutine bank2
 rem  subroutinereturn       :rem place a subroutine title to return back to...
 rem
 rem   bank 2 
 rem  subroutine
 rem     <code>
 rem     goto subroutinereturn bank1
 rem
 rem
 rem ---Using Gosub---
 rem You must specify whether or not you are returning to the same bank when
 rem you return.
 rem
 rem     gosub subroutine bank2
 rem
 rem   bank 2
 rem  subroutine
 rem     <code>
 rem   return otherbank  
 rem  
 rem  if you're making a gosub call from within the same bank, use this:
 rem
 rem   return thisbank
 rem
 rem ------------------------------------------------------------------------

 rem ----------------------------------------------------------
 rem set ROM size to 16k, which gives us four banks of 4K each.
 rem ----------------------------------------------------------
 set romsize 16k

 rem ----------------------------------------------------------
 rem Set up variables for frame counter. Change these numbers
 rem to alter the animation speed. (5,10,15 would be faster).
 rem ----------------------------------------------------------
 x=10 : rem Counter number - when to switch to frame 2
 y=20 : rem Counter number - when to switch to frame 3
 z=30 : rem Counter number - when to switch to frame 4

main

 rem ----------------------------------------------------------
 rem Set color of playfield to Yellow, background to black
 rem ---------------------------------------------------------- 
 COLUPF=28
 COLUBK=0
 COLUP1=44

 rem ----------------------------------------------------------
 rem Set frame counter for playfield animation
 rem ---------------------------------------------------------- 
 b=b+1
 if b>30 then b=0

 rem ----------------------------------------------------------
 rem Change the playfield based on the frame counter
 rem ---------------------------------------------------------- 
 if b=x then goto frame1 bank2
 if b=y then goto frame2 bank3
 if b=z then goto frame3 bank4

 rem ----------------------------------------------------------
 rem Call player0 with a gosub to a different bank
 rem ---------------------------------------------------------- 
 gosub getplayer bank4
 player1x=74:player1y=70

 drawscreen

framereturn

 goto main

 bank 2

frame1
 playfield:
 ..............XX................
 .............X..X...............
 ............X....X..............
 ...........X......X.............
 ..........X........X............
 .........X..........X...........
 ........X............X..........
 .......X..............X.........
 ......X................X........
 .....X..................X.......
 ....X....................X......
 ...X......................X.....
end
 goto framereturn bank1

 bank 3

frame2
 playfield:
 ................................
 ................................
 ................................
 ..............XX................
 .............X..X...............
 ............X....X..............
 ...........X......X.............
 ..........X........X............
 .........X..........X...........
 ........X............X..........
 .......X..............X.........
 ......X................X........
end
 goto framereturn bank1

 bank 4
 
frame3
 playfield:
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ..............XX................
 .............X..X...............
 ............X....X..............
 ...........X......X.............
 ..........X........X............
 .........X..........X...........
end
 goto framereturn bank1

getplayer
 player1:
 %11000110
 %01101100
 %00101000
 %00010000
 %01111100
 %00010000
 %00111000
 %00111000
 %00111000
end
 return otherbank
 