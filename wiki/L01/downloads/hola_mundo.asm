#-- Programa hola mundo en RISC-V
#-- Esto son comentarios
	.data
str:	.asciz "Hola mundo en RISC-V!\n"
	
	.text
	
main:	
	
	la a0, str
	li a7, 4   
	ecall
	
	li a7, 10
	ecall
	
