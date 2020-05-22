	.file	"pmm-secuencial.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"\nUso: %s <tama\303\261o de las matrices>\n"
	.align 8
.LC1:
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
	jne	.L27
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movslq	%eax, %rbx
	movq	%rax, %r15
	movq	%rax, (%rsp)
	salq	$3, %rbx
	movq	%rbx, %rdi
	call	malloc@PLT
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	malloc@PLT
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	malloc@PLT
	testl	%r15d, %r15d
	movq	%rax, %rbp
	jle	.L3
	movl	%r15d, %eax
	xorl	%r13d, %r13d
	subl	$1, %eax
	leaq	8(,%rax,8), %r15
	movl	%eax, 12(%rsp)
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%rbx, %rdi
	call	malloc@PLT
	movq	%rbx, %rdi
	movq	%rax, (%r12,%r13)
	call	malloc@PLT
	movq	%rbx, %rdi
	movq	%rax, (%r14,%r13)
	call	malloc@PLT
	movq	%rax, 0(%rbp,%r13)
	addq	$8, %r13
	cmpq	%r13, %r15
	jne	.L4
	movsd	.LC2(%rip), %xmm1
	xorl	%r15d, %r15d
	movsd	.LC3(%rip), %xmm0
	.p2align 4,,10
	.p2align 3
.L5:
	movq	(%r12,%r15), %rdi
	movq	(%r14,%r15), %rsi
	xorl	%eax, %eax
	movq	0(%rbp,%r15), %rcx
	.p2align 4,,10
	.p2align 3
.L8:
	movsd	%xmm1, (%rdi,%rax)
	movq	$0x000000000, (%rcx,%rax)
	movsd	%xmm0, (%rsi,%rax)
	addq	$8, %rax
	cmpq	%r13, %rax
	jne	.L8
	addq	$8, %r15
	cmpq	%rax, %r15
	jne	.L5
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L16:
	movq	0(%rbp,%r8), %rdi
	movq	(%r12,%r8), %rsi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L13:
	movsd	(%rdi,%rcx), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%r14,%rax), %rdx
	movsd	(%rdx,%rcx), %xmm0
	mulsd	(%rsi,%rax), %xmm0
	addq	$8, %rax
	cmpq	%rax, %r15
	addsd	%xmm0, %xmm1
	jne	.L10
	movsd	%xmm1, (%rdi,%rcx)
	addq	$8, %rcx
	cmpq	%rcx, %r15
	jne	.L13
	addq	$8, %r8
	cmpq	%r8, %r15
	jne	.L16
.L12:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 136
	pxor	%xmm0, %xmm0
	movq	-8(%rbp,%rbx), %r8
	pxor	%xmm1, %xmm1
	movq	0(%rbp), %rsi
	movq	-8(%r14,%rbx), %rdi
	movq	-8(%r12,%rbx), %rcx
	cvtsi2sdq	%rax, %xmm0
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movq	(%r14), %rdx
	movq	(%r12), %r15
	movsd	-8(%r8,%rbx), %xmm6
	movsd	-8(%rdi,%rbx), %xmm5
	movl	$1, %edi
	movsd	-8(%rcx,%rbx), %xmm4
	cvtsi2sdq	%rax, %xmm1
	movl	20(%rsp), %eax
	movsd	(%rsi), %xmm3
	leaq	.LC6(%rip), %rsi
	movsd	(%rdx), %xmm2
	pushq	%rax
	.cfi_def_cfa_offset 144
	pushq	%rax
	.cfi_def_cfa_offset 152
	movl	%eax, %r9d
	pushq	%rax
	.cfi_def_cfa_offset 160
	movq	32(%rsp), %r13
	movl	%eax, %r8d
	movl	%eax, %ecx
	movl	%eax, %ebx
	movl	$7, %eax
	divsd	.LC5(%rip), %xmm0
	movl	%r13d, %edx
	addsd	%xmm1, %xmm0
	movsd	(%r15), %xmm1
	call	__printf_chk@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 128
	testl	%r13d, %r13d
	jle	.L14
	movl	%ebx, %r13d
	xorl	%ebx, %ebx
	leaq	8(,%r13,8), %r13
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L28:
	movq	(%r12,%rbx), %r15
.L15:
	movq	%r15, %rdi
	call	free@PLT
	movq	(%r14,%rbx), %rdi
	call	free@PLT
	movq	0(%rbp,%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r13, %rbx
	jne	.L28
.L14:
	movq	%r12, %rdi
	call	free@PLT
	movq	%r14, %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	free@PLT
	xorl	%eax, %eax
	movq	56(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L29
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
	testq	%r12, %r12
	sete	%dl
	testq	%r14, %r14
	sete	%al
	orb	%al, %dl
	jne	.L18
	testq	%rbp, %rbp
	je	.L18
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	(%rsp), %rax
	subl	$1, %eax
	movl	%eax, 12(%rsp)
	jmp	.L12
.L18:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L27:
	movq	(%rsi), %rdx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L29:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	858993459
	.long	1071854387
	.align 8
.LC3:
	.long	2454267026
	.long	1074415908
	.align 8
.LC5:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
