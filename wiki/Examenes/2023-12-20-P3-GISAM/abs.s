#---------------------------------------
#-- Funcion abs(n)
#-- Devolver el valor absoluto de n
#--
#-- ENTRADA:
#--   a0: (n): Numero entero (positivo o negativo)
#-- SALIDA:
#--   a0: abs(n): Valor absoluto de n
#--------------------------------------------------

	.globl abs

	.text
abs:

	#-- Si el numero es mayor que cero, hemos terminado
	bgt a0, zero, fin
	
	#-- En el resto de casos hay que cambiar el signo de a0
	#-- a0 = 0 - a0
	sub a0, zero, a0
	
fin:
	ret
	
