#------- Calcular la longitud de una lista 
#---- Algoritmo recursivo
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
	#-- Usamos t0 como acumulador
	li t0, 0
	
	#-- Si a0 es NULL, terminar
	beq a0, zero, fin
	
	#-- Crear la pila
	addi sp, sp, -16
	sw ra, 12(sp)
	
	#-- Apuntar al siguiente nodo
	lw a0, NEXT(a0)
	
	#-- Calcula la longitud de la sublista
	jal len
	
	#-- Sumar un elemento mas
	addi t0, a0, 1
	
	#-- Recuperar direccion de retorno
	lw ra, 12(sp)
	addi sp, sp, 16
	
fin:

	#-- Devolver en a0 la longitud
	mv a0, t0

	ret