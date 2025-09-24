# Sesion L1 
# Solucion al ejercicio 3
# El registro x3 toma los valores 0,1,2,3,4,5... (Incremento de 1)
# El x4: 0,3,6,9,12,15... (Incremento de 3 en 3)
# El x5 0,5,10,15,20,25.... (Incremento de 5 en 5)
#-- Se repite indefinidamente

	.text
	
	#-- Inicializar los registros a 0
	addi x3, x0, 0
	addi x4, x0, 0
	addi x5, x0, 0 
	
bucle:
	#-- Incrementar x3 en una unidad
	addi x3, x3, 1
	
	#-- Incrementar x4 en 3 unidades
	addi x4, x4, 3
	
	#-- Incrementar x5 en 5 unidades
	addi x5, x5, 5
	
	#-- Repetir indefinidamente
	j bucle
