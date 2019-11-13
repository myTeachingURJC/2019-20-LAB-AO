#-- Programa principal: main

	.include "servicios.asm"
	
	.data
msg:	.string "MENSAJE DE ERROR"
	
	
	.text
	
	#-- Cargamos en s0 la direccion de msg
	#-- Lo hacemos en s0 porque hay que llamar dos veces
	la s0, msg
	
	#-- Llamar a la funcion print_error
	mv a0, s0
	jal print_error
	
	#-- Llamar a la funcion print_error
	mv a0, s0
	jal print_error
	
	#-- Terminar
	li a7, EXIT
	ecall 
	
