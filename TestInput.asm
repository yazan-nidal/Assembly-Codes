.model small
.stack 64
.data
   msg1 db "Please Enter your Name",13,10,"$"
   ;----------Parameter List----------------
   BUFF label byte
   maxlen db 20
   actlen db ?
   namefld db 20 DUP(' ')
   ;---------------------------------------        
   msg2 db "Welcome Mr $"
   
.code
  main proc far
    mov ax,@data
    mov ds,ax
         
         
  ;----The first msg print----       
    lea dx,msg1
    mov ah,09h
    int 21h   
    
  ;----Accep Input from the Keyboard
    
    lea dx,BUFF
    mov ah,0Ah
    int 21h
                
   ;---Print the second msg
    lea dx,msg2
    mov ah,09h
    int 21h     
    
    
   ;---Process the input  
    mov bh,00
    mov bl,actlen  
    mov namefld[bx+1],'$'
    
     
    
   ;---Print the input name
    lea dx,namefld
    mov ah,09h
    int 21h
  endp
  end
  
  
    
    
   