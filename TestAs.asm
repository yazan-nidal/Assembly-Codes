.model small
.stack 64
;---------------------------
.data
string DB "abcdefghij"
;---------------------------
.code 
myproc proc far
    mov ax,@data
    mov ds,ax 
    
    mov si,offset string
    
    mov cx,10
    
    B30:
       
       mov bx,[si]
       push bx
       inc si
       dec cx
       jnz B30
       
    mov cx,10
    
    B31:
       pop dx
       mov ah,02h
       int 21h 
       dec cx
       jnz B31
       
endp myproc
end 
    
        



