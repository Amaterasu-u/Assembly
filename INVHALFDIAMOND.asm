.MODEL SMALL
.STACK 100H
.DATA 

 N1 DB 0 
  N2 DB 0
   N3 DB 0
 I DB 0
 J DB 0
 K DB 0
 HOLDI DB 0
 HOLDN DB 0  
 LEVEL DB 0 
 ROWS DB 0
 
.CODE

MAIN PROC
    
MOV AH,01H
INT 21H
SUB AL,'0'
MOV N1,AL
MOV N2,AL
MOV N3,AL



MOV CL,1

LUPI:

CMP CL,N
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    MAIN ENDP
END MAIN