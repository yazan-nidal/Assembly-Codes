.model small
.stack 64
.data
message db "Enter a string: $"
buff db 50 DUP(?)
;-----------------------------------------------      
.code
mov ax,@data
mov ds,ax
;-----------------------------------------------
mov ah,09h
lea dx,message
int 21h     
;-----------------------------------------------
mov ah,0Ah
lea dx,buff
int 21h
;------------------------------------------
mov ax,09h
int 21h
;-----------------------------
mov ax,4c00h
int 21h
end


