;The LOOP instruction assumes that the ECX register contains the loop count.

section .text
	global _start
_start:
	mov ecx, 10
	mov eax, '1'

L1:
	mov [num],eax
	mov eax, 4
	mov ebx, 1
	push ecx
	
	mov ecx, num
	mov edx, 1
	int 0x80

	mov eax, [num]
	sub eax, '0'
	inc eax
	add eax, '0'
	pop ecx
	
	loop L1

	mov eax, 1
	int 0x80

section .bss
	num resb 1