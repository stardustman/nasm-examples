section .data				;data segment
	userMsg db  'Please enter a number: '  	;ask the user to enter a number
	lenUserMsg equ $-userMsg	;the length of message
	dispMsg db 'You have entered: ' 
	lenDispMsg equ $-dispMsg


section .bss	;Uninitialized data
	num resb 5

section .text	;code segment
	global _start
_start:	;User prompt
	mov eax, 4 ;sys_write
	mov ebx, 1 ;stdout
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h

	;read and store the user input
	mov eax, 3 ;sys_read
	mov ebx, 2 ;stderr, this can be replaced by 0 stdin
	mov ecx, num
	mov edx, 5 ; 5 bytes (numeric, 1 for sign) of that information
	int 80h

	;output the message 'The entered number is : '
	mov eax, 4 ;sys_write
	mov ebx, 1 ;stdout
	mov ecx, dispMsg
	mov edx, lenDispMsg
	int 80h

	;output the number entered
	mov eax, 4 ;sys_write
	mov ebx, 1 ;stdout
	mov ecx, num
	mov edx, 5
	int 0x80

	; exit code
	mov eax, 1 ;sys_exit
	mov ebx, 0 ;sys_in
	int 80h
