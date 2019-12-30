#-- Ejemplo de reserva de dos
#-- bloques de 10 bytes
#-- Se escriben 2 palabras en cada bloque
	
	.include "servicios.asm"
	
	#-- Tamaño del bloque a reservar
	.eqv TAM 10
	
	.text

	#-- Reserva de 1 bloque de 10 bytes
	li a0, TAM
	li a7, SBRK
	ecall
	
	#-- Almacenamos dos palabras en 
	#-- en bloque
	li t0, 0xCACABACA
	li t1, 0xCAFEB0B0
	sw t0, 0(a0)
	sw t1, 4(a0)
	
	#-- Reservamos otro bloque de 10 bytes
	li a0, TAM
	li a7, SBRK
	ecall
	
	#-- Almacenamos otras dos palabras
	li t0, 0xB0CAF0CA
	li t1, 0xDED0FE00
	sw t0, 0(a0)
	sw t1, 4(a0)
	
	#-- Terminar
	li a7, EXIT
	ecall

