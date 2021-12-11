 .model small
 .stack 64
 .data
 Array db 2,7,3,1,4,0,2,5,1,6
 max db 0
 
 .code
 main proc far
    mov ax,@data
    mov ds,ax
    
    call findMax 
    mov dl,al
    add dl,48h
    
    mov ah,02h
    int 21h
    
    
    mov ax,4c00h
    int 21h
    main endp
   
   
   proc findMax near  
    
    
      mov cx,10
      lea si,Array
      mov al,max
      
     L1:
       cmp [si],al
       jg  L2 
       inc si
       loop L1
       
       jmp end
       
       
       
     
     L2:
       mov al,[si]
       inc si
       loop L1 
    
     end:
     ret
   endp
   
