section .text
global _start

_start:
    mov eax,0b1010
    mov ebx,0b1100
    xor eax,ebx
    int 80h