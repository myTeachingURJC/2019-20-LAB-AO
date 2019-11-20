#-- Ejemplo de subrutina
#-- que respeta el conveniod 
#-- aunque no está implementada todavía
#-- Es un boceto

	.globl tarea1

	.include "servicios.asm"
			
	.text

#-----------------------------------------
#-- Subrutina Tarea 1
#--------------------------------------------

	.data
msg1:	.string "Tarea 1\n"

	.text
	#--- PUnto de entrada de la subrutia
tarea1:	
	#-- Imprimir un mensaje
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Antes de modificar s0, hay que almacenarlo
	#-- en la pila:
	
	#-- GUARDA S0 EN LA PILA
	
	#-- USAR S0. Modifcarlo
	addi s0,s0,1
	
	#-- RECUPERAR s0 de la PILA
	
	#-- De esta forma es como si no se hubisese modificado

	#-- Punnto de salida
	ret	
	
