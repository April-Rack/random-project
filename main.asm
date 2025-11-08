format ELF64 executable 3

segment readable executable
entry start
start:
	lea	rsi,	[msg] ; LOADS THE EFFECTIVE ADDRESS OF MESSAGE
	mov rdx,	sz	  ; MOVE SIZE INTO RDX
	mov	rdi,	1	  ; FILE DESCRIPTOR (SDTOUT)
	mov rax,	1	  ; SYSTEM CALL (SYSWRITE)
	syscall
	xor	rdi,	rdi
	mov	rax,	60
	syscall

segment readable writable
msg db "Hello, World!",0xA,0x0
sz	= $-msg
