
#-- PRUEBAS DE LA FUNCION procesar

	.include "servicios.asm"

	#-- Cadenas de prueba y sus valores correctos
	.eqv CAD1 "Hola\n"
	.eqv CAD2 "0123456789\n"
	.eqv CAD3 "Esta es una cadena\n"
	.eqv CAD4 "a"
	
	.data

cad1:   .string CAD1
cad2:   .string CAD2
cad3:   .string CAD3
cad4:   .string CAD4	

	.text

	#-- TEST 1
	la a0, cad1
	jal procesar
	
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- TEST 2
	la a0, cad2
	jal procesar
	
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- TEST 3
	la a0, cad3
	jal procesar
	
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- TEST 4
	la a0, cad4
	jal procesar
	
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Termina
	li a7, EXIT
	ecall 
	



