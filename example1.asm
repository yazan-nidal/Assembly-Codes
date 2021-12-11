.model small
.stack     
;--------------------
.data
message db "Hello World$"  
;----------------------
.code
mainproc proc far 
    ;-----------------
    mov ax,@data
    mov ds,ax
    ;----------------    
    lea dx,message   
    mov ah,09h
    int 21h
    ;---------------
    mov ax,4c00h
    int 21h
    
   mainproc endp
end

    