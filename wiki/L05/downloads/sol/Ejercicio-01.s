#-- Ejercicio 1. Programa para calcular
#-- la expresion f = (2*a - b) + c - 1
#-- Para su evaluacion usar los valores:
#-- a=10, b=20, c=30
#-- Resultado: t5 = 29

	.eqv EXIT 10

	.text
	
	#- Asignacion de registros:
	#- t0 = a, t1 = b, t2 = c, t5 = f
	
	#-- Inicializacion
	li t0, 10  #-- a = 10
	li t1, 20  #-- b = 20
	li t2, 30  #-- c = 30
	
	#----- Calculo de la expresion
	
	#-- t0 = 2*a
	add t0, t0, t0
	
	#-- t3 = (2*a - b)
	sub t3, t0, t1
	
	#-- t4 = c - 1
	addi t4, t2, -1
	
	#-- t5 = (2*a - b) + c - 1
	add t5, t3, t4
	
	#-- Terminar
	li a7, EXIT
	ecall