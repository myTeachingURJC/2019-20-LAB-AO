#-- Rellenar el segmento de datos con los valores 0,1,2,3,4....

	.data
	
#-- Direccion del segmento de datos	
inicio:

	.text
	
	#-- x5 apunta al comienzo del segmento de datos
	la x5, inicio
	
	#-- x6 es la variable contador, que se incrementa y se 
	#-- almacena en memoria
	li x6, 0
	
bucle:
	#-- Almacenar x6 en la posicion actual, apuntada por x5
	sw x6, 0(x5)
	
	#-- Incrementar el contador
	addi x6, x6, 1
	
	#-- Apuntar a la siguiente palabra de memoria
	addi x5, x5, 4
	
	b bucle
	

	
