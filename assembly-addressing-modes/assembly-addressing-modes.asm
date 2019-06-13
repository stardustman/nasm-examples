section .text
	global _start
_start:
	;write the name 'Zara Ali'
	mov edx,9 ;message length
	mov ecx,name  ;message to write
	mov ebx,1 ;stdout
	mov eax,4 ;sys_write
	int 0x80  ;call kernel

	mov [name], dword 'Dust' ;changed the name to Dust Ali
	
	;write the name 'Nuha Ali'
	mov edx,8 ;message length
	mov ecx,name ;message to write
	mov ebx,1 ;stdout
	mov eax,4 ;sys_write
	int 0x80  ;call kernel

	mov ecx,BYTE_TABLE
	mov ebx,1
	mov eax,4
		
	mov eax,1 ;sys_exit
	int 0x80  ;call kernel

section .data
name db 'Zara Ali'
BYTE_TABLE DB  14, 15, 22, 45      ; Tables of bytes
WORD_TABLE DW  134, 345, 564, 123  ; Tables of words
