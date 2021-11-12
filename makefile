boot.bin: src/boot.asm
	nasm -f bin src/boot.asm -o boot.bin

clean: boot.bin
	rm boot.bin