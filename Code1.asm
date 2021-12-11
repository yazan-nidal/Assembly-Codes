 Page 60,132
 Title My First Code
 ;------------------------------------------------
 StackSeg SEGMENT PARA STACK 'stack'
    DW 32 DUP(0)
    StackSeg ENDS
 ;-----------------------------------------------
 DataSeg SEGMENT PARA 'data'     ; Define your data here.
    x1 DW 10
    x2 DW 20
    y DW ?
    DataSeg ENDS
 ;--------------------------------------------------
 CodeSeg SEGMENT PARA 'code'; Define your instructions here.
    Begin Proc FAR      ; your code will start from here
        ASSUME SS:StackSeg, DS:DataSeg, CS:CodeSeg
        Mov AX,DataSeg
        Mov DS,AX
        
        Mov AX,x1
        Add AX,x2
        Mov y, AX
        
        ;-----End Execution
        Mov AX,4C00H
        Int 21h
        Begin ENDP
    CodeSeg ENDS
 END       
 

 
        
    