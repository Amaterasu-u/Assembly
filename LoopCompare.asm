   .MODEL SMALL
        .STACK 100H
        .DATA
             B DB 0
             A DB 0
            MSG1  DW 'EQUAL$'  
            MSG2 DW 'GREATER$'    
            MSG3 DW 'LESSER$'
            
        .CODE
        
           
        MAIN PROC ;INSIDE A FOR LOOP KEEP CHECKING EQUAL OR NOT  
              
              
                      MOV AX,@DATA
            MOV DS,AX
            
            MOV AH,01H
            INT 21H
            SUB AL,48D
            MOV B,AL
            MOV CL,1
            LS:
               MOV AH ,02H
                      MOV DX,0AH
                      INT 21H
                     
                          MOV DX,0DH
                          INT 21H
            CMP CL,B
            JG LEE
            
            MOV AH,01H
            INT 21H 
            MOV A,AL 
            
             MOV AH ,02H
                      MOV DX,0AH
                      INT 21H
                     
                          MOV DX,0DH
                          INT 21H
        
            MOV AH,01H
            INT 21H
              MOV BL,AL
              
              MOV AH ,02H
                      MOV DX,0AH
                      INT 21H
                     
                          MOV DX,0DH
                          INT 21H
        
            
            CMP A, BL
             JL  LE 
             JG  GE
             
             
             MOV AH ,02H
             MOV DX,0AH
             INT 21H
             MOV AH ,02H
             MOV DX,0DH
             INT 21H
        
             MOV AH, 09H
             LEA DX,MSG1
             INT 21H 
             JMP L
             
             LE: 
                      MOV AH ,02H
                      MOV DX,0AH
                      INT 21H
                      MOV AH ,02H
                      MOV DX,0DH
                      INT 21H
                      MOV AH, 09H
                      LEA DX,MSG3
                      INT 21H
                      JMP L 
                      
                      
             GE: 
                      MOV AH ,02H
                      MOV DX,0AH
                      INT 21H
                      MOV AH ,02H
                      MOV DX,0DH
                      INT 21H
                      MOV AH, 09H
                      LEA DX,MSG2
                      INT 21H
                     
          L:   
         INC CX
         JMP LS
            
            
            
         LEE: 
       
         MAIN ENDP
        END MAIN





