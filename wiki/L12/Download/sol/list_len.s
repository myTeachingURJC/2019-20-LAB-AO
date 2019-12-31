#------- Calcular la longitud de una lista 
#--- SUBRUTINA len
#--   ENTRADAS: 
#--     a0: Puntero de acceso a la lista
#--
#--   DEVUELVE:
#--     a0: Número de nodos en la lista
#----------------------------------------------
	
	.globl len
	
	#-- Informacion sobre la lista
	.eqv NUM 4
	.eqv NEXT 0
	
len:
	#-- Usamos t0 como contador
	li t0, 0
	
next:
	#-- Si a0 es NULL, terminar
	beq a0, zero, fin
	
	#-- Es un nodo. INcrementar el contador
	addi t0, t0, 1
	
	#-- Apuntar al siguiente nodo
	lw a0, NEXT(a0)
	
	#-- Repetir
	b next
	
fin:

	#-- Devolver en a0 la longitud
	mv a0, t0

	ret