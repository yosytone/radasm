; Template for console application - комментарий
    .586    ; подключение набора команд Реntium
    .MODEL flat, stdcall    ; модель памяти и
; конвенция о передаче параметров
OPTION CASEMAP:NONE ; опция различия строчных
; и прописных букв

Include kernel32.inc ; подключение описаний процедур и
Include masm32.inc ; констант
IncludeLib kernel32.lib ; подключение библиотек
IncludeLib masm32.lib
    .CONST ; начало раздела констант
MsgExit DB "Press Enter to Exit",0AH,0DH,0

    .DATA ;раздел инициализированных переменных
    .DATA? ;раздел неинициализированных переменных
inbuf DB 100 DUP (?)
    .CODE ; начало сегмента кода
Start:
; Место, куда
; Add you statements добавляется код
;
Invoke StdOut,ADDR MsgExit ; вывод сообщения
Invoke StdIn,ADDR inbuf,LengthOf inbuf ; ввод строки
Invoke ExitProcess,0 ; завершение программы
End Start ; конец модуля
