# --- Incrementar el registro x5 varias veces

	.text
	
	#-- Inicializar contador
	addi x5, x0, 1  #-- x5 = 1
	
	#-- Primer incremento
	addi x5, x5, 1
	
	#-- Segundo incremento
	addi x5, x5, 1
	
	#-- Tercer incremento
	addi x5, x5, 1
	
	#-- Terminar
	li a7, 10
	ecall
