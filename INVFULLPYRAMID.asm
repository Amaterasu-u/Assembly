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
 JGE TERMINATE   
 
 MOV BL,0
 
 LUPJ:
 
 CMP BL,CL
 JGE NEXTLOOP   
    
 MOV AH,02H
 MOV DL,' '
 INT 21H
 
 INC BL
 JMP LUPJ
 
 NEXTLOOP:
 
 MOV BH,N1
 SUB BH,CL
 
 MOV AL,2
 MUL BH
 SUB AL,1
 MOV K,AL
 
 MOV CH,0
 LUPK:
 
 CMP CH,K
 JGE OUTER
 
 MOV AH,02H
 MOV DL,'*'
 INT 21H
 
 INC CH
 JMP LUPK   
    
    
OUTER:

MOV AH,02H
MOV DL,0AH
INT 21H
MOV DL,0DH
INT 21H    
    

    
  INC CL  
  JMP LUPI  
    
 TERMINATE:   
    
    MAIN ENDP
END MAIN