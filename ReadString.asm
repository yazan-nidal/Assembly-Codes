.Model samll
.stack 100
.data
myArry DB 0,1,2,3,4,5,6,7,8,9  

newline DB 13,10,'$'

.code

.startup

mov bx, offset myArry 


mov cx, 10
Call dispArry

mov cx, 5
xor si,si
mov di ,10

myloop:
       mov al, [bx+si]
       mov ah, [bx+di]
                  
       mov [bx+si], ah
       mov [bx+di], al  
       
       inc si
       dec di
       
       loop myloop
       

mov ah, 09
mov dx, offset newline
int 21H



Call dispArry

.exit



dispArry Proc near
    
   
    
    mov cx, 10 
    xor si, si
    mov ah, 02
    
    Arrayloop:
               mov dl, [bx+si]
               Add dl, '0' 
               int 21H
               inc si
               loop Arrayloop  
               
  
    
    ret
               
endp dispArray


end
                      
       
        