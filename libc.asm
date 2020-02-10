BITS 32
extern start
extern write
extern main
placeholder:
        dd 0xffffffff, 0xffffffff ; 0x00 - 0x07
        dd 0xffffffff, 0xffffffff ; 0x08 - 0x0f
        dd 0xffffffff, 0xffffffff ; 0x10 - 0x17
        dd 0xffffffff, 0xffffffff ; 0x18 - 0x1f
        dd 0xffffffff, 0xffffffff ; 0x20 - 0x27
        dd 0xffffffff, 0xffffffff ; 0x28 - 0x2f
        dd 0xffffffff, 0xffffffff ; 0x30 - 0x37
        dd 0xffffffff,            ; 0x38 - 0x40
        db 0xff, 0xff, 0xff,      ; 0x40 - 0x42
start:
        call main
        mov eax, 1
        mov ebx, 0
        int 0x80
        mov eax, placeholder ; hold the door
write:
        push ebp
        mov ebp, esp
        mov eax, 4
        mov ebx, [ebp+8]
        mov ecx, [ebp+12]
        mov edx, [ebp+16]
        int 0x80
        pop ebp
        ret

