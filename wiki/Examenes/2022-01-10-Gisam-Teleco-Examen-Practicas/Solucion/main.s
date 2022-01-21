	.eqv EXIT         10

	.text
	
	# -- Llamar a la funcion pedida dos veces
	jal test_printbin
	jal test_printbin
	
	# -- Terminar 
	li a7, EXIT
	ecall
	
