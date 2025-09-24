# Sesion L1 
# Solucion al ejercicio 2
# --- Programa contador
# --- Se implementa un contador en el registro x5
# --- que se ejecuta indefinidamente
# --- El contador se inicializa con el valor 0
# --- El contador se incrementa de 2 en 2

	.text
	
	#-- Inicializar contador
	addi x5, x0, 0  #-- x5 = 0
	
	# -- Repetir indefinidamente las siguientes
	# -- instrucciones	
bucle:

	#-- Incrementar contador en 2 unidades
	addi x5, x5, 2
	
	#-- Repetir!
	j bucle