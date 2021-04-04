bits 16
org 0x7c00


boot:
    cli
    push ds

    lgdt [gdt.info]

    ; switch to protected mode
    mov eax, cr0
    or al, 1
    mov cr0, eax
    jmp $+2

    ; unreal mode fuckery
    mov bx, 0x08

    ; switch back to real mode
    and al, 0xFE
    mov cr0, eax
    pop ds
    sti

    ; load kernel from disk
    mov ah, 0x2
    mov al, 1
    mov ch, 0
    mov dh, 0
    mov cl, 2
    mov dl, 0
    mov bx, kernel
    int 0x13

    ; please work please work please work
    jmp kernel

gdt:
    dq 0
    ; TODO: modify descriptor for just enough memory to load kernel instead of 4 obese gb
    db 0xff, 0xff, 0, 0, 0, 10010010b, 11001111b, 0
.info:
    dw .info - gdt - 1
    dq gdt


times 510 - ($-$$) db 0
dw 0xaa55



; second sector
kernel:
bits 16


boot2:
    mov esi, string
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
