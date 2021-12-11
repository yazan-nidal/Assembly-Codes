.model small
.stack
;----------------
.data
x1 db 10110000b
x2 db 00010001b
y db ?  
;----------------
.code
myproc proc far
    mov ax,@data
    mov ds,ax
 ;----------------
 mov al,x1
 add al,x2
 mov y,al
 ;----------------
 mov ax,4c00h
 int 21h
 myproc endp
end

