#----------------------------------------------------------
#-- linea(n): Dibujar una linea horizontal de n asteriscos
#--
#-- ENTRADA:
#--   a0: (n) Numero de asteriscos de la liena
#-- SALIDA:
#--   Ninguna
#----------------------------------------------------------

	.include "so.s"

	.globl linea
	
linea:

	#-- t0: Contador de asteriscos
	mv t0, a0

bucle:
	#-- Si hay 0 asteriscos hemos terminado
	beq t0,zero,fin

	#-- Imprimir un asterisco
	li a0, '*'
	li a7, PRINT_CHAR
	ecall

	#-- Queda un asterisco menos
	addi t0,t0,-1
	
	#-- Repetir
	b bucle

fin:
	#-- Imprimir salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	ret