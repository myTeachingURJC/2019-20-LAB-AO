#-- Imprimir los números del 1 al 10

	.include "servicios.asm"
	
	#-- Incremento
	.eqv INC 1
	
	#-- Numero maximo de la cuenta
	.eqv N 5
	
	.text
	
	#-- Inicializar el contador a 0
	li t0, 0
	
bucle:
	#-- Incrementar el contador en una unidad
	addi t0, t0, INC
	
	#-- Imprimir el número
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir ' '
	li a0, ' '
	li a7, PRINT_CHAR
	ecall
	
	#-- Comprobar si t0 < 10
	li t1, N
	blt t0,t1, bucle
	
	#-- Si t0 == 10 sale del bucle
	
	#-- Terminar
	li a7, EXIT
	ecall