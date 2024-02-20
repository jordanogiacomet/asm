extern str_to_int
extern int_to_str

section .bss
    input resb 256

section .data
    fmt db "%d",0
    prompt db 'Digite o tamanho do lado do quadrado: ',0xA
    lenPrompt equ $ - prompt

section .text
global main

main:
    mov eax,4
    mov ebx,1
    mov ecx,prompt
    mov edx,lenPrompt
    int 80h

    mov eax,3
    mov ebx,0
    mov ecx,input
    mov edx,256
    int 80h

    push input
    call str_to_int
    add esp,4
    imul eax,eax

    push eax
    push fmt
    lea eax,[input+32]
    push eax
    call int_to_str
    add esp,12

    mov eax,input+32
    mov ecx,0
calc_len:
    cmp byte [eax+ecx],0
    je done_calc
    inc ecx
    jmp calc_len
done_calc:
    mov eax,4
    mov ebx,1
    lea ecx,[input+32]
    mov edx,ecx
    int 80h
end:
    mov eax, 1
    xor ebx, ebx
    int 80h



    

    

