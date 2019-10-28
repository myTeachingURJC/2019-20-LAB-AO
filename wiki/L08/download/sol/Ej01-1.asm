##-- Solución al ejercicio 1
##-- Obtener el carácter correspondiente al código ASCII
##-- pedido al usuario

	.include "servicios.asm"
	
	.data
msg1:   .string "Introduzca codigo ASCII: "
msg2:   .string "El caracter es: "
	
	.text
	
	#-- Imprimir mensaje 1
	la a0,msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir código ASCII al usuario
	li a7, READ_INT
	ecall
	
	#-- a0 contiene el numero introducido
	#-- Lo guardamos en t0
	mv t0, a0
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir caracter ASCII correspondiente
	mv a0, t0
	li a7, PRINT_CHAR
	ecall
	
	
	#--- Terminar
	li a7, EXIT
	ecall