#-- Ejemplo de la directiva include

	#-- Incluir fichero con los códigos
	#-- de los servicios del Sistema operativo
	.include "servicios.asm"
	
	.data
msg1:   .string "HOLA!!"
	
	.text
	
	#-- Imprimir la cadena
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
		