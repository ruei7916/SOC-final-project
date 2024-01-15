	.file	"uart.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/SOC-final-project/testbench/all" "uart.c"
	.section	.mprj,"ax",@progbits
	.align	2
	.globl	uart_write
	.type	uart_write, @function
uart_write:
.LFB321:
	.file 1 "uart.c"
	.loc 1 7 1
	.cfi_startproc
.LVL0:
	.loc 1 8 5
	.loc 1 8 14 is_stmt 0
	li	a4,805306368
.L2:
	.loc 1 8 11 is_stmt 1 discriminator 1
	.loc 1 8 14 is_stmt 0 discriminator 1
	lw	a5,8(a4)
	.loc 1 8 11 discriminator 1
	andi	a5,a5,8
	bne	a5,zero,.L2
	.loc 1 9 5 is_stmt 1
	.loc 1 9 39 is_stmt 0
	sw	a0,4(a4)
	.loc 1 10 1
	ret
	.cfi_endproc
.LFE321:
	.size	uart_write, .-uart_write
	.align	2
	.globl	uart_write_char
	.type	uart_write_char, @function
uart_write_char:
.LFB322:
	.loc 1 13 1 is_stmt 1
	.cfi_startproc
.LVL1:
	.loc 1 14 2
	.loc 1 13 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 14 5
	li	a5,10
	.loc 1 13 1
	mv	s0,a0
	.loc 1 14 5
	bne	a0,a5,.L5
	.loc 1 15 3 is_stmt 1
	li	a0,13
.LVL2:
	call	uart_write_char
.LVL3:
.L5:
	.loc 1 19 14 is_stmt 0 discriminator 1
	li	a4,805306368
.L6:
	.loc 1 19 11 is_stmt 1 discriminator 1
	.loc 1 19 14 is_stmt 0 discriminator 1
	lw	a5,8(a4)
	.loc 1 19 11 discriminator 1
	andi	a5,a5,8
	bne	a5,zero,.L6
	.loc 1 20 5 is_stmt 1
	.loc 1 22 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 1 20 39
	sw	s0,4(a4)
	.loc 1 22 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE322:
	.size	uart_write_char, .-uart_write_char
	.align	2
	.globl	uart_write_string
	.type	uart_write_string, @function
uart_write_string:
.LFB323:
	.loc 1 25 1 is_stmt 1
	.cfi_startproc
.LVL4:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	.loc 1 26 5
.LVL5:
.L10:
	.loc 1 26 12
	lbu	a0,0(s0)
	bne	a0,zero,.L11
	.loc 1 28 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL6:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL7:
.L11:
	.cfi_restore_state
	.loc 1 27 9 is_stmt 1
	.loc 1 27 28 is_stmt 0
	addi	s0,s0,1
.LVL8:
	.loc 1 27 9
	call	uart_write_char
.LVL9:
	j	.L10
	.cfi_endproc
.LFE323:
	.size	uart_write_string, .-uart_write_string
	.align	2
	.globl	uart_read_char
	.type	uart_read_char, @function
uart_read_char:
.LFB324:
	.loc 1 32 1 is_stmt 1
	.cfi_startproc
	.loc 1 33 2
	.loc 1 34 5
	.loc 1 34 12 is_stmt 0
	li	a5,805306368
	lw	a4,8(a5)
	.loc 1 32 1
	li	a0,0
	.loc 1 34 44
	srli	a4,a4,5
	.loc 1 34 7
	bne	a4,zero,.L14
	.loc 1 34 67 discriminator 1
	lw	a4,8(a5)
	.loc 1 34 99 discriminator 1
	srli	a4,a4,4
	.loc 1 34 60 discriminator 1
	bne	a4,zero,.L14
.LVL10:
.LBB2:
	.loc 1 35 26 is_stmt 1 discriminator 1
	.loc 1 36 13 discriminator 1
 #APP
# 36 "uart.c" 1
	nop
# 0 "" 2
	.loc 1 35 32 discriminator 1
.LVL11:
	.loc 1 35 26 discriminator 1
 #NO_APP
.LBE2:
	.loc 1 38 9 discriminator 1
	.loc 1 38 16 is_stmt 0 discriminator 1
	lw	a0,0(a5)
	.loc 1 38 13 discriminator 1
	andi	a0,a0,0xff
.LVL12:
.L14:
	.loc 1 41 5 is_stmt 1
	.loc 1 42 1 is_stmt 0
	ret
	.cfi_endproc
.LFE324:
	.size	uart_read_char, .-uart_read_char
	.align	2
	.globl	uart_read
	.type	uart_read, @function
uart_read:
.LFB325:
	.loc 1 45 1 is_stmt 1
	.cfi_startproc
	.loc 1 46 5
	.loc 1 47 5
	.loc 1 47 12 is_stmt 0
	li	a5,805306368
	lw	a4,8(a5)
	.loc 1 47 44
	srli	a4,a4,5
	.loc 1 47 7
	bne	a4,zero,.L16
	.loc 1 47 67 discriminator 1
	lw	a4,8(a5)
	.loc 1 47 99 discriminator 1
	srli	a4,a4,4
	.loc 1 47 60 discriminator 1
	bne	a4,zero,.L16
.LVL13:
.LBB3:
	.loc 1 48 26 is_stmt 1 discriminator 1
	.loc 1 49 13 discriminator 1
 #APP
# 49 "uart.c" 1
	nop
# 0 "" 2
	.loc 1 48 32 discriminator 1
.LVL14:
	.loc 1 48 26 discriminator 1
 #NO_APP
.LBE3:
	.loc 1 51 9 discriminator 1
	.loc 1 51 16 is_stmt 0 discriminator 1
	lw	a0,0(a5)
.LVL15:
.L16:
	.loc 1 54 5 is_stmt 1
	.loc 1 55 1 is_stmt 0
	ret
	.cfi_endproc
.LFE325:
	.size	uart_read, .-uart_read
	.text
.Letext0:
	.file 2 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x17c
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.4byte	.LASF16
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL4
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x9
	.4byte	.LASF17
	.byte	0x2
	.byte	0x34
	.byte	0x1b
	.4byte	0x5c
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x2
	.4byte	.LASF11
	.byte	0x2c
	.byte	0x2f
	.4byte	0x6a
	.4byte	.LFB325
	.4byte	.LFE325-.LFB325
	.byte	0x1
	.byte	0x9c
	.4byte	0xb5
	.byte	0x3
	.string	"num"
	.byte	0x2e
	.byte	0x9
	.4byte	0x6a
	.byte	0x1
	.byte	0x5a
	.byte	0x4
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.byte	0x5
	.string	"i"
	.byte	0x30
	.4byte	0x6a
	.4byte	.LLST3
	.byte	0
	.byte	0
	.byte	0x2
	.4byte	.LASF12
	.byte	0x1f
	.byte	0x30
	.4byte	0xf2
	.4byte	.LFB324
	.4byte	.LFE324-.LFB324
	.byte	0x1
	.byte	0x9c
	.4byte	0xf2
	.byte	0x3
	.string	"num"
	.byte	0x21
	.byte	0x7
	.4byte	0xf2
	.byte	0x1
	.byte	0x5a
	.byte	0x4
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x5
	.string	"i"
	.byte	0x23
	.4byte	0x6a
	.4byte	.LLST2
	.byte	0
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.byte	0xb
	.4byte	0xf2
	.byte	0x6
	.4byte	.LASF14
	.byte	0x18
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.byte	0x1
	.byte	0x9c
	.4byte	0x129
	.byte	0x7
	.string	"s"
	.byte	0x18
	.byte	0x4e
	.4byte	0x129
	.4byte	.LLST1
	.byte	0xc
	.4byte	.LVL9
	.4byte	0x12f
	.byte	0
	.byte	0xd
	.byte	0x4
	.4byte	0xf9
	.byte	0x6
	.4byte	.LASF15
	.byte	0xc
	.4byte	.LFB322
	.4byte	.LFE322-.LFB322
	.byte	0x1
	.byte	0x9c
	.4byte	0x160
	.byte	0x7
	.string	"c"
	.byte	0xc
	.byte	0x45
	.4byte	0xf2
	.4byte	.LLST0
	.byte	0xe
	.4byte	.LVL3
	.4byte	0x12f
	.byte	0xf
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3d
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF18
	.byte	0x1
	.byte	0x6
	.byte	0x30
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
	.byte	0x1
	.byte	0x9c
	.byte	0x11
	.string	"n"
	.byte	0x1
	.byte	0x6
	.byte	0x3f
	.4byte	0x6a
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x11
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x30
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST3:
	.byte	0x7
	.4byte	.LVL13
	.4byte	.LVL14
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL15
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL12
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LFE323
	.byte	0x1
	.byte	0x58
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LFE322
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
	.4byte	.LFB322
	.4byte	.LFE322-.LFB322
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.4byte	.LFB324
	.4byte	.LFE324-.LFB324
	.4byte	.LFB325
	.4byte	.LFE325-.LFB325
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL4:
	.byte	0x6
	.4byte	.LFB321
	.4byte	.LFE321
	.byte	0x6
	.4byte	.LFB322
	.4byte	.LFE322
	.byte	0x6
	.4byte	.LFB323
	.4byte	.LFE323
	.byte	0x6
	.4byte	.LFB324
	.4byte	.LFE324
	.byte	0x6
	.4byte	.LFB325
	.4byte	.LFE325
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF18:
	.string	"uart_write"
.LASF12:
	.string	"uart_read_char"
.LASF11:
	.string	"uart_read"
.LASF6:
	.string	"unsigned char"
.LASF14:
	.string	"uart_write_string"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF10:
	.string	"unsigned int"
.LASF16:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -Os -ffreestanding"
.LASF9:
	.string	"long long unsigned int"
.LASF15:
	.string	"uart_write_char"
.LASF5:
	.string	"long long int"
.LASF13:
	.string	"char"
.LASF3:
	.string	"short int"
.LASF17:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/SOC-final-project/testbench/all"
.LASF0:
	.string	"uart.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
