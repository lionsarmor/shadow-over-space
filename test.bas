 rem ----------------------------------------------------------------------------
 rem Declare Variables
 rem ----------------------------------------------------------------------------
 dim shooting  rem Replaces fire variable
 dim missile0x
 dim missile0y
 dim player1x
 dim player1y
 dim e
 dim w
 dim a
 dim b
 dim c  rem Needed for c{} bitfield variables

 rem Direction tracking variables
 c{1} = 0  rem UP
 c{2} = 0  rem DOWN
 c{3} = 0  rem LEFT
 c{4} = 1  rem RIGHT (Default)
 c{5} = 0  rem UP+LEFT
 c{6} = 0  rem UP+RIGHT
 c{7} = 0  rem DOWN+LEFT
 c{0} = 0  rem DOWN+RIGHT

 rem ----------------------------------------------------------------------------
 rem Initialize Player Position
 rem ----------------------------------------------------------------------------
 a = 76   : rem Player X
 b = 50   : rem Player Y
 e = 20   : rem Missile Travel Counter
 w = 0    : rem Player reflection (for mirroring)

 rem ----------------------------------------------------------------------------
 rem Game Loop
 rem ----------------------------------------------------------------------------
start

 drawscreen

 rem ----------------------------------------------------------------------------
 rem Track the last direction moved
 rem ----------------------------------------------------------------------------
 if joy0up then c{1}=1 : c{2}=0 : c{3}=0 : c{4}=0 : c{5}=0 : c{6}=0 : c{7}=0 : c{0}=0
 if joy0down then c{1}=0 : c{2}=1 : c{3}=0 : c{4}=0 : c{5}=0 : c{6}=0 : c{7}=0 : c{0}=0
 if joy0left then c{1}=0 : c{2}=0 : c{3}=1 : c{4}=0 : c{5}=0 : c{6}=0 : c{7}=0 : c{0}=0
 if joy0right then c{1}=0 : c{2}=0 : c{3}=0 : c{4}=1 : c{5}=0 : c{6}=0 : c{7}=0 : c{0}=0

 rem ----------------------------------------------------------------------------
 rem Set Player Sprite Color
 rem ----------------------------------------------------------------------------
 COLUP1 = 28
 COLUP0 = 28

 rem ----------------------------------------------------------------------------
 rem Player Movement
 rem ----------------------------------------------------------------------------
 if joy0up then b = b - 1
 if joy0down then b = b + 1
 if joy0left then a = a - 1
 if joy0right then a = a + 1

 player1x = a
 player1y = b

 rem ----------------------------------------------------------------------------
 rem Fire Missile in 8 Directions
 rem ----------------------------------------------------------------------------
 e = e + 1
 if e > 20 then e = 0

 if !joy0fire then shooting = 0 : missile0x = 0 : missile0y = 0 : e = 0

 if joy0fire && shooting = 0 then shooting = 1

 if shooting = 1 then
    if c{3} then missile0x = player1x - e : missile0y = player1y - 5
    if c{4} then missile0x = player1x + 8 + e : missile0y = player1y - 5
    if c{1} then missile0x = player1x + 5 : missile0y = player1y - 10 - e
    if c{2} then missile0x = player1x + 5 : missile0y = player1y + 3 + e
endif

 rem ----------------------------------------------------------------------------
 rem Keep Player Facing the Right Direction
 rem ----------------------------------------------------------------------------
 if joy0left then w=8 : REFP1=8
 if joy0right then w=0 : REFP1=0

 rem ----------------------------------------------------------------------------
 rem Player Animation (With Standing Still Logic)
 rem ----------------------------------------------------------------------------
 y = y + 1
 if y > 30 then y = 0 

 goto start
