#-----------------------------------------------------
#-- SUBRUTINA LINEA
#---  * Entradas:
#---     * a0: Carácter a usar 
#---     * a1: numero de caracteres a imprimir a imprimir
#---  * Salida: Ninguna
#-----------------------------------------------------

	.include "servicios.asm"
	
	.globl linea
	
	.text

linea:  #-- PUNTO DE ENTRADA	
	#--- Estamos dentro de una subrutina
	#--- usamos SIEMPRE registros temporales
	#-- t0: contador. Inicializado a 0
	li t2, 0
	
	#-- Meter en t0 el carácter
	mv t0, a0
	
	#-- Meter en t1 la cantidad
	mv t1, a1
	
bucle:

	#-- Si t2 > t1 --> Terminar
	bge t2, t1, fin

	#-- Imprimir el caracter
	mv a0, t0
	li a7, PRINT_CHAR
	ecall
	
	#-- Incrementar contador de asteriscos
	addi t2, t2, 1
	
	#-- Repetir bucle
	b bucle
			
	
fin:	
	#-- Retornar
	ret
