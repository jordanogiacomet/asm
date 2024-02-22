section .data
        pathname DD "/home/jordano/Documents/test.txt"
        toWrite DD "Hello World!",0AH,0DH,"$"
section .text
global main

main:
    mov eax,5
    mov ebx,pathname
    mov ecx,101o
    mov edx,700o
    int 80h
    
    mov ebx,eax
    mov eax,4
    mov ecx,toWrite
    mov edx,15
    
    mov eax,1
    xor ebx,ebx
    int 80h
