#-- Probando el servicio EXIT

	.text
	
#-- Este es el PUNTO DE ENTRADA del programa principal

	#-- No se hace nada
	
	#-- Este es el punto de salida del programa principal
	#-- se invoca al servicio exit
	
	#-- Primero cargamos en el registro a7 el codigo de servicio
	li a7, 10
	
	#-- y ahora realizamos la llamada al sistema
	ecall
	
