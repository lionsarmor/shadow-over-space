     rem  ---- Sample Program 4 ----
     
     rem  This program demonstrates how to make a sprite fire a missile

 e=0   : rem  counter for firing gun
 c=50  : rem  player0 x position
 d=50  : rem  player0 y position

 dim fire=e
 dim p0y=d
 dim p0x=c

main

 player0y=p0y
 player0x=p0x

 COLUBK=$02
 COLUP1=$28

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

 if x>140 || missile0x>140 then missile0y=11

 if !joy0fire then fire=0 : x=p0x : missile0x=0 : missile0y=0

 if joy0fire then missile0x=x+8:missile0y=p0y-y-6

 if fire<60 && missile0x>135 then missile0y=0
 if fire<60 then x=x+2 else missile0y=0
 if fire>250 then fire=25

 fire=fire+1
 
 drawscreen

 goto main
