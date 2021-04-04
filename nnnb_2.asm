bits 16
org 0x7c00

boot:
    mov ah, 0x2
    mov al, 1
    mov ch, 0
    mov dh, 0
    mov cl, 2
    mov dl, 0
    mov bx, kernel
    int 0x13

    jmp kernel

times 510 - ($-$$) db 0
dw 0xaa55


kernel:
bits 16

boot2:
    mov si, string
    mov ah, 0x0e
.loop:
    lodsb
    or al, al
    jz halt
    int 0x10
    jmp .loop

halt:
    cli
    hlt

string: db "if this works im gonna cum", 0

times 1024 - ($-$$) db 0
