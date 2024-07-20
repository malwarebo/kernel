CC = clang
LD = ld

CFLAGS = -ffreestanding -mno-sse -target i386-pc-none-macho -Wall -Wextra
LDFLAGS = -static -nostdlib

OBJS = kernel.o

all: kernel.bin

kernel.o: kernel.c
	$(CC) -c kernel.c -o kernel.o $(CFLAGS)

kernel.bin: $(OBJS)
	$(LD) -o kernel.bin $(LDFLAGS) $(OBJS) -lSystem

clean:
	rm -f *.o kernel.bin
