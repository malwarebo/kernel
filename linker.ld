ENTRY(_start)

SECTIONS {
    . = 0x1000;        /* The kernel starts at memory address 0x1000 */

    .text : {          /* The text section contains code */
        *(.text)
    }

    .bss : {           /* The bss section contains uninitialized data */
        *(.bss)
    }
}
