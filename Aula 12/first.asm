section .data


section .text
global _start

_start:
    mov eax,1
    mov ebx,2
    cmp eax,ebx
    jz lesser
    jmp end

lesser:
    mov ecx,1
end:
    int 80h