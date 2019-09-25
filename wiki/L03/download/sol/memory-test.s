#-- Comprobacion de la memoria
#-- Este programa debe escribir un valor en las palabras
#-- de la memoria 0, 3, 4 y 7

	.data
memoria:

	.text
	
	#-- Puntero para acceder a la memoria, en x5
	la x5, memoria
	
	#-- Valor de test a escribir:
	li x10, 0xAA5555AA
	
	#-- Escribir en la primera posicion
	sw x10, 0(x5)
	
	#-- Escribir en la cuarta palabra
	sw x10, 0xC(x5)
	
	#-- Escribir en la quinta palabra
	sw x10, 0x10(x5)
	
	#-- Escribir en la octava palabra
	sw x10, 0x1C(x5)
	
	#-- Terminar
	li a7, 10
	ecall
	
	