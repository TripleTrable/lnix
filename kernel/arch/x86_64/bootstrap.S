

.section .multiboot_header
multiboot_start:
.long 0xe85250d6
.long 0
.long multiboot_end - multiboot_start
.long 0x100000000 - (0xe85250d6 + 0 + (multiboot_end - multiboot_start))
.short 0
.short 0
.long 8
multiboot_end:


.section .text
.code32


.global _start
.type _start, @function
_start:

	mov $stack_top, %esp
 
	call kernel_main
 
	cli
1:	hlt
	jmp 1b
 
.size _start, . - _start
.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top: