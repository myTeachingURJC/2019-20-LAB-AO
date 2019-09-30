#-- Contador con valor inicial definido mediante
#-- un identificador
	
	#-- Definir el valor inicial para el contador
	.eqv INICIAL 20
	
	.text
	
	#-- Inicializar contador
	#-- El ensamblador sustituye el identificador INICIAL
	#-- por el numero 20
	li x5, INICIAL
	
bucle:
	#-- Incrementar contador: x5 = x5 + 1
	addi x5, x5, 1
	
	#-- Repetir
	b bucle
	
