	.file	"arcsin.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%lf"
	.text
	.globl	GetInput
	.type	GetInput, @function
GetInput:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, -16[rbp]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	movsd	xmm0, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	xor	rax, QWORD PTR fs:40
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	GetInput, .-GetInput
	.globl	Fact
	.type	Fact, @function
Fact:
.LFB1:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -20[rbp], edi
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -12[rbp], 1
	jmp	.L5
.L6:
	cvtsi2sd	xmm0, DWORD PTR -12[rbp]
	movsd	xmm1, QWORD PTR -8[rbp]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -12[rbp], 1
.L5:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jle	.L6
	movsd	xmm0, QWORD PTR -8[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	Fact, .-Fact
	.globl	Arcsin
	.type	Arcsin, @function
Arcsin:
.LFB2:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	movsd	QWORD PTR -72[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -48[rbp], xmm0
	mov	DWORD PTR -52[rbp], 0
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	xmm0, QWORD PTR -72[rbp]
	movsd	QWORD PTR -32[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC1[rip]
	pxor	xmm1, xmm1
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC3[rip]
	pxor	xmm1, xmm1
	divsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	jmp	.L9
.L13:
	movsd	xmm0, QWORD PTR -48[rbp]
	addsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -48[rbp], xmm0
	mov	eax, DWORD PTR -52[rbp]
	add	eax, eax
	mov	edi, eax
	call	Fact
	mulsd	xmm0, QWORD PTR -32[rbp]
	divsd	xmm0, QWORD PTR -40[rbp]
	movsd	QWORD PTR -80[rbp], xmm0
	mov	eax, DWORD PTR -52[rbp]
	mov	edi, eax
	call	Fact
	movsd	xmm2, QWORD PTR -80[rbp]
	divsd	xmm2, xmm0
	movsd	QWORD PTR -80[rbp], xmm2
	mov	eax, DWORD PTR -52[rbp]
	mov	edi, eax
	call	Fact
	movsd	xmm2, QWORD PTR -80[rbp]
	divsd	xmm2, xmm0
	movapd	xmm0, xmm2
	mov	eax, DWORD PTR -52[rbp]
	add	eax, eax
	add	eax, 1
	cvtsi2sd	xmm1, eax
	divsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR -72[rbp]
	mulsd	xmm0, QWORD PTR -72[rbp]
	movsd	xmm1, QWORD PTR -32[rbp]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0
	movsd	xmm1, QWORD PTR -40[rbp]
	movsd	xmm0, QWORD PTR .LC4[rip]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0
	add	DWORD PTR -52[rbp], 1
.L9:
	movsd	xmm0, QWORD PTR -24[rbp]
	ucomisd	xmm0, QWORD PTR -16[rbp]
	jp	.L14
	movsd	xmm0, QWORD PTR -24[rbp]
	ucomisd	xmm0, QWORD PTR -16[rbp]
	je	.L10
.L14:
	movsd	xmm0, QWORD PTR -24[rbp]
	ucomisd	xmm0, QWORD PTR -8[rbp]
	jp	.L15
	movsd	xmm0, QWORD PTR -24[rbp]
	ucomisd	xmm0, QWORD PTR -8[rbp]
	je	.L10
.L15:
	pxor	xmm0, xmm0
	ucomisd	xmm0, QWORD PTR -32[rbp]
	jp	.L13
	pxor	xmm0, xmm0
	ucomisd	xmm0, QWORD PTR -32[rbp]
	jne	.L13
.L10:
	mov	rax, QWORD PTR -48[rbp]
	mov	QWORD PTR -80[rbp], rax
	movsd	xmm0, QWORD PTR -80[rbp]
	lea	rdi, .LC0[rip]
	mov	eax, 1
	call	printf@PLT
	mov	edi, 10
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	Arcsin, .-Arcsin
	.section	.rodata
.LC5:
	.string	"Incorrect"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	mov	eax, 0
	call	GetInput
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
	movsd	xmm0, QWORD PTR .LC3[rip]
	ucomisd	xmm0, QWORD PTR -8[rbp]
	ja	.L17
	movsd	xmm0, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR .LC1[rip]
	ucomisd	xmm0, xmm1
	jbe	.L22
.L17:
	lea	rdi, .LC5[rip]
	call	puts@PLT
	jmp	.L20
.L22:
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR -40[rbp], rax
	movsd	xmm0, QWORD PTR -40[rbp]
	call	Arcsin
.L20:
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	0
	.long	-1074790400
	.align 8
.LC4:
	.long	0
	.long	1074790400
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
