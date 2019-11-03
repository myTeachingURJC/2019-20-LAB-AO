#-- Solución al ejercicio 2

#-------------------------------------------------------
#-- PROGRAMA PRINCIPAL
#-------------------------------------------------------

	.include "servicios.asm"
	
	.data
msg1:	.string "Introduce el numero de asteriscos: "
	
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir el numero de asteriscos
	li a7, READ_INT
	ecall
	
	#-- a0 contiene el numero de asteriscos
	
	#-- Llamar a la funcion linea(a0)
	jal linea
	
	#-- Terminar
	li a7, EXIT
	ecall

#--------------------------------------------------------