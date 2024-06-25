#---------------------------------------
#-- Funcion trunc(n)
#-- Truncar el valor positivo n a 255. Se devuelve el siguiente valor:
#--    * n, si n < 255
#--    * 255, si n >= 255
#--
#-- ENTRADA:
#--   a0: (n): Numero positivo a truncar
#-- SALIDA:
#--   a0: trunc255(n): Valor truncado
#--------------------------------------------------

	.globl trunc255

	.text

trunc255:

	#-- Meter en t0 el valor para truncar
	li t0, 255

	#-- Si el numero es menor a 255...
	#-- devolver el mismo numero (no hacer nada)
	blt a0, t0, fin

	#-- El numero es >= 255: hay que devolver 255
	mv a0, t0

	#-- Hemos acabado. Devolver lo que haya en a0
fin:
	ret
	
