##-- Solución al Ejercicio 2
##-- Código comentado, para entenderlo mejor

	#-- Definiciones. Estos indetificadores nos permiten acceder
	#-- directamente a los elementos de la tabla: E1, E2, E3 y E4
	.eqv E1 0
	.eqv E2 4
	.eqv E3 8
	.eqv E4 0xC
	
	#----------------------- Variables
	.data
	
	#-- Tabla de 4 elementos, inicializados a ciertos valores
tabla:	.word 0xBEBECAFE, 0xFACEB00C, 0x00FABADA, 0xCACABACA
	
	
	#------------------------ Código
	.text
	
	#-- x5 es un puntero a la tabla (x5 contiene la direccion del primer elemento de la tabla)
	la x5, tabla
	
	#-- x10 = Elemento E1
	lw x10, E1(x5)
	
	#-- x11 = Elemento E2
	lw x11, E2(x5)
	
	#-- x12 = Elemento E3
	lw x12, E3(x5)
	
	#-- x13 = Elemento E4
	lw x13, E4(x5)
	
	#-- Terminar
	li a7, 10
	ecall