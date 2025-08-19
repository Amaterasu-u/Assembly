.MODEL SMALL
.STACK 100H
.DATA
    N DB 0
.CODE     
MAIN PROC  
    MOV AX,@DATA
    MOV DS,AX
    
    ; Read input
    MOV AH,01H
    INT 21H 
    SUB AL,48D 
    MOV N,AL     
    
    ; New line
    MOV AH,02H
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H 
    
    ; Top half (1 to N-1)
    MOV CL,1  
I1:
    MOV AL,CL
    CMP AL,N
    JGE BOTTOM      ; Fixed: stop when CL >= N
    
    ; Calculate spaces = 2*(N - CL)
    MOV AL,N
    SUB AL,CL       ; AL = N - CL
    MOV AH,0        ; Clear AH for multiplication
    MOV BL,2
    MUL BL          ; AX = 2*(N - CL)
    MOV BL,AL       ; BL = space count
    
    ; Print left stars (CL times)
    MOV CH,0        ; Use CH for star counter
J1:
    CMP CH,CL
    JAE J1END
    MOV DL,'*'      ; Fixed: print star without extra space
    MOV AH,02H
    INT 21H
    INC CH
    JMP J1
J1END:

    ; Print spaces (BL times)
    MOV CH,0        ; Use CH for space counter
J2:
    CMP CH,BL
    JAE J2END
    MOV DL,' '
    MOV AH,02H
    INT 21H
    INC CH
    JMP J2
J2END:

    ; Print right stars (CL times)
    MOV CH,0        ; Reset star counter
J3:
    CMP CH,CL
    JAE J3END
    MOV DL,'*'      ; Fixed: print star without extra space
    MOV AH,02H
    INT 21H
    INC CH
    JMP J3
J3END:

    ; New line
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H

    INC CL
    JMP I1
    
BOTTOM: 
    ; Bottom half (N to 1)
    MOV CL,N
I2:   
    CMP CL,0
    JLE TERMINATE   ; Stop when CL <= 0
    
    ; Calculate spaces = 2*(N - CL)
    MOV AL,N
    SUB AL,CL       ; AL = N - CL
    MOV AH,0        ; Clear AH for multiplication
    MOV BL,2
    MUL BL          ; AX = 2*(N - CL)
    MOV BL,AL       ; BL = space count
    
    ; Print left stars (CL times)
    MOV CH,0
J11:
    CMP CH,CL
    JAE J11END
    MOV DL,'*'      ; Fixed: print star without extra space
    MOV AH,02H
    INT 21H
    INC CH
    JMP J11
J11END:

    ; Print spaces (BL times)
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

    ; Print right stars (CL times)
    MOV CH,0
J33:
    CMP CH,CL
    JAE J33END
    MOV DL,'*'      ; Fixed: print star without extra space
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
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN