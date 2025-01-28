   set romsize 4k
   const logo_color=$00
   const logo_height=75
   COLUBK=$A0      

   playfield:
   .X...X.XXXXX.X.....X......XXX...
   .X...X.X.....X.....X.....X...X..
   .XXXXX.XXX...X.....X.....X...X..
   .X...X.X.....X.....X.....X...X..
   .X...X.XXXXX.XXXXX.XXXXX..XXX...
   ................................
   X.....X..XXX..XXXXX.X.....XXXX..
   X.....X.X...X.X...X.X.....X...X.
   X..X..X.X...X.XXXXX.X.....X...X.
   .X.X.X..X...X.X..X..X.....X...X.
   ..X.X....XXX..X...X.XXXXX.XXXX..
end

SubTitleLoop
   if joy0fire then goto SubMainLoop
   gosub drawlogo
   goto SubTitleLoop

SubMainLoop
   COLUPF=$00
   drawscreen
   goto SubMainLoop

   inline abb.asm
