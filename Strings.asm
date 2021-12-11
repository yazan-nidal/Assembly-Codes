.model small
.stack 64
.data
    str1 db "String1$"
    str2 db "String2$"
.code   
myproc proc far
    mov ax,@data
    mov ds,ax   
    
    mov cx, 07
    lea si,str1
    lea di,str2
    
  B20:
    mov AL,[si]
    mov [di],AL
    
    inc si
    inc di
    dec cx
    
    jnz B20
    
    mov dx,offset str1
    mov ah,09h
    
    int 21h
    
    mov ax,4c00h
    int 21h
endp
end

    
 
      
  
