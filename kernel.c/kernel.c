#include <stdint.h>

// Multiboot header constants
#define MULTIBOOT_HEADER_MAGIC 0x1BADB002
#define MULTIBOOT_HEADER_FLAGS 0x00000003

// Multiboot header structure
struct multiboot_header {
  uint32_t magic;
  uint32_t flags;
  uint32_t checksum;
};

// Declare the multiboot header
__attribute__((
    used, section("__TEXT,__multiboot"))) static const struct multiboot_header
    multiboot = {MULTIBOOT_HEADER_MAGIC, MULTIBOOT_HEADER_FLAGS,
                 -(MULTIBOOT_HEADER_MAGIC + MULTIBOOT_HEADER_FLAGS)};

// Function to write a string to video memory
void print(const char *str) {
  volatile char *video = (volatile char *)0xB8000;
  while (*str != 0) {
    *video++ = *str++;
    *video++ = 0x07; // Light grey on black
  }
}

// Kernel entry point
__attribute__((used, section("__TEXT,__text"))) void kernel_main() {
  print("Hello, World!");
  while (1) {
  }
}
