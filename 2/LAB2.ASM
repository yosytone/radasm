.686
include \masm32\include\io.asm

;(A–481/B)/85·(C–44)

;481/13 = 37

.data
    ;Put your data here
    A DW 547
    B DB 13
    CC DW 46

.code
LStart:
    

LExit:
    ;ax=481/13=37
	MOV AX, 481 
    MOV BL, B
    DIV BL 
    ;outint AL
    
    ;bx=457–37=510
    MOV BX, A
    SUB BX, AX 
    ;outint BX
   
    ;Cx=46-44=2
    MOV AX, 0
    MOV AX, 44
    MOV CX, CC
    SUB CX, AX 
    ;outint CX
    
    ;AX=85*2
    MOV EAX, 0
    mov ax, 85
    mul CX 
    ;outint AX
    
    ;AX=510/170
    MOV CX, AX
    mov ax, BX
	div cl
    ;outint16 AX 

	
	newline
	inkey "Press any key to exit."
	exit
	

end LStart













.686
include \masm32\include\io.asm

;A*(83*B–156)/(C+82)
;(A-481/B)/85*(C-44)

.data
    ;Put your data here
    A DW 547
    B DB 13
    CC DB 46

.code
LStart:
    

LExit:
    ;ax=481/13=37
    MOV AX, 481
    MOV DX, 0
    DIV B
    
    outint AL ;AH - ÄÐÎÁÜ
    newline
    
    ;bx=457–37=510
    MOV BX, A
    SUB BX,AX
    
    MOV DX, BX
    
    outint BX
    newline
    
    ;Cx=46-44=2
    MOV AL, CC
    SUB AL, 44
    
    outint AL
    newline
    
    ;AX=85*2
    MOV BL, 85
    MUL BL
    
    MOV CX, AX
    outint AX
    newline
    
    ;AX=510/170
    MOV AX, DX
    mov Dx, 0
	div CX
	
	outint AX
    newline
    
    newline
	inkey "Press any key to exit."
	exit

end LStart
