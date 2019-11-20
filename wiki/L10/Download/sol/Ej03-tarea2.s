#-------------------------
#-- Subrutina tarea2 
#-- ENTRADAS: Ninguna
#-- SALIDAS: Ninguna
#-------------------------

	#-- Punto de entrada
	.globl tarea2
	
	.include "servicios.asm"
	
	.data
msg:	.string "    Tarea 2\n" 		
	
	.text
	
tarea2:	

	#-- Imprimir mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Terminar
	ret