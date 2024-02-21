section .data
        pathname DD "/home/jordano/Documents/test.txt"
global .text
global main

main:
    mov eax,5
    mov ebx,pathname
    mov ecx,101o
    mov edx,700o
    int 80h
