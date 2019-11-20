#-----------------------------------------
# Subrutina print_vect(x,y)
#--
#--  Imprimir el vector (x,y)
#--
#-- ENTRADA:
#     a0: Coordenada x
#     a1: Coordenada y
#-- SALIDA: Ninguna
#--------------------------------------------

	#-- Punto de entrada
	.globl print_vec
	
	.include "servicios.asm"
	
	.text
	
print_vec:	
	
	addi sp, sp, -16
	
	#-- Necesitamos guardar a0 en la pila
	sw a0, 0(sp)
	
	li a0, '('
	li a7, PRINT_CHAR
	ecall
	
	#-- Imprimir coordenada x
	lw a0, 0(sp)
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir la coma
	li a0, ','
	li a7, PRINT_CHAR
	ecall
	
	#-- Imprimir coordenada y
	mv a0, a1
	li a7, PRINT_INT
	ecall
	
	li a0, ')'
	li a7, PRINT_CHAR
	ecall
	
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	addi sp, sp, 16
	ret
	
