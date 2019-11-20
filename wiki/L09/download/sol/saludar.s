#-------------------------------------------------------------------	
#------ SUBRUTINA: saludar
#------   * Parametros de entrada: Ninguno
#------   * Parametros de salida: Ninguno
#-------------------------------------------------------------------

	.include "servicios.asm"

	#-- Punto de entrada de la subrutina
	.globl saludar

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
	
