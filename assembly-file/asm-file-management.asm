SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
SYS_OPEN equ 5
SYS_CLOSE equ 6
SYS_CREAT equ 8

section .text	;code
	global _start

_start:
	;create the file
	mov eax, SYS_CREAT
	mov ebx, file_name
	mov ecx, 0777	;read,write and execute by all
	int 0x80

	mov [fd_out], eax

	;write into the file
	mov edx, len	;number of bytes
	mov ecx, msg	;message to write
	mov ebx, [fd_out] ;file descriptor
	mov eax, SYS_WRITE ;system call number
	int 0x80
	
	;close the file
	mov eax, SYS_CLOSE
	mov ebx, [fd_out]
	int 0x80

	;write the message to stdout indicating end of file write
	mov eax, SYS_WRITE
	mov ebx, 1
	mov ecx, msg_done
	mov edx, len_done
	int 0x80

	;open the file for reading
	mov eax, SYS_OPEN
	mov ebx, file_name
	mov ecx, 0	; for read only access
	mov edx, 0777   ;read wirte execute by all
	int 0x80

	mov [fd_in], eax
	
	;read from file
	mov eax, SYS_READ
	mov ebx, [fd_in]
	mov ecx, info
	mov edx, 26
	int 0x80

	;close the file
	mov eax, SYS_CLOSE
	mov ebx, [fd_in]
	int 0x80
	
	;print the info
	mov eax, SYS_WRITE
	mov ebx, 1
	mov ecx, info
	mov edx, 26
	int 0x80

	;exit
	mov eax, SYS_EXIT
	int 0x80

section .data
	file_name db 'myfile.txt'
	msg db 'Welcome to Tutorials Point'
	len equ $ -msg

	msg_done db 'Written to file', 0xa
	len_done equ $ -msg_done

section .bss
	fd_out resb 1
	fd_in resb 1
	info resb 26
