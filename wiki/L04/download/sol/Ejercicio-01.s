#-- Ejercicio 1
#-- Contador con valor incial e incremento

	#-- DEFINICION de constantes
	.eqv INICIO 100   #-- Valor de inicio del contador
	.eqv INC 10       #-- Incremento del contador
	
	#-- Variables
	.data
	
contador:  .word 0

	#-- Código
	.text
	
	#-- Usamos el registro x5 como contador
	#-- x5 = INICIO (Inicializacion)
	li x5, INICIO
	
	#-- PUntero a la variale contador: x6
	la x6, contador

bucle:	
	#-- Actualizar la variable contador
	#-- Almacenar el valor de x5 en contador
	sw x5, 0(x6)
	
	#-- Incrementar el contador
	addi x5, x5, INC
	
	#-- Bucle infinito
	b bucle