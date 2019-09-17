#-- Programa para calcular la expresion:
#-- f = (a + b) - c + d + 50
#-- Suponemos lo siguiente:
#-- x5 = a,  x6 = b, x7 = c, x8 = d
#-- El resultado final se guarda en x10

	.text
	
	
	#--- Dar un valor a las variables (puede ser cualquiera)
	#-- para comprobar que el cálculo funciona
	addi x5, x0, 1
	addi x6, x0, 2
	addi x7, x0, 3
	addi x8, x0, 4
	
	
	#----- Codigo para calcular la expresion generica
	#----  x10 = (x5 + x6) - x7 + x8 + 50
	
	#-- Calculamos f = (a + b)
	add x10, x5, x6
	
	#-- Calculamos (-c + d). Lo almacenamos por ejemplo en x9
	sub x9, x8, x7   #  x9 = d - c
	
	#-- Calculamos (-c + d + 50)
	addi x9, x9, 50
	
	#-- Calculamos la expresion final: (a + b) + (-c + d + 50)
	add x10, x10, x9

	#-- Terminar
	li a7, 10
	ecall