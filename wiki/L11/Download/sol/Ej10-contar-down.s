#---------------------------------------------------------------------------------------
#-- Subrutina contar_down(n)
#-- Contar desde n hasta 1, usando un algoritmo recursivo
#-- La cuenta actual se saca por la consola y por el display de 7 segmentos derecho
#-- (Para poder verlo, poner la velocidad de simulación a 30 instr/sec)
#--
#-- ENTRADAS:
#--  a0:  Numero desde el que contar
#-- SALIDAS:
#--  Ninguna
#---------------------------------------------------------------------------------------

#----------------------
#def contar_down(n): 
#  print(n) 
#  print_display(n)
#   if n > 1: 
#     contar_down (n-1)
#

	.globl contar_down
	
	.include "servicios.asm"
	
	.text
contar_down:
	#-- Crear la pila
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)

        #-- Imprimir numero actual
	#-- En la consola
	li a7, PRINT_INT
	ecall
	
	#-- Guardar n en la pila
	sw a0, 0(sp)
	#-- Sacar número actual en el display de 7 segmentos derecho
	jal print_display


        #-- Recuperar n de la pila
        lw a0, 0(sp)

	#-- Si la cuenta es desde 1
	li t0, 1
	bne a0, t0, contar_rec
	
	#-- Terminar. No mas llamadas recursivas
	b fin
	
	
contar_rec:

	#-- Contar desde n-1
	addi a0, a0, -1
	
	jal contar_down

	
fin:			
	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	
	#-- Liberar la pila
	addi sp, sp, 16

	ret