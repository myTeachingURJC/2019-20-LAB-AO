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
msg:	.string "\n> Fact1\n"
	
	.text
	
fact1:

	la a0, msg   #-- fact1
	li a7, PRINT_STRING
	ecall
	
	li a0, 1
	
	#-- Terminar
	ret
	




