#-- Suma de dos numeros introducidor por el teclado
#-- Los valores leidos se deben almacenar en las
#-- variables a y b. El resultado en f
#-- El resultado se saca por la consola

	#-- Códigos de servicio
	.eqv EXIT      10
	.eqv READ_INT  5
	.eqv PRINT_INT 1
		
	.text
	
	#-- Pedir el primer numero al usuario
	li a7, READ_INT
	ecall
	
	#-- El valor introducido esta en a0
	#-- t0 = a
	mv t0, a0
	
	#-- Pedir el segundo numero
	li a7, READ_INT
	ecall
	
	#-- t1 = b
	mv t1, a0
	
	#-- Pedir el tercer numero
	li a7, READ_INT
	ecall
	
	#-- t2 = c
	mv t2, a0
	
	#----- Calculo de la expresion
	
	#-- t0 = 2*a
	add t0, t0, t0
	
	#-- t3 = (2*a - b)
	sub t3, t0, t1
	
	#-- t4 = c - 1
	addi t4, t2, -1
	
	#-- t5 = (2*a - b) + c - 1
	add t5, t3, t4
	
	#-- Imprimir el resultado en la consola
	#-- El numero a imprimir debe estar en a0
	mv a0, t5
	
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	