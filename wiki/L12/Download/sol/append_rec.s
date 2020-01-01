#-- Añadir un elemento al final de la lista
#-- Algoritmo recursivo
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

	#-- En todos los casos hay que llamar a otra subrutina
	#-- Hay que crear la pila
	addi sp, sp, -16
	sw ra, 12(sp)

	#-- Leer el campo next
	lw t0, NEXT(a0)

	#-- Si es el ultimo elemento
	#-- creamos nodo y lo enlazamos
	beq t0, zero, crear
	
	#-- No es el último: Insertar el valor en la sublista
	mv a0, t0
	jal append
	
	b fin
	
crear:  
	
	#-- Guardar el puntero al ultimo nodo en la pila
	sw a0, 8(sp)
	
	#-- Crear un nodo nuevo, con next = 0 y num = a1
	li a0, 0
	jal create
	
	#-- Recuperar el puntero del nodo. Lo metemos en t0
	lw t0, 8(sp)
	
	#-- Hacemos que su campo next apunter al nuevo nodo creado
	sw a0, NEXT(t0)
	
fin:	
	#-- Recuperar direccion de retorno 
	lw ra, 12(sp)
	addi sp, sp, 16

	ret