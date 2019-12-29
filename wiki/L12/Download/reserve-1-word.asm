#-- Ejemplo de reserva de una palabra
	
	.include "servicios.asm"
	
	.text

	#-- Reserva de 1 palabra (4 bytes)
	li a0, 4
	li a7, 9   #-- Servicio Sbrk
	ecall
	
	#-- En a0 tenemos el puntero a la zona de 
	#-- memoria asignada
	
	#-- Guardamos una palabra de prueba
	#-- en esa dirección
	li t0, 0xCACABACA
	sw t0, 0(a0)
	
	#-- Terminar
	li a7, EXIT
	ecall

