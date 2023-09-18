[org 0x7C00]

start:
    ; Set up stack and segments
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00  ; Set stack pointer

    ; Load the kernel
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov dh, 0
    mov dl, 0x80    ; Assuming boot from the first hard disk
    mov bx, kernel_address
    mov cx, kernel_sector_count
    int 0x13

    ; Jump to the kernel
    jmp 0x1000:0

; Padding to ensure the bootloader is 512 bytes
times 510-($-$$) db 0

; Boot signature (MBR signature)
dw 0xAA55

kernel_address: dw 0x1000       ; Address where the kernel will be loaded
kernel_sector_count: dw 1       ; Number of sectors to load

