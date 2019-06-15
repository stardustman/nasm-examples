; A macro with two parameters
; Implements the write system call

%macro write_string 2
	mov eax, 4 ;sys_write
	mov ebx, 1 ;stdout
	mov ecx, %1;parameter 1
	mov edx, %2;parameter 2
	int 0x80   ;call kernel
%endmacro

section .text
	global _start	;for linker
_start:
	write_string msg1, len1
	write_string msg2, len2
	write_string msg3, len3

	mov eax, 1 ;sys_exit
	int 0x80

section .data
	msg1 db "Hello, programmers!",0xa,0xd
	len1 equ $ -msg1
	
	msg2 db "Welcome to the world of ",0xa,0xd
	len2 equ $ -msg2

	msg3 db "Linux assembly programming!"
	len3 equ $ -msg3
