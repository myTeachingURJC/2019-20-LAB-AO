# --- Programa contador
# --- Se implementa un contador en el registro x5
# --- que se ejecuta indefinidamente
# --- El contador se inicializa con el valor 1

	.text
	
	#-- Inicializar contador
	addi x5, x0, 1  #-- x5 = 1
	
	# -- Repetir indefinidamente las siguientes
	# -- instrucciones	
bucle:

	#-- Incrementar contador
	addi x5, x5, 1
	
	#-- Repetir!
	j bucle
