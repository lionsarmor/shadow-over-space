
 dim ea = a
 dim dy = b
 dim dx = c
 dim x1 = temp1
 dim x0 = temp2
 dim y1 = temp3
 dim y0 = temp4
 dim delay = h
 dim rand16 = z

 player0:
 %11000000
 %11000000
 %00000000
 %00000000
 %00000000
 %00000000
 %00000000
 %00000000
end

 player1:
 %11110000
 %11110000
 %11110000
 %11110000
 %00000000
 %00000000
 %00000000
 %00000000
end
 
 player1x = 150 : player1y = 60
 player0x = 10  : player0y = 15

 var40 = $55

 d = 15

 goto enter

loop

 COLUP0 = $1C
 COLUP1 = $B4
 COLUPF = $62
 drawscreen

 if delay then delay = delay - 1 : goto loop
 if !joy0fire then loop

 if !collision(player0, player1) then gosub move : goto loop
 delay = 60
 player0y = rand & $3F : player0y = (player0y / 8) + player0y + 8
 player0x = rand & $7F : player0x = (player0x / 8) + player0x + 16
 player1y = rand & $3F : player1y = (player1y / 8) + player1y + 8
 player1x = rand & $7F : player1x = (player1x / 8) + player1x + 16

enter
 x0 = player0x + 1 : y0 = player0y + 1
 x1 = player1x + 1 : y1 = player1y

 gosub setup_move
 goto loop


move
  temp1 = ea

  if f{0} then skip
  player0y = player0y + yinc[f]
  ea = ea - dx
  if temp1 < ea then ea = ea + dy : player0x = player0x + xinc[f] 
  return
skip
  player0x = player0x + xinc[f]
  ea = ea - dy
  if temp1 < ea then ea = ea + dx : player0y = player0y + yinc[f]  
  return



setup_move
 if x0 < x1 then f{2} = 1 : dx = x1 - x0 else f{2} = 0 : dx = x0 - x1
 if y0 < y1 then f{1} = 1 : dy = y1 - y0 else f{1} = 0 : dy = y0 - y1

 if dx > dy then f{0} = 1 : ea = dx else f{0} = 0 : ea = dy 
 var36 = f
 return

  data yinc
  $FF, $FF, $01, $01, $FF, $FF,$01, $01
end

  data xinc
  $FF, $FF, $FF, $FF, $01, $01, $01, $01
end

