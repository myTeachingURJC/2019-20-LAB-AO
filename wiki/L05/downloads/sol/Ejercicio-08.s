#-- Ejercicio 8. Calcular la secuencia de fibonacci e
#-- imprimirla en la consola

	#-- Códigos de servicio
	.eqv EXIT      10
	.eqv PRINT_INT 1
	.eqv PRINT_CHAR 11

	#-- Valores de fibonacci iniciales
	.eqv INI0  0
	.eqv INI1  1


	.text

	#-- Usamos los registros t0 y t1 para los dos terminos anteriores
	li t0, INI0
	li t1, INI1
	
	#-- Los terminos iniciales no se imprimen
	
bucle:
	#-- calcular el siguiente termino
	add t2, t1, t0
	
	#-- Imprimir el siguiente termino
	mv a0, t2
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir el caracter ,
	li a0, ','
	li a7, PRINT_CHAR
	ecall
	
	#-- Actualizar los terminos
	mv t0, t1
	mv t1, t2
	 
	#-- Bucle infinito
	b bucle
	
	
	
