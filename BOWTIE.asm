.MODEL SMALL
.STACK 100H
.DATA
    N DB 0
.CODE     
MAIN PROC  
    MOV AX,@DATA
    MOV DS,AX
    

    MOV AH,01H
    INT 21H 
    SUB AL,48D 
    MOV N,AL     
    

    MOV AH,02H
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H 
    

    MOV CL,1  
I1:
    MOV AL,CL
    CMP AL,N
    JGE BOTTOM   

    MOV AL,N
    SUB AL,CL     
    MOV AH,0       
    MOV BL,2
    MUL BL          
    MOV BL,AL     
    

    MOV CH,0        
J1:
    CMP CH,CL
    JAE J1END
    MOV DL,'*'    
    MOV AH,02H
    INT 21H
    INC CH
    JMP J1
J1END:


    MOV CH,0       
J2:
    CMP CH,BL
    JAE J2END
    MOV DL,' '
    MOV AH,02H
    INT 21H
    INC CH
    JMP J2
J2END:


    MOV CH,0  
J3:
    CMP CH,CL
    JAE J3END
    MOV DL,'*'    
    MOV AH,02H
    INT 21H
    INC CH
    JMP J3
J3END:


    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H

    INC CL
    JMP I1
    
BOTTOM: 

    MOV CL,N
I2:   
    CMP CL,0
    JLE TERMINATE  
    

    MOV AL,N
    SUB AL,CL  
    MOV AH,0      
    MOV BL,2
    MUL BL      
    MOV BL,AL       
    

    MOV CH,0
J11:
    CMP CH,CL
    JAE J11END
    MOV DL,'*'    
    MOV AH,02H
    INT 21H
    INC CH
    JMP J11
J11END:


    MOV CH,0
J22:
    CMP CH,BL
    JAE J22END
    MOV DL,' '
    MOV AH,02H
    INT 21H
    INC CH
    JMP J22
J22END:


    MOV CH,0
J33:
    CMP CH,CL
    JAE J33END
    MOV DL,'*'     
    MOV AH,02H
    INT 21H
    INC CH
    JMP J33
J33END:

    ; New line
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H

    DEC CL
    JMP I2
          
TERMINATE:

MAIN ENDP
END MAIN
