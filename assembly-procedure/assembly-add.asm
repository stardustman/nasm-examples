section .text
	global _start	;for linker
_start:
	mov ecx, '4'
	sub ecx, '0'

	mov edx, '5'
	sub edx, '0'

	call sum	;call sum procedure
	mov [res], eax
	mov ecx, msg
	mov edx, len
	mov ebx, 1	;stdout
	mov eax, 4	;sys_write
	int 0x80	;call kernel
	
	mov ecx, res
	mov edx, 1
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 1
	int 0x80

sum:
	mov eax, ecx
	add eax, edx
	add eax , '0'
	ret
section .data
	msg db "The sum is: ",0xa,0xd
	len equ $ -msg

segment .bss
	res resb 1

