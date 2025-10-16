# -- Calcular la expresion: f=2a + b -4
# -- Evaluarla para los valores a=10, b=20

	.data
a:	.word 10   #-- Variable a: primera posicion (ESPECIFICACION)
	.word 20   #-- Variable b: segunda posicion (ESPECIFICACION)
	.word 0    #-- Variable c: tercera posicion (ESPECIFICACION)
	
	.text
	
	#-- f   = 2a  +  b - 4
	#-- x10 = 2x5 + x6 - 4
	
	#------- Lectura de la variable a
	#-- x5 = a
	#-- Obtener la direccion de a
	la x1, a
	
	#-- Leer a
	lw x5, 0(x1)
	
	#------- Lectura de la variable b
	#-- x6 = b
	lw x6, 4(x1)
	
	#-- Evaluacion de la funcion
	#-- x10 = 2x5 (f=2a)
	add x10, x5, x5
	
	#-- f = (2a) + b
	add x10, x10, x6
	
	#-- f = (2a + b) - 4
	addi x10, x10, -4
	
	#--- Almacenamiento de la variable f en memoria
	sw x10, 8(x1)

	#-- Terminar
	li a7, 10
	ecall	

    