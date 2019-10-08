#-- Ejemplo de uso del servicio PrintChar
#-- para imprimir un carácter ASCII
#-- Se imprime una 'A' seguida de un salto de línea

	.eqv PRINT_CHAR 11
	.eqv EXIT 10

	.text
	
	#-- Imprimir una A, usando su codigo ASCII
	li a0, 0x41
	li a7, PRINT_CHAR
	ecall
	
	#-- Imprimir un salto de linea, usando '\n'
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall