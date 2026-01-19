
	#-- Servicios del sistema operativo
	#-- Deben estar aqui por ESPECIFICACIONES
	.eqv EXIT 10
	.eqv PRINT_CHAR 11

	.text
	
	#-- Programa principal
	#-- Imprimir los numeros del 1 al 15 en hexadecimal
	
	#-- Inicializar contador de numeros (s0)
	li s0, 0
	
bucle:
	#-- Imprimir numero actual
	mv a0, s0
	jal print_hex1
	
	#-- Imprimir salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Incrementar contador
	addi s0, s0, 1
	
	#-- Si contador <= 15, repetir bucle
	li t0, 15
	ble s0, t0, bucle
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	