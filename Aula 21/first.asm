section .data
        pathname DD "/home/jordano/Documents/test.txt"
section .bss
        buffer: resb 10
section .text
global main

main:
    mov eax,5
    mov ebx,pathname
    mov ecx,0
    int 80h

    mov ebx,eax
    mov eax,19
    mov ecx,20
    mov edx,0
    int 80h

    mov eax,3
    mov ecx,buffer
    mov edx,10
    int 80h

    mov eax,1
    xor ebx,ebx
    int 80h