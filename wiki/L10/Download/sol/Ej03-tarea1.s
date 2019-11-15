#---------------------------------
#-- Subrutina Tarea 1
#-- ENTRADAS: Ninguna
#-- SALIDAS: Ninguna
#---------------------------------

	#-- Punto de entrada
	.globl tarea1
	
	.include "servicios.asm"

	.data
msg:	.string "  Tarea 1\n" 	
			
	.text
	
	
#-------- Punto de entrada
tarea1:

	#-- Reservar memoria en la pila
	addi sp,sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)
	
	#-- Imprimir el mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Llamar a la tarea 2
	jal tarea2
	
	#-- Imprimir el mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	
	##-- Recuperar dirección de retorno
	lw ra, 12(sp)
	
	#-- Liberar memoria de la pila
	addi sp, sp, 16		
			
#------- Punto de salida
	ret
