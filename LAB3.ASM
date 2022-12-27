.686
include \masm32\include\io.asm

.data
	A DW 56, 85, 73, 45, 65, 48, 40, 77, 60, 21, 81, 29, 4, 86, 18, 28, 35, 67, 60, 89, 73, 95, 2, 56, 23, 65, 95, 3, 98, 91, 17, 84, 78, 17, 45, 98, 40, 8, 54, 31
	N DW 40
	min DW 0
	max DW 0
	I1 DD 0
	I2 DD 0
	
.code
LStart:
	MOV ECX, 0
	MOV CX, N
	MOV EBX, 0
    
Lmat:
	ADD EBX, 2
	LOOP Lmat
	MOV EBX,0
	MOV CX, N
	MOV AX, A[0]
	SUB CX, 1
	mov min,AX  
    
Lmin:
	ADD EBX, 2
	cmp A[EBX], AX
	JG Lmin2
	MOV AX, A[EBX]
	mov min, AX
	MOV I1, EBX
    
Lmin2:
	loop Lmin
	printf ("Min=")
	outint min
	
	newline
	
	MOV ECX, 0
	MOV EBX,0
	MOV CX, N
	MOV AX, A[0]
	SUB ECX, 1
	MOV max, AX  
    
Lmin3:
	ADD EBX, 2
	cmp A[EBX], AX
	JL Lmin4
	MOV AX, A[EBX]
	mov max, AX
	MOV I2, EBX
    
Lmin4:
	loop Lmin3
   
   
	printf ("Max=")
	outint max
    
    
    MOV EAX, 0
    MOV EBX, 0
    
    MOV AX, min
    MOV BX, max
    
    MOV ECX, 0
    MOV CX, N
LFSR:    
    CMP AX, BX
    JE  LSR
    ADD CX, 1
    SUB BX, 1
    ADD AX, 1
    
    LOOP LFSR
    
LSR:
    outint BX    

    
LExit:
	newline
	inkey "Press any key to exit."
	exit
end LStart
