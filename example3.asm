.model small
.stack
.data
message db "helloooooooo$"
.code     
myproc proc far
mov ax,@data
mov ds,ax

mov dl,offset message
mov ah,09h
int 21h

mov ax,4c00h
int 21h     

ret
end

