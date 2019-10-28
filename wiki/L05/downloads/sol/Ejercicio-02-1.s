#-- Solucion Ejercicio 2

	.include "servicios.asm"

	.data
	
cad1:	.string "Hola\n"
cad2:	.string "Adios\n"
	
		
	.text
	
	#-- Imprimir la primera cadena
	la a0, cad1
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la segunda cadena
	la a0, cad2
	li a7, PRINT_STRING
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	