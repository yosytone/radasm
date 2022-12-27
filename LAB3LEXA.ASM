.686
include \masm32\include\io.asm

.data
	A DW 56, 85, 73, 45, 65, 48, 40, 77, 60, 21, 81, 29, 4, 86, 18, 28, 35, 67, 60, 89, 73, 95, 3, 56, 23, 65, 95, 3, 98, 91
	N DW 30
    B DW 30 DUP (?)
	
.code
LStart:
	MOV EAX, 0
    MOV EBX, 0
    MOV ECX, 0
    MOV EDX, 0
    MOV CX, N
    
    MOV AX, A[0]
    MOV B[0], AX
    
    MOV EAX, 0
L1:    
    CMP CX, 1
    JE LExit
    MOV AX, CX  
    MOV BX, 2   
    MUL BX 
    
    MOV BX, AX
    SUB BX,2
    
    MOV DX, A[BX]
    ADD DX, A[0]
    
    MOV B[BX], DX
    
    SUB CX, 1
    LOOP L1

LExit:
    MOV EBX, 0
    MOV BX, B[30]
    outint BX

    
	newline
	inkey "Press any key to exit."
	exit
    
end LStart
