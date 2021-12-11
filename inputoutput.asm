.model small
.stack 64    
.data     
;---------Main Buffer-------------
   buffname label byte
   maxlength db 20
   actlength db ?
   namefld db 21 DUP(' ')  
;-------------------------------
   prompt db "Enter your name",13,10,"$"  
.code
 main proc far
    mov ax,@data
    mov ds,ax
    
    call clearproc  ;;  Call clear screen procedure  
                                                      
                                                      
    L1:   ; Main Loop     
       mov dx,0000h ; set the cursor to row0 and col0
       call setcursor
       call printprom ;; print the prompt 
                 
   
       call clrtext ;; clear the string before input                   
       call inputstr ;; input string  
       call clearproc ;; again clear the secreen  
      
       
       ;---Confirm that there is an input
       cmp actlength,00
       je done   
       
       call preprocess ;; set the input before printing it  
       call displaystr ;; center and display the input string  
       jmp L1
       
       
    done:
       mov ax,4c00h
       int 21h
 endp
 
    
   ;-----Clear Screen Procedure----
clearproc proc near  
    mov ax,0600h ; scrol service
    mov bh,30 ; Blue Color
    mov cx,0000  ; upperleft corner
    mov dx,184Fh ; lower right corner
    int 10h  ; request interrupt
    
    ret
endp     
             
;-------Set the Cursor Procedure (location stored in DX register)
setcursor proc near  ;; 
    mov ah,02h    ; set the cursor service
    mov bh,00h ; page#
    int 10h
    ret
endp      
       
       
       
;--------------Fill the string with spaces-------------
clrtext proc near
    mov cx,20
    mov si,00
    
  B30:
    mov namefld[Si],20H ; Fill with spaces
    inc si    
    loop B30    
 ret
endp
            
;-------Display Procedure-----------
printprom proc near
    mov ah,09h     ;; display string service
    lea dx, prompt
    int 21h   
    ret
endp    

;-----Input Procedure-------

inputstr proc near
    mov ah,0Ah ;; keyboard input service
    lea dx,buffname ;; input to be stored here
    int 21h
    ret
endp    

;-----PreProcessing for printing-----

preprocess proc near
    mov bh,00
    mov bl, actlength
    mov namefld[bx],07   ;; beep from the soundspeaker
    mov namefld[bx+1],'$'
    ret
endp   

displaystr proc near
    mov dl,actlength ; length of the string
    shr dl,1 ;; divide the length by 2
    neg dl ; reverse the sign
    add dl,40
    mov dh,12 ;; current row (mid)
    call setcursor ; set the cursor
    mov ah,09h
    lea dx, namefld
    int 21h
    ret
endp


    


    

    

  
    
 