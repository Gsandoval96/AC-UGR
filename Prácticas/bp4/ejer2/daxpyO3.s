	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta tamanio"
.LC8:
	.string	"\nTiempo (seg): %11.9f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jne	.L31
	movl	%edi, %ebx
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movslq	%eax, %rbp
	movq	%rax, %r13
	salq	$2, %rbp
	movq	%rbp, %rdi
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	malloc@PLT
	testl	%r13d, %r13d
	movq	%rax, %rbp
	jle	.L3
	movq	%r12, %rdx
	leal	-1(%r13), %r14d
	movl	$5, %ecx
	shrq	$2, %rdx
	negq	%rdx
	andl	$3, %edx
	leal	3(%rdx), %eax
	cmpl	$5, %eax
	cmovb	%ecx, %eax
	cmpl	%eax, %r14d
	jb	.L17
	xorl	%esi, %esi
	testl	%edx, %edx
	je	.L5
	movss	.LC1(%rip), %xmm1
	cmpl	$1, %edx
	movss	.LC2(%rip), %xmm0
	movss	%xmm1, (%r12)
	movss	%xmm0, 0(%rbp)
	je	.L19
	cmpl	$3, %edx
	movss	%xmm1, 4(%r12)
	movss	%xmm0, 4(%rbp)
	jne	.L20
	movss	%xmm1, 8(%r12)
	movl	$3, %esi
	movss	%xmm0, 8(%rbp)
.L5:
	movl	%r13d, %r8d
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	subl	%edx, %r8d
	salq	$2, %rdx
	movl	%r8d, %r9d
	movaps	.LC3(%rip), %xmm1
	leaq	(%r12,%rdx), %rdi
	shrl	$2, %r9d
	addq	%rbp, %rdx
	movaps	.LC4(%rip), %xmm0
	.p2align 4,,10
	.p2align 3
.L7:
	addl	$1, %ecx
	movaps	%xmm1, (%rdi,%rax)
	movups	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpl	%ecx, %r9d
	ja	.L7
	movl	%r8d, %edx
	andl	$-4, %edx
	cmpl	%edx, %r8d
	leal	(%rdx,%rsi), %eax
	je	.L8
.L4:
	movslq	%eax, %rdx
	movss	.LC1(%rip), %xmm1
	movss	.LC2(%rip), %xmm0
	movss	%xmm1, (%r12,%rdx,4)
	movss	%xmm0, 0(%rbp,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %r13d
	jle	.L8
	movslq	%edx, %rdx
	movss	%xmm1, (%r12,%rdx,4)
	movss	%xmm0, 0(%rbp,%rdx,4)
	leal	2(%rax), %edx
	cmpl	%edx, %r13d
	jle	.L8
	movslq	%edx, %rdx
	movss	%xmm1, (%r12,%rdx,4)
	movss	%xmm0, 0(%rbp,%rdx,4)
	leal	3(%rax), %edx
	cmpl	%edx, %r13d
	jle	.L8
	movslq	%edx, %rdx
	movss	%xmm1, (%r12,%rdx,4)
	movss	%xmm0, 0(%rbp,%rdx,4)
	leal	4(%rax), %edx
	cmpl	%edx, %r13d
	jle	.L8
	addl	$5, %eax
	movslq	%edx, %rdx
	cmpl	%eax, %r13d
	movss	%xmm1, (%r12,%rdx,4)
	movss	%xmm0, 0(%rbp,%rdx,4)
	jle	.L8
	cltq
	movss	%xmm1, (%r12,%rax,4)
	movss	%xmm0, 0(%rbp,%rax,4)
.L8:
	xorl	%edi, %edi
	movq	%rsp, %rsi
	call	clock_gettime@PLT
	movq	%rbp, %rdx
	shrq	$2, %rdx
	negq	%rdx
	andl	$3, %edx
	leal	3(%rdx), %eax
	cmpl	%r14d, %eax
	ja	.L21
	testl	%edx, %edx
	je	.L22
	movss	.LC5(%rip), %xmm0
	cmpl	$1, %edx
	movss	(%r12), %xmm1
	mulss	%xmm0, %xmm1
	addss	0(%rbp), %xmm1
	movss	%xmm1, 0(%rbp)
	je	.L23
	movss	4(%r12), %xmm1
	cmpl	$3, %edx
	mulss	%xmm0, %xmm1
	addss	4(%rbp), %xmm1
	movss	%xmm1, 4(%rbp)
	jne	.L13
	mulss	8(%r12), %xmm0
	movl	$3, %ebx
	addss	8(%rbp), %xmm0
	movss	%xmm0, 8(%rbp)
.L13:
	movl	%r13d, %r8d
	movaps	.LC6(%rip), %xmm1
	subl	%edx, %r8d
	salq	$2, %rdx
	xorl	%eax, %eax
	movl	%r8d, %edi
	leaq	(%r12,%rdx), %rsi
	xorl	%ecx, %ecx
	shrl	$2, %edi
	addq	%rbp, %rdx
	.p2align 4,,10
	.p2align 3
.L10:
	movups	(%rsi,%rax), %xmm0
	addl	$1, %ecx
	mulps	%xmm1, %xmm0
	addps	(%rdx,%rax), %xmm0
	movaps	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpl	%edi, %ecx
	jb	.L10
	movl	%r8d, %eax
	andl	$-4, %eax
	addl	%eax, %ebx
	cmpl	%eax, %r8d
	je	.L15
.L12:
	movslq	%ebx, %rdx
	movss	.LC5(%rip), %xmm0
	movss	(%r12,%rdx,4), %xmm1
	leaq	0(%rbp,%rdx,4), %rax
	mulss	%xmm0, %xmm1
	addss	(%rax), %xmm1
	movss	%xmm1, (%rax)
	leal	1(%rbx), %eax
	cmpl	%r13d, %eax
	jge	.L15
	cltq
	movss	(%r12,%rax,4), %xmm1
	leaq	0(%rbp,%rax,4), %rdx
	leal	2(%rbx), %eax
	mulss	%xmm0, %xmm1
	cmpl	%r13d, %eax
	addss	(%rdx), %xmm1
	movss	%xmm1, (%rdx)
	jge	.L15
	cltq
	movss	(%r12,%rax,4), %xmm1
	leaq	0(%rbp,%rax,4), %rdx
	leal	3(%rbx), %eax
	mulss	%xmm0, %xmm1
	cmpl	%eax, %r13d
	addss	(%rdx), %xmm1
	movss	%xmm1, (%rdx)
	jle	.L15
	cltq
	addl	$4, %ebx
	movss	(%r12,%rax,4), %xmm1
	leaq	0(%rbp,%rax,4), %rdx
	cmpl	%ebx, %r13d
	mulss	%xmm0, %xmm1
	addss	(%rdx), %xmm1
	movss	%xmm1, (%rdx)
	jle	.L15
	movslq	%ebx, %rbx
	mulss	(%r12,%rbx,4), %xmm0
	leaq	0(%rbp,%rbx,4), %rax
	addss	(%rax), %xmm0
	movss	%xmm0, (%rax)
.L15:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leaq	.LC8(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC7(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	free@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L32
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L23:
	.cfi_restore_state
	movl	$1, %ebx
	jmp	.L13
.L19:
	movl	$1, %esi
	jmp	.L5
.L22:
	xorl	%ebx, %ebx
	jmp	.L13
.L3:
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	jmp	.L15
.L20:
	movl	$2, %esi
	jmp	.L5
.L17:
	xorl	%eax, %eax
	jmp	.L4
.L21:
	xorl	%ebx, %ebx
	jmp	.L12
.L32:
	call	__stack_chk_fail@PLT
.L31:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	1102646527
	.align 4
.LC2:
	.long	1113206176
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	1102646527
	.long	1102646527
	.long	1102646527
	.long	1102646527
	.align 16
.LC4:
	.long	1113206176
	.long	1113206176
	.long	1113206176
	.long	1113206176
	.section	.rodata.cst4
	.align 4
.LC5:
	.long	1084551499
	.section	.rodata.cst16
	.align 16
.LC6:
	.long	1084551499
	.long	1084551499
	.long	1084551499
	.long	1084551499
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
