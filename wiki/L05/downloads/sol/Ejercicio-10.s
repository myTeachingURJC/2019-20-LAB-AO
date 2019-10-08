#-- Ejercicio 10: Volcado de memoria en hexadecimal
#-- Usar el caracter de salto de linea para separar las palabras


	#-- Códigos de servicio
	.eqv EXIT      10
	.eqv PRINT_INT 1
	.eqv PRINT_CHAR 11
	.eqv PRINT_INT_HEX  34

	#-- Segmento de datos
	.data
datos:	.word 10,11,12,13,14,15,127,255,0x00FABADA, 0xCAFEBACA


	.text

	#-- t0 es un puntero al comienzo del segmento de datos
	la t0, datos

	
bucle:			
	#-- Leer palabra
	lw a0, 0(t0)
	
	#-- Imprimir el numero en la consola
	li a7, PRINT_INT_HEX
	ecall
	
	#-- Imprimir el salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Incrementar el puntero
	addi t0, t0, 4
	 
	#-- Bucle infinito
	b bucle
	
	
	
