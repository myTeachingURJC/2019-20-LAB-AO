#-- Ejemplo de suma de las variables a y b, 
#-- situadas en memoria

	.data

	#-- Variables	
a:	.word 20
b:      .word 30
	
	.text

	#-- Leer la variable a en el registro x10
	la x5, a  #-- Para acceder a la variable necesitamos su direccion
	lw x10, 0(x5)  #-- x10 = a
	
	#-- Leer la variable b en el registro x11
	la x5, b #-- Necesitamos la direccion de b
	lw x11, 0(x5) #-- x11 = b
	
	#-- Ahora ya podemos hacer la suma. La depositamos en x12
	add x12, x10, x11  #-- x12 = a + b
	
	#-- Terminar
	li a7, 10
	ecall
