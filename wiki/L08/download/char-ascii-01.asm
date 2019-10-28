##-- Imprimir el código ASCII de un carácter
##-- Cargamos en un registro un carácter constante
##-- Lo imprimimos en la consola interpretándolo de dos formas:
##--  * Si llamamos al servicio PRINT_CHAR: Lo interpretamos con un carácter
##--  * Si llamamos al servicio PRINT_INT: lo interpretamos como número entero

	.include "servicios.asm"
	
	.data
msg1:   .string "Caracter: "
msg2:   .string "\nCódigo ASCII: "
	
	.text
	
	#--- Cargamos en a0 el código ASCII de un carácter
	li t0, 'g'
	
	#-- En el registro t0 veremos su código ascii (el ensamblador lo convierte)
	#-- Llamamos al servicio PRINT_CHAR para imprimir el caracter
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#--- Llamamos al servicio PRINT_CHAR para imprimir el caracter
	mv a0, t0
	li a7, PRINT_CHAR
	ecall
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Llamamos al servicio PRINT_INT para imprimir su código ASCII
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	
	#--- Terminar
	li a7, EXIT
	ecall