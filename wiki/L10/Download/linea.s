#-----------------------------------------------------
#-- SUBRUTINA LINEA
#---  * Entrada: a0: numero de asteriscos a imprimir
#---  * Salida: Ninguna
#-----------------------------------------------------

	.include "servicios.asm"
	
	.globl linea
	
	.text

linea:  #-- PUNTO DE ENTRADA	
	#--- Estamos dentro de una subrutina
	#--- usamos SIEMPRE registros temporales
	#-- t0: contador. Inicializado a 0
	li t0, 0
	
	#-- a0 contiene el numero de asteriscos
	#-- Lo guardamos en t1 para no perderlo
	mv t1, a0
	
bucle:

	#-- Si t0 > t1 --> Terminar
	bge t0, t1, fin

	#-- Imprimir un asterisco
	li a0, '*'
	li a7, PRINT_CHAR
	ecall
	
	#-- Incrementar contador de asteriscos
	addi t0, t0, 1
	
	#-- Repetir bucle
	b bucle
			
	
fin:	
	#-- Retornar
	ret