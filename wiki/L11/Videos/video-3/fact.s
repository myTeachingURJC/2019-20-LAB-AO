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

	#-- Si a0 > 1 estamos en el caso general
	li t0, 1   #---- fact
	bgt a0, t0, fact_rec
	
	#-- Caso terminal. fact(1)
	
	#-- Imprimir mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#--- El factorial de 1 es 1
	li a0,1
	
	#-- Imprimir a0
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	b fin

	#-- Caso general 
fact_rec:	

	#-- Necesitamos crear la pila para guardar la direccion de retorno
	addi sp, sp, -16
	sw ra, 12(sp)
	
	#-- Guardar n en la pila
	sw a0, 8(sp)
	
	#-- calcular fact(n-1)
	addi a0, a0, -1
	jal fact
	
	#-- a0 = fact(n-1)
	
	#--- Calcular n * fact(n-1)
	lw t0, 8(sp)
	mul t1, t0, a0	
	
	#-- Imprimir mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir n
	mv a0, t0
	li a7, PRINT_INT
	ecall						
		
	#--- Colocar en a0 el resultado a devolver
	mv a0, t1
			
				
	#-- Recuperar direccion de retorno			
	lw ra, 12(sp)
	
	#-- Liberar el espacio ocupado por esta pila
	addi sp, sp, 16			
fin:
	#-- Terminar	
	ret
