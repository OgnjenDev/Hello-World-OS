# Makefile for Hello World OS

ASM = nasm
ASMFLAGS = -f bin
QEMU = qemu-system-x86_64
IMG = boot.img
SRC = boot.asm

all: $(IMG)

$(IMG): $(SRC)
	$(ASM) $(ASMFLAGS) $(SRC) -o $(IMG)

run: $(IMG)
	$(QEMU) -drive format=raw,file=$(IMG)

clean:
	rm -f $(IMG)
