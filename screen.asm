.model small
.stack 64
.data  
           
 str db "enter your name",10,13,"$" 
 str2 db "Your name is",10,13,"$"
 buffer label byte
 MAXLEN db 20
 ACTLEN db ?
 BUFF db 20 DUP(?)
      
.code
    
main proc far
  mov ax,@data
  mov ds,ax
    
    
  ;--Set the cursor
  mov ah,02h
  mov bh,00
  mov dh,05
  mov dl,12
  int 10h     
            
  ;---print the string          
  mov ah,09h  
  lea dx,str
  int 21h    
            
            
  ;---Read the input string          
  mov ah,0Ah  
  lea dx,buffer
  int 21h  
  
    
   
  ;----Print the inputted string
   
  mov ah,09h  
  lea dx,str2
  int 21h    
          
 
  mov bx, ACTLEN 
  mov BUFF[bx+1],'$'
   
  mov ah,09h  
  lea dx,BUFF
  int 21h                    
            
  
  
 mov ax,4c00h
 int 21h    

main endp

 
