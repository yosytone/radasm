.686
.model flat, stdcall
include laba.inc

.data
cap db "caption", 0
msg db "first program...", 0

.code
start:

push 0
push offset cap
push offset msg
push 0
call MessageBox

push 0
call ExitProcess
end start
