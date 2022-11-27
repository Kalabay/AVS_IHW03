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
	mov	DWORD PTR -20[rbp], edi
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -12[rbp], 1
	jmp	.L4
.L5:
	cvtsi2sd	xmm0, DWORD PTR -12[rbp]
	movsd	xmm1, QWORD PTR -8[rbp]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -12[rbp], 1
.L4:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jle	.L5
	movsd	xmm0, QWORD PTR -8[rbp]
	pop	rbp
	ret
	.size	Fact, .-Fact
	.globl	Arcsin
	.type	Arcsin, @function
Arcsin:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	movsd	QWORD PTR -72[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -12[rbp], 0
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR -72[rbp]
	movsd	QWORD PTR -32[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC1[rip]
	pxor	xmm1, xmm1
	divsd	xmm0, xmm1
	movsd	QWORD PTR -48[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC3[rip]
	pxor	xmm1, xmm1
	divsd	xmm0, xmm1
	movsd	QWORD PTR -56[rbp], xmm0
	jmp	.L8
.L12:
	movsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, QWORD PTR -40[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	mov	eax, DWORD PTR -12[rbp]
	add	eax, eax
	mov	edi, eax
	call	Fact
	mulsd	xmm0, QWORD PTR -32[rbp]
	divsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -80[rbp], xmm0
	mov	eax, DWORD PTR -12[rbp]
	mov	edi, eax
	call	Fact
	movsd	xmm2, QWORD PTR -80[rbp]
	divsd	xmm2, xmm0
	movsd	QWORD PTR -80[rbp], xmm2
	mov	eax, DWORD PTR -12[rbp]
	mov	edi, eax
	call	Fact
	movsd	xmm2, QWORD PTR -80[rbp]
	divsd	xmm2, xmm0
	movapd	xmm0, xmm2
	mov	eax, DWORD PTR -12[rbp]
	add	eax, eax
	add	eax, 1
	cvtsi2sd	xmm1, eax
	divsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	xmm0, QWORD PTR -72[rbp]
	mulsd	xmm0, QWORD PTR -72[rbp]
	movsd	xmm1, QWORD PTR -32[rbp]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0
	movsd	xmm1, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR .LC4[rip]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	add	DWORD PTR -12[rbp], 1
.L8:
	movsd	xmm0, QWORD PTR -40[rbp]
	ucomisd	xmm0, QWORD PTR -48[rbp]
	jp	.L13
	movsd	xmm0, QWORD PTR -40[rbp]
	ucomisd	xmm0, QWORD PTR -48[rbp]
	je	.L9
.L13:
	movsd	xmm0, QWORD PTR -40[rbp]
	ucomisd	xmm0, QWORD PTR -56[rbp]
	jp	.L14
	movsd	xmm0, QWORD PTR -40[rbp]
	ucomisd	xmm0, QWORD PTR -56[rbp]
	je	.L9
.L14:
	pxor	xmm0, xmm0
	ucomisd	xmm0, QWORD PTR -32[rbp]
	jp	.L12
	pxor	xmm0, xmm0
	ucomisd	xmm0, QWORD PTR -32[rbp]
	jne	.L12
.L9:
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR -80[rbp], rax
	movsd	xmm0, QWORD PTR -80[rbp]
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
