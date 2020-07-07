
	.eqv EXIT 10
	.eqv PRINT_STRING 4
	.eqv PRINT_CHAR 11
	.eqv READ_INT 5
	.eqv PRINT_INT 1
	.eqv N_INI 100
	.eqv N_FIN 105

	

	.data
msg1:   .string "\nDivisores de "
msg2:   .string "Divisores:\n"


	.text

	#-- S0 contiene el numero a comprobar
	li s0, N_INI
	
next_num: 	
	
	#-- Imprimir mensaje  
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir numero a comprobar
	mv a0, s0
	li a7, PRINT_INT
	ecall 
	
	#-- En s1 tenemos los divisores
	li s1, 0
	
	#-- Salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall 
	
bucle:	

	#-- Incrementar divisor
	addi s1, s1, 1

	#-- Comprobar si es divisible entre s1
	mv a0, s0
	mv a1, s1
	jal divisible
	
	#-- a0 nos indica si es o no divisible
	#-- Si no divisible, pasa al proximo divisor
	beq a0, zero, bucle
	
	#-- Imprimir el divisor
	mv a0, s1
	li a7, PRINT_INT
	ecall 
	
	#-- Salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall 
	
	#-- Es el divisor menor numero? Si: pasar al siguiente divisor
	blt s1,s0, bucle
	
	#-- El divisor es igual al numero:
	#-- Hemos terminado con este numero
	
	
	#-- Comprobar el siguiente numero
	addi s0, s0, 1
	
	#-- Si es <= que el maximo, repetimos
	li t0, N_FIN
	ble s0, t0, next_num
	
	#-- Hemos terminado
	
fin2:
	li a7, EXIT
	ecall
