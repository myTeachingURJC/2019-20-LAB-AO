#-- Programa con dos contadores 
#-- El registro x5 se incrementa de uno en uno
#-- El registro x6 se incrementa de dos en dos

	.text
	
	#-- Inicializar el registro x5 a 0
	addi x5, x0, 0
	
	#-- x6 = 0
	addi x6, x0, 0
	
bucle:
	#-- Incrementar el registro x5 en una unidad
	addi x5, x5, 1  #-- x5 = x5 + 1
	
	#-- x6 = x6 + 2
	addi x6, x6, 2
	
	#-- Repetir indefinidamente		
	j bucle