
	.globl random

	#--- Constantes para la generacion de los numeros aleatorios
	#-- (ESPECIFICACIONES)
	.eqv CA 37    #-- Coeficiente a
	.eqv CB 1373  #-- Coeficiente b
	.eqv CC 16    #-- Coeficiente c

	.text
	
 #-------------------------------------------------
 #-- random(n)
 #-- Calcular el siguiente numero aleatorio a partir
 #-- del actual
 #-- ENTRADA:
 #--   * a0 (n): Numero actual
 #-- SALIDA:
 #-    * Devuelve el valor (CA * n + CB) mod CC
 #--------------------------------------------------- 
random:
	
	#-- Calcular siguiente numero aleatorio
	#-- a0 = (A * a0 + b) mod C
	
	#-- Usamos el propio registro a0 para guardar
	#-- los resultados parciales
	li t1, CA
	mul a0, a0, t1  #-- a0 = A * a0
	
	#-- a0 = (A * a0) + B
	li t1, CB
	add a0,a0,t1
	
	#-- Calcular el resto
	#-- a0 = (A * a0 + B) mod C
	li t1, CC
	rem a0, a0, t1
	
	ret
	