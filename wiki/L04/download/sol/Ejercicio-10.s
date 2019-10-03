##-- Solución al Ejercicio 10
##-- Animacion en el display

	#-- Definiciones. Estos indetificadores nos permiten acceder
	#-- directamente a los elementos de la tabla: E1, E2, E3, E4.....
	.eqv E1 0
	.eqv E2 4
	.eqv E3 8
	.eqv E4 0xC
	.eqv E5 0x10
	.eqv E6 0x14
	.eqv E7 0x18
	.eqv E8 0x1C
	.eqv E9 0x20
	.eqv E10 0x24
	
	#-- Direccion del display
	.eqv DISPLAY 0xFFFF0010
	
	#----------------------- Variables
	.data
	
	#-- Tabla de 4 elementos, inicializados a ciertos valores
tabla:  .word 0x01  #-- E1
	.word 0x02  #-- E2
	.word 0x04  #-- E3
	.word 0x08  #-- E4
	.word 0x10  #-- E5
	.word 0x20  #-- E6
	
	
	#------------------------ Código
	.text
	
	#-- x5 es un puntero a la tabla (x5 contiene la direccion del primer elemento de la tabla)
	la x5, tabla
	
	#-- x6 es el puntero al display
	li x6, DISPLAY
	
	
repetir:
	#-- Leer el primer elmento y sacarlo por el display
	lw x10, E1(x5)
	sw x10, 0(x6)
	
	#-- Leer el segundo elemento y sacarlo por el display
	lw x10, E2(x5)
	sw x10, 0(x6)
	
	#-- Leer el tercer elemento y sacarlo por el display
	lw x10, E3(x5)
	sw x10, 0(x6)
	
	#-- Leer el cuarto elemento y sacarlo por el display
	lw x10, E4(x5)
	sw x10, 0(x6)
	
	lw x10, E5(x5)
	sw x10, 0(x6)
	
	lw x10, E6(x5)
	sw x10, 0(x6)
	
	b repetir
	
	