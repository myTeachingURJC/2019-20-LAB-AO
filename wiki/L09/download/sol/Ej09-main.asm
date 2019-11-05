#-- Solución al ejercicio 9
#-- Pasar una cadena de minúsculas a mayúsculas

	.include "servicios.asm"

	#-- Tamaño máximo de la cadena
	.eqv MAX 1024
		
		
	.data 
cad:	.space MAX	
msg1:	.string "Introduce cadena: "
msg2:	.string "Cadena en mayusculas: "
	
	
	.text 
	
	#-- Imprimir mensaje msg1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena al usuario
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Almacenar a0 en s0
	mv s0, a0
	
	#-- Pasar cadena a mayusculas
	jal upper


	#-- Imprimir el mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cadena
	mv a0, s0
	li a7, PRINT_STRING
	ecall			
			
	#-- Terminar
	li a7, EXIT
	ecall
	
