# On macOS: Compile the kernel and convert to flat binary

 1. Compile the kernel (assuming you're in the directory with kernel.c and Makefile)
make

2. Convert the Mach-O binary to a flat binary
Install objcopy if you haven't already: brew install binutils
```bash
objcopy -O binary kernel.bin kernel.img
```

3. Transfer kernel.img to your Linux environment

On Linux: Create the bootable image

4. Create a directory structure for your image
```bash
mkdir -p isodir/boot/grub
```

5. Copy your kernel binary to this directory
```bash
cp path/to/kernel.img isodir/boot/
```

6. Create a GRUB configuration file
```bash
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "MyKernel" {
    multiboot /boot/kernel.img
}
EOF
```
7. Create the ISO image
```bash
grub-mkrescue -o mykernel.iso isodir
```

8. Run the kernel in QEMU (install QEMU if you haven't: sudo apt-get install qemu-system-x86)
```bash
qemu-system-i386 -cdrom mykernel.iso
```
