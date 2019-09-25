#-- Programa para calcular la expresion f = (a + b + c) - (d - 3)


	#-- Variables
	.data
	
a:	.word -5
b: 	.word 2
c:	.word 30
d:	.word 5
f:	.word 0

	#-- Segmento de código
	.text
	
	#-- Para calcular la expresion usaremos los sig. registros:
	#-- x5 = a
	#-- x6 = b
	#-- x7 = c
	#-- x8 = d
	#-- x12 = f
	
	#-- Leer las variables y las situamos en los registros
	la x4, a  #-- Usamos x4 como puntero para acceder a las varaibles
	lw x5, 0(x4)  #-- x5 = a
	lw x6, 4(x4)  #-- x6 = b
	lw x7, 8(x4)  #-- x7 = c
	lw x8, 12(x4) #-- x8 = d
	
	#-------------- Calcular la expresión
	add x9, x5, x6  #-- x9 = a + b
	add x9, x9, x7  #-- x9 = a + b + c
	addi x10, x8, -3  #-- x10 = d - 3
	sub x12, x9, x10  #-- x12 = (a + b + c) - (d - 3)
	
	#-- Almacenar el resultado en f
	sw x12, 16(x4)  #-- f = (a + b + c) - (d - 3)
	
	#-- Terminar
	li a7, 10
	ecall
	

	
	