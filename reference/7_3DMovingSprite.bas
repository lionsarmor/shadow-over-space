 a=44
 c=60
 
main 

 COLUBK=2
 COLUP0=28

 if a<1 then a=44 
 if a>43 then c=70:a=1

 if a>35 then c=c-1: goto sprite4
 if a>25 && a<36 then c=c-1: goto sprite3
 if a>15 && a<26 then c=c-1: goto sprite2
 if a>2 && a<16 then c=c-1: goto sprite1
returnhere

 a=a+1

 player0x=c:player0y=a

 drawscreen

 goto main

sprite1
 player0:
 %00011000
 %00011000
 %00000000
 %00000000
 %00000000
 %00000000
end 
 goto returnhere

sprite2
 player0:
 %00111100
 %00111100
 %00111100
 %00000000
 %00000000
 %00000000
end 
 goto returnhere

sprite3
 player0:
 %01111110
 %01111110
 %01111110
 %01111110
 %01111110
 %00000000
 %00000000
end 
 goto returnhere

sprite4
 player0:
 %11111111
 %11111111
 %11111111
 %11111111
 %11111111
 %11111111
 %11111111
end 
 goto returnhere

