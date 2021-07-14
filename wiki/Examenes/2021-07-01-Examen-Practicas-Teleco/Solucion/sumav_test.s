# -- Programa sumav_test.s
# -- Prueba de la funcion sumav()
# -- Suma de 3 vectores almacenados en la memoria
# -- El resultado se muestra en la consola


	# -- Constantes
	.eqv EXIT       10
	.eqv PRINT_INT  1 
	.eqv PRINT_CHAR 11

	.data
	
	# -- Array de vectores
vectores:	.word 1, 2   #-- Vector v1: (1,2)
		.word 3, 5   #-- Vector v2: (3,5)
	
	.text
	
	la s0, vectores #-- Puntero a los vectores
	
	# -- Leer el primero
	lw a0, 0(s0)  # u.x
	lw a1, 4(s0)  # u.y
	
	# -- Leer el segundo
	lw a2, 8(s0)  # v.x
	lw a3, 12(s0) # v.y
	
	# -- Realizar la suma
	jal sumav
	
	# -- a0,a1 contienen el resultado
	# -- w = (a0, a1)
	
	# -- Imprimir componente x resultado
	# -- (Esta en a0)
	li a7, PRINT_INT
	ecall
	
	# -- Imprimir una ',' de separacion
	li a0, ','
	li a7, PRINT_CHAR
	ecall
	
	# -- Imprimir componente y del resultado
	# -- (esta en a1, que no se modificado)
	mv a0, a1
	li a7, PRINT_INT
	ecall
	
	# -- Terminar
	li a7, EXIT
	ecall
	
	
