#--------------------------------------
#-- Subrutina: Imprimir el contenido de una lista enlazada
#-- 
#-- ENTRADA: 
#--   a0: Puntero al primer elemento de la lista
#--
#-- SALIDA: Ninguna
#------------------------------------------------------------

	.include "servicios.asm"
	
	.globl print
	
	#---- Informacion sobre el nodo
	.eqv NEXT 0  #-- Offset del campo NEXT
	.eqv NUM 4   #-- Offset del campo NUM
	
	.text
print:	
	#-- Usamos t0 para recorer la lista
	mv t0, a0

next:	
	#-- Comprobar si hemos llegado al final
	#-- Si el puntero es NULL, terminamos
	beq t0, zero, fin

	#-----Hay nodo: Imprimir su valor
	#-- Leer numero
	lw a0, NUM(t0)
	
	#-- Imprimirlo en la consola
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir un salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Actualizar t0 para apuntar al siguiente nodo
	#-- t0 = t0->next
	lw t0, NEXT(t0)
	
	#-- Repetir
	b next
	
fin:	
	#-- Terminar
	ret