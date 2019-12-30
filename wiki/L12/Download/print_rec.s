#--------------------------------------
#-- Subrutina: Imprimir el contenido de una lista enlazada
#-- Se imprime usando un algoritmo recursivo
#-- 
#-- ENTRADA: 
#--   a0: Puntero a la lista a imprimir
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

	#-- Si es una lista vacia, terminar
	beq a0, zero, fin

	#-- No es una lista vacia
	#-- Crear la pila para guardar la direccion de retorno
	addi sp,sp,-16
	sw ra, 12(sp)
	
	#-- Usamos t0 para acceder al nodo
	mv t0, a0
	
	#-- Imprimir el valor del nodo
	lw a0, NUM(t0)
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir '\n'
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Obtener el puntero al siguiente nodo
	lw a0, NEXT(t0)
	
	#-- Imprimir la sublista
	jal print
	
	lw ra, 12(sp)
	addi sp,sp,16
	
fin:	
	#-- Terminar
	ret