BITS 32
	org 0x01000000
	db 0x7F, "ELF" ; 0x00: e_ident[EI_MAG0..3]
	db 0x01        ; 0x04: e_ident[EI_CLASS]
	db 0x00        ; 0x05: e_ident[EI_DATA]
	db 0x00        ; 0x06: e_ident[EI_VERSION]
	db 0x00        ; 0x07: e_ident[EI_OSABI]
	db 0x00        ; 0x08: e_ident[EI_ABIVERSION]
	db 0x00, 0x00, 0x00 ; 0x09
	dd $$          ; 0x0c
	dw 0x0002      ; 0x10: e_type
	dw 0x0003      ; 0x12: e_machine
	dd 0x01000000  ; 0x14: e_version
	dw _start - $$ ; 0x18: e_entry
	dw 0x0100
	dd 0x00000004  ; 0x1c: e_phoff
	dd 0x00000000  ; 0x20: e_shoff
	dd 0x00000000  ; 0x24: e_flags
	dw 0x0000      ; 0x28: e_ehsize
	dw 0x0020      ; 0x2a: e_phentsize
	dw 0x0001      ; 0x2c: e_phnum
_start:
	call ENTRY_ADDRESS
	xor eax, eax
	xor ebx, ebx
	inc eax
	int 0x80
incbin "tinyhelloworld.bin"
