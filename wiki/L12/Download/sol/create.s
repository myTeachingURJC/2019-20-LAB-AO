#-- Subrutina para crear e inicializar un nodo
#-- de la lista
#-- ENTRADAS: 
#--    a0: puntero al siguiente nodo
#--    a1: Numero a almacenar en ese nodo
#--
#-- SALIDAS:
#--    a0: Puntero al nodo creado
#-----------------------------------------------------

	.include "servicios.asm"
	
	.globl create
	
	#---- Informacion sobre el nodo
	.eqv TAM 8   #-- Tamaño del nodo
	.eqv NEXT 0  #-- Offset del campo NEXT
	.eqv NUM 4   #-- Offset del campo NUM
	
	.text 
	
create:

	#-- Guardar los argumentos pasados en t0 y t1 respectivamente
	mv t0, a0
	mv t1, a1

	#-- Crear un nodo nuevo
	li a0, TAM
	li a7, SBRK
	ecall
	
	#-- a0 apunta al nuevo nodo
	
	#-- Inicializar los campos a los valores t0 y t1 (pasados como parametros)
	sw t0, NEXT(a0)
	sw t1, NUM(a0)

	#-- Terminar
	#-- En a0 se devuelve el puntero al nuevo nodo
	ret