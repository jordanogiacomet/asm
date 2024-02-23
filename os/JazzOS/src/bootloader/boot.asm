org 0x7C00
bits 16

jmp short main
nop

bdb_oem:                 DB 'MSWIN4.1'
bdb_bytes_per_sector:    DW 512
bdb_sectors_per_cluster: DB 1
bdb_reserved_sectors:    DW 1
bdb_fat_count:           DB 2
bdb_dir_entries_count:   DW 0e0h
bdb_total_sectors:       DW 2880
bdb_media_descriptor_type: DB 0f0h
bdb_sectors_per_fat:     DW 9
bdb_sectors_per_track:   DW 18
bdb_heads:               DW 2
bdb_hidden_sectors:      DD 0
bdb_large_sector_count:  DD 0
ebr_drive_number: DB 0
                  DB 0
ebr_signature: DB 29h
ebr_volume_id: DB 12h,34h,56h,78h
ebr_volume_label: DB 'JAZZ OS    '
ebr_system_id: DB 'FAT12   '

main:
    mov ax,0
    mov ds,ax
    mov es,ax
    mov ss,ax 

    mov sp,0x7C00
    
    mov [ebr_drive_number],dl
    mov ax,1
    mov cl,1
    mov bx,0x7E00
    call disk_read

    
    mov si,os_boot_msg
    call print
    hlt

halt:
    jmp halt

;input: LBA index in ax
;cx [bits 0-5]: sector number
;cx [6-15]: cylinder
;dh: head

lba_to_chs:
    push ax
    push dx

    xor dx,dx
    div word [dbd_sectors_per_track] ;(LBA % sectors per track) + 1 <- sector
    inc dx ;Sector
    mov cx,dx

    xor dx,dx
    div word [dbd_heads]

    mov dh,dl ;head
    mov ch,al
    shl ah,6
    or cl,ah
    ;head: (LBA / sectors per track) % number of heads
    ;cylinder: (LBA / sectors per track) / number of heads







disk_read:
    push ax
    push bx
    push cx
    push dx
    push di

    call lba_to_chs

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