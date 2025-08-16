 .MODEL SMALL
    .STACK 100H
    .DATA
         B DW 0
         A DB 0
         C DW 0
         D DW 0
        MSG1  DW 'GIVEN INPUT IS A VOWEL$'  
        MSG2 DW 'GIVEN INPUT IS A CONSONANT$'    
        MSG3 DW 'GIVEN INPUT IS A NUMBER$' 
        MSG4 DW 'INVALID INPUT$'
        MSG5 DW 'DO YOU WANT TO GIVE ANOTHER INPUT? ENTER Y IF YES AND N IF NO$' 
        MSG6 DW 'PROGRAM TERMINATED$'
        
    .CODE
    
       
    MAIN PROC 
          
          
        MOV AX,@DATA
        MOV DS,AX 
        
        
     RESTART:   
        
        
        MOV AH,01H
        INT 21H

        MOV A,AL
         
        MOV AH ,02H
        MOV DX,0AH
        INT 21H
        MOV DX,0DH
        INT 21H
    
        
        CMP A, 65
        JGE A1 
         
        JL CHECKNUM
        
        
        
        
    CHECKNUM:
    
         CMP A,48
         JGE A2 
         JL INVALID
         

         
         A2:
         
         CMP A,57
         JLE NUMBER 
         JG INVALID    
                      

               A1:
               CMP A,90
               JLE L1 
               JG  INVALID
                
     
                 L1: 
                 CMP A,65
                 JE VOWEL  
                 CMP A,69
                 JE VOWEL
                 CMP A,73
                 JE VOWEL
                 CMP A,79
                 JE VOWEL
                 CMP A,85
                 JE VOWEL
                 JMP CONSONANT
                    
                  
                      
                  
   VOWEL:
                  MOV AH ,02H
                  MOV DX,0AH
                  INT 21H
                  MOV AH ,02H
                  MOV DX,0DH
                  INT 21H
                  MOV AH, 09H
                  LEA DX,MSG1
                  INT 21H  
                  JMP ASK 
                  
                  
                  
   CONSONANT:     
                  MOV AH ,02H
                  MOV DX,0AH
                  INT 21H
                  MOV AH ,02H
                  MOV DX,0DH
                  INT 21H
                  MOV AH, 09H
                  LEA DX,MSG2
                  INT 21H  
                  JMP ASK  
                  
                  
                  
   NUMBER:        
                  MOV AH ,02H
                  MOV DX,0AH
                  INT 21H
                  MOV AH ,02H
                  MOV DX,0DH
                  INT 21H
                  MOV AH, 09H
                  LEA DX,MSG3
                  INT 21H  
                  JMP ASK         
                  
                  
                  
   INVALID:       
                  MOV AH ,02H
                  MOV DX,0AH
                  INT 21H
                  MOV AH ,02H
                  MOV DX,0DH
                  INT 21H
                  MOV AH, 09H
                  LEA DX,MSG4
                  INT 21H  
                  JMP ASK         
   
                     
                  
                  
   ASK:
                  MOV AH ,02H
                  MOV DX,0AH
                  INT 21H
                  MOV AH ,02H
                  MOV DX,0DH
                  INT 21H
                  MOV AH, 09H
                  LEA DX,MSG5
                  INT 21H  
                  
                  MOV AH ,02H
                  MOV DX,0AH
                  INT 21H
                  MOV AH ,02H
                  MOV DX,0DH
                  INT 21H 
                  
                  MOV AH,01H
                  INT 21H
                  MOV A,AL 
                  
                  MOV AH ,02H
                  MOV DX,0AH
                  INT 21H
                  MOV AH ,02H
                  MOV DX,0DH
                  INT 21H
                  
                  CMP A,89 
                  JE RESTART 
                  CMP A,78
                  JE SHESH
                  
       
       SHESH:           
                  
                  MOV AH ,02H
                  MOV DX,0AH
                  INT 21H
                  MOV AH ,02H
                  MOV DX,0DH
                  INT 21H
                  MOV AH, 09H
                  LEA DX,MSG6
                  INT 21H 
                  
                  
                             
   
     MAIN ENDP
    END MAIN
