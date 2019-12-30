#-- Ejemplo de creación de una lista enlazada
#-- de tres nodos, inicializada con los valores
#-- 1,2 y 3

	.include "servicios.asm"

	.text
	

	#-- Crear un nodo nuevo, inicializa a 1
	mv a0, zero
	li a1, 1
	jal create		
		
	#-- Crear otro nodo, inicializado a 2
	li a1, 2
	jal create
	
	#-- Crear otro nodo, inicializado a 3
	li a1, 3
	jal create
	
	li a7, EXIT
	ecall
	
