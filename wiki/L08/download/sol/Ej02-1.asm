##-- Solución al ejercicio 2
##-- Calcular el código ASCII del caracter introducido
##-- por el usuario

	.include "servicios.asm"
	
	.data
msg1:   .string "Introduzca un carácter: "
msg2:   .string "\nSu código ASCII es: "
	
	.text
	
	#-- Imprimir mensaje 1
	la a0,msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir carácter al usuario
	li a7, READ_CHAR
	ecall
	
	#-- a0 contiene el carácter introducido
	#-- Lo guardamos en t0
	mv t0, a0
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir su código ASCII
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	
	#--- Terminar
	li a7, EXIT
	ecall