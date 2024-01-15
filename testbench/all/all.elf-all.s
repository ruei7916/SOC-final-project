	.file	"all.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/SOC-final-project/testbench/all" "all.c"
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB316:
	.file 1 "../../firmware/stub.c"
	.loc 1 19 1
	.cfi_startproc
.LVL0:
	.loc 1 20 2
	.loc 1 19 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 20 5
	li	a5,10
	.loc 1 19 1
	mv	s0,a0
	.loc 1 20 5
	bne	a0,a5,.L2
	.loc 1 21 3 is_stmt 1
	li	a0,13
.LVL1:
	call	putchar
.LVL2:
.L2:
	.loc 1 22 13 is_stmt 0 discriminator 1
	li	a5,-268410880
	.loc 1 22 60 discriminator 1
	li	a4,1
.L3:
	.loc 1 22 60 is_stmt 1 discriminator 1
	.loc 1 22 13 is_stmt 0 discriminator 1
	lw	a3,-2044(a5)
	.loc 1 22 60 discriminator 1
	beq	a3,a4,.L3
	.loc 1 23 2 is_stmt 1
	.loc 1 24 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 1 23 50
	sw	s0,-2048(a5)
	.loc 1 24 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE316:
	.size	putchar, .-putchar
	.align	2
	.globl	print
	.type	print, @function
print:
.LFB317:
	.loc 1 27 1 is_stmt 1
	.cfi_startproc
.LVL3:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	.loc 1 28 2
.LVL4:
.L7:
	.loc 1 28 9
	lbu	a0,0(s0)
	bne	a0,zero,.L8
	.loc 1 30 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL5:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL6:
.L8:
	.cfi_restore_state
	.loc 1 29 3 is_stmt 1
	.loc 1 29 14 is_stmt 0
	addi	s0,s0,1
.LVL7:
	.loc 1 29 3
	call	putchar
.LVL8:
	j	.L7
	.cfi_endproc
.LFE317:
	.size	print, .-print
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB323:
	.file 2 "all.c"
	.loc 2 46 1 is_stmt 1
	.cfi_startproc
	.loc 2 48 5
	.loc 2 76 5
	.loc 2 46 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.loc 2 76 53
	li	a3,1
	li	a5,-268419072
	.loc 2 78 39
	li	a2,8192
	addi	a4,a2,-2039
	.loc 2 76 53
	sw	a3,-2048(a5)
	.loc 2 78 5 is_stmt 1
	.loc 2 78 39 is_stmt 0
	li	a5,637534208
	sw	a4,160(a5)
	.loc 2 79 5 is_stmt 1
	.loc 2 79 39 is_stmt 0
	sw	a4,156(a5)
	.loc 2 80 5 is_stmt 1
	.loc 2 80 39 is_stmt 0
	sw	a4,152(a5)
	.loc 2 81 5 is_stmt 1
	.loc 2 81 39 is_stmt 0
	sw	a4,148(a5)
	.loc 2 82 5 is_stmt 1
	.loc 2 82 39 is_stmt 0
	sw	a4,144(a5)
	.loc 2 83 5 is_stmt 1
	.loc 2 83 39 is_stmt 0
	sw	a4,140(a5)
	.loc 2 84 5 is_stmt 1
	.loc 2 84 39 is_stmt 0
	sw	a4,136(a5)
	.loc 2 85 5 is_stmt 1
	.loc 2 85 39 is_stmt 0
	sw	a4,132(a5)
	.loc 2 86 5 is_stmt 1
	.loc 2 86 39 is_stmt 0
	sw	a4,128(a5)
	.loc 2 87 5 is_stmt 1
	.loc 2 87 39 is_stmt 0
	sw	a4,124(a5)
	.loc 2 88 5 is_stmt 1
	.loc 2 88 39 is_stmt 0
	sw	a4,120(a5)
	.loc 2 89 5 is_stmt 1
	.loc 2 89 39 is_stmt 0
	sw	a4,116(a5)
	.loc 2 90 5 is_stmt 1
	.loc 2 90 39 is_stmt 0
	sw	a4,112(a5)
	.loc 2 91 5 is_stmt 1
	.loc 2 91 39 is_stmt 0
	sw	a4,108(a5)
	.loc 2 92 5 is_stmt 1
	.loc 2 92 39 is_stmt 0
	sw	a4,104(a5)
	.loc 2 93 5 is_stmt 1
	.loc 2 93 39 is_stmt 0
	sw	a4,100(a5)
	.loc 2 95 5 is_stmt 1
	.loc 2 95 39 is_stmt 0
	sw	a4,96(a5)
	.loc 2 96 5 is_stmt 1
	.loc 2 96 39 is_stmt 0
	sw	a4,92(a5)
	.loc 2 97 5 is_stmt 1
	.loc 2 97 39 is_stmt 0
	sw	a4,88(a5)
	.loc 2 98 5 is_stmt 1
	.loc 2 98 39 is_stmt 0
	sw	a4,84(a5)
	.loc 2 99 5 is_stmt 1
	.loc 2 99 39 is_stmt 0
	sw	a4,80(a5)
	.loc 2 100 5 is_stmt 1
	.loc 2 100 39 is_stmt 0
	sw	a4,76(a5)
	.loc 2 101 5 is_stmt 1
	.loc 2 101 39 is_stmt 0
	sw	a4,72(a5)
	.loc 2 102 5 is_stmt 1
	.loc 2 102 39 is_stmt 0
	sw	a4,68(a5)
	.loc 2 103 5 is_stmt 1
	.loc 2 103 39 is_stmt 0
	sw	a4,64(a5)
	.loc 2 104 5 is_stmt 1
	.loc 2 104 39 is_stmt 0
	sw	a4,52(a5)
	.loc 2 105 5 is_stmt 1
	.loc 2 105 39 is_stmt 0
	sw	a4,48(a5)
	.loc 2 106 5 is_stmt 1
	.loc 2 106 39 is_stmt 0
	sw	a4,44(a5)
	.loc 2 107 5 is_stmt 1
	.loc 2 107 39 is_stmt 0
	sw	a4,40(a5)
	.loc 2 108 5 is_stmt 1
	.loc 2 108 39 is_stmt 0
	sw	a4,36(a5)
	.loc 2 109 5 is_stmt 1
	.loc 2 109 39 is_stmt 0
	addi	a2,a2,-2040
	sw	a2,60(a5)
	.loc 2 110 5 is_stmt 1
	.loc 2 110 39 is_stmt 0
	li	a4,1026
	sw	a4,56(a5)
	.loc 2 111 5 is_stmt 1
	.loc 2 111 53 is_stmt 0
	li	a4,-268410880
	sw	a3,0(a4)
	.loc 2 114 2 is_stmt 1
.LBB12:
.LBB13:
	.file 3 "../../firmware/irq_vex.h"
	.loc 3 24 2
	.loc 3 25 2
 #APP
# 25 "../../firmware/irq_vex.h" 1
	csrr a4, 3008
# 0 "" 2
.LVL9:
	.loc 3 26 2
 #NO_APP
.LBE13:
.LBE12:
	.loc 2 115 2
	.loc 2 116 2
.LBB14:
.LBB15:
	.loc 3 31 2
	ori	a4,a4,4
.LVL10:
 #APP
# 31 "../../firmware/irq_vex.h" 1
	csrw 3008, a4
# 0 "" 2
.LVL11:
 #NO_APP
.LBE15:
.LBE14:
	.loc 2 118 2
.LBB16:
	.file 4 "../../firmware/csr.h"
	.loc 4 806 2
.LBB17:
.LBB18:
	.file 5 "../../firmware/hw/common.h"
	.loc 5 34 2
	.loc 5 34 32 is_stmt 0
	li	a4,-268406784
.LVL12:
	sw	a3,-2028(a4)
.LVL13:
.LBE18:
.LBE17:
.LBE16:
	.loc 2 121 2 is_stmt 1
	.loc 2 121 36 is_stmt 0
	sw	a3,0(a5)
	.loc 2 122 2 is_stmt 1
	.loc 2 122 10 is_stmt 0
	li	s0,637534208
	.loc 2 122 43
	li	a4,1
.L11:
	.loc 2 122 43 is_stmt 1 discriminator 1
	.loc 2 122 10 is_stmt 0 discriminator 1
	lw	a5,0(s0)
	.loc 2 122 43 discriminator 1
	beq	a5,a4,.L11
	.loc 2 124 2 is_stmt 1
	.loc 2 124 36 is_stmt 0
	li	a5,939524096
	sw	zero,256(a5)
	.loc 2 125 2 is_stmt 1
	.loc 2 125 36 is_stmt 0
	li	a3,-10
	sw	a3,260(a5)
	.loc 2 126 2 is_stmt 1
	.loc 2 126 36 is_stmt 0
	li	a2,-9
	sw	a2,264(a5)
	.loc 2 127 2 is_stmt 1
	.loc 2 127 36 is_stmt 0
	li	a0,23
	sw	a0,268(a5)
	.loc 2 128 2 is_stmt 1
	.loc 2 128 36 is_stmt 0
	li	a1,56
	sw	a1,272(a5)
	.loc 2 129 2 is_stmt 1
	.loc 2 129 36 is_stmt 0
	li	s4,63
	sw	s4,276(a5)
	.loc 2 130 2 is_stmt 1
	.loc 2 130 36 is_stmt 0
	sw	a1,280(a5)
	.loc 2 131 2 is_stmt 1
	.loc 2 131 36 is_stmt 0
	sw	a0,284(a5)
	.loc 2 132 2 is_stmt 1
	.loc 2 132 36 is_stmt 0
	sw	a2,288(a5)
	.loc 2 133 2 is_stmt 1
	.loc 2 133 36 is_stmt 0
	sw	a3,292(a5)
	.loc 2 134 2 is_stmt 1
	.loc 2 134 36 is_stmt 0
	sw	zero,296(a5)
	.loc 2 135 2 is_stmt 1
	.loc 2 135 36 is_stmt 0
	sw	zero,304(a5)
	.loc 2 136 2 is_stmt 1
	.loc 2 136 36 is_stmt 0
	sw	a4,308(a5)
	.loc 2 137 2 is_stmt 1
	.loc 2 137 36 is_stmt 0
	li	a2,2
	sw	a2,312(a5)
	.loc 2 138 2 is_stmt 1
	.loc 2 138 36 is_stmt 0
	li	a3,3
	sw	a3,316(a5)
	.loc 2 139 2 is_stmt 1
	.loc 2 139 36 is_stmt 0
	li	s3,4
	sw	s3,320(a5)
	.loc 2 140 2 is_stmt 1
	.loc 2 140 36 is_stmt 0
	li	s2,5
	sw	s2,324(a5)
	.loc 2 141 2 is_stmt 1
	.loc 2 141 36 is_stmt 0
	li	s1,6
	sw	s1,328(a5)
	.loc 2 142 2 is_stmt 1
	.loc 2 142 36 is_stmt 0
	li	ra,7
	sw	ra,332(a5)
	.loc 2 143 2 is_stmt 1
	.loc 2 143 36 is_stmt 0
	li	t2,8
	sw	t2,336(a5)
	.loc 2 144 2 is_stmt 1
	.loc 2 144 36 is_stmt 0
	li	t0,9
	sw	t0,340(a5)
	.loc 2 145 2 is_stmt 1
	.loc 2 145 36 is_stmt 0
	li	t6,10
	sw	t6,344(a5)
	.loc 2 146 2 is_stmt 1
	.loc 2 146 36 is_stmt 0
	li	t5,11
	sw	t5,348(a5)
	.loc 2 147 2 is_stmt 1
	.loc 2 147 36 is_stmt 0
	li	t4,12
	sw	t4,352(a5)
	.loc 2 148 2 is_stmt 1
	.loc 2 148 36 is_stmt 0
	li	t3,13
	sw	t3,356(a5)
	.loc 2 149 2 is_stmt 1
	.loc 2 149 36 is_stmt 0
	li	t1,14
	sw	t1,360(a5)
	.loc 2 150 2 is_stmt 1
	.loc 2 150 36 is_stmt 0
	li	a7,15
	sw	a7,364(a5)
	.loc 2 151 2 is_stmt 1
	.loc 2 151 36 is_stmt 0
	li	a6,16
	sw	a6,368(a5)
	.loc 2 152 2 is_stmt 1
	.loc 2 152 36 is_stmt 0
	li	s5,17
	sw	s5,372(a5)
	.loc 2 153 2 is_stmt 1
	.loc 2 153 36 is_stmt 0
	li	s5,18
	sw	s5,376(a5)
	.loc 2 154 2 is_stmt 1
	.loc 2 154 36 is_stmt 0
	li	s5,19
	sw	s5,380(a5)
	.loc 2 155 2 is_stmt 1
	.loc 2 155 36 is_stmt 0
	li	s5,20
	sw	s5,384(a5)
	.loc 2 156 2 is_stmt 1
	.loc 2 156 36 is_stmt 0
	li	s5,21
	sw	s5,388(a5)
	.loc 2 157 2 is_stmt 1
	.loc 2 157 36 is_stmt 0
	li	s5,22
	sw	s5,392(a5)
	.loc 2 158 2 is_stmt 1
	.loc 2 158 36 is_stmt 0
	sw	a0,396(a5)
	.loc 2 159 2 is_stmt 1
	.loc 2 159 36 is_stmt 0
	li	a0,24
	sw	a0,400(a5)
	.loc 2 160 2 is_stmt 1
	.loc 2 160 36 is_stmt 0
	li	a0,25
	sw	a0,404(a5)
	.loc 2 161 2 is_stmt 1
	.loc 2 161 36 is_stmt 0
	li	a0,26
	sw	a0,408(a5)
	.loc 2 162 2 is_stmt 1
	.loc 2 162 36 is_stmt 0
	li	a0,27
	sw	a0,412(a5)
	.loc 2 163 2 is_stmt 1
	.loc 2 163 36 is_stmt 0
	li	a0,28
	sw	a0,416(a5)
	.loc 2 164 2 is_stmt 1
	.loc 2 164 36 is_stmt 0
	li	a0,29
	sw	a0,420(a5)
	.loc 2 165 2 is_stmt 1
	.loc 2 165 36 is_stmt 0
	li	a0,30
	sw	a0,424(a5)
	.loc 2 166 2 is_stmt 1
	.loc 2 166 36 is_stmt 0
	li	a0,31
	sw	a0,428(a5)
	.loc 2 167 2 is_stmt 1
	.loc 2 167 36 is_stmt 0
	li	a0,32
	sw	a0,432(a5)
	.loc 2 168 2 is_stmt 1
	.loc 2 168 36 is_stmt 0
	li	a0,33
	sw	a0,436(a5)
	.loc 2 169 2 is_stmt 1
	.loc 2 169 36 is_stmt 0
	li	a0,34
	sw	a0,440(a5)
	.loc 2 170 2 is_stmt 1
	.loc 2 170 36 is_stmt 0
	li	a0,35
	sw	a0,444(a5)
	.loc 2 171 2 is_stmt 1
	.loc 2 171 36 is_stmt 0
	li	a0,36
	sw	a0,448(a5)
	.loc 2 172 2 is_stmt 1
	.loc 2 172 36 is_stmt 0
	li	a0,37
	sw	a0,452(a5)
	.loc 2 173 2 is_stmt 1
	.loc 2 173 36 is_stmt 0
	li	a0,38
	sw	a0,456(a5)
	.loc 2 174 2 is_stmt 1
	.loc 2 174 36 is_stmt 0
	li	a0,39
	sw	a0,460(a5)
	.loc 2 175 2 is_stmt 1
	.loc 2 175 36 is_stmt 0
	li	a0,40
	sw	a0,464(a5)
	.loc 2 176 2 is_stmt 1
	.loc 2 176 36 is_stmt 0
	li	a0,41
	sw	a0,468(a5)
	.loc 2 177 2 is_stmt 1
	.loc 2 177 36 is_stmt 0
	li	a0,42
	sw	a0,472(a5)
	.loc 2 178 2 is_stmt 1
	.loc 2 178 36 is_stmt 0
	li	a0,43
	sw	a0,476(a5)
	.loc 2 179 2 is_stmt 1
	.loc 2 179 36 is_stmt 0
	li	a0,44
	sw	a0,480(a5)
	.loc 2 180 2 is_stmt 1
	.loc 2 180 36 is_stmt 0
	li	a0,45
	sw	a0,484(a5)
	.loc 2 181 2 is_stmt 1
	.loc 2 181 36 is_stmt 0
	li	a0,46
	sw	a0,488(a5)
	.loc 2 182 2 is_stmt 1
	.loc 2 182 36 is_stmt 0
	li	a0,47
	sw	a0,492(a5)
	.loc 2 183 2 is_stmt 1
	.loc 2 183 36 is_stmt 0
	li	a0,48
	sw	a0,496(a5)
	.loc 2 184 2 is_stmt 1
	.loc 2 184 36 is_stmt 0
	li	a0,49
	sw	a0,500(a5)
	.loc 2 185 2 is_stmt 1
	.loc 2 185 36 is_stmt 0
	li	a0,50
	sw	a0,504(a5)
	.loc 2 186 2 is_stmt 1
	.loc 2 186 36 is_stmt 0
	li	a0,51
	sw	a0,508(a5)
	.loc 2 187 2 is_stmt 1
	.loc 2 187 36 is_stmt 0
	li	a0,52
	sw	a0,512(a5)
	.loc 2 188 2 is_stmt 1
	.loc 2 188 36 is_stmt 0
	li	a0,53
	sw	a0,516(a5)
	.loc 2 189 2 is_stmt 1
	.loc 2 189 36 is_stmt 0
	li	a0,54
	sw	a0,520(a5)
	.loc 2 190 2 is_stmt 1
	.loc 2 190 36 is_stmt 0
	li	a0,55
	sw	a0,524(a5)
	.loc 2 191 2 is_stmt 1
	.loc 2 191 36 is_stmt 0
	sw	a1,528(a5)
	.loc 2 192 2 is_stmt 1
	.loc 2 192 36 is_stmt 0
	li	a1,57
	sw	a1,532(a5)
	.loc 2 193 2 is_stmt 1
	.loc 2 193 36 is_stmt 0
	li	a1,58
	sw	a1,536(a5)
	.loc 2 194 2 is_stmt 1
	.loc 2 194 36 is_stmt 0
	li	a1,59
	sw	a1,540(a5)
	.loc 2 195 2 is_stmt 1
	.loc 2 195 36 is_stmt 0
	li	a1,60
	sw	a1,544(a5)
	.loc 2 196 2 is_stmt 1
	.loc 2 196 36 is_stmt 0
	li	a1,61
	sw	a1,548(a5)
	.loc 2 197 2 is_stmt 1
	.loc 2 197 36 is_stmt 0
	li	a1,62
	sw	a1,552(a5)
	.loc 2 198 2 is_stmt 1
	.loc 2 198 36 is_stmt 0
	sw	s4,556(a5)
	.loc 2 199 2 is_stmt 1
	.loc 2 199 36 is_stmt 0
	sw	zero,560(a5)
	.loc 2 200 2 is_stmt 1
	.loc 2 200 36 is_stmt 0
	sw	a4,564(a5)
	.loc 2 201 2 is_stmt 1
	.loc 2 201 36 is_stmt 0
	sw	a2,568(a5)
	.loc 2 202 2 is_stmt 1
	.loc 2 202 36 is_stmt 0
	sw	a3,572(a5)
	.loc 2 203 2 is_stmt 1
	.loc 2 203 36 is_stmt 0
	sw	zero,576(a5)
	.loc 2 204 2 is_stmt 1
	.loc 2 204 36 is_stmt 0
	sw	a4,580(a5)
	.loc 2 205 2 is_stmt 1
	.loc 2 205 36 is_stmt 0
	sw	a2,584(a5)
	.loc 2 206 2 is_stmt 1
	.loc 2 206 36 is_stmt 0
	sw	a3,588(a5)
	.loc 2 207 2 is_stmt 1
	.loc 2 207 36 is_stmt 0
	sw	zero,592(a5)
	.loc 2 208 2 is_stmt 1
	.loc 2 208 36 is_stmt 0
	sw	a4,596(a5)
	.loc 2 209 2 is_stmt 1
	.loc 2 209 36 is_stmt 0
	sw	a2,600(a5)
	.loc 2 210 2 is_stmt 1
	.loc 2 210 36 is_stmt 0
	sw	a3,604(a5)
	.loc 2 211 2 is_stmt 1
	.loc 2 211 36 is_stmt 0
	sw	zero,608(a5)
	.loc 2 212 2 is_stmt 1
	.loc 2 212 36 is_stmt 0
	sw	a4,612(a5)
	.loc 2 213 2 is_stmt 1
	.loc 2 213 36 is_stmt 0
	sw	a2,616(a5)
	.loc 2 214 2 is_stmt 1
	.loc 2 214 36 is_stmt 0
	sw	a3,620(a5)
	.loc 2 215 2 is_stmt 1
	.loc 2 215 36 is_stmt 0
	sw	a4,624(a5)
	.loc 2 216 2 is_stmt 1
	.loc 2 216 36 is_stmt 0
	sw	a2,628(a5)
	.loc 2 217 2 is_stmt 1
	.loc 2 217 36 is_stmt 0
	sw	a3,632(a5)
	.loc 2 218 2 is_stmt 1
	.loc 2 218 36 is_stmt 0
	sw	s3,636(a5)
	.loc 2 219 2 is_stmt 1
	.loc 2 219 36 is_stmt 0
	sw	s2,640(a5)
	.loc 2 220 2 is_stmt 1
	.loc 2 220 36 is_stmt 0
	sw	s1,644(a5)
	.loc 2 221 2 is_stmt 1
	.loc 2 221 36 is_stmt 0
	sw	ra,648(a5)
	.loc 2 222 2 is_stmt 1
	.loc 2 222 36 is_stmt 0
	sw	t2,652(a5)
	.loc 2 223 2 is_stmt 1
	.loc 2 223 36 is_stmt 0
	sw	t0,656(a5)
	.loc 2 224 2 is_stmt 1
	.loc 2 224 36 is_stmt 0
	sw	t6,660(a5)
	.loc 2 225 2 is_stmt 1
	.loc 2 225 36 is_stmt 0
	sw	t5,664(a5)
	.loc 2 226 2 is_stmt 1
	.loc 2 226 36 is_stmt 0
	sw	t4,668(a5)
	.loc 2 227 2 is_stmt 1
	.loc 2 227 36 is_stmt 0
	sw	t3,672(a5)
	.loc 2 228 2 is_stmt 1
	.loc 2 228 36 is_stmt 0
	sw	t1,676(a5)
	.loc 2 229 2 is_stmt 1
	.loc 2 229 36 is_stmt 0
	sw	a7,680(a5)
	.loc 2 230 2 is_stmt 1
	.loc 2 230 36 is_stmt 0
	sw	a6,684(a5)
	.loc 2 231 2 is_stmt 1
	.loc 2 231 36 is_stmt 0
	sw	a4,688(a5)
	.loc 2 232 2 is_stmt 1
	.loc 2 232 36 is_stmt 0
	li	a5,-1420820480
	sw	a5,12(s0)
	.loc 2 233 2 is_stmt 1
	.loc 2 233 13 is_stmt 0
	call	qsort
.LVL14:
	.loc 2 234 2 is_stmt 1
	.loc 2 234 43 is_stmt 0
	lw	a5,0(a0)
	.loc 2 245 1
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
	.loc 2 234 43
	slli	a5,a5,16
	.loc 2 234 36
	sw	a5,12(s0)
	.loc 2 235 2 is_stmt 1
	.loc 2 235 47 is_stmt 0
	lw	a5,4(a0)
	.loc 2 245 1
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	.loc 2 235 47
	slli	a5,a5,16
	.loc 2 235 36
	sw	a5,12(s0)
	.loc 2 236 2 is_stmt 1
	.loc 2 236 47 is_stmt 0
	lw	a5,8(a0)
	.loc 2 245 1
	lw	s4,8(sp)
	.cfi_restore 20
	lw	s5,4(sp)
	.cfi_restore 21
	.loc 2 236 47
	slli	a5,a5,16
	.loc 2 236 36
	sw	a5,12(s0)
	.loc 2 237 2 is_stmt 1
	.loc 2 237 47 is_stmt 0
	lw	a5,12(a0)
	slli	a5,a5,16
	.loc 2 237 36
	sw	a5,12(s0)
	.loc 2 238 2 is_stmt 1
	.loc 2 238 47 is_stmt 0
	lw	a5,16(a0)
	slli	a5,a5,16
	.loc 2 238 36
	sw	a5,12(s0)
	.loc 2 239 2 is_stmt 1
	.loc 2 239 47 is_stmt 0
	lw	a5,20(a0)
	slli	a5,a5,16
	.loc 2 239 36
	sw	a5,12(s0)
	.loc 2 240 2 is_stmt 1
	.loc 2 240 47 is_stmt 0
	lw	a5,24(a0)
	slli	a5,a5,16
	.loc 2 240 36
	sw	a5,12(s0)
	.loc 2 241 2 is_stmt 1
	.loc 2 241 47 is_stmt 0
	lw	a5,28(a0)
	slli	a5,a5,16
	.loc 2 241 36
	sw	a5,12(s0)
	.loc 2 242 2 is_stmt 1
	.loc 2 242 47 is_stmt 0
	lw	a5,32(a0)
	slli	a5,a5,16
	.loc 2 242 36
	sw	a5,12(s0)
	.loc 2 243 2 is_stmt 1
	.loc 2 243 47 is_stmt 0
	lw	a5,36(a0)
	slli	a5,a5,16
	.loc 2 243 36
	sw	a5,12(s0)
	.loc 2 244 2 is_stmt 1
	.loc 2 244 36 is_stmt 0
	li	a5,-1419706368
	sw	a5,12(s0)
	.loc 2 245 1
	lw	s0,24(sp)
	.cfi_restore 8
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE323:
	.size	main, .-main
	.text
.Letext0:
	.file 6 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x21a
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x9
	.4byte	.LASF17
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL7
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
	.byte	0xa
	.4byte	.LASF18
	.byte	0x6
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
	.byte	0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0xc
	.4byte	.LASF19
	.byte	0x2
	.byte	0x22
	.byte	0xd
	.4byte	0x8a
	.4byte	0x8a
	.byte	0xd
	.byte	0
	.byte	0x4
	.4byte	0x6a
	.byte	0xe
	.4byte	.LASF20
	.byte	0x2
	.byte	0x2d
	.byte	0x6
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.byte	0x1
	.byte	0x9c
	.4byte	0x144
	.byte	0xf
	.4byte	.LASF11
	.byte	0x2
	.byte	0x30
	.byte	0x9
	.4byte	0x6a
	.4byte	.LLST2
	.byte	0x10
	.string	"tmp"
	.byte	0x2
	.byte	0xe9
	.byte	0x7
	.4byte	0x8a
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.4byte	0x15e
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.byte	0x72
	.byte	0x9
	.4byte	0xdc
	.byte	0x11
	.4byte	0x16f
	.byte	0
	.byte	0x3
	.4byte	0x144
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.byte	0x74
	.byte	0x2
	.4byte	0xf9
	.byte	0x2
	.4byte	0x151
	.4byte	.LLST3
	.byte	0
	.byte	0x3
	.4byte	0x1e9
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.byte	0x76
	.byte	0x2
	.4byte	0x13a
	.byte	0x2
	.4byte	0x1f7
	.4byte	.LLST4
	.byte	0x12
	.4byte	0x203
	.4byte	.LBB17
	.4byte	.LBE17-.LBB17
	.byte	0x4
	.2byte	0x326
	.byte	0x2
	.byte	0x2
	.4byte	0x214
	.4byte	.LLST5
	.byte	0x2
	.4byte	0x20c
	.4byte	.LLST4
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LVL14
	.4byte	0x78
	.byte	0
	.byte	0x13
	.4byte	.LASF15
	.byte	0x3
	.byte	0x1d
	.byte	0x14
	.byte	0x3
	.4byte	0x15e
	.byte	0x14
	.4byte	.LASF11
	.byte	0x3
	.byte	0x1d
	.byte	0x2d
	.4byte	0x71
	.byte	0
	.byte	0x15
	.4byte	.LASF21
	.byte	0x3
	.byte	0x16
	.byte	0x1c
	.4byte	0x71
	.byte	0x3
	.4byte	0x17c
	.byte	0x16
	.4byte	.LASF11
	.byte	0x3
	.byte	0x18
	.byte	0xf
	.4byte	0x71
	.byte	0
	.byte	0x6
	.4byte	.LASF13
	.byte	0x1a
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x1a7
	.byte	0x7
	.string	"p"
	.byte	0x1a
	.byte	0x18
	.4byte	0x1a7
	.4byte	.LLST1
	.byte	0x5
	.4byte	.LVL8
	.4byte	0x1b8
	.byte	0
	.byte	0x4
	.4byte	0x1b3
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x17
	.4byte	0x1ac
	.byte	0x6
	.4byte	.LASF14
	.byte	0x12
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x1e9
	.byte	0x7
	.string	"c"
	.byte	0x12
	.byte	0x13
	.4byte	0x1ac
	.4byte	.LLST0
	.byte	0x18
	.4byte	.LVL2
	.4byte	0x1b8
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3d
	.byte	0
	.byte	0
	.byte	0x1a
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x325
	.byte	0x14
	.byte	0x3
	.4byte	0x203
	.byte	0x1b
	.string	"v"
	.byte	0x4
	.2byte	0x325
	.byte	0x38
	.4byte	0x50
	.byte	0
	.byte	0x1c
	.4byte	.LASF22
	.byte	0x5
	.byte	0x20
	.byte	0x14
	.byte	0x3
	.byte	0x8
	.string	"v"
	.byte	0x33
	.4byte	0x5c
	.byte	0x8
	.string	"a"
	.byte	0x44
	.4byte	0x5c
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
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0x21
	.byte	0x2
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
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
	.byte	0x6
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
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x5
	.byte	0x3b
	.byte	0x21
	.byte	0x20
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xc
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
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
	.byte	0x34
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x34
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
	.byte	0x11
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0x5
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x2e
	.byte	0x1
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x5
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
	.byte	0x15
	.byte	0x2e
	.byte	0x1
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
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x34
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
	.byte	0x17
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x2e
	.byte	0x1
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
	.byte	0x20
	.byte	0xb
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
.LLST2:
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LVL10
	.byte	0x5
	.byte	0x7e
	.byte	0
	.byte	0x34
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL12
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LVL10
	.byte	0x5
	.byte	0x7e
	.byte	0
	.byte	0x34
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST4:
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL13
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL13
	.byte	0x6
	.byte	0x9e
	.byte	0x4
	.4byte	0xf0006814
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL4
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LFE317
	.byte	0x1
	.byte	0x58
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LFE316
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
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
.LLRL7:
	.byte	0x6
	.4byte	.Ltext0
	.4byte	.Letext0
	.byte	0x6
	.4byte	.LFB323
	.4byte	.LFE323
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF22:
	.string	"csr_write_simple"
.LASF19:
	.string	"qsort"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF14:
	.string	"putchar"
.LASF20:
	.string	"main"
.LASF21:
	.string	"irq_getmask"
.LASF15:
	.string	"irq_setmask"
.LASF10:
	.string	"unsigned int"
.LASF17:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -Os -ffreestanding"
.LASF16:
	.string	"user_irq_0_ev_enable_write"
.LASF9:
	.string	"long long unsigned int"
.LASF5:
	.string	"long long int"
.LASF11:
	.string	"mask"
.LASF13:
	.string	"print"
.LASF3:
	.string	"short int"
.LASF18:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF12:
	.string	"char"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"all.c"
.LASF1:
	.string	"/home/ubuntu/SOC-final-project/testbench/all"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
