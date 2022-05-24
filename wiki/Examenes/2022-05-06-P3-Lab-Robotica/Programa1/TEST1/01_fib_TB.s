#------------------------------------------------
#-- Funcion de fibonacci
#-- ENTRADA:
#--   a0:  Termino a calcular (n > 1)
#--
#-- SALIDA:
#--   a0: Termino de fibonacci pedido fib(n)
#------------------------------------------------

	.include "system.h"
	.include "test.h"

  .globl fib
	.text
	
fib:
	#-- Meter en t6 el termino a calcular
	mv t6, a0  
	
	#-- El registro t5 se usa para indicar el numero del termino 
	#-- de fibonacci actual (n)
	li t5, 1  #-- Termino final a calcular
	
	
	#-- Los registros t0 y t1 contienen fib(n) y fib(n+1)
	li t0, 0
	li t1, 1

bucle:		
	#-- Comprobar si hemos calculado el termino pedido
	beq t5,t6, fin
	
	#-- Calcular el siguiente termino: t2 = t1 + t0
	add t2, t1, t0
	
	#-- Actualizar los valores recordados
	mv t0, t1   #-- t0 = t1 (termino anterior)
	mv t1, t2   #-- t1 = t2 (nuevo termino)
	
	#-- Incrementar el termino actual
	addi t5, t5, 1
	
	#-- Repetir bucle
	b bucle
	
	
	#-- Devolver el numero de fibonacci
	#-- calculado
fin:
	mv a0, t2

  #-- Modificar todos los registros temporales y de argumentos
	#-- ... salvo a0
	init_temp_regs_noa0
	
	ret
	