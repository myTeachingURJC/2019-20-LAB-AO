#-- Solucion al ejercicio 2
#-- Calcular la suma de los numeros pares
#-- 2 + 4 + 6 + 8 + 10 + ....

	.text

	#-- Inicializamos los registros x5,x6 a 0
	addi x5, x0, 0
	addi x6, x0, 0
	
	#-- Bucle principal
bucle:
	#-- Incrementar contador principal en dos unidades
	addi x5, x5, 2   #-- x5 = x5 + 2
	
	#-- Obtener termino i-esimo
	add x6, x6, x5  #-- x6 = x6 + x5
	
	#-- Repetir el bucle
	b bucle

