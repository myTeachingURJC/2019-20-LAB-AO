#--- Programa principal
#-- Contador recursivo
#-- Mostrar una cuenta desde 1 hasta 9 en la consola y en el display de 7 segmentos

	.include "servicios.asm"
	
	.text
	
	#-- Poner el contador a 0
	li a0, 0
	jal print_display
	
	#-- Contar hasta 10
	li a0, 9
	jal contar_up
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	