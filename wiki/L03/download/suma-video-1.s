#--- Suma de dos variables en memoria

	.data
v1:	.word 1
v2:	.word 2
v3:	.word 0

	.text
	
	#--- Punteros de acceso a las variables
	la x5, v1
	la x6, v2
	la x7, v3
	
	#--- Lectura de v1 y v2
	lw x10, 0(x5) 
	lw x11, 0(x6)
	
	#-- Suma de v1 + v2
	add x12, x10, x11
	
	#-- Almacenar el resultado
	sw x12, 0(x7)
	
	#-- Terminar
	li a7, 10
	ecall
	
	