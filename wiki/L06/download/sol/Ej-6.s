#-- Solucion al ejercicio 6

	#-- Código de los servicios del S.O
	.include "servicios.asm"

	.data
	
	#-- Cadena definida en tiempo de compilacion
hola:	.string "Hola\n"

	.text
	
	#-- Imprimir la cadena original
	la a0, hola
	li a7, PRINT_STRING
	ecall
	
	#-------- Modificar la 'a' por una 'i'
	li t1, 'i' #-- Nuevo caracter
	
	#-- La 'a' está 3 bytes adelante
	sb t1, 3(a0)
	
	#-- Imprimir la nueva cadena
	la a0, hola
	li a7, PRINT_STRING
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	
