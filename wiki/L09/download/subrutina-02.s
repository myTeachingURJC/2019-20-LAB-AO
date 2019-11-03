##-- Esquema de un programa que realiza la tarea 1
##-- Está dividido en el PROGRAMA PRINCIPAL y la
##-- Subrutina tarea1 

	.include "servicios.asm"
	
	.data
	
msg_tarea1:	.string "\nTAREA 1\n"
	
	.text 
	
	
	#------------------------ PROGRAMA PRINCIPAL (MAIN)-------------------------
	#-- PUNTO DE ENTRADA
	
	#-- Comienzo
	#-- Ejecutar la Tarea 1
	jal tarea1
	
	#-- ....
	#-- Otros cálculos y operaciones de mi programa
	#-- ...
	
	#-- Final
	#-- Ejecutar la Tarea 1
	jal tarea1
	
	#-- PUNTO DE SALIDA
	li a7, EXIT
	ecall
	#-----------------------------------------------------------------------
	
	
	 #-------- SUBRUTINA TAREA 1 ----------------
tarea1:  #-- PUNTO DE ENTRADA

	 #-- Ejecutar la Tarea 1
	la a0, msg_tarea1
	li a7, PRINT_STRING
	ecall
	
	#-- PUNTO DE SALIDA
	ret
	#----------------------------------------------