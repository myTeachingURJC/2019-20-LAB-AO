

	.eqv READ_INT 5
	.eqv PRINT_STRING 4
	.eqv EXIT 10

	.data
	
msg1:	.string "\nIntroduce numero de multiplos a imprimir: "

	.text
	
bucle:	
	#-- Imprimir mensaje de solicitud
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir numero al usuario
	li a7, READ_INT
	ecall
	
	#-- a0 contiene el numero introducido por el usuario
	#-- Si este numero es 0 se termina
	beq a0, zero, fin 

	#-- Imprimir los multiplos pedidos, llamando a print_mult()
	jal print_mul5
	
	#-- Repetir el bucle
	b bucle
fin:
	
	#-- Terminar
	li a7, EXIT
	ecall
	