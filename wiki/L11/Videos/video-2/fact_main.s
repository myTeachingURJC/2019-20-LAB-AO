#----------------------------------------------------------
#-- PROGRAMA PRINCIPAL
#--
#--  Calculo del factorial de 3, llamando a subrutinas
#-- de niveles inferiores
#----------------------------------------------------------

	.include "servicios.asm"
	
	.data
msg1:	.string "\n\nResultado:  "	
		
	.text 
	
	jal fact3  #-- main
	
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir \n
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
	
