#-- Ejemplo de subrutina
#-- que VIOLA EL CONVENIO  
#-- de uso de registros de la ABI del RISCV
#---------¡¡¡¡¡¡CUIDADO!!!!!

	.globl tarea1

	.include "servicios.asm"
			
	.text

#-----------------------------------------
#-- Subrutina Tarea 1
#--------------------------------------------

	.data
msg1:	.string "Tarea 1\n"

	.text
	#--- PUnto de entrada de la subrutia
tarea1:	
	#-- Imprimir un mensaje
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- INCORRECTO! NO PODEMOS MODIFICAR
	#-- NINGUN registro estatico
	addi s0,s0,1

	#-- Punnto de salida
	ret	
	
