.MODEL SMALL
.STACK 100H
.DATA 

 AR DB 32,16,8,4,2,1
 
ARR DB 10 DUP(0) 

MSG1 DW 'PRINT ARRAY : $' 
MSG2 DW 'DECIMAL EQUIVALENT OF THE BINARY INPUT : $'

TOTAL DW 0
COUNT DW 0
DECI DW 0

.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX

    CALL DEC_INP
    CALL NEW_LINE
    CALL DEC_OUT

  JMP TERMINATE

MAIN ENDP


NEW_LINE PROC
    PUSH DX
    PUSH AX
    MOV AH,02H
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    POP AX
    POP DX
    RET
    NEW_LINE ENDP 


DEC_OUT PROC
    
    PUSH BX
    PUSH CX
    PUSH DX 
    MOV COUNT,0
    MOV DX,0
    MOV AX,TOTAL  
    MOV BX,10 
    MOV CX,0
    
    REPEAT:
    
    MOV DX,0
    DIV BX 
    
    PUSH DX 
    INC CX
    CMP AX,0
    
    JNE REPEAT
    
    MOV DX,0

    
    L:
    POP DX
    ADD DL,'0'
    MOV AH,02H
    INT 21H
    LOOP L
    
    POP DX
    POP CX
    POP BX
    RET
    DEC_OUT ENDP


DEC_INP PROC
    
    PUSH BX
    
    MOV TOTAL,0
    MOV AX,0
    MOV AH,01H
    INT 21H 
    
    AGAIN:
    CMP AL,0DH
    JE EXIT
    SUB AL,'0'
    CBW
    MOV BX,AX
    MOV AX,10
    MUL TOTAL
    ADD AX,BX
    MOV TOTAL,AX
    MOV AH,01H
    INT 21H
    JMP AGAIN  
    
    EXIT:
    POP BX
    RET
    DEC_INP ENDP   

TERMINATE:
END MAIN