.686
include \masm32\include\io.asm


;a=1
;c=2
;b=182


.data
    ;Put your data here
    A DW 1
    B Dw 182
    CC DW 2

.code
LStart:
    

LExit:
	MOV AX, 33  
    MOV BX, CC   
    MUL BX 
    ;outint16 AX ;66
    
    MOV BX, B
    SUB BX, AX 
	;outint16 BX ;116
	
	MOV AX, BX 
    MOV BL, 58 
    DIV BL 
    ;outint16 AL ;2
    
    MOV CX, 843  
    MOV DX, A   
    MUL DX 
	;outint16 CX ;1
	
	ADD AX, CX
	;outint16 AX ;1
	
    exit
end LStart



