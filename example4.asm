.model small
.stack 
.data
message db "Hello World$"
.code
myproc proc far 
   ;---Initializaiton of the DS register
    mov ax,@data
    mov ds,ax   
                
 ;-------Print the content of message               
    mov ah,09h 
    lea dx,message
    int 21h           
    
 ;-----------Finalization
    mov ax,4c00h
    int 21h
    myproc endp
end

    
    
    