[org 0x1000]

section .text
    global _start

_start:
    ; Clear the screen
    mov ah, 0x0E     ; Teletype output subfunction
    mov al, 'H'      ; Character to print (in this case, 'H')
    mov bh, 0x00     ; Page number (0 for video mode)
    mov bl, 0x07     ; Text attribute (white on black)
    int 0x10         ; Video BIOS interrupt for printing

    ; Infinite loop
.hang:
    hlt
    jmp .hang

section .bss
    ; Define uninitialized data (BSS section)
