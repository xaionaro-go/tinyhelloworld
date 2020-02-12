all: tinyhelloworld cleanup

tinyhelloworld: build link

build: emptyelf
	tinygo build -gc leaking -ldflags '-specs /usr/lib/i386-linux-musl/musl-gcc.specs' -o helloworld.o
	ld -entry=main -Ttext=0x010000$(shell printf '%x' $(shell stat -c %s emptyelf)) -nmagic -o helloworld helloworld.o

emptyelf:
	touch tinyhelloworld.bin
	nasm -f bin -D ENTRY_ADDRESS=0 -o emptyelf elf.asm
	rm -f tinyhelloworld.bin

link:
	objcopy -O binary -j '.*t*' helloworld tinyhelloworld.bin
	nasm -f bin -D ENTRY_ADDRESS=0x$(shell objdump --disassemble=main ./helloworld | awk '{if($$2=="<main>:"){print $$1}}') -o tinyhelloworld elf.asm
	chmod +x tinyhelloworld

cleanup:
	rm -f *.o *.bin helloworld emptyelf

clean: cleanup
	rm -f tinyhelloworld
