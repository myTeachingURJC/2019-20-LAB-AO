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

	.text

	#-- Se trata de una funcion Hoja, por lo que
	#-- no hay que crear pila para guardar lal direccion
	#-- de retorno
max:
	#-- Si a0 > a1, devolver a0
	bgt a0, a1, max_a0
	
	#-- El valor maximo esta en a1
	#-- Lo movemos a a0 para devolverlo
	mv a0, a1
	
max_a0:
	ret
	
