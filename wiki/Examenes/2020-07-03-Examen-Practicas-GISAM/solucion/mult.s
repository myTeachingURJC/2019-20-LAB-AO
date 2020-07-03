
	.text
	
	.globl mult
	
	
# -----------------------------------------------------
# --- Funcion mult(a,b): Calcular a * b
# -- Entradas:
#--  a0: Primero operando  
#--  a1: Segundo operando
#-- Salidas
#--   a0: a*b
#-------------------------------------------------------  	
mult:

	#-- Se trata de una funcion hoja, por lo que no es necesario
	#-- crear la pila para almacenar la direccion de retorno
	
	# -- El resultado de la multiplicacion se calcula
	# -- en el registro temporal t0
	li t0, 0
	
	# -- Se utiliza un bucle para realizar a0 veces la operación
	# -- t0 = t0 + a1
bucle:	
	#--- Si a0 = 0, terminar
	beq a0, zero, fin
	
	# -- Calcular t0 = t0 + a1
	add t0, t0, a1
	
	#-- Decremebtar a0
	addi a0, a0, -1
	
	b bucle
		
fin:	
	#-- Devolver el resultado
	mv a0, t0
	ret