#----------------------------------------------------
#-- Subrutina que calcula el factorial del 2
#-- ENTRADAS:
#--   Ninguna
#-- SALIDAS:
#--   Devuelve 2 * fact1()
#----------------------------------------------------

	.include "servicios.asm"

	#-- Punto de entrada
	.globl fact2
	
	.data
msg:	.string "> Fact2\n"
	
	.text
	
fact2:

	#--Crear la pila para guardar la direccion de retorno
	addi sp, sp, -16 #-- Fact2
	sw ra, 12(sp)
	
	#-- Calcular el factorial de 1
	jal fact1
	
	#-- 2 * fact1()
	li t0, 2
	mul t1, a0, t0
	
	#--- t1 contiene el resultado
	
	la a0, msg   
	li a7, PRINT_STRING
	ecall
	
	#-- Devolver el valor del factorial
	mv a0, t1
	
	
	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	addi sp, sp, 16
	
	#-- Terminar
	ret
	




