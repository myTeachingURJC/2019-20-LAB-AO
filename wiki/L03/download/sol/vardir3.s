#-- Inicializa los registros x10-x13 con los valores de 
#-- las variables. En x5 se debe situar la direccion de la variable a 
#-- y usarlo para acceder al resto de variables

	#-- Variables en el seg. de datos
	.data
a:	.word 1
b:	.word 2
c:	.word 3
d:	.word 4

	#-- Segmento de código
	.text
	
	#-- Obtener la direccion de a
	la x5, a
	
	#-- Inicializar los registros
	lw x10, 0(x5)  #-- x10 = a
	lw x11, 4(x5)  #-- x11 = b
	lw x12, 8(x5)  #-- x12 = c
	lw x13, 12(x5)  #-- x13 = d
	
	
	#-- Terminar
	li a7, 10
	ecall
