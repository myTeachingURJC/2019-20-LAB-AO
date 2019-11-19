#--- Programa principal
#-- Contador recursivo
#-- Mostrar una cuenta desde 9 hasta 1 en la consola y en el display de 7 segmentos

	.include "servicios.asm"
	
	.text
	
	#-- Poner el contador a 9
	li a0, 9
	jal print_display
	
	#-- Contar desde 9
	li a0, 9
	jal contar_down
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	