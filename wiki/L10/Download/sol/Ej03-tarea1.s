#---------------------------------
#-- Subrutina Tarea 1
#-- ENTRADAS: Ninguna
#-- SALIDAS: Ninguna
#---------------------------------

	#-- Punto de entrada
	.globl tarea1
	
	.include "servicios.asm"

	.data
msg:	.string "  Tarea 1\n" 	
			
	.text
	
	
#-------- Punto de entrada
tarea1:

	
	#-- Imprimir el mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
			
#------- Punto de salida
	ret