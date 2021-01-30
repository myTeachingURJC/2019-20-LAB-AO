#------------------------------
#- Funcion max(a,b): Calcular el valor máximo de dos números enteros  
#-
#- Entradas:
#-  a0: Número entero a
#-  a1: Número entero b
#-
#- Salidas:
#-  a0: Valor máximo (a,b)
#-------------------------------------


	.globl max

	.include "system.h"
	.include "test.h"
	
	.text

	#-- Cambiar los valores de todos los registros temporales
	#-- menos a0 y a1
	init_temp_regs_noa0a1 
max:
	#-- Si a0 > a1, devolver a0
	bgt a0, a1, max_a0
	
	#-- El valor maximo esta en a1
	#-- Lo movemos a a0 para devolverlo
	mv a0, a1
	
max_a0:
	
	ret
	
