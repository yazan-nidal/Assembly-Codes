.model small
.stack 64
.data
   str1 db "abcdefgh123$"  
 .code
 main proc far
    mov ax,@data
    mov ds,ax
        
    ;---print the original string.
    lea dx,str1
    mov ah,09h
    int 21h
    
    call convertCase  ;--change to uppercase     
    
    ;---print the uppercase string
    
    lea dx,str1
    mov ah,09h
    int 21h    
    
    mov ax,4c00h
    int 21h
 endp
 
 convertCase proc near
      
      mov si,offset str1  
      mov cx, 12
      
      L1:
      mov ah,[si]
      cmp ah,61H
      jb L2
      cmp ah,7AH
      ja L2 
     
      
      and ah,11011111b
      mov [si],ah
      
      L2:
      inc si 
      Loop L1  
    ret
 endp
 
      
      
      
    
    
    
