#-- Programa con dos contadores 
#-- El registro x5 se incrementa de uno en uno
#-- El registro x6 se incrementa de dos en dos
#-- Se han añadido más etiquetas

	.text

inicio:  #-- Esta etiqueta tiene la direccion de la primera instrucccion
         #-- (que ya sabemos que es 0x00400000)
		
	#-- Inicializar el registro x5 a 0
	addi x5, x0, 0
	
	
etiqueta1:  #-- Etiqueta de prueba

	#-- x6 = 0
	addi x6, x0, 0
	
bucle:
	#-- Incrementar el registro x5 en una unidad
	addi x5, x5, 1  #-- x5 = x5 + 1
	
	#-- x6 = x6 + 2
	addi x6, x6, 2
	
etiqueta2: #-- Otra prueba	
	
	#-- Repetir indefinidamente		
	j bucle

fin:  #-- Esta etiqueta contiene la direccion de la posicion de memoria
      #-- siguiente a la instrucción j bucle
      