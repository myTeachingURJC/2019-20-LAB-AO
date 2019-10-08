#-- Suma de dos numeros introducidor por el teclado

	#-- Códigos de servicio
	.eqv EXIT      10
	.eqv READ_INT  5
	.eqv PRINT_INT 1
	
	.text
	
	#-- Pedir el primer numero al usuario
	li a7, READ_INT
	ecall
	
	#-- El valor introducido se devuelve en a0
	
	#-- t0 = primer numero
	mv t0, a0
	
	#-- Pedir el segundo numero
	li a7, READ_INT
	ecall
	
	#-- t1 = segundo numero
	mv t1, a0
	
	#-- Realizar la suma
	#-- a0 = t0 + t1
	add a0, t0, t1
	
	#-- Imprimir el numero en la consola
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	