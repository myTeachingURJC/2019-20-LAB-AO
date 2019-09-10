	.text
	
	#-- Inicializar el registro x5 a 0
	li x5, 0
	
bucle:
	#-- Incrementar el registro x5 en una unidad
	addi x5, x5, 1  #-- x5 = x5 + 1
	
	#-- Repetir indefinidamente		
	b bucle
