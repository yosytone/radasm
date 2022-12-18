.686
include \masm32\include\io.asm

;(A–481/B)/85·(C–44)
;481/13 = 37
;A = 187
;B = 13
;C = 46
;DX=1

;481/B
;A-481/B
;C-44
;85*(C–44)


.data
    ;Put your data here
    A DW 207
    B DB 13
    CC DW 46

.code
LStart:
    

LExit:
	MOV AX, 481 ;Äåëèìîå
    MOV BL, B ;Äåëèòåëü
    DIV BL ;AL= 37
    
    MOV BX, A
    SUB BX, AX ;BX=207-37=170
    
    MOV AX, 0
    MOV AX, 44
    
    MOV CX, CC
    SUB CX, AX ;CX=CL=46-44
    
    MOV EAX, 0
    mov ax, 85
    mul CX ;AX=85*2
    
    DIV BX ;AL= 37
    
    outint16 AX
	
    exit
end LStart
