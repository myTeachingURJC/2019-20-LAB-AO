#-- Cargar las direcciones de las
#-- variables en los registros x5-x8
#-- Inicializa los registros x10-x13 con los valores de 
#-- las variables 

	#-- Variables en el seg. de datos
	.data
a:	.word 1
b:	.word 2
c:	.word 3
d:	.word 4

	#-- Segmento de código
	.text
	
	#-- Obtener las direcciones
	la x5, a
	la x6, b
	la x7, c
	la x8, d
	
	#-- Inicializar los registros
	lw x10, 0(x5)  #-- x10 = a
	lw x11, 0(x6)  #-- x11 = b
	lw x12, 0(x7)  #-- x12 = c
	lw x13, 0(x8)  #-- x13 = d
	
	
	#-- Terminar
	li a7, 10
	ecall
