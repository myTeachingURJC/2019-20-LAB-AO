##-------------------------------------
## PROGRAMA PRINCIPAL
## --------------------------------------


	.include "servicios.asm"

	.text
	
	#-- Evluar la expresion para a=5, b=10, c=15  evaluar(5,10,159)
	li a0, 5
	li a1, 10
	li a2, 15
	jal evaluar
	
	#-- a0 contiene el resultado
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall

