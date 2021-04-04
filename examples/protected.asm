bits 16
; informs bios to load bootloader into RAM address 0x7c00
org 0x7c00

boot:
    ; a20 gate activate, see https://wiki.osdev.org/A20_Line
    mov ax, 0x2401
    int 0x15

    ; set vga mode 3, allows direct memory access to a linear address containing each character and it's associated attributes
    mov ax, 0x3
    int 0x10

    
