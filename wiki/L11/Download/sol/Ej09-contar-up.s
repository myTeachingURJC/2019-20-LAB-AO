#---------------------------------------------------------------------------------------
#-- Subrutina contar-up(n)
#-- Contar desde 1 hasta n, usando un algoritmo recursivo
#-- La cuenta actual se saca por la consola y por el display de 7 segmentos derecho
#-- (Para poder verlo, poner la velocidad de simulación a 30 instr/sec)
#--
#-- ENTRADAS:
#--  a0:  Numero hasta el que contar
#-- SALIDAS:
#--  Ninguna
#---------------------------------------------------------------------------------------


	.globl contar_up
	
	.include "servicios.asm"
	
	.text
contar_up:
	#-- Crear la pila
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)

	#-- Si la cuenta es hasta 1
	li t0, 1
	bne a0, t0, contar_rec
	
	#-- Terminar. No mas llamadas recursivas
	b fin
	
	
contar_rec:

	#-- Guardar a0 en la pila
	sw a0, 0(sp)

	#-- Contar hasta n-1
	addi a0, a0, -1
	
	jal contar_up
	
	#-- Recuperar a0 de la pila
	lw a0, 0(sp)
	
fin:	

	#-- Imprimir numero actual
	#-- En la consola
	li a7, PRINT_INT
	ecall
	
	#-- Sacar número actual en el display de 7 segmentos derecho
	jal print_display
	
	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	
	#-- Liberar la pila
	addi sp, sp, 16

	ret