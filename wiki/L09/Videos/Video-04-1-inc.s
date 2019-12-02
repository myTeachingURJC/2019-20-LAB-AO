##-------------------------------------
## PROGRAMA PRINCIPAL
## --------------------------------------

	.include "servicios.asm"

	.eqv VALOR 2

	.text
	
	#--Impriimir el valor sin incrementar
	li a0, VALOR
	li a7, PRINT_INT
	ecall
	
	#--- Print '\n'
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#--- Llamar a la funcion inc(x)
	li a0, VALOR
	jal inc
	
	#-- a0 contiene el valor incrementado
	
	#-- Imprmir el valor incrementado
	li a7, PRINT_INT
	ecall
	
	
	#-- Terminar
	li a7, EXIT
	ecall


#--------------------------------------------
#-- SUBRUTINA (f = inc(x) )
#--
#-- ENTRADA:
#--  a0: Valor a incrementar
#--
#-- SALIDA:
#--- a0 : Valor incrementado
#--------------------------------------------

	.text

inc:	
			
	#-- a0 = a0 + 1
	addi a0, a0, 1
	
	#-- Retornar
	ret				



