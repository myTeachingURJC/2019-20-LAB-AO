##-- Solución al Ejercicio 3
##-- Incrementar cada uno de los elmementos de la tabla en INC unnidades

	#-- Definiciones. Estos indetificadores nos permiten acceder
	#-- directamente a los elementos de la tabla: E1, E2, E3 y E4
	.eqv E1 0
	.eqv E2 4
	.eqv E3 8
	.eqv E4 0xC
	
	#-- Incremento: Valor a incrementar TODOS los elementos de la tabla
	.eqv INC 1
	
	#----------------------- Variables
	.data
	
	#-- Tabla de 4 elementos, inicializados a ciertos valores
tabla:	.word 0xBEBECAFE, 0xFACEB00C, 0x00FABADA, 0xCACABACA
	
	
	#------------------------ Código
	.text
	
	#-- x5 es un puntero a la tabla (x5 contiene la direccion del primer elemento de la tabla)
	la x5, tabla
	
	#-- Leer todos los elementos de la tabla, y situarlos en los registros x10, x11, x12 y x13
	lw x10, E1(x5)
	lw x11, E2(x5)
	lw x12, E3(x5)
	lw x13, E4(x5)
	
	#-- Incrementar los registros en INC unidades
	addi x10, x10, INC
	addi x11, x11, INC
	addi x12, x12, INC
	addi x13, x13, INC
	
	#-- Actualizar la tabla con los nuevos valores
	sw x10, E1(x5)
	sw x11, E2(x5)
	sw x12, E3(x5)
	sw x13, E4(x5)
	
	#-- Terminar
	li a7, 10
	ecall