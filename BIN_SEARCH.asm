;LINEAR SEARCH



.MODEL SMALL
.STACK 100H
.DATA 
    
    ARR DB 0,1,2,3,4,5,6,7,8,9  

    
     LOW DB 0
     HIGH DB 0
     MID DB 0
     
     HOLD DW 0 

     MSG1 DW 'PRINT ARRAY $'
     MSG2 DW 'ENTER NUMBER YOU WANT TO SEARCH$'
     MSG3 DW 'FOUND AT INDEX : $'  
     MSG4 DW 'NOT FOUND : $'
     TOTAL DB 0
     COUNT DB 0
.CODE

MAIN PROC

    MOV AX,@DATA
    MOV DS,AX   
      
     
     ; ARRAY INPUT
     
 MOV DX,0
 MOV SI,0
 MOV BX,OFFSET ARR
 
 MOV CX,5
 GHUR:
 CALL DEC_INP
 MOV DL,TOTAL
 MOV ARR[BX+SI],DL
 CALL NEW_LINE
 INC SI
 LOOP GHUR    
  
     
;PRINT ARRAY
MOV AX,0
MOV AH,09H
LEA DX,MSG1
INT 21H
CALL NEW_LINE

MOV DX,0  
MOV SI,0
MOV BX,OFFSET ARR
MOV CX,5

DEKHAO:
MOV DX,[BX+SI]
MOV TOTAL,DL
CALL DEC_OUT
CALL NEW_LINE
INC SI
LOOP DEKHAO
   
CALL NEW_LINE



MOV AX,0
MOV AH,09H
LEA DX,MSG2
INT 21H
CALL DEC_INP  
CALL NEW_LINE
MOV DX,0
MOV DH,TOTAL 


 
;BIN_SEARCH

MOV LOW,0
MOV HIGH,4
MOV SI,0
MOV AX,0
MOV BX,0
MOV CX,0



SEARCH_KORO:
    
    MOV AL, LOW
    CMP AL, HIGH
    JG PAI_NAI

 
    MOV AL, LOW
    ADD AL, HIGH
    MOV AH, 0
    MOV CL, 2
    DIV CL
    MOV MID, AL
    MOV BX, 0
    MOV BL, MID

  
    MOV AL, [ARR+BX]      
    CMP AL, DH
    JE FOUND
    JL CHOTO           


    MOV AL, MID
    DEC AL
    MOV HIGH, AL
    JMP SEARCH_KORO

CHOTO:

    MOV AL, MID
    INC AL
    MOV LOW, AL
    JMP SEARCH_KORO

FOUND:

    MOV AH,09H
    LEA DX,MSG3
    INT 21H 
    MOV CX,0
    MOV CL,MID
    MOV TOTAL, CL
    CALL DEC_OUT
    CALL NEW_LINE
    JMP FIN_EXIT

PAI_NAI:
    MOV AH,09H
    LEA DX,MSG4
    INT 21H
    
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
    
