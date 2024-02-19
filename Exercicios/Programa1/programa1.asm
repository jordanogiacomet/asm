section .data


section .text
global _start

_start:
    mov al,0
    mov bl,1
    add al,bl
loop:
    add al,bl
    add bl,al
    jo end
    jmp loop
end:
    int 80h


