#-- Ejemplo de suma de las variables a y b, 
#-- situadas en memoria. El resultado se 
#-- deposita también en memoria

	.data

	#-- Variables	
a:	.word 20
b:      .word 30
suma:   .word 0   
	
	.text

	#-- Leer la direccion de acceso a las variables
	#-- la variable a estará en 0(x5), la b en 4(x5)
	#-- y suma en 8(x5)
	la x5, a  
	
	#-- Leer la variable a
	lw x10, 0(x5)  #-- x10 = a
	
	#-- Leer la variable b
	lw x11, 4(x5)  #-- x11 = b
	
	#-- Hacer la suma y dejar el resutlado en x12
	add x12, x10, x11  #-- x12 = a + b
	
	#-- llevar el resultado a la variable suma
	sw x12, 8(x5)
	
	#-- Terminar
	li a7, 10
	ecall
