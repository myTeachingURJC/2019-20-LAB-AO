#------------------------
# int fib(a,b): Devolver el siguiente numero de fibonacci, suponiendo que a y b son numeros de fibonacci  
# Entradas:
#   a: Numero de fibonacci n
#   b: Numero de fibonacci siguiente a n
# Salidas:
#   Numero de fibonacci siguiente a b  (a+b)
#---------------------------------------------

	.globl fib

fib:
	#-- Asumimos que a0 y a1 son numeros de fibonacci consecutivos
	#-- (ESPECIFICACION DEL ENUNCIADO)
	#-- El siguiente numero de fibonacci será a0 + a1
	#-- El resultado hay que devolverlo por a0
	add a0, a0, a1
	
	ret
	
	
	
