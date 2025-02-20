 rem batari Basic Program
 rem created 4/20/2011 2:17:53 PM by Visual bB Version 1.0.0.554


 rem ___defghijklmnopqrs_uvwxyz
   dim p1_x = b
   dim p1_y = c

 player1x = 75
 player1y = 75
 a = 11

loop
 t = t + 1
 COLUBK = $00
 COLUPF = $0C
 COLUP1 = $BC

 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 X..............................X
 X..............................X
 X...X..........................X
 X....................X.........X
 X....................X.........X
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end


 player1:
 %01001110
 %11001100
 %10001000
 %11011000
 %01011000
 %00111000
 %00110000
 %00110000
 %00110000
 %01110000
 %01111100
 %01111000
 %01110000
 %01110000
 %01110000
 %00110000
 %00110000
 %00011000
 %00011000
 %00011000
end
 drawscreen

 if t = 20 then gosub change_direction
 if t = 21 then t = 0
 if collision(player1,playfield) then gosub knock_player_back
 gosub move_enemy



 goto loop

change_direction
 a = (rand&7) + 4
end
     return


move_enemy
 p1_x = 0
 if a = 8 then p1_x = 1
 if a = 9 then p1_x = 255
 player1x = player1x + p1_x

 p1_y = 0
 if a = 10 then p1_y = 1
 if a = 11 then p1_y = 255
 player1y = player1y + p1_y
end
   return

knock_player_back
   player1x = player1x - p1_x
   player1y = player1y - p1_y
end
   return

