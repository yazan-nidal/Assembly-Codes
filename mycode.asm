Page 60,130   ; Directive to set the number of lines and charachters per line.
Title "Our First Assembly Code" ; Give a title to my code.
;-------------------------Stack Segment--------------------------
StackSeg SEGMENT PARA STACK 'stack'
    DW 32 DUP(0)
     StackSeg ends 
;-------------------Data Segment-----------------------------
Dataseg SEgment PARA DATA 'data'
    x1 db 25     ; int x1=250
    x2 db 12     ; int x2=125
    y db ?        ; int y;
    Dataseg ends
;-------------------Code Segment------------------------------
Codeseg Segment PARA 'code'
    Begin Proc FAR
        ASSUME SS:StackSeg , DS:Dataseg, CS:Codeseg   
        ;------------------
        mov ax,Dataseg
        mov ds,ax        
        ;-------------------   
        mov ax,x1
        add ax,x2
        mov y,ax  
        ;----------------------     
        mov ax,4C00H
        int 21H    
         Begin endp
     Codeseg ends
end

        
        
      
        
    






