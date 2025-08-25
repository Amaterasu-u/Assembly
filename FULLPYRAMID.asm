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
 
.CODE

MAIN PROC
    
 MOV AH,01H
 INT 21H
 SUB AL,'0'
 
 MOV N1,AL
 MOV N2,AL
 MOV N3,AL
 
 MOV AH,02H
 MOV DL,0AH
 INT 21H
 MOV DL,0DH
 INT 21H
 
 MOV CL,0
 LUPI:
 CMP CL,N1
 
 JGE EXIT
    
  
    
  MOV BL,0 
   
  MOV BH,N2
  SUB BH,CL
  SUB BH,1
  
  LUPJ:
  

  
  CMP BL,BH
  JGE NEXTLOOP  
    
  MOV AH,02H
  MOV DL,' '
  INT 21H  
    
  INC BL
  JMP LUPJ  
    

  NEXTLOOP:
  
  
  MOV CH,0
  
  MOV AL,CL
  MOV BL,2
  MUL BL
  ADD AL,1
  MOV BL,AL
  
  LUPK:
  CMP CH,BL
  JGE NEXTLINE
  
  MOV AH,02H
  MOV DL,'*'
  INT 21H 
  
  INC CH
  JMP LUPK
  
  
 NEXTLINE:
 MOV AH,02H
 MOV DL,0AH
 INT 21H
 MOV DL,0DH
 INT 21H   
    
    
    
 INC CL
 JMP LUPI
 
 EXIT:   
    
    
    
    MAIN ENDP
END MAIN



