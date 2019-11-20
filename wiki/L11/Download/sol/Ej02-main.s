#--- Programa principal
#-- Pedir al usuario una cadena e imprimirla del revés
#-- Ej: Hola --> aloH

	.include "servicios.asm"
	
	.eqv MAX 1024
	
	.data
	
cad:	.space MAX	
msg1:	.string "Introduce una cadena: "
	
	.text
	
	#-- Imprimri mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall 
	
	#-- Pedir cadena al usuario
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Llamar a la funcion reverse
	jal print_reverse
	
	#-- Terminar
	li a7, EXIT
	ecall