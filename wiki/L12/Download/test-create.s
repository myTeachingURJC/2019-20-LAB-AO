#-- Prueba de la creación de un nodo

	.include "servicios.asm"

	.text
	
	#-- Crear un nodo con NUM=1, NEXT=0
	mv a0, zero
	li a1, 1
	jal create
	
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	