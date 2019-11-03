##-- Un programa que realiza ciertos cálculos

	.include "servicios.asm"
	
	.data
	
tarea1:	.string "\nTAREA 1\n"
	
	.text 
	#-- PUNTO DE ENTRADA
	
	#-- Acción de la Tarea 1: La simulamos imprimiendo un 
	#-- mensaje en la consola, pero la tarea podría ser cualquiera
	#-- que necesitasemos en nuestro proyecto
	la a0, tarea1
	
	li a7, PRINT_STRING
	ecall
	
	
	#-- PUNTO DE SALIDA
	li a7, EXIT
	ecall