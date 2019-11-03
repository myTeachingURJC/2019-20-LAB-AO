#-- Solución al ejercicio 1-1
#-- La subrutina tiene su propio segmento de 
#-- datos y código

	.include "servicios.asm"
	
	    .data
msg_main:   .string "Comienza el programa principal\n"	
	
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

	     #--- Datos usados sólo por la subrutina
	     .data
msg_saludo: .string "Hola!\n"


	#-- Código de la subrutina
	.text
saludar:  #-- Punto de entrada

	 #-- Saludar
	la a0, msg_saludo
	li a7, PRINT_STRING
	ecall
	
	#-- Retornar (Punto de salida)
	ret
	
