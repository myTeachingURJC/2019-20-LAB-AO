#-- Solución al ejericico 7
#-- Programa principal

	.include "servicios.asm"
			
	.text
	
	
	#-- Meter el número 1 en la lista
	li a0, 0
	li a1, 1
	jal create
	
	#-- Mover el puntero de acceso a la lista a s0
	mv s0, a0
	
	#-- Llamar a add para añadir a la lista el numero 2
	li a1,2
	jal append
	
	#-- Añadir el numero 3
	mv a0, s0
	li a1, 3
	jal append
	
	#-- Imprimir la lista
	mv a0, s0
	jal print
	
	
	#-- Terminar
	li a7, EXIT
	ecall
