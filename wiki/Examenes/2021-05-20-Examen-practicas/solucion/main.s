	.eqv EXIT         10

	.text
	
	# -- Llamar a la funcion pedida dos veces
	jal test_printhex
	jal test_printhex
	
	# -- Terminar 
	li a7, EXIT
	ecall
	