BITS 32
extern start
extern write
extern main
start:
	call main
	mov eax, 1
	mov ebx, 0
	int 0x80
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
