.MODEL SMALL
    .STACK 100H
    .DATA
         B DW 0
         A DB 0
         C DW 0
         D DW 0
        MSG1  DW 'ENTERED BINARY NUMBER : $'  

        
    .CODE
    
       
    MAIN PROC ;BINARY INPUT LEFT SHIFT
          
          
MOV AX,@DATA
MOV DS,AX

MOV AH,1
INT 21H
SUB AL,'0'

MOV BX,0

L1:
SHL BX,1
OR BL,AL

MOV AH,1
INT 21H

CMP AL,0DH
JE EXIT

SUB AL,'0'
JMP L1


EXIT:  
MOV AH,02H
MOV DX,0AH
INT 21H 
MOV AH,09H
LEA DX,MSG1
INT 21H

MOV CX,16

PRINT: 

ROL BX,1  

JC P1
JNC P0


P1: 
MOV AH,02H
MOV DX,'1'
INT 21H
LOOP PRINT

P0: 
CMP CX,0
JE TERMINATE
MOV AH,02H
MOV DX,'0'
INT 21H

LOOP PRINT

TERMINATE:
   
     MAIN ENDP
    END MAIN