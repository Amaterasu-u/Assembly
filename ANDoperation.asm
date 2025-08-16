 .MODEL SMALL
    .STACK 100H
    .DATA
         B DW 0
         A DB 0
         C DW 0
         D DW 0
        MSG1  DW 'HELLO$'  
        MSG2 DW 'BYE$'    
        MSG3 DW 'SEE YOU$'
        
    .CODE
    
       
    MAIN PROC ;AND 
          
          
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AH,01H
        INT 21H
        SUB AL,48D 
        MOV A,AL 
        
         MOV AH ,02H
                  MOV DX,0AH
                  INT 21H
                 
                      MOV DX,0DH
                      INT 21H
    
        
        CMP A, 5
         
         JGE A1                
       PK:
       CMP A,8
       JGE A2         
       
       PKK: 
       JMP L3         
                
     
               A1:
               CMP A,7
               JLE L1 
               
               JMP PK
                
            
             A2:
             CMP A,10
             JLE L2
             
             JMP PKK   
                
  
                  
                 L1: 
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
                  
           L2:       
         
         MOV AH ,02H
         MOV DX,0AH
         INT 21H
         MOV AH ,02H
         MOV DX,0DH
         INT 21H
    
         MOV AH, 09H
         LEA DX,MSG2
         INT 21H 
         JMP L 
         
         
         
                    L3:       
         
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
                             
        
     L: 
   
     MAIN ENDP
    END MAIN
