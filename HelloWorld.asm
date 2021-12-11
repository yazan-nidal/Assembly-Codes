.model small
.stack 100h
.data
message db  "Wello World$"
.code 
;---Intialize the data segment register
mov ax,@data
mov dx,ax  
;-------Prin the message
mov ah,09h
lea dx,message
int 21h  
;------End the execution
mov AH,4cH
int 21h
end 
.Use TASM



