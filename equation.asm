.586   
.MODEL flat, stdcall 

Include kernel32.inc
Include masm32.inc 
IncludeLib kernel32.lib
IncludeLib masm32.lib

.DATA 
    A SDWORD -30
    B SDWORD 21
.DATA?      
    X SDWORD ?

.CODE
Start:
    mov EAX, A ; поместить число в регистр EAX
    add EAX, 5;сложить EAX и 5, результат в EAX
    sub EAX, B ;вычесть B, результат в EAX
    mov X, EAX ; сохранить результат в памяти

End Start
