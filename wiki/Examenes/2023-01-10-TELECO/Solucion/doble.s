#----------------------------------------------------------------
#-- Funcion doble(n): Calcula el doble del numero recibido
#-------------------------------
#-- ENTRADAS:
#--    * a0:  Numero a doblar
#-- SALIDAS:
#--    * a0: Numero doble (2 * a0)
#----------------------------------------------------------------

	.globl doble
	
	.text

doble:

	#-- Es una función hoja, por lo que no hay que guardar la direccion
	#-- de retorno en la pila
	add a0, a0, a0

	ret
	
