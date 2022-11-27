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
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rax, -8[rbp]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	movsd	xmm0, QWORD PTR -8[rbp]
	leave
	ret
	.size	GetInput, .-GetInput
	.globl	Fact
	.type	Fact, @function
Fact:
	push	rbp
	mov	rbp, rsp
        mov	r12d, edi
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	xmm11, xmm0
	mov	r13d, 1
	jmp	.L4
.L5:
	cvtsi2sd	xmm0, r13d
	movsd	xmm1, xmm11
	mulsd	xmm0, xmm1
	movsd	xmm11, xmm0
	add	r13d, 1
.L4:
	mov	eax, r13d
	cmp	eax, r12d
	jle	.L5
	movsd	xmm0, xmm11
	pop	rbp
	ret
	.size	Fact, .-Fact
	.globl	Arcsin
	.type	Arcsin, @function
Arcsin:
	push	rbp
	mov	rbp, rsp
	movsd	xmm12, xmm0
	pxor	xmm0, xmm0
	movsd	xmm15, xmm0
	mov	r15d, 0
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	xmm9, xmm0
	movsd	xmm0, xmm12
	movsd	xmm7, xmm0
	pxor	xmm0, xmm0
	movsd	xmm8, xmm0
	movsd	xmm0, QWORD PTR .LC1[rip]
	pxor	xmm1, xmm1
	divsd	xmm0, xmm1
	movsd	xmm6, xmm0
	movsd	xmm0, QWORD PTR .LC3[rip]
	pxor	xmm1, xmm1
	divsd	xmm0, xmm1
	movsd	xmm5, xmm0
	jmp	.L8
.L12:
	movsd	xmm0, xmm15
	addsd	xmm0, xmm8
	movsd	xmm15, xmm0
	mov	eax, r15d
	add	eax, eax
	mov	edi, eax
	call	Fact
	mulsd	xmm0, xmm7
	divsd	xmm0, xmm9
	movsd	xmm4, xmm0
	mov	eax, r15d
	mov	edi, eax
	call	Fact
	movsd	xmm2, xmm4
	divsd	xmm2, xmm0
	movsd	xmm4, xmm2
	mov	eax, r15d
	mov	edi, eax
	call	Fact
	movsd	xmm2, xmm4
	divsd	xmm2, xmm0
	movapd	xmm0, xmm2
	mov	eax, r15d
	add	eax, eax
	add	eax, 1
	cvtsi2sd	xmm1, eax
	divsd	xmm0, xmm1
	movsd	xmm8, xmm0
	movsd	xmm0, xmm12
	mulsd	xmm0, xmm12
	movsd	xmm1, xmm7
	mulsd	xmm0, xmm1
	movsd	xmm7, xmm0
	movsd	xmm1, xmm9
	movsd	xmm0, QWORD PTR .LC4[rip]
	mulsd	xmm0, xmm1
	movsd	xmm9, xmm0
	add	r15d, 1
.L8:
	movsd	xmm0, xmm8
	ucomisd	xmm0, xmm6
	jp	.L13
	movsd	xmm0, xmm8
	ucomisd	xmm0, xmm6
	je	.L9
.L13:
	movsd	xmm0, xmm8
	ucomisd	xmm0, xmm5
	jp	.L14
	movsd	xmm0, xmm8
	ucomisd	xmm0, xmm5
	je	.L9
.L14:
	pxor	xmm0, xmm0
	ucomisd	xmm0, xmm7
	jp	.L12
	pxor	xmm0, xmm0
	ucomisd	xmm0, xmm7
	jne	.L12
.L9:
	movsd	xmm0, xmm15
	lea	rdi, .LC0[rip]
	mov	eax, 1
	call	printf@PLT
	mov	edi, 10
	call	putchar@PLT
	nop
	leave
	ret
	.size	Arcsin, .-Arcsin
	.section	.rodata
.LC5:
	.string	"Incorrect"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	mov	eax, 0
	call	GetInput
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
	movsd	xmm0, QWORD PTR .LC3[rip]
	ucomisd	xmm0, QWORD PTR -8[rbp]
	ja	.L16
	movsd	xmm0, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR .LC1[rip]
	ucomisd	xmm0, xmm1
	jbe	.L21
.L16:
	lea	rdi, .LC5[rip]
	call	puts@PLT
	jmp	.L19
.L21:
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR -40[rbp], rax
	movsd	xmm0, QWORD PTR -40[rbp]
	call	Arcsin
.L19:
	mov	eax, 0
	leave
	ret
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
