
	.globl sum10
	
	.text	
#-------------------------------------------------------------------------------------------
#-- sum10: Suma de un conjutno de 10 numeros enteros situados a partir de una posicion de memoria
#-- ENTRADAS:
#--    a0: Puntero al primer numero
#-- SALIDAS:
#--    a0: Resultado de la suma
#-------------------------------------------------------------------------------------------	
sum10:	
	
	#--- t0: Suma acumulada
	li t0, 0
	
	#-- Contador de iteraciones
	li t1, 0
	
bucle:	
	
	# -- Leer numero
	lw t2, 0(a0)
	
	#-- Sumarlo a t0
	add t0,t0, t2
	
	#-- Apuntar al siguiente numero
	addi a0, a0, 4
	
	#-- Incrementar contador de iteraciones
	addi t1, t1, 1
	
	#-- Si contador de iteraciones < 10: repetir
	li t3, 10
	blt t1, t3, bucle
	
	#-- Devolver el resultado
	mv a0, t0
	ret
	