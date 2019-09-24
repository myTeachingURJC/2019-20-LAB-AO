#-- Ejemplo de lectura de una variable
#-- almacenada en memoria
#-- Por defecto, si no nos dicen lo contrario, siempre
#-- usaremos variables de 32 bits (palabras)

	.data

	#-- Variable, inicializada a un valor		
var1:	.word 0xCAFEBACA
	
	.text

	#-- Leer la direccion de la variable en x5
	#-- x5 = Direccion de var1
	la x5, var1
	
	#-- Leer la variable en el registro x6
	lw x6, 0(x5)   #-- Accede a la direccion x5 + 0
	
	#-- Terminar
	li a7, 10
	ecall
