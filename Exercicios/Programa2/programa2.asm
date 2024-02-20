section .data
    list DB 20,11,2

section .text
global _start

_start:
    mov al,0
    mov cl,0
loop:
    mov bl,[list + eax]
    inc al
    cmp al,4
    je end
    cmp bl,cl
    jg swap
    jmp loop
swap:
    mov cl,bl
    jmp loop
end:
    mov eax,1
    mov ebx,0
    int 80h


    