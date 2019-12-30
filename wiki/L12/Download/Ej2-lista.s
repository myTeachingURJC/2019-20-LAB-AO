#-- Ejemplo de creación de una lista enlazada
#-- Luego se imprime

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
	
	#-- Imprimir la lista
	#-- Se pasa por a0 el puntero a la lista
	jal print

	#-- Terminar
	li a7, EXIT
	ecall
	
