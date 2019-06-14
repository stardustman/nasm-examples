section .text
	global _start

_start:
	mov al, 5	;getting 5 in al
	mov bl, 3	;getting 3 in bl		
	or al, bl	;or al and bl register,result is 7
	add al,byte '0' ;converting decimal to ascii

	mov [result], al
	mov eax, 4
	mov ebx, 1
	mov ecx, result
	mov edx, 1
	int 0x80

outprog:
	mov eax, 1
	int 0x80

section .bss
	result resb 1
