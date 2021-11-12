; this program prints aBcDeFgH... etc
[org 0x7c00] ; set string offset
mov ah, 0x0e ; teletype 

mov bx, string
jmp print

; define string
string:
	db "hello world!", 0 ; set 'string' to "hello world" and add null termination 

print:
	mov al, [bx]
	int 0x10
	inc bx
	mov al, [bx]
	cmp al, 0
	je end
	jmp print

end:
	jmp $

; fill out the bytes
times 510 - ($-$$) db 0
db 0x55, 0xaa ; set last bytes 