
	#-- Servicios del sistema operativo
	.eqv PRINT_CHAR   11
	.eqv EXIT         10

	.text
	
	#-- Imprimir primer bloque
	li a0, '*'
	li a1, 3
	jal bloque
	
	#-- Imprimir salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Imprimir segundo bloque
	li a0, 'X'
	li a1, 4
	jal bloque
	
	#-- Terminar
	li a7,EXIT
	ecall
	
