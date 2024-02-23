org 0x7C00
bits 16

jmp short main
nop

bdb_oem: DB 'MSWIN4.1'
bsb_bytes_per_sector DW 512
bdb_sectors_per_cluster DB 1
bdb_reserved_sectors  DW 1  
bdb_fat_count:  DB 2
bdb_dir_entries_count: DW 0E0h
bdb_total_sectors   DW 2880
bdb_media-descriptor_type DB 0F0h

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
    push si
    push ax
    push bx

print_loop:
    lodsb
    or al,al
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