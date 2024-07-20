# Kernel

Minimal starting point for kernel development using x86 assmebly
[Basic kernel implementation of this paper] (https://www.cs.vu.nl/~herbertb/misc/basickernel.pdf)

## Usage

### Prerequisites

- A development environment for assembling and running x86 assembly code (e.g., NASM and QEMU).
- Basic knowledge of x86 assembly language.
- A virtual machine or computer with x86 architecture.

## File Structure

```bash
- kernel/
    - boot/
        - bootloader.asm
    - kernel/
        - kernel.asm
    - linker.ld

```

## Steps to Build and Run

- Assemble the bootloader and kernel using NASM:

```bash
nasm -f bin boot/bootloader.asm -o bootloader.bin
nasm -f elf32 kernel/kernel.asm -o kernel.o
ld -T kernel/linker.ld kernel.o -o kernel.bin
```

- Combine the bootloader and kernel into a single image:

```bash
cat bootloader.bin kernel.bin > os-image.bin
```

- Run the kernel using QEMU

```bash
qemu-system-i386 -fda os-image.bin
```

The QEMU emulator should launch, and you will see the output of your simple kernel, which in this case, clears the screen and prints 'H' in white text on a black background. The kernel will enter an infinite loop to keep it running.
