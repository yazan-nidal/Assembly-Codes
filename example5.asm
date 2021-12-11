.model small
.stack
.data
x1 db 5
x2 db 3
y db ?

.code 
mainproc proc far
    mov ax,@data
    mov ds,ax
    
    mov ah,x1 
    sub ah,x2
    mov y,ah
    
    mov dl,y
    
    mov ah,02h
    int 21h
    
    mov ax,4c00h
    int 21
    
   ret
  end
  
    