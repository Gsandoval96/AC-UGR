	.file	"figura1-b.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"\nTiempo (seg): %11.9f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$160000, %edi
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	call	malloc@PLT
	xorl	%edi, %edi
	movq	%rsp, %rsi
	movq	%rax, %rbx
	call	clock_gettime@PLT
	leaq	40000+s(%rip), %rdi
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L2:
	leaq	s(%rip), %rax
	movl	%r8d, %edx
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rax), %esi
	addq	$32, %rax
	leal	(%rdx,%rsi,2), %r10d
	movl	-28(%rax), %esi
	addl	%r9d, %r10d
	leal	(%rsi,%rsi,2), %esi
	subl	%edx, %esi
	addl	%esi, %ecx
	movl	-24(%rax), %esi
	leal	(%rdx,%rsi,2), %r9d
	movl	-20(%rax), %esi
	addl	%r9d, %r10d
	leal	(%rsi,%rsi,2), %esi
	subl	%edx, %esi
	addl	%ecx, %esi
	movl	-16(%rax), %ecx
	leal	(%rdx,%rcx,2), %r9d
	movl	-12(%rax), %ecx
	addl	%r10d, %r9d
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	addl	%ecx, %esi
	movl	-8(%rax), %ecx
	leal	(%rdx,%rcx,2), %ecx
	addl	%ecx, %r9d
	movl	-4(%rax), %ecx
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	addl	%esi, %ecx
	cmpq	%rax, %rdi
	jne	.L3
	cmpl	%ecx, %r9d
	cmovl	%r9d, %ecx
	movl	%ecx, (%rbx,%r8,4)
	addq	$1, %r8
	cmpq	$40000, %r8
	jne	.L2
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leaq	.LC1(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	free@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L11
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.comm	s,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
