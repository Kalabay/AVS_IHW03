	.file	"arcsin.c"
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movsd	-16(%rbp), %xmm0
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$1, -12(%rbp)
	jmp	.L5
.L6:
	cvtsi2sd	-12(%rbp), %xmm0
	movsd	-8(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	addl	$1, -12(%rbp)
.L5:
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jle	.L6
	movsd	-8(%rbp), %xmm0
	popq	%rbp
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movsd	%xmm0, -72(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -48(%rbp)
	movl	$0, -52(%rbp)
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-72(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	.LC1(%rip), %xmm0
	pxor	%xmm1, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	.LC3(%rip), %xmm0
	pxor	%xmm1, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L9
.L13:
	movsd	-48(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, %edi
	call	Fact
	mulsd	-32(%rbp), %xmm0
	divsd	-40(%rbp), %xmm0
	movsd	%xmm0, -80(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, %edi
	call	Fact
	movsd	-80(%rbp), %xmm2
	divsd	%xmm0, %xmm2
	movsd	%xmm2, -80(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, %edi
	call	Fact
	movsd	-80(%rbp), %xmm2
	divsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm0
	movl	-52(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-72(%rbp), %xmm0
	mulsd	-72(%rbp), %xmm0
	movsd	-32(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-40(%rbp), %xmm1
	movsd	.LC4(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	addl	$1, -52(%rbp)
.L9:
	movsd	-24(%rbp), %xmm0
	ucomisd	-16(%rbp), %xmm0
	jp	.L14
	movsd	-24(%rbp), %xmm0
	ucomisd	-16(%rbp), %xmm0
	je	.L10
.L14:
	movsd	-24(%rbp), %xmm0
	ucomisd	-8(%rbp), %xmm0
	jp	.L15
	movsd	-24(%rbp), %xmm0
	ucomisd	-8(%rbp), %xmm0
	je	.L10
.L15:
	pxor	%xmm0, %xmm0
	ucomisd	-32(%rbp), %xmm0
	jp	.L13
	pxor	%xmm0, %xmm0
	ucomisd	-32(%rbp), %xmm0
	jne	.L13
.L10:
	movq	-48(%rbp), %rax
	movq	%rax, -80(%rbp)
	movsd	-80(%rbp), %xmm0
	leaq	.LC0(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$10, %edi
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, %eax
	call	GetInput
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movsd	.LC3(%rip), %xmm0
	ucomisd	-8(%rbp), %xmm0
	ja	.L17
	movsd	-8(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm1
	ucomisd	%xmm1, %xmm0
	jbe	.L22
.L17:
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	jmp	.L20
.L22:
	movq	-8(%rbp), %rax
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	call	Arcsin
.L20:
	movl	$0, %eax
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
