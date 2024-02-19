section .text
global _start

_start:
    mov eax,0xff
    mov ecx,2
    idiv ecx
    int 80h
