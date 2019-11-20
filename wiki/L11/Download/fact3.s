#----------------------------------------------------
#-- Subrutina que calcula el factorial del 3
#-- ENTRADAS:
#--   Ninguna
#-- SALIDAS:
#--   Devuelve 6
#----------------------------------------------------

	.include "servicios.asm"

	#-- Punto de entrada
	.globl fact3
	
	.data
msg:	.string "\n> Fact3: "
	
	.text
	
fact3:

	#-- Necesitamos pila para guardar
	#-- la direccion de retorno
	addi sp, sp, -16
	sw ra, 12(sp)

	#-- Calcular el factorial de 2
	jal fact2
	
	#-- Calcular 3 * fact2
	li t0, 3
	mul t1, a0, t0 
	
	
	#-- Imprimir mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Recuperar a0
	mv a0, t1
	
	#-- Imprimir el valor de factorial
	li a7, PRINT_INT
	ecall
	
	#-- Recuperar direccion de retorno
	lw ra, 12(sp)
	addi sp, sp, 16
	
	ret
	




