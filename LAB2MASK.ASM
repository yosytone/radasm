.686
include \masm32\include\io.asm

.data
	RESULT DB ?
	
.code
LStart:
    MOV EBX, 0
    MOV EDX, 0

    
	mov BX, 01101011b ;107
    mov DX, 00000010b ;105 ;ÁÈÒÎÂÀß ÌÀÑÊÀ
    and BX, DX
   
    CMP BX, DX
    JE  LRES1
    MOV RESULT, 0
    JMP LEXIT

LRES1:
    MOV RESULT, 1

LEXIT:
    outint RESULT
    newline
	inkey "Press any key to exit."
	exit
    
end LStart
