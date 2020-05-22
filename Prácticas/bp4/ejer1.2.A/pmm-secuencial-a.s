	.file	"pmm-secuencial-a.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"\nUso: %s <tama\303\261o de las matrices>\n"
	.align 8
.LC2:
	.string	"Error en la reserva de espacio"
	.align 8
.LC6:
	.string	"Tiempo(seg.):%11.9f\n Tama\303\261o matrices:%u\n m1[0][0]+m2[0][0]=m3[0][0](%8.6f+%8.6f=%8.6f) m1[%d][%d]+m2[%d][%d]=m3[%d][%d](%8.6f+%8.6f=%8.6f)\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jne	.L30
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movslq	%eax, %rbp
	movq	%rax, %r14
	movq	%rax, (%rsp)
	salq	$3, %rbp
	movq	%rbp, %rdi
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	malloc@PLT
	testq	%r13, %r13
	movq	%rax, %r12
	sete	%r15b
	testq	%rbx, %rbx
	sete	%al
	orl	%eax, %r15d
	testq	%r12, %r12
	sete	%al
	orl	%eax, %r15d
	testl	%r14d, %r14d
	movb	%r15b, 15(%rsp)
	jle	.L3
	movl	%r14d, %eax
	xorl	%r15d, %r15d
	subl	$1, %eax
	leaq	8(,%rax,8), %r14
	movl	%eax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%rbp, %rdi
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, 0(%r13,%r15)
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, (%rbx,%r15)
	call	malloc@PLT
	movq	%rax, (%r12,%r15)
	addq	$8, %r15
	cmpq	%r15, %r14
	jne	.L4
	cmpb	$0, 15(%rsp)
	jne	.L16
	movsd	.LC3(%rip), %xmm1
	xorl	%edi, %edi
	movsd	.LC4(%rip), %xmm0
	.p2align 4,,10
	.p2align 3
.L8:
	movq	0(%r13,%rdi), %rcx
	movq	(%rbx,%rdi), %rdx
	xorl	%r14d, %r14d
	movq	(%r12,%rdi), %rax
	.p2align 4,,10
	.p2align 3
.L7:
	movsd	%xmm1, (%rcx,%r14)
	movq	$0x000000000, (%rax,%r14)
	movsd	%xmm0, (%rdx,%r14)
	addq	$8, %r14
	cmpq	%r14, %r15
	jne	.L7
	addq	$8, %rdi
	cmpq	%r14, %rdi
	jne	.L8
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movl	8(%rsp), %eax
	xorl	%r10d, %r10d
	shrl	$2, %eax
	salq	$5, %rax
	leaq	32(%rax), %r11
	.p2align 4,,10
	.p2align 3
.L17:
	movq	0(%r13,%r10), %r8
	movq	(%r12,%r10), %r9
	xorl	%ecx, %ecx
	leaq	(%r11,%r8), %rdi
	.p2align 4,,10
	.p2align 3
.L13:
	pxor	%xmm3, %xmm3
	movq	%rbx, %rdx
	movq	%r8, %rax
	pxor	%xmm2, %xmm2
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%rdx), %rsi
	addq	$32, %rax
	addq	$32, %rdx
	movsd	(%rsi,%rcx), %xmm4
	movq	-24(%rdx), %rsi
	mulsd	-32(%rax), %xmm4
	addsd	%xmm4, %xmm0
	movsd	(%rsi,%rcx), %xmm4
	movq	-16(%rdx), %rsi
	mulsd	-24(%rax), %xmm4
	addsd	%xmm4, %xmm1
	movsd	(%rsi,%rcx), %xmm4
	movq	-8(%rdx), %rsi
	mulsd	-16(%rax), %xmm4
	addsd	%xmm4, %xmm2
	movsd	(%rsi,%rcx), %xmm4
	mulsd	-8(%rax), %xmm4
	cmpq	%rax, %rdi
	addsd	%xmm4, %xmm3
	jne	.L10
	addsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm2
	addsd	%xmm2, %xmm3
	movsd	%xmm3, (%r9,%rcx)
	addq	$8, %rcx
	cmpq	%rcx, %r14
	jne	.L13
	addq	$8, %r10
	cmpq	%r10, %r14
	jne	.L17
.L12:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 136
	pxor	%xmm0, %xmm0
	movq	-8(%rbx,%rbp), %rdi
	pxor	%xmm1, %xmm1
	movq	-8(%r12,%rbp), %r8
	movq	-8(%r13,%rbp), %rcx
	movq	(%rbx), %rdx
	cvtsi2sdq	%rax, %xmm0
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	16(%rsp), %r15d
	movq	(%r12), %rsi
	movq	0(%r13), %r14
	movsd	-8(%r8,%rbp), %xmm6
	pushq	%r15
	.cfi_def_cfa_offset 144
	movsd	-8(%rdi,%rbp), %xmm5
	cvtsi2sdq	%rax, %xmm1
	pushq	%r15
	.cfi_def_cfa_offset 152
	movsd	-8(%rcx,%rbp), %xmm4
	pushq	%r15
	.cfi_def_cfa_offset 160
	movq	32(%rsp), %rbp
	movsd	(%rsi), %xmm3
	movsd	(%rdx), %xmm2
	leaq	.LC6(%rip), %rsi
	movl	%r15d, %r9d
	movl	%r15d, %r8d
	movl	%r15d, %ecx
	movl	%ebp, %edx
	movl	$1, %edi
	movl	$7, %eax
	divsd	.LC5(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	(%r14), %xmm1
	call	__printf_chk@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 128
	testl	%ebp, %ebp
	jle	.L14
	movl	%r15d, %eax
	xorl	%ebp, %ebp
	movq	%r14, %rdi
	leaq	8(,%rax,8), %r15
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L31:
	movq	0(%r13,%rbp), %rdi
.L15:
	call	free@PLT
	movq	(%rbx,%rbp), %rdi
	call	free@PLT
	movq	(%r12,%rbp), %rdi
	addq	$8, %rbp
	call	free@PLT
	cmpq	%rbp, %r15
	jne	.L31
.L14:
	movq	%r13, %rdi
	call	free@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	xorl	%eax, %eax
	movq	56(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L32
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	cmpb	$0, 15(%rsp)
	jne	.L16
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	(%rsp), %rax
	subl	$1, %eax
	movl	%eax, 8(%rsp)
	jmp	.L12
.L16:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L30:
	movq	(%rsi), %rdx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L32:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	858993459
	.long	1071854387
	.align 8
.LC4:
	.long	2454267026
	.long	1074415908
	.align 8
.LC5:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
