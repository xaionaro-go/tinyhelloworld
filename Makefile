LDFLAGS=-m elf_i386
LLVMFLAGS=-target i386-pc-linux-gnu

all: tinyhelloworld cleanup

tinyhelloworld: build link

build: emptyelf
	tinygo build $(LLVMFLAGS) -gc leaking -o helloworld.o
	ld $(LDFLAGS) -entry=main -Ttext=0x010000$(shell printf '%x' $(shell stat -c %s emptyelf)) -nmagic -o helloworld helloworld.o

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
