;LINEAR SEARCH



.MODEL SMALL
.STACK 100H
.DATA 
    
    ARR DB 0,1,2,3,4,5,6,7,8,9  
 
     E DB 0
     OD DB 0
     HOLD DB 0
     MSG1 DW 'EVEN-ARRAY$'
     MSG2 DW 'ODD-ARRAY$'
     MSG3 DW 'EQUAL-ARRAY$'
  ;  ARR DB 10 DUP(0)
    TOTAL DB 0
    COUNT DB 0
    

.CODE

MAIN PROC

    MOV AX,@DATA
    MOV DS,AX   
      
     
     ; ARRAY INPUT
     
     
    MOV BX,OFFSET ARR ;BX ER MODDHE ARR ER BASE ADDRESS RAKHLAM
   MOV SI,0
   MOV CX,5
   LOOO:
    
   CALL DEC_INP
   MOV DX,0
   MOV DL,TOTAL
   MOV [BX+SI],DX
   CALL NEW_LINE 

   INC SI
   LOOP LOOO
     
   
  
   
   ;ARRAY OUTPUT  
     
   MOV BX,OFFSET ARR ;BX ER MODDHE ARR ER BASE ADDRESS RAKHLAM
   MOV SI,0
   MOV CX,5
   L00:
   
   
   
   MOV DL,[BX+SI] 
   MOV HOLD,DL 
   TEST DL,1
   JZ EVEN
   JNZ ODD
    GOBACK:

   INC SI
   LOOP L00 
   CMP CX,0
   JE COMPARE
   
   
   EVEN:
   
   PUSH AX
   MOV AX,0
   MOV AL,HOLD
   ADD E,AL
   POP AX 
   JMP GOBACK 
   
   
    ODD:
   
   PUSH AX
   MOV AX,0
   MOV AL,HOLD
   ADD OD,AL
   POP AX 
   JMP GOBACK
 
   
   CALL NEW_LINE
   
    COMPARE:
    
    PUSH AX
    PUSH BX
    MOV AX,0
    MOV BX,0
    
    MOV AL,E
    MOV BL,OD
    
    CMP AL,BL
    JG PRINTE
    JL PRINTO
    JE EQUAL
    
    
    
    
    PRINTE: 
    
    CALL NEW_LINE
    
    MOV AH,09H
    LEA DX,MSG1
    INT 21H
    POP BX
    POP AX
    JMP GOOUT
    
    PRINTO:
           
    CALL NEW_LINE
    MOV AH,09H
    LEA DX,MSG2
    INT 21H
    POP BX
    POP AX
   
    JMP GOOUT
    
    EQUAL:
    CALL NEW_LINE
    MOV AH,09H
    LEA DX,MSG3
    INT 21H
    
    GOOUT:
     

    
   
    
    
    
    
    JMP FIN_EXIT
    
MAIN ENDP

;FUNCTION FOR SEARCHING




;FUNCTION TO PRINT NEWLINE

NEW_LINE PROC 
    PUSH DX
    MOV DX,0AH
    MOV AH,02H
    INT 21H
    MOV DX,0DH
    INT 21H
    POP DX
    RET
    
    NEW_LINE ENDP


;FUNCTION FOR DECIMAL OUTPUT
DEC_OUT PROC
    PUSH BX 
    PUSH CX
    PUSH DX
    MOV COUNT,0
    MOV DX,0
    MOV AX,0
    MOV AL,TOTAL
    
    LAB2:
        MOV BL,10
        MOV AH,0
        DIV BL
        
        MOV DL,AH
        PUSH DX
        INC COUNT
        
        CMP AL,0
        JNE LAB2
        
        
        MOV CX,0
        MOV DX,0
        MOV CL,COUNT
        
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


;FUNCTION FOR DECIMAL INPUT

DEC_INP PROC 
       PUSH BX
       MOV BX,0
       MOV TOTAL,0
       MOV AH,01
       INT 21H
       
       LAB:
            CMP AL,0DH
            JE EXIT
            SUB AL,'0'
            MOV BL,AL
            MOV AL,10
            MUL TOTAL
            ADD AL,BL
            MOV TOTAL,AL
            
            
            MOV AH,01H
            INT 21H
            JMP LAB
            
       EXIT: 
       
       POP BX
       RET
    
    DEC_INP ENDP

FIN_EXIT:

END MAIN
    
