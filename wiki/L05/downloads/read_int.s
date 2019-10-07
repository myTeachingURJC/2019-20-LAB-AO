#-- Ejemplo de uso del servicio ReadInt,
#-- para leer un número entero de la consola
#-- El dato leido se deposita en el registro t0

	.eqv READ_INT 5
	.eqv EXIT 10
	
	.text
	
	#-- Invocar ReadInt
	li a7, READ_INT
	ecall
	
	#-- El número leido se devuelve por a0
	#-- Lo pasamos a t0
	mv t0, a0
	
	#-- Terminar
	li a7, EXIT
	ecall
	