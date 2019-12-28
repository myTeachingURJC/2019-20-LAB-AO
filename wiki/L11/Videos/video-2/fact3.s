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
	#--Crear la pila para guardar la direccion de retorno
	addi sp, sp, -16   #--- Fact3
	sw ra, 12(sp)
	
	#-- Calcular el factorial de 2
	jal fact2
	
	#-- 3 * fact2()
	li t0, 3
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



