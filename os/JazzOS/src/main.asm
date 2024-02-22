ORG 0x7C00
BITS 16

main:
    mov ax,0
    mov ds,ax
    mov es,ax
    mov ss,ax 

    mov sp,0x7C00
    mov si,os_boot_msg
    
    call print
    hlt

halt:
    jmp halt

print:
    PUSH si
    PUSH ax
    PUSH bx

print_loop:
    LODSB 
    OR al,al
    jz done_print

    mov ah,0x0E
    mov bh,0
    int 0x10

    jmp print_loop

done_print:
    pop bx
    pop ax
    pop si
    
    ret

os_boot_msg: DB 'Hello World!',0x0D,0x0A,0

TIMES 510-($-$$) DB 0
DW 0AA55h