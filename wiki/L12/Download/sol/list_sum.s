#------- Calcular la suma de todos los elementos de la lista
#---- Algoritmo iterativo
#--- SUBRUTINA sum
#--   ENTRADAS: 
#--     a0: Puntero de acceso a la lista
#--
#--   DEVUELVE:
#--     a0: Suma de sus elementos
#----------------------------------------------
	
	.globl sum
	
	#-- Informacion sobre la lista
	.eqv NUM 4
	.eqv NEXT 0
	
sum:
	#-- Usamos t0 como acumulador de la suma
	li t0, 0
	
next:
	#-- Si a0 es NULL, terminar
	beq a0, zero, fin
	
	#-- Es un nodo. Leer su valor
	lw t1, NUM(a0)
	
	#-- Sumarlo al acumulador
	add t0, t0, t1
	
	#-- Apuntar al siguiente nodo
	lw a0, NEXT(a0)
	
	#-- Repetir
	b next
	
fin:

	#-- Devolver en a0 la suma total
	mv a0, t0

	ret
