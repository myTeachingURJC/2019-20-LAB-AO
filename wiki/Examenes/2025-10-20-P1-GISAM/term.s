# Expresion a calcular: c = b - 4a - 3

	.data
	
	# -- Valor almacenado en la primera posicion del segmento de datos
	.word 0xCAFEBACA  #-- ESPECIFICACION
	
	# -- Variables
a:	.word 10   #-- Variable a
    .word 100  #-- Variable b
	.word 0    #-- Variable c

	.text
	
	#-- Registro x1: Direccion de a
	la x1, a
	
	#-- Leer las variables a y b
	#-- x2 = a
	lw x2, 0(x1)
	
	#-- b está 4 bytes más arriba que a
	#--x3 = b
	lw x3, 4(x1)
	
	#-- Calcular la expresion
	#--  c =  b - 4a   - 3
	#-- x9 = x3 - 4*x2 - 3
	#-- Hay que usar x9 por ESPECIFICACIONES
	
	#-- Calculo de 4a
	add x2, x2, x2  #-- 2a
	add x2, x2, x2  #-- 4a
	
	#-- c = b - 4a
	#-- x9 x3  x2
	sub x9, x3, x2
	
	#-- c = (b - 4a) - 3
	addi x9, x9, -3
	
	#-- x9 contiene el resultado final (ESPECIFICACIONES)
	#-- Lo almacenamos en la variable c
	#-- La variable c está 8 bytes por encima de a
	sw x9, 8(x1)
	
	# -- Terminar
	li a7, 10
	ecall
