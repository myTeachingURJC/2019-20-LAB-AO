#-- Ejemplo de profundidad 2
#-- El programa principal llama a tarea1
#-- Tarea1 llama a tarea 2
#-- Se crea una pila en la tarea1 para almacenar la 
#-- direccion de retorno del nivel 0

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

	#-- Crear la pila mínima: 16 bytes
	addi sp, sp, -16
	
	#---- GUARDAR RA EN LA PILA
	sw ra, 12(sp)

	#-- Estamos en el nivel 1
	li t0, 1

	#-- Llamar a tarea2
	jal tarea2
	
r1:  #-- Direccion de retorno al nivel 1	
	
	#-- Estamos en el nivel 1 otra vez
	li t0, 1
	
	#----- RECUPERAR RA DE LA PILA
	lw ra, 12(sp)
	
	#-- Liberar el espacio de la pila
	addi sp, sp, 16
	
	#-- Punto de salida
	ret	
	
#-----------------------------------------------
#-- Subrutina Tarea2
#-----------------------------------------------
tarea2:

	#--- Es una funcion hoja: No llamamos a otra funcion
	#-- NO hace falta guardar la direccion de retorno
	#-- No hay que crear pila

	#-- Estamos en el nivel 2
	li t0, 2

	#-- Punto de salida
	ret
	
