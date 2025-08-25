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
  SPACES DB 0
  CURBIT DB '1'
  
.CODE

MAIN PROC 
        MOV AX, @DATA
    MOV DS, AX
    
MOV AH,01H
INT 21H
SUB AL,'0'
MOV N1,AL
MOV N2,AL
MOV N3,AL

MOV I,2
MUL I
SUB AL,1
MOV ROWS,AL

MOV AH,02H
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H






MOV CL,1

LUPI:

CMP CL,ROWS 
JG TERMINATE
  
  
  
 MOV LEVEL,0 
 CMP CL,N1
 JG P1
 MOV LEVEL,CL
 JMP PROCEED
 
 P1:
 
 MOV CH,ROWS
 SUB CH,CL
 ADD CH,1
 MOV LEVEL,CH
   
 PROCEED:
 
 MOV CH,N1
 SUB CH,LEVEL
 MOV SPACES,CH
 
 
 MOV BL,0
 LUPJ:
 
 CMP BL,SPACES
 JGE NEXTLOOP   
    
 MOV AH,02H
 MOV DL,' '
 INT 21H
 
 INC BL
 JMP LUPJ   
    
   
NEXTLOOP:    
    


    MOV BH,0
      
  

LUPK:
    CMP BH,LEVEL
    JGE OUTER
    MOV AH,02H 
    MOV DL,CURBIT
    INT 21H         
    XOR CURBIT, 1  

    INC BH
    JMP LUPK

 
 OUTER:
   
 MOV AH,02H
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H   
    
    
           INC CL
           JMP LUPI
 TERMINATE:   
    
    
    MAIN ENDP
END MAIN