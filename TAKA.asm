.MODEL SMALL
.STACK 100H
.DATA
 

 TOTAL DW 0
 INPUT DW 0
 COUNT DW 0
 
 MSG1 DW "1000 TAKA NOTE : $"  
  MSG2 DW "500 TAKA NOTE : $" 
   MSG3 DW "200 TAKA NOTE : $" 
     MSG4 DW "100 TAKA NOTE : $"
   MSG5 DW "50 TAKA NOTE : $"
    MSG6 DW "20 TAKA NOTE : $" 
    MSG7 DW "10 TAKA NOTE : $"
     MSG8 DW "2 TAKA NOTE : $"
     MSG9 DW "50 PAISA COIN : $"
     MSG10 DW "25 PAISA COIN : $"
     FINAL_MSG DW "TOTAL MONEY : $"   
 
.CODE

MAIN PROC
        MOV AX,@DATA
        MOV DS,AX 
    
      
    LEA DX,MSG1
    CALL PRINT_STR
    CALL DEC_INP
    MOV AX,INPUT
    MOV BX,1000
    MUL BX
    ADD TOTAL,AX
    CALL NEW_LINE
                    
                    
        LEA DX,MSG2
    CALL PRINT_STR
    CALL DEC_INP
    MOV AX,INPUT
    MOV BX,500
    MUL BX
    ADD TOTAL,AX
    CALL NEW_LINE
    
    
        LEA DX,MSG3
    CALL PRINT_STR
    CALL DEC_INP
    MOV AX,INPUT
    MOV BX,200
    MUL BX
    ADD TOTAL,AX
    CALL NEW_LINE
    
    
        LEA DX,MSG4
    CALL PRINT_STR
    CALL DEC_INP
    MOV AX,INPUT
    MOV BX,100
    MUL BX
    ADD TOTAL,AX
    CALL NEW_LINE                
    
        
        LEA DX,MSG5
    CALL PRINT_STR
    CALL DEC_INP
    MOV AX,INPUT
    MOV BX,50
    MUL BX
    ADD TOTAL,AX
    CALL NEW_LINE    
        
        
    
        LEA DX,MSG6
    CALL PRINT_STR
    CALL DEC_INP
    MOV AX,INPUT
    MOV BX,20
    MUL BX
    ADD TOTAL,AX
    CALL NEW_LINE 
    
    
        LEA DX,MSG7
    CALL PRINT_STR
    CALL DEC_INP
    MOV AX,INPUT
    MOV BX,10
    MUL BX
    ADD TOTAL,AX
    CALL NEW_LINE
    
    
        LEA DX,MSG8
    CALL PRINT_STR
    CALL DEC_INP
    MOV AX,INPUT
    MOV BX,2
    MUL BX
    ADD TOTAL,AX
    CALL NEW_LINE 
    
    
            LEA DX,MSG9
    CALL PRINT_STR
    CALL DEC_INP
    MOV AX,INPUT
    SHR AX,1
    ADD TOTAL,AX
    CALL NEW_LINE 
        
    
    
            LEA DX,MSG10
    CALL PRINT_STR
    CALL DEC_INP
    MOV AX,INPUT
    SHR AX,2
    ADD TOTAL,AX
    CALL NEW_LINE 
    
    
    LEA DX,FINAL_MSG
    CALL PRINT_STR
   ; CALL NEW_LINE 
    CALL DEC_OUT
    CALL NEW_LINE
    JMP TERMINATE    
     
    
    MAIN ENDP
 
 
 
 DEC_OUT PROC

    MOV AX,TOTAL
       MOV BX,10 
       MOV CX,0
    GHURO:
    
  
    MOV DX,0
    DIV BX 
    PUSH DX
    INC CX
    CMP AX,0
    JNE GHURO
    

    
    PRINTKORO:
    POP DX
    ADD DL,'0'
    MOV AH,02H
    INT 21H
    LOOP PRINTKORO
    

    RET
    
    DEC_OUT ENDP
 
 

 DEC_INP PROC
    PUSH BX
   
    MOV INPUT,0
    MOV AH,01H
    INT 21H   
    
    ABAR:
    
    CMP AL,0DH
    JE EXIT
    SUB AL,'0'
    CBW
    MOV BX,AX
    MOV AX,INPUT
    MOV CX,10
    MUL CX
    ADD AX,BX
    MOV INPUT,AX
    
    MOV AH,01H
    INT 21H
    JMP ABAR
    
    
    
    EXIT:
    POP BX
    RET
    DEC_INP ENDP
 


 PRINT_STR PROC 
    
    MOV AH,09H
    INT 21H
    RET
    PRINT_STR ENDP
 
 NEW_LINE PROC
    MOV AH,02H
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    RET
    NEW_LINE ENDP

 TERMINATE:

END MAIN



