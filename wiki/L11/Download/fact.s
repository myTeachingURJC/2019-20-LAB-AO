#-----------------------------------------------------
#-- Subrutina fact(n)
#-- Calcula el factorial de n, de forma recursiva
#-- ENTRADAS:
#--   a0: n
#-- DEVUELVE:
#--   a0: n * fact(a0-1)
#----------------------------------------------------

	.include "servicios.asm"
	
	.globl fact
	
	.data
msg:	.string "\n> Factorial "
	
	.text
fact:

	#-- En las funciones recursivas hay que comprobar
	#-- primero en que nivel estamos: ¿El ultimo? ¿Intermedio?
	
	#-- Si a0 > 1 no estamos en el nivel más profundo
	li t0, 1
	bgt a0, t0, fact_rec 
	
	#-- Estamos en el nivel mas profundo
	#-- Es una subrutina Hoja
	#-- No hace falta guardar direccion de retorno en la pila
	
	#-- Imprimir mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- El factorial de 1 es 1
	li a0, 1
	
	#-- Imprimir a0
	li a7, PRINT_INT
	ecall
	
	#-- Ir al punto de salida
	b fin


	#--- Estamos en un nivel intermedio
fact_rec:

	#-- Hay que crear la pila para guardar la direccion de retorno
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)

	#-- Guardar n en la pila
	sw a0, 8(sp)
	
	#-- Calcular fact(n-1)
	addi a0, a0, -1
	jal fact
	
r1:     #-- Direccion de retorno
        #-- (Para depurar)
	
	#-- a0 = fact(n-1)
	#-- Recuperar n
	lw t0, 8(sp)
	
	#-- Calcular t0 = n * fact(n-1)
	mul t1, t0, a0
	
	#-- Imprimir mensajes
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir n
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Colocar en a0 el resultado a devolver
	mv a0, t1

	#-- Recuperar direccion de retorno
	lw ra, 12(sp)

	addi sp, sp, 16
	#-- Punto de salida
fin:
	#-- Terminar	
	ret
