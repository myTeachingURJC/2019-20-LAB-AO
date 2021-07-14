# -- tests_fib.s

	.include "so.s"
	
	.eqv N  10
	.eqv N0 0
	.eqv N1 1
	
	.text
	
	

	# -- Contador de terminos de la serie de fibonacci
	# -- sin contar los dos primeros (0, 1)
	li s2, N
	
	# -- valores iniciales de la secuencia de fibonacci
	# -- Estos valores NO se imprimen. Se usan para calcular
	# -- el siguiente trrmino
	li s0, 0
	li s1, 1
	
bucle: 
	# -- Comprobar si quedan terminos por calcular
	# -- Si no quedan, terminar
        beq s2, zero, fin
        
        # -- Queda un término menos
        addi s2, s2, -1
        
        # -- Asignar los valores actuales
        # -- para calcular el siguiente termino de fibonacci
        mv a0, s0
        mv a1, s1
	jal fib
	
	#-- a0 contiene el siguiente numero de fibonacci
	
	# -- Actualizar los terminos de fibonacci actuales
	mv s0, s1
	mv s1, a0
	
	#-- Imprimir nuevo termino
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir un espacio de separacion
	li a0, ' '
	li a7, PRINT_CHAR
	ecall
	
	# -- Repetir bucle
	b bucle
	
	
fin:
	# -- Terminar
	li a7, EXIT
	ecall
	
	
