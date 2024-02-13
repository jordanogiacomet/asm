section .bss
    num RESB 3

section .data
    num2 DB 3 DUP(2)                           

section .text
global _start

_start:
    mov bl,1
    mov bl,[num2]
    mov [num],bl
    mov [num+1],bl
    mov [num+2],bl

    mov eax,1
    int 80h