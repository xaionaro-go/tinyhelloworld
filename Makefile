all: tinyhelloworld cleanup

tinyhelloworld:
	nasm -f bin -o elf.o elf.asm
	nasm -f elf32 -o placeholder.o placeholder.asm
	tinygo build -gc leaking -ldflags '-specs /usr/lib/i386-linux-musl/musl-gcc.specs' -o helloworld.o
	ld -entry=start -Ttext=0x05430000 -nmagic -o helloworld placeholder.o helloworld.o
	objcopy -O binary -j '.*t*' helloworld tinyhelloworld
	dd if=elf.o of=tinyhelloworld conv=notrunc
	chmod +x tinyhelloworld

cleanup:
	rm -f *.o *.text-section helloworld

clean: cleanup
	rm -f tinyhelloworld
