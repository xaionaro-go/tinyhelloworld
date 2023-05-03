GOFLAGS=-buildvcs=false

all: tinyhelloworld cleanup

tinyhelloworld: build link

build: emptyelf
	./generate_config.sh
	GOFLAGS=$(GOFLAGS) tinygo build -target custom.json -x -opt s -panic trap -o helloworld

emptyelf:
	touch tinyhelloworld.bin
	nasm -f bin -D ENTRY_ADDRESS=0 -o emptyelf elf.asm
	rm -f tinyhelloworld.bin

link:
	objcopy -O binary -j '\.text' -j '\.rodata' helloworld tinyhelloworld.bin
	nasm -f bin -D ENTRY_ADDRESS=0x$(shell objdump --disassemble=actual_main ./helloworld | awk '{if($$2=="<actual_main>:"){print $$1}}') -o tinyhelloworld elf.asm
	chmod +x tinyhelloworld

cleanup:
	rm -f *.o *.bin helloworld emptyelf custom.json

clean: cleanup
	rm -f tinyhelloworld
