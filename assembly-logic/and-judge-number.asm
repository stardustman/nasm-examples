section .text ;code
	global _start ; for linker

_start: ;entry point
	mov ax, 8h	;getting 8 in the ax
	and ax, 1	;and ax with 1, result in ax
	jz evnn
	mov eax, 4	;sys_write
	mov ebx, 1	;stdout
	mov ecx, odd_msg	;message to write
	mov edx, len2
	int 0x80
	jmp outprog

evnn:

	mov ah, 09h
	mov eax, 4	;sys_write
	mov ebx, 1	;stdout
	mov ecx, even_msg
	mov edx, len1
	int 0x80

outprog:

	mov eax, 1	;sys_exit
	int 0x80

section .data
	even_msg db "Even Number!"
	len1 equ $ - even_msg
	
	odd_msg db "Odd Number!"
	len2 equ $ - odd_msg
