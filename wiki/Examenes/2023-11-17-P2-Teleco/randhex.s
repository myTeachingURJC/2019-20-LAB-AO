#-- Programa para imprimir numeros aleatorios en hexadecimal

	#-- Servicios del sistema operativo (ESPECIFICACION)
	.include "sis.s"

	.data
num:    .word 0  #-- (BONUS) ESPECIFICACION: Numero introducido por el usuario
msg1:	.string "Cantidad de numeros aleatorios: " #-- ESPECIFICACION

	.text
	
	#-- Imprimir mensaje
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cantidad de numeros aleatorios #-- ESPECIFICACION
	li a7, READ_INT
	ecall
	
	#-- t0: Cantidad de numeros aleatorios
	mv t0,a0
	
	#-- BONUS! Guardar este numero al comienzo del segmento de datos
	la t1,num
	sw t0,0(t1)
	
	#-- Bucle principal
bucle:
	#-- Si el numero es 0, terminar
	beq t0, zero, fin
	
	#-- Obtener numero aleatorio, llamando al sistema operativo
	#-- (ESPECIFICACION)
	li a0,1   #---- (ESPECIFICACION: índice del generador de números pseudoaleatorios)
	li a7, RAND_INT
	ecall
	
	#-- Imprimir numero aleatorio, en hexadecimal (ESPECIFICACION)
	li a7, PRINT_INT_HEX
	ecall
	
	#-- Imprimir salto de linea (ESPECIFICACION)
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Decrementar t0
	addi t0,t0,-1
	
	#-- Repetir
	b bucle
	
fin:
	#-- Terminar
	li a7, EXIT
	ecall
	
	
	
	
