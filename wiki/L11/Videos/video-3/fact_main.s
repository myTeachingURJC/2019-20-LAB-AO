#----------------------------------------------------------
#-- PROGRAMA PRINCIPAL
#--
#--  Calculo del factorial de 3, llamando a subrutinas
#-- de niveles inferiores
#----------------------------------------------------------

	.include "servicios.asm"
	
	.data
msg:	.string "\n\nResultado:  "	
		
	.text 
	
	li a0, 3
	jal fact  
	
	mv s0, a0
	
	
	#-- Imprimir mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir resultado
	mv a0, s0
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
	
