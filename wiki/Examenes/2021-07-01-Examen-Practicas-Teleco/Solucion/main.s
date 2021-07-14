#-- Programa de pruebas de la funcion printv_test()
#-- Hay que pedir al usuario la cantidad de vectores de prueba a imprimir
#-- Esta operacion se repite hasta que el usuario introduce 0
#-- En ese momento se termina

	# -- Servicios del sistema operativo
	.eqv EXIT 10
	.eqv PRINT_STRING 4
	.eqv READ_INT 5

	.data
	
msg1:	.string "\nIntroduce numero de vectores de test: "


	.text


bucle:
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	# -- Pedir al usuario el numero de vectores (n)
	li a7, READ_INT
	ecall
			
	# -- Si se introduce el 0 terminamos
	beq a0, zero, fin
			
	# -- Imprimir los vectores
	# -- Por a0 se pasa el numero de vectores a imprimir
	jal printv_test
	
	#-- Repetir
	b bucle
	
fin:
	# Terminar
	li a7, EXIT
	ecall
	
