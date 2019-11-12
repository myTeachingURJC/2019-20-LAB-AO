#-- Ejemplo de profundidad 2
#-- El programa principal llama a tarea1
#-- Tarea1 llama a tarea 2
#-- Este programa ES INCORRECTO!
#-- SE QUEDA EN UN BUCLE INFINITO!

	.include "servicios.asm"
			
			
#-------------------------------------------
#-- PROGRAMA PRINCIPAL
#-------------------------------------------			
			
	.text
	
	#-- En t0 ponemos el nivel
	#-- Estamos en el nivel 0
	li t0, 0
	
	#-- Llamar a tarea1
	jal tarea1
	
	#-- Direccion de retorno al nivel 0
r0:	

	#-- Estamos en el nivel 0 otra vez
	li t0, 0
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
#-----------------------------------------
#-- Subrutina Tarea1
#--------------------------------------------
	.text
	
	#--- PUnto de entrada de la subrutia
tarea1:	

	#-- Estamos en el nivel 1
	li t0, 1

	#-- Llamar a tarea2
	jal tarea2
	
r1:  #-- Direccion de retorno al nivel 1	
	
	#-- Estamos en el nivel 1 otra vez
	li t0, 1
	
	#-- Punto de salida
	ret	
	
#-----------------------------------------------
#-- Subrutina Tarea2
#-----------------------------------------------
tarea2:

	#-- Estamos en el nivel 2
	li t0, 2

	#-- Punto de salida
	ret
	
