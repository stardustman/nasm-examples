;The following example demonstrates the above concepts by defining a 3-element array x, which stores three values: 2, 3 and 4. It adds the values in the array and displays the sum 9 
section .text
	global _start

_start:
	mov eax, 3	;number bytes to be summed
	mov ebx, 0	;ebx will store the sum
	mov ecx, x	;ecx will point to the current element to be summed

top:	add ebx, [ecx]
	add ecx, 1	;move pointer to next element
	dec eax		;decrement counter
	jnz top		;if counter not 0, then loop again

done:
	add ebx, '0'	;change to character
	mov [sum], ebx 	;done, store result in "sum"
display:
	mov edx, 1	;message length
	mov ecx, sum	;message to write
	mov ebx, 1	;sdtout
	mov eax, 4	;sys_write
	int 0x80	;call kernel

	mov eax, 1	;sys_exit
	int 0x80	;call kernel

section .data
	global x
	x:
	  db 2
	  db 4
	  db 3
	sum:
	  db 0
