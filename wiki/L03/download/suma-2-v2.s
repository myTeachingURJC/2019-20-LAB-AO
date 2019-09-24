#-- Ejemplo de suma de las variables a y b, 
#-- situadas en memoria. Version 2

	.data

	#-- Variables	
a:	.word 20
b:      .word 30
	
	.text

	#-- Leer la direccion de acceso a las variables
	#-- la variable a estará en 0(x5) y la b en 4(x5)
	la x5, a  
	
	#-- Leer la variable a
	lw x10, 0(x5)  #-- x10 = a
	
	#-- Leer la variable b
	lw x11, 4(x5)  #-- x11 = b
	
	#-- Ahora ya podemos hacer la suma. La depositamos en x12
	add x12, x10, x11  #-- x12 = a + b
	
	#-- Terminar
	li a7, 10
	ecall
