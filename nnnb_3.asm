bits 16
org 0x7c00


boot:
    ; enable a20 line
    in al, 0x92
    or al, 2
    out 0x92, al

    ; setup unreal mode
    cli
    lgdt [gdt.info]
    mov eax, cr0
    or al, 1
    mov cr0, eax

    mov bx, 0x08
    mov ds, bx
    mov es, bx
    mov fs, bx
    mov gs, bx

    and al, 0xfe
    mov cr0, eax

    sti

    ; zero selector regs after limits removed
    xor ax, ax
    mov	ds, ax
    mov	es, ax
    mov fs, ax
    mov gs, ax


    ; load kernel from disk
    mov ax, 0x0
    mov es, ax
    mov ebx, 0x0b8000

    mov ah, 0x2
    mov al, 1
    mov ch, 0
    mov dh, 0
    mov cl, 2
    mov dl, 0

    ; mov ebx, 0x13cd7e00
    int 0x13

    jmp 0x0b8000


gdt:
    dq 0
    db 0xff, 0xff, 0, 0, 0, 10010010b, 11001111b, 0
.info:
    dw .info - gdt - 1
    dq gdt


times 510 - ($-$$) db 0
dw 0xaa55








; second sector (offset 0x7e00)
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

string: db "hi from beyond 20 bit addresses", 0

times 1024 - ($-$$) db 0
