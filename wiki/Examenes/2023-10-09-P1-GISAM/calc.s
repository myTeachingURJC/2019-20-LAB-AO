#-- Calcular la expresion f = 2a + b - 1
#-- a y b son variables en memoria, inicializadas a 10 y 20 (a=10, b=20)
#-- Resultado en x10

	.data
a:	.word 10  #-- Variable a inicializada
b:	.word 20  #-- Variable b inicializada

	.text
	
	#-- Asignacion de registros a variables
	#-- f  = 2a  + b - 1
	#--x10 = 2x5 + x6 -1
	
	#-- Leer las variables de memoria y llevarlas a los registros
	la x11,a  #-- x11: Direccion de la variable a
	lw x5, 0(x11)  #--- x5 = a
	lw x5, 4(x11)  #--- x6 = b
	
	#-- Evaluar la expresion
	#-- En x10 metemos los resultados intermedios
	add x10, x5,x5    #-- x10 = 2a
	add x10, x10, x6  #-- x10 = (2a) + b
	addi x10, x10, -1 #-- x10 = (2a + b) - 1
	
	#-- En x10 tenemos el resultado final (que debe ser 39)
	
	# BONUS:  Escribir resultado en posición de memoria 0x1001000C
	# Programa completo tiene que tener menos de 11 instrucciones
	sw x10, 12(x11)
	
	#-- Terminar
	li a7, 10
	ecall

    