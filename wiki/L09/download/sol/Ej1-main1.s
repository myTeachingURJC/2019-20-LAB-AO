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
	
