#----------------------------------------------------
#-- Subrutina que calcula el factorial del 1
#-- ENTRADAS:
#--   Ninguna
#-- SALIDAS:
#--   Devuelve 1
#----------------------------------------------------

	.include "servicios.asm"

	#-- Punto de entrada
	.globl fact1
	
	.data
msg:	.string "\n> Fact1: 1"
	
	.text
	
fact1:

	#-- NO necesitamos pila
	#-- La direccion de retorno esta en ra
	
	#-- Imprimir mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#--- El resultado es 1
	li a0, 1
	ret
	




