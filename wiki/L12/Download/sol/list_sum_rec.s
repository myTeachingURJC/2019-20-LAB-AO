#------- Calcular la longitud de una lista 
#---- Algoritmo recursivo
#--- SUBRUTINA len
#--   ENTRADAS: 
#--     a0: Puntero de acceso a la lista
#--
#--   DEVUELVE:
#--     a0: Número de nodos en la lista
#----------------------------------------------
	
	.globl sum
	
	#-- Informacion sobre la lista
	.eqv NUM 4
	.eqv NEXT 0
	
sum:
	#-- Usamos t0 como acumulador
	li t0, 0
	
	#-- Si a0 es NULL, terminar
	beq a0, zero, fin
	
	#-- Crear la pila
	addi sp, sp, -16
	sw ra, 12(sp)
	
	#-- Guardar en la pila el puntero a la lista
	sw a0, 8(sp)
	
	#-- Apuntar al siguiente nodo
	lw a0, NEXT(a0)
	
	#-- Calcula la suma de la sublista
	jal sum
	
	#-- Guardar en t0 la suna de la sublista
	mv t0, a0
	
	#-- Recuperar puntero al nodo actual
	lw a0, 8(sp)
	
	#-- Leer el valor del nodo actual
	lw t1, NUM(a0)
	
	#-- Sumar la sublista con el valro actual
	add t0, t0, t1
	
	#-- Recuperar direccion de retorno
	lw ra, 12(sp)
	addi sp, sp, 16
	
fin:

	#-- Devolver en a0 la longitud
	mv a0, t0

	ret
