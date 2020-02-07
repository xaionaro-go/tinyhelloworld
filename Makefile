all:
	tinygo build -gc leaking -ldflags '-specs /usr/lib/i386-linux-musl/musl-gcc.specs' -o helloworld.o
	nasm -f elf32 -o libc.o libc.asm
	ld -entry=start -o helloworld libc.o helloworld.o
	objcopy -O binary -j .text helloworld helloworld.text-section
	nasm -f bin -o elftrampoline.o elftrampoline.asm
	cat elftrampoline.o helloworld.text-section > tinyhelloworld
