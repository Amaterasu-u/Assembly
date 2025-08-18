.MODEL SMALL
.STACK 100H
.DATA

N DB 0
ROWS DB 0  
SPACES DB 0
STARTS DB 0  
HOLD1 DB 0   
HOLD2 DB 0  
MULHOLD DB 0

.CODE     
MAIN PROC  
    MOV AX,@DATA
    MOV DS,AX
    

    MOV AH,01H
    INT 21H 
    
    
    SUB AL,48D 
    MOV N,AL     
    
    
    

    MOV AL, N
    MOV BL, 2
    MUL BL     
    DEC AL    
    MOV ROWS, AL
    
    MOV CL,1  
    
    MOV AH ,02H   
    MOV DL, 0DH    
    INT 21H
    MOV DL, 0AH 
    INT 21H 
    
LS:
    CMP CL, ROWS 
    JG LEE     
    

    MOV BL, 0
    CMP CL, N
    JL L1
    JMP L2
            
L1:

    MOV BL, CL
    JMP PROCEED
            
L2:

    MOV AL, N
    MOV AH, 0   
    MOV DL, 2  
    MUL DL      
    SUB AL, CL  
    MOV BL, AL  
    
PROCEED:

    MOV AL, N
    SUB AL, BL
    MOV SPACES, AL
    

    MOV MULHOLD, BL
    MOV AL, MULHOLD
    MOV AH, 0       
    MOV DL, 2        
    MUL DL         
    DEC AL           
    MOV STARTS, AL  
    

    MOV DL, 0    
LS2:
    CMP DL, SPACES
    JGE LEE2
    

    MOV HOLD1, DL   
    MOV AH, 02H
    MOV DL, ' '
    INT 21H 
    MOV DL, ' '
    INT 21H
    MOV DL, HOLD1  
    
    INC DL
    JMP LS2
               
LEE2:    

    MOV BH, 0        
LS3:
    CMP BH, STARTS
    JGE LEE3
    

    MOV AH, 02H
    MOV DL, '#'     
    INT 21H  
    MOV DL, ' '
    INT 21H


    INC BH
    JMP LS3
                   
LEE3: 

    MOV AH ,02H   
    MOV DL, 0DH    
    INT 21H
    MOV DL, 0AH 
    INT 21H  
    

    INC CL
    JMP LS
            
LEE: 


MAIN ENDP
END MAIN