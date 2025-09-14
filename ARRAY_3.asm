;LINEAR SEARCH



.MODEL SMALL
.STACK 100H
.DATA 
    
    ARR DB 0,1,2,3,4,5,6,7,8,9  
    AR  DB 0,1,2,3,4,5,6,7
    RES DB 5 DUP(0)
    
     E DB 0
     OD DB 0
     HOLD DB 0 
     HOLD1 DB 0  
     HOLD2 DB 0
     MSG1 DW 'EVEN-ARRAY$'
     MSG2 DW 'ODD-ARRAY$'
     MSG3 DW 'EQUAL-ARRAY$'
  ;  ARR DB 10 DUP(0)
    TOTAL DB 0
    COUNT DB 0 
    COUNT1 DW 0
    

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
   
   CALL NEW_LINE
   CALL NEW_LINE
     
   ; SECOND ARRAY INPUT  
   
   MOV AX,0
   MOV BX,0
   MOV DX,0
   MOV DI,0
   MOV SI,0
   
   MOV BX,OFFSET AR ;BX ER MODDHE ARR ER BASE ADDRESS RAKHLAM
   MOV SI,0
   MOV CX,5
   
   LOOOO:
    
   CALL DEC_INP
   MOV DX,0
   MOV DL,TOTAL
   MOV [BX+SI],DL
   CALL NEW_LINE 

   INC SI
   LOOP LOOOO 
   
   
  
     
     CALL NEW_LINE
     
     
   ;NEW ARR BUILD  
     

   MOV BP,OFFSET RES
   MOV SI,0
   MOV CX,5
   L00:
   
   
   
   MOV DL,[ARR+SI] 

   
   MOV AL,[AR+SI]

   
   ADD DL,AL
   MOV [BP+SI],DL


   INC SI
   LOOP L00 
   

   
   CALL NEW_LINE
   CALL NEW_LINE
   

   ; RES ARR OUTPUT
   
    MOV BP,OFFSET RES ;BX ER MODDHE ARR ER BASE ADDRESS RAKHLAM
   MOV SI,0
   MOV CX,5
   L12:
   
   MOV DL,[BP+SI]  
  
   MOV TOTAL,DL
   CALL DEC_OUT 
   CALL NEW_LINE
   INC SI
   LOOP L12
   
     

    
   
    
    
    
    
    JMP FIN_EXIT
    
MAIN ENDP






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
    
