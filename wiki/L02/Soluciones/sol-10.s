#-- Programa en ensamblador para calcular la expresion:
#-- f = (d - c) + 15 - (a + b)
#-- Probarlos con las siguientes secuencias de valores:
#-- a=1,2,3,4,5...
#-- b=2,3,4,5,6..
#-- c=3,4,5,6,7..
#-- d=4,5,6,7,8..
	
	.text
	
	#--- Inicializacion
	addi x5,x0,1  #-- x5 = a
	addi x6,x0,2  #-- x6 = b
	addi x7,x0,3  #-- x7 = c
	addi x8,x0,4  #-- x8 = d
	 
bucle:	 
	#-- calcular la expresion 
	sub x11, x8, x7  #-- x11 = (d - c)
	addi x11,x11,15  #-- x11 = (d - c) + 15
	add x12,x5,x6    #-- x12 = (a + b)
	sub x13, x11,x12 #-- x13 = (d - c) + 15 - (a + b)
	
	nop  #-- No hace nada. Se usa para poner aqui el Breakpoint
	
	#-- Incrementar x5,x6,x7 y x8
	addi x5,x5,1  #-- a = a+1
	addi x6,x6,1  #-- b = b+1
	addi x7,x7,1  #-- c = c+1
	addi x8,x8,1  #-- d = d+1
	
	#-- Repetir. Siguiente iteraccion
	b bucle
	