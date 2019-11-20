#-- Solución al ejercicio 1-1

	.include "servicios.asm"
	
	    .data
msg_main:   .string "Comienza el programa principal\n"
msg_saludo: .string "Hola!\n"	
	
	.text
	
	#----- PROGRAMA PRINCIPAL ----------------
	
	#-- Imprimir mensaje desde programa principal
	la a0, msg_main
	li a7, PRINT_STRING
	ecall
	
	#-- Llamar a la subrutina
	jal saludar
	
	#-- Terminar (Punto de salida)
	li a7, EXIT
	ecall
	#-----------------------------------------
	
#-------------------------------------------------------------------	
#------ SUBRUTINA: saludar
#------   * Parametros de entrada: Ninguno
#------   * Parametros de salida: Ninguno
#-------------------------------------------------------------------
saludar:  #-- Punto de entrada

	 #-- Saludar
	la a0, msg_saludo
	li a7, PRINT_STRING
	ecall
	
	#-- Retornar (Punto de salida)
	ret
	
