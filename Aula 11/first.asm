section .text
global _start

_start:
    mov eax,2
    shl eax,1
    int 80h