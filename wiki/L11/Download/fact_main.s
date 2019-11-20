#----------------------------------------------------------
#-- PROGRAMA PRINCIPAL
#--
#--  Calculo del factorial de 3, llamando a subrutinas
#-- de niveles inferiores
#----------------------------------------------------------

	.include "servicios.asm"
	
	#-- Constante. Queremos calcular el factorial de N
	.eqv N 3
	
	.data
msg1:	.string "\n\nFactorial de "	
msg2:   .string ": "
		
	.text 
	
	
	#-- Calcular el factorial
	jal fact3
	
	#-- a0 contiene el factorial de 3 
	#-- Lo guardamos en s0 para no perderlo
	mv s0, a0
	
	#-- Imprimir mensaje:
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir N
	li a0, N 
	li a7, PRINT_INT
	ecall
	
	#-- Fin del mensaje
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Recuperar a0
	mv a0, s0
	
	#-- Imprimir el resultado
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir \n
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
	
