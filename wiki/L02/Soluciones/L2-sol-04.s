# Sesion L2
## Programa para calcular la expresion: 
##  f = (a + b + c) - [(d - a) + (e + 3) - 30]
##  Valores iniciales de prueba: a=2, b=4, c=6, d=8, e=10

	.text
	
	#-- Valores iniciales
	addi x5,x0,2  #-- x5 = a = 2
	addi x6,x0,4  #-- x6 = b = 4
	addi x7,x0,6  #-- x7 = c = 6
	addi x8,x0,8  #-- x8 = d = 8
	addi x9,x0,10 #-- x9 = e = 10
	
	#-- Calcular la expresion. Resultado en X10
	add x11, x5, x6  #-- x11 = a + b
	add x11, x11,x7  #-- x11 = (a + b + c)
	sub x12, x8, x5  #-- x12 = (d - a)
	addi x13, x9, 3 #-- x13 = (e + 3)
	addi x14, x13, -30  #-- x14 = (e + 3) - 30
	add x15, x12, x14   #-- x15 = [(d - a) + (e + 3) - 30]
	
	#-- Resultado final
	sub x10, x11, x15    #-- x10 =   (a + b + c) - [(d - a) + (e + 3) - 30]
	
	#-- Terminar
	li a7, 10
	ecall
