#-- Añadir un elemento al final de la lista
#--
#--  ENTRADA:
#--    a0:  Puntero a la lista
#--    a1:  Numero a guardar en la lista
#--
#--  SALIDAS:
#--    Ninguna
#--------------------------------------------------------

	.globl append
	
	#---- Informacion sobre el nodo
	.eqv NEXT 0  #-- Offset del campo NEXT
	.eqv NUM 4   #-- Offset del campo NUM
	
append:

	#-- Es una subrutina intermdia
	#-- Necesitamos crear la pila
	addi sp, sp, -16
	sw ra, 12(sp)

	#--- Primero recorremos la lista 
	#--- hasta llegar al último nodo
	#--- Sabemos si es el ultimo portque NEXT es 0
	
next:	
	#-- Leer el campo next
	lw t0, NEXT(a0)

	#-- Si es el ultimo elemento
	#-- salimos del bucle
	beq t0, zero, cont
	
	#-- Actualizar a0 para apuntar al siguiente elemento
	mv a0, t0
	
	#-- Repetir
	b next

cont:	
	#--- a0 apunta al último elemento de la lista
	#-- Guardamos el puntero en la pila
	sw a0, 8(sp)
	
	#-- Crear un nodo nuevo, con next = 0 y num = a1
	li a0, 0
	jal create
	
	#-- Recuperar el puntero del nodo. Lo metemos en t0
	lw t0, 8(sp)
	
	#-- Hacemos que su campo next apunter al nuevo nodo creado
	sw a0, NEXT(t0)
	
	
	#-- Recuperar direccion de retorno 
	lw ra, 12(sp)
	addi sp, sp, 16

	ret