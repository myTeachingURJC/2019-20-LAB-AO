#---------------------------------------
#-- Subrutina para imprimir todas las cadenas
#-- contenidas en los nodos de la lista
#--
#--  ENTRADAS:  
#--    a0: Puntero a la lista
#--
#--  SALIDAS:
#--    Ninguna
#-----------------------------------------------

	.include "servicios.asm"
	
	.globl print
	
	#-- Informacion del nodo
	.eqv NEXT 0
	.eqv STR  4
	
	.text
	
print:

	#-- Usamos t0 para recorrer la lista
	mv t0, a0

next:
	#-- Si el puntero es NULL, terminamos
	beq t0, zero, fin

	
	#-- a0 apunta al campo 	
	addi a0, t0, STR
	
	#-- Imprimir la cadena del campo STR
	li a7, PRINT_STRING
	ecall 
	
	#-- Apuntar al siguiente nodo
	lw t0, NEXT(t0)
	
	#-- Repetir
	b next
	
fin:
	ret
	
	