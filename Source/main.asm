global _start

segment .text
_start:
	mov rdi,01h
	mov rax,01h
	lea rsi,msg
	mov rdx,msgLen
	syscall
	xor rdi,rdi
	mov rax,3ch
	syscall

segment .data
	msg db "Hello, world!",0ah,00h
	msgLen equ $-msg
