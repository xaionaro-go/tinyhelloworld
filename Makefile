all: tinyhelloworld cleanup

tinyhelloworld:
	nasm -f bin -o elftrampoline.o elftrampoline.asm
	nasm -f elf32 -o start_main.o start_main.asm
	tinygo build -gc leaking -ldflags '-specs /usr/lib/i386-linux-musl/musl-gcc.specs' -o helloworld.o
	ld -entry=start -Ttext=0x05430000 -nmagic -o helloworld start_main.o helloworld.o
	objcopy -O binary -j '.*t*' helloworld tinyhelloworld
	dd if=elftrampoline.o of=tinyhelloworld conv=notrunc
	chmod +x tinyhelloworld

cleanup:
	rm -f *.o *.text-section helloworld

clean: cleanup
	rm -f tinyhelloworld
