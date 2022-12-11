.586   
.MODEL flat, stdcall 

Include kernel32.inc
Include masm32.inc 
IncludeLib kernel32.lib
IncludeLib masm32.lib

.STACK 100h

.DATA 
    I11	DB 124
    I12	DW 124
    I13	DD 124
    
    I21	DW -5665
    I22	DD -5665
    
.CODE
Start:
	MOV DX, CX
    MOV EBX, offset I21
    MOV EBX, offset I22
    
    mov eax, [EBP+EDI] 
    
End Start
