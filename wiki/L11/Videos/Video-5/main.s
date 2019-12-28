
	.include "servicios.asm"
	
	.data

msg: 	.string "\nLongitud: "
cad:	.string "Hola"	
	
	.text
	

	#-- Imprimir la cadena
	la a0, cad
	li a7, PRINT_STRING
	ecall
	
	#-- Calcular su longitud
	jal len
	
	mv s0, a0
	
	#------- Imprimir la longitud
	#-- Mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir longitud
	mv a0, s0
	li a7, PRINT_INT
	ecall
	
	
	li a7, EXIT
	ecall
	
	