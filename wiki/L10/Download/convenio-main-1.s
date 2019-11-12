#-- Ejemplo de programa principal 
#-- que cumple correctamente con el convenio
#-- de uso de registros de la ABI del RISCV

	.include "servicios.asm"
	
	.text
	
	li s0, 25
	
	#--- Llamar a la tarea1
	jal tarea1
	
	#-- Imprimir el valor de s0
	#-- Al llamar a tarea1 SU VALOR SE HA PRESERVADO
	mv a0,s0
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
#-----------------------------------------
#-- Subrutina Tarea 1
#-- Estaría definida en otro fichero, pero 
#-- la incluimos aquí por comodidad
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

	#-- Punnto de salida
	ret	
	
