section .text
global _start

_start:
    mov al,0xFF
    mov bl,2
    imul bl
    int 80h

