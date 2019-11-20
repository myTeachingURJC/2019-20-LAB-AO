#-- Solución al ejercicio 2

#-------------------------------------------------------
#-- PROGRAMA PRINCIPAL
#-------------------------------------------------------

	.include "servicios.asm"
	
	.data
msg1:   .string "\nIntroduce el caracter: "	
msg2:	.string "\nIntroduce la cantidad: "
	
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir el caracter
	li a7, READ_CHAR
	ecall
	
	#-- t0 contiene el caracter
	mv t0, a0
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir la cantidad
	li a7, READ_INT
	ecall
	
	#-- t1 contiee el numero de caracteres a imprimir
	mv t1, a0
	
	
	
	#-- Llamar a la funcion linea(car, x)
	mv a0, t0
	mv a1, t1
	jal linea
	
	#-- Terminar
	li a7, EXIT
	ecall

#--------------------------------------------------------
