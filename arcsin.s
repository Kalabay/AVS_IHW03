	.file	"arcsin.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%lf"
	.text
	.globl	GetInput
	.type	GetInput, @function
GetInput:                                           # функция - считывние числа
	push	rbp                                 # сохраняем указатель на стэк
	mov	rbp, rsp                            # изменение области видимости функции в памяти
	sub	rsp, 16                             # rsp -= 16, выделил 16 байт памяти
	lea	rax, -8[rbp]
	mov	rsi, rax                            # rsi = rax = x, второй аргумент
	lea	rdi, .LC0[rip]                      # первый аргумент scanf = "%lf"
	mov	eax, 0                              # eax = 0
	call	__isoc99_scanf@PLT                  # вызываем scanf
	movsd	xmm0, QWORD PTR -8[rbp]
	leave                                       # выйти из функции, очистить стек, восстановить предыдущее значение rbp
	ret                                         # вернуться к вызову функции
	.size	GetInput, .-GetInput
	.globl	Fact
	.type	Fact, @function
Fact:                                               # функция - поиск факториала
	push	rbp                                 # сохраняем указатель на стэк 
	mov	rbp, rsp                            # изменение области видимости функции
	mov	DWORD PTR -20[rbp], edi             # (по адресу rbp-20) = edi = n
	movsd	xmm0, QWORD PTR .LC1[rip]           # xmm0 = 1
	movsd	QWORD PTR -8[rbp], xmm0             # fact = xmm0 = 1
	mov	DWORD PTR -12[rbp], 1               # i = 1
	jmp	.L4                                 # начинаем for
.L5:                                                # fact *= i и ++i
	cvtsi2sd	xmm0, DWORD PTR -12[rbp]    # преобразование в double
	movsd	xmm1, QWORD PTR -8[rbp]             # берём fact
	mulsd	xmm0, xmm1                          # вычисляем произведение
	movsd	QWORD PTR -8[rbp], xmm0             # обновили значение fact
	add	DWORD PTR -12[rbp], 1               # ++i
.L4:                                                
	mov	eax, DWORD PTR -12[rbp]             # берём i
	cmp	eax, DWORD PTR -20[rbp]             # сравниваем с n
	jle	.L5                                 # если i <= n, то прыгаем на .L5
	movsd	xmm0, QWORD PTR -8[rbp]             # для возврата fact
	pop	rbp
	ret                                         # вернуться к вызову функции
	.size	Fact, .-Fact
	.globl	Arcsin
	.type	Arcsin, @function
Arcsin:                                             # функция для вычисления arcsin
	push	rbp                                 # функция - считывние числа
	mov	rbp, rsp                            # изменение области видимости функции в памяти
	sub	rsp, 80                             # rsp -= 80, выделил 80 байт памяти
	movsd	QWORD PTR -72[rbp], xmm0            # записываем значение x
	pxor	xmm0, xmm0                          # xmm0 = 0
	movsd	QWORD PTR -8[rbp], xmm0             # arcsin = xmm0 = 0
	mov	DWORD PTR -12[rbp], 0               # n = 0
	movsd	xmm0, QWORD PTR .LC1[rip]           # xmm0 = 1
	movsd	QWORD PTR -24[rbp], xmm0            # four = xmm0 = 1
	movsd	xmm0, QWORD PTR -72[rbp]            # xmm0 = x
	movsd	QWORD PTR -32[rbp], xmm0            # xNow = xmm0 = x
	pxor	xmm0, xmm0                          # xmm0 = 0
	movsd	QWORD PTR -40[rbp], xmm0            # add = xmm0 = 0
	movsd	xmm0, QWORD PTR .LC1[rip]           # xmm0 = 1
	pxor	xmm1, xmm1                          # xmm1 = 0
	divsd	xmm0, xmm1                          # 1 / 0 = inf
	movsd	QWORD PTR -48[rbp], xmm0            # POS_INF = inf
	movsd	xmm0, QWORD PTR .LC3[rip]           # xmm0 = -1
	pxor	xmm1, xmm1                          # xmm1 = 0
	divsd	xmm0, xmm1                          # -1 / 0 = -inf
	movsd	QWORD PTR -56[rbp], xmm0            # NEG_INF = -inf
	jmp	.L8                                 # начинаем while
.L12:
	movsd	xmm0, QWORD PTR -8[rbp]             # xmm0 = arcsin
	addsd	xmm0, QWORD PTR -40[rbp]            # xmm0 += add
	movsd	QWORD PTR -8[rbp], xmm0             # arcsin = xmm0, то есть по сути просто arcsin += add
	mov	eax, DWORD PTR -12[rbp]             # eax = n
	add	eax, eax                            # eax = 2 * n
	mov	edi, eax                            # edi = eax = 2 * n - аргумент Fact
	call	Fact                                # Fact(2 * n)
	mulsd	xmm0, QWORD PTR -32[rbp]            # Fact(2 * n) * xNow
	divsd	xmm0, QWORD PTR -24[rbp]            # (Fact(2 * n) * xNow) / four
	movsd	QWORD PTR -80[rbp], xmm0            # кладём Fact(2 * n) * xNow / four
	mov	eax, DWORD PTR -12[rbp]             # eax = n
	mov	edi, eax                            # edi = eax = n - аргумент Fact
	call	Fact                                # Fact(n)
	movsd	xmm2, QWORD PTR -80[rbp]            # xmm2 = Fact(2 * n) * xNow / four
	divsd	xmm2, xmm0                          # xmm2 = (Fact(2 * n) * xNow / four) / Fact(n)
	movsd	QWORD PTR -80[rbp], xmm2            # кладём Fact(2 * n) * xNow / four / Fact(n)
	mov	eax, DWORD PTR -12[rbp]             # eax = n
	mov	edi, eax                            # edi = eax = n - аргумент Fact
	call	Fact                                # Fact(n)
	movsd	xmm2, QWORD PTR -80[rbp]            # xmm2 = Fact(2 * n) * xNow / four / Fact(n)
	divsd	xmm2, xmm0                          # xmm2 = (Fact(2 * n) * xNow / four / Fact(n)) / Fact(n)
	movapd	xmm0, xmm2                          # xmm0 = xmm2 = Fact(2 * n) * xNow / four / Fact(n) / Fact(n)
	mov	eax, DWORD PTR -12[rbp]             # eax = n 
	add	eax, eax                            # eax = 2 * n
	add	eax, 1                              # eax = 2 * n + 1
	cvtsi2sd	xmm1, eax                   # преобразование в double 
	divsd	xmm0, xmm1                          # xmm0 = (Fact(2 * n) * xNow / four / Fact(n) / Fact(n)) / (2 * n + 1)
	movsd	QWORD PTR -40[rbp], xmm0            # кладём (Fact(2 * n) * xNow / four / Fact(n) / Fact(n)) / (2 * n + 1)
	movsd	xmm0, QWORD PTR -72[rbp]            # xmm0 = x
	mulsd	xmm0, QWORD PTR -72[rbp]            # xmm0 *= x, xmm0 = x * x
	movsd	xmm1, QWORD PTR -32[rbp]            # xmm1 = Xnow
	mulsd	xmm0, xmm1                          # xmm1 *= xmm0
	movsd	QWORD PTR -32[rbp], xmm0            # Xnow = xmm1, то есть Xnow = Xnow * x * x
	movsd	xmm1, QWORD PTR -24[rbp]            # xmm1 = four
	movsd	xmm0, QWORD PTR .LC4[rip]           # xmm0 = 4
	mulsd	xmm0, xmm1                          # xmm0 = 4 * four
	movsd	QWORD PTR -24[rbp], xmm0            # fout = 4 * fout
	add	DWORD PTR -12[rbp], 1               # ++n
.L8:
	movsd	xmm0, QWORD PTR -40[rbp]            # xmm0 = add
	ucomisd	xmm0, QWORD PTR -48[rbp]            # сравнение с POS_INF 
	jp	.L13                                # след. условие
	movsd	xmm0, QWORD PTR -40[rbp]            # xmm0 = add
	ucomisd	xmm0, QWORD PTR -48[rbp]            # сравнение с POS_INF 
	je	.L9                                 # выход из while
.L13:
	movsd	xmm0, QWORD PTR -40[rbp]            # xmm0 = add
	ucomisd	xmm0, QWORD PTR -56[rbp]            # сравнение с NEG_INF 
	jp	.L14                                # след. условие 
	movsd	xmm0, QWORD PTR -40[rbp]            # xmm0 = add
	ucomisd	xmm0, QWORD PTR -56[rbp]            # сравнение с NEG_INF
	je	.L9                                 # выход из while 
.L14:
	pxor	xmm0, xmm0                          # xmm0 = 0
	ucomisd	xmm0, QWORD PTR -32[rbp]            # сравнение xNow с 0
	jp	.L12                                # заходим внутрь while
	pxor	xmm0, xmm0                          # xmm0 = 0
	ucomisd	xmm0, QWORD PTR -32[rbp]            # сравнение xNow с 0
	jne	.L12                                # заходим внутрь while
.L9:
	mov	rax, QWORD PTR -8[rbp]              # rax = arcsin
	mov	QWORD PTR -80[rbp], rax             # кладём arcsin
	movsd	xmm0, QWORD PTR -80[rbp]            # xmm0 = arcsin
	lea	rdi, .LC0[rip]                      # первый аргумент printf = "%lf"
	mov	eax, 1                              # eax = 1
	call	printf@PLT                          # вывод arcsin
	mov	edi, 10                             # первый аргумент - edi = 10 = \n
	call	putchar@PLT                         # вывод \n
	nop
	leave                                       # выйти из функции, очистить стек, восстановить предыдущее значение rbp
	ret                                         # вернуться к вызову функции
	.size	Arcsin, .-Arcsin
	.section	.rodata
.LC5:
	.string	"Incorrect"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp                                 # сохраняем указатель на стэк
	mov	rbp, rsp                            # изменение области видимости функции в памяти
	sub	rsp, 48                             # выделяем память
	mov	DWORD PTR -20[rbp], edi             # первый аргумент функции, argc
	mov	QWORD PTR -32[rbp], rsi             # второй аргумент функции, argv
	mov	eax, 0
	call	GetInput                            # вызываем GetInput, возвращаемое значение лежит в rax
	movq	rax, xmm0                           # x
	mov	QWORD PTR -8[rbp], rax              # кладём x
	movsd	xmm0, QWORD PTR .LC3[rip]           # -1
	ucomisd	xmm0, QWORD PTR -8[rbp]             # x < -1
	ja	.L16                                # заходим в вывод Incorrect
	movsd	xmm0, QWORD PTR -8[rbp]             # x
	movsd	xmm1, QWORD PTR .LC1[rip]           # 1
	ucomisd	xmm0, xmm1                          # x > 1
	jbe	.L21                                # заходим в поиск arcsin
.L16:
	lea	rdi, .LC5[rip]
	call	puts@PLT                            # вывод Incorrect
	jmp	.L19
.L21:
	mov	rax, QWORD PTR -8[rbp]              # x
	mov	QWORD PTR -40[rbp], rax             # кладём x
	movsd	xmm0, QWORD PTR -40[rbp]            # xmm0 = x
	call	Arcsin                              # Arcsin(x)
.L19:
	mov	eax, 0                              # eax = 0
	leave                                       # выйти из функции, очистить стек, восстановить предыдущее значение rbp
	ret                                         # вернуться к вызову функции
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
