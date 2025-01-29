 rem Created using Atari Dev Studio
 rem batari Basic format
 rem Author: James Weeks
   
   ;****************************************************************
   ;
   ;  This program uses the DPC+ kernel.
   ;
   set kernel DPC+


   ;****************************************************************
   ;
   ;  Standard used in North America and most of South America.
   ;
   set tv ntsc


   ;****************************************************************
   ;
   ;  NTSC colors.
   ;
   ;  Use these constants so you can quickly and easily swap them
   ;  out for PAL-60 colors. Or use this if you created a PAL-60
   ;  game and want to instantly convert the colors to NTSC (if you
   ;  were already using the PAL-60 constants).
   ;
   const _00 = $00
   const _02 = $02
   const _04 = $04
   const _06 = $06
   const _08 = $08
   const _0A = $0A
   const _0C = $0C
   const _0E = $0E
   const _10 = $10
   const _12 = $12
   const _14 = $14
   const _16 = $16
   const _18 = $18
   const _1A = $1A
   const _1C = $1C
   const _1E = $1E
   const _20 = $20
   const _22 = $22
   const _24 = $24
   const _26 = $26
   const _28 = $28
   const _2A = $2A
   const _2C = $2C
   const _2E = $2E
   const _30 = $30
   const _32 = $32
   const _34 = $34
   const _36 = $36
   const _38 = $38
   const _3A = $3A
   const _3C = $3C
   const _3E = $3E
   const _40 = $40
   const _42 = $42
   const _44 = $44
   const _46 = $46
   const _48 = $48
   const _4A = $4A
   const _4C = $4C
   const _4E = $4E
   const _50 = $50
   const _52 = $52
   const _54 = $54
   const _56 = $56
   const _58 = $58
   const _5A = $5A
   const _5C = $5C
   const _5E = $5E
   const _60 = $60
   const _62 = $62
   const _64 = $64
   const _66 = $66
   const _68 = $68
   const _6A = $6A
   const _6C = $6C
   const _6E = $6E
   const _70 = $70
   const _72 = $72
   const _74 = $74
   const _76 = $76
   const _78 = $78
   const _7A = $7A
   const _7C = $7C
   const _7E = $7E
   const _80 = $80
   const _82 = $82
   const _84 = $84
   const _86 = $86
   const _88 = $88
   const _8A = $8A
   const _8C = $8C
   const _8E = $8E
   const _90 = $90
   const _92 = $92
   const _94 = $94
   const _96 = $96
   const _98 = $98
   const _9A = $9A
   const _9C = $9C
   const _9E = $9E
   const _A0 = $A0
   const _A2 = $A2
   const _A4 = $A4
   const _A6 = $A6
   const _A8 = $A8
   const _AA = $AA
   const _AC = $AC
   const _AE = $AE
   const _B0 = $B0
   const _B2 = $B2
   const _B4 = $B4
   const _B6 = $B6
   const _B8 = $B8
   const _BA = $BA
   const _BC = $BC
   const _BE = $BE
   const _C0 = $C0
   const _C2 = $C2
   const _C4 = $C4
   const _C6 = $C6
   const _C8 = $C8
   const _CA = $CA
   const _CC = $CC
   const _CE = $CE
   const _D0 = $D0
   const _D2 = $D2
   const _D4 = $D4
   const _D6 = $D6
   const _D8 = $D8
   const _DA = $DA
   const _DC = $DC
   const _DE = $DE
   const _E0 = $E0
   const _E2 = $E2
   const _E4 = $E4
   const _E6 = $E6
   const _E8 = $E8
   const _EA = $EA
   const _EC = $EC
   const _EE = $EE
   const _F0 = $F0
   const _F2 = $F2
   const _F4 = $F4
   const _F6 = $F6
   const _F8 = $F8
   const _FA = $FA
   const _FC = $FC
   const _FE = $FE


   goto __Bank_2 bank2


   bank 2
   temp1=temp1


__Bank_2


   playfield:
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ..........X.........X...........
   ..........X.........X...........
   ..........XX........X...........
   X.........XX........X...........
   X.........XX........X...........
   X.X.......XX.......XX.........X.
   XXX.......XX.......XX.........X.
   XXX.......XX.......XX.........X.
   XXX.......XX.......XX.........X.
   XXX.......XX.......XX.........X.
   XXX.......XX.......XX.........X.
   XXX.......XX.......XX.........X.
   XXX.......XX.......XX.........XX
   XXX.......XX.......XX.........XX
   XXX.......XX......XXX.........XX
   XXX.......XX......XXXX........XX
   XXX...X.X.XX......XXXX........XX
   XXX...X.X.XX......XXXX........XX
   XXX...X.X.XX......XXXX........XX
   XXX.X.X.X.XX......XXXX.......XXX
   XXX.X.X.X.XX......XXXX.......XXX
   XXX.X.X.X.XX......XXXX.......XXX
   XXXXX.X.X.XX..X...XXXX.......XXX
   XXXXX.X.X.XX..X...XXXX.......XXX
   XXXXX.X.X.XX..X...XXXX.X...X.XXX
   XXXXX.X.X.XX..X...XXXX.X...X.XXX
   XXXXX.X.X.XX.XX..XXXXX.X...X.XXX
   XXXXX.X.X.XX.XX..XXXXX.X...X.XXX
   XXXXX.X.X.XX.XX..XXXXX.X...X.XXX
   XXXXXXX.XXXX.XX..XXXXXXX.X.XXXXX
   XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end


   pfcolors:
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
   _00
end


   bkcolors:
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
   _A0
end

 rem initilize player 0 sprite
 player0:
  %01111110  ; Helmet
  %11000011  ; Top armor
  %11110111  ; Shoulders
  %11011101  ; Arms and chest
  %11111111  ; Full torso
  %00111100  ; Waistline
  %01010010  ; Legs
  %00110011  ; Boots
end

 rem sets the location of player 0
 player0x = 16
 player0y = 16

 rem sets the location of player 1
 player1x = 32
 player1y = 32

 
 e=0   : rem  counter for firing gun
 c=50  : rem  player0 x position
 d=50  : rem  player0 y position

 dim fire=e
 dim p0y=d
 dim p0x=c

__Main_Loop

 rem *********************** move player 0 sprite left and right
 rem Normal player sprite
 if joy0right then player0:
  %01111110  ; Helmet
  %11000011  ; Top armor
  %11110111  ; Shoulders
  %11011101  ; Arms and chest
  %11111111  ; Full torso
  %00111100  ; Waistline
  %01010010  ; Legs
  %00110011  ; Boots
end

 rem ************************ Mirrored player sprite
 if joy0left then player0:
  %01111110  ; Helmet (same)
  %11000011  ; Top armor (same)
  %11101111  ; Shoulders (mirrored)
  %10111011  ; Arms and chest (mirrored)
  %11111111  ; Full torso (same)
  %00111100  ; Waistline (same)
  %01001010  ; Legs (mirrored)
  %11001100  ; Boots (mirrored)
end

 rem player 0 missle
 if x>140 || missile0x>140 then missile0y=11

 if !joy0fire then fire=0 : x=p0x : missile0x=0 : missile0y=0

 if joy0fire then missile0x=x+8:missile0y=p0y-y-6

 if fire<60 && missile0x>135 then missile0y=0
 if fire<60 then x=x+2 else missile0y=0
 if fire>250 then fire=25

 fire=fire+1


 rem set player 0 gradient
 player0color:
   $40
   $40
   $42
   $42
   $44
   $44
   $46
   $48
   $4A
   $4C
   $4E
   $50
   $52
   $54
   $56
   $58
   $5A
   $5C
   $5E
   $60
   $60
   $60
   $60
   $60
   $60
end


 rem ************************** animate monster 

 rem original sprite
 rem set y variable for initial animation
 y=y+1
 
  if y=10 then player1: 
   %01111110
   %00011111
   %00001111
   %00001110
   %00011100
   %00011101
   %11011001
   %01011011
   %11111110
   %00111000
   %01111110
   %00111100
   %11111111
   %11111100
   %01111111
   %10111001
   %00111001
   %00111000
   %11111100
   %01011110
   %00011110
   %00001111
   %00001111
   %01111110
end

 rem original color
 player1color:
 $B4
 $B4
 $B4
 $B4
 $B4
 $B4
 $B4
 $B2
 $B2
 $C2
 $B2
 $C2
 $B2
 $B2
 $B2
 $C2
 $B2
 $B2
 $B4
 $B4
 $B4
 $B4
 $B4
 $B4
end

 rem mirrored sprite 
 if y=20 then player1:
   %00111110
   %00001111
   %00111110
   %00011110
   %01011110
   %11111100
   %00111000
   %00111001
   %10111001
   %01111111
   %11111100
   %11111111
   %00111100
   %01111110
   %00111000
   %11111110
   %01011011
   %11011001
   %00011101
   %00011100
   %00011110
   %00001111
   %00011111
   %01111110
end

 rem mirrored color
 player1color:
 $A0
 $A0
 $A0
 $A0
 $A0
 $B2
 $B2
 $B2
 $C2
 $B2
 $B2
 $B2
 $C2
 $B2
 $C2
 $B2
 $B2
 $B2
 $A0
 $A0
 $A0
 $A0
 $A0
 $A0
end
 
 rem resets the y variable set for animation
 if y>30 then y=0 

 rem defines joystick controls for joystick 0 & player 0
 if joy0up then player0y    = player0y - 1 : goto control_done
 if joy0down then player0y  = player0y + 1 : goto control_done
 if joy0left then player0x  = player0x - 1 : goto control_done
 if joy0right then player0x = player0x + 1 : goto control_done
 
 rem adds collision for the player and items
 if collision(player0, player1) then score = score + 1 : player1x = rand&127 : player1y = rand&63

control_done

   ;***************************************************************
   ;
   ;  Displays the screen.
   ;
   drawscreen

   ;***************************************************************
   ;
   ;  88 rows that are 2 scanlines high.
   ;
   DF6FRACINC = 255 ; Background colors.
   DF4FRACINC = 255 ; Playfield colors.

   DF0FRACINC = 128 ; Column 0.
   DF1FRACINC = 128 ; Column 1.
   DF2FRACINC = 128 ; Column 2.
   DF3FRACINC = 128 ; Column 3.



   ;***************************************************************
   ;
   ;  Simple fix for the top two lines having the same color.
   ;
   asm
   lda DF6FRACDATA
   lda DF4FRACDATA
end
   
   rem resets game loop
   goto __Main_Loop



  