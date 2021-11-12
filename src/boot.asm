[org 0x7c00] ; set string offset
mov ah, 0x0e ; teletype 

mov bx, string
jmp print 

string:
	times 10 db 65
	db 0

; allocate char
char: 
	db 0 ; occupy 1 byte of memory and set it to 0

; define string
; string:
; 	db "hello world!", 0 ; set 'string' to "hello world" and add null termination 


input: ; takes 1 char as input and moves the input from al into the one byte char
	mov ah, 0
	int 0x16
	mov [char], al


print: ; prints string that is stored in bx
	mov al, [bx] 
	int 0x10
	inc bx
	mov al, [bx]
	cmp al, 0
	je end
	jmp print

print_char:
	int 0x10

end:
	jmp $

; fill out the bytes
times 510 - ($-$$) db 0
db 0x55, 0xaa ; set last bytes 