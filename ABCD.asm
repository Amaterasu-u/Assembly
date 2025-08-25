.MODEL SMALL
.STACK 100H
.DATA


.CODE


MAIN PROC
MOV AX,@DATA
MOV DS,AX

MOV AL,0FBH 
CBW
MOV BL,0FFH
IDIV BL    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    MAIN ENDP
END MAIN