#--------------------------------------
#-- Subrutina: Imprimir el contenido de una lista enlazada en sentido inverso
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
	
	#-- Guardar a0 en la pila, para preservarlo
	sw a0, 8(sp)
	
	#-- Obtener el puntero al siguiente nodo
	lw a0, NEXT(a0)
	
	#-- Imprimir la sublista en orden inverso
	jal print
	
	#-- Recuperar el puntero a la lista original
	lw a0, 8(sp)
	
	#-- Imprimir el valor del nodo
	lw a0, NUM(a0)
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir '\n'
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Recuperar direccion de retorno
	lw ra, 12(sp)
	addi sp,sp,16
	
fin:	
	#-- Terminar
	ret
