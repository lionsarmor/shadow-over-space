   dim p0_x = b
   dim p0_y = c

   player0:
   %01101100
   %00101000
   %00111000
   %00010000
   %11111110
   %00010000
   %00111000
   %00111000
   %00111000
end

   COLUBK = 0
   COLUPF = 144

   player0x = 92
   player0y = 47

main

   playfield:
   XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   XX............................XX
   XX............................XX
   XX............................XX
   XX............................XX
   XX............................XX
   XX............................XX
   XX............................XX
   XX............................XX
   XX............................XX
   XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

   COLUP0 = 28

   p0_x = 0
   if joy0left then p0_x = 255
   if joy0right then p0_x = 1
   player0x = player0x + p0_x

   p0_y = 0
   if joy0up then p0_y = 255
   if joy0down then p0_y = 1
   player0y = player0y + p0_y


   drawscreen

   if collision(player0,playfield) then gosub knock_player_back

   goto main

knock_player_back
   player0x = player0x - p0_x
   player0y = player0y - p0_y
   return






