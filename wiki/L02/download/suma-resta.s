#-- Programa para calcular la serie infinita de los enteros con signos
#-- alternados: 1 - 2 + 3 - 4 + 5 -...
#-- El resultado se deja en el registros 6
#-- Usamos el registro x5 como contador: 1,2,3,4,5,6...
#-- En cada vuelta sumamos el valor de x5 y restamos x5+1 a la cuenta acumulada en x6

	.text

	#-- Inicializamos los registros x5,x6 a 0
	addi x5, x0, 0
	addi x6, x0, 0
	
	#-- Bucle principal
bucle:
	#-- Incrementar contador principal
	addi x5, x5, 1   #-- x5 = x5 + 1
	
	#-- Sumar resultado acumulado
	add x6, x6, x5  #-- x6 = x6 + x5
	
	#-- Incrementar x5 de nuevo
	addi x5, x5, 1  #-- x5 = x5 + 1
	
	#-- Restar al resultado acumulado
	sub x6, x6, x5
	
	#-- Repetir el bucle
	j bucle

