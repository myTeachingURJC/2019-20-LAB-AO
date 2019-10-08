#-- Ejercicio 9. Cifrador sencillo
#-- Leer un caracter,incrementarlo en una unidad e imprimirlo en la consola
#-- Repetirlo en bucle infinito

	#-- Códigos de servicio
	.eqv READ_CHAR 12
	.eqv PRINT_CHAR 11

	.text
	
bucle:
	
	#-- Leer caracter del usuario
	li a7, READ_CHAR
	ecall
	
	#-- Incrementar el caracter recibido en una unidad
	addi a0, a0, 1
	
	#-- Imprimir el caracter en la consola
	li a7, PRINT_CHAR
	ecall
	
	#-- Bucle infinito
	b bucle
	
	
	
