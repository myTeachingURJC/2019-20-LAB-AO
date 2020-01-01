#-- Crear un nodo inicializado con una cadena 
#-- pedida al usuario. Se inicializa el campo NEXT 
#-- con el valor pasado
#--
#--  ENTRADAS:
#--     a0: Puntero a almacenar al campo next
#--
#--  SALIDAS:
#--     a0: Puntero al nuevo nodo creado
#--------------------------------------------------------

	.include "servicios.asm"
	
	.globl create_str
	
	#-- Informacion del nodo
	.eqv NEXT 0
	.eqv STR  4
	
	 #-- Tamaño del nodo: 20 bytes para la cadena y 4 para el puntero
	.eqv TAM  24 
	.eqv MAX_STR 20  #-- Tamaño de la cadena
	
	.text
	
	
create_str:	
	
	#-- a0 Contiene se debe guardar en NEXT
	#-- Lo movemos a a1 para no perderlo
	mv a1, a0
	
	#-- Crear un nodo nuevo
	li a0, TAM
	li a7, SBRK
	ecall 
	
	#-- a0 contiene el puntero al nodo
	#-- Lo movemos a t0 para no perderlo
	mv t0, a0
	
	#-- Inicializar los campos
	sw a1, NEXT(t0)
	sw zero, STR(t0)
	
        #-- a0 apunta al campo str
	addi a0,t0,STR
	
	#-- Pedir cadena al usuario y guardarla en 
	#-- el campo STR
	li a1, MAX_STR
	li a7, READ_STRING
	ecall
	
	#-- Devolver el puntero al nodo creadd
	mv a0, t0
	
	ret
