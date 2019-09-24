#-- Ejemplo de uso de la pseudo-instruccion la
#-- Se usa para cargar una direccion en un registros
	
	#-- Segmento de datos
	.data

	#-- Dato almacenado		
dato:	.word 0xCAFEBACA
	
	#-- Segmento de Codigo
	.text

	#-- Leer la direccion del dato en el registro x5
	#-- Esta direccion está en la etiqueta dato
	la x5, dato
	
	#-- Terminar
	li a7, 10
	ecall
