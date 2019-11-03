##-- Esquema de un programa que realiza la tarea 1, 
#--  La tarea 1 se realiza al comienzo y al final
#--  Está estructura en UN UNICO PROGRAMA PRINCIPAL

	.include "servicios.asm"
	
	.data
	
msg_tarea1:	.string "\nTAREA 1\n"
	
	.text 
	
	
	#------------------------ PROGRAMA PRINCIPAL (MAIN)-------------------------
	#-- PUNTO DE ENTRADA
	
	#-- Comienzo
	#-- Ejecutar la Tarea 1
	la a0, msg_tarea1
	li a7, PRINT_STRING
	ecall
	
	#-- ....
	#-- Otros cálculos y operaciones de mi programa
	#-- ...
	
	#-- Final
	#-- Ejecutar la Tarea 1
	#-- Ejecutar la Tarea 1
	la a0, msg_tarea1
	li a7, PRINT_STRING
	ecall
	
	#-- PUNTO DE SALIDA
	li a7, EXIT
	ecall
	#-----------------------------------------------------------------------
	