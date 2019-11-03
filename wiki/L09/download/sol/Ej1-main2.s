#-- Solución al ejercicio 1-3
#-- Se invoca dos veces a la subrutina
#-- de saludo

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
	
	#-- Llamar a la subrutina otra vez
	jal saludar
	
	#-- Terminar (Punto de salida)
	li a7, EXIT
	ecall
	#-----------------------------------------
	
