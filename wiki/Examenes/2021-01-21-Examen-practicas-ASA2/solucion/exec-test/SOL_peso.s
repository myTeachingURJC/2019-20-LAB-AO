#-------------------------
#-- Funcion Peso(cad): Calcular la suma de los codigos ascii de los caracteres de la cadena
#--
#-- Entradas:
#--  a0: Puntero a la cadena de texto
#--
#-- Salidas:
#--  a0: Devolver el valor calculado
#----------------------------------------
	
	.globl peso
	
	.text
	
	
	#-- Se trata de una funcion hoja, por lo 
	#-- que no es necesario crear la pila para 
	#-- guardar la direccion de retorno
	
peso:

	#-- Peso inicial: 0
	li t0, 0

bucle:	
	#-- Leer el siguiente caracter de la cadena
	lb t1, 0(a0)
	
	#-- Si es 0, terminar
	beq t1, zero, fin
	
	#-- Si es \n terminar
	li t2, '\n'
	beq t1, t2, fin
	
	#-- Sumar el valor actual del caracter al contador de peso
	add t0, t0, t1
	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	b bucle
	
fin:    #-- Devolver el peso
	mv a0, t0

	ret
	
	
	