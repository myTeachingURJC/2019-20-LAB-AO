#-- Fichero con la subrutina e incremento
		
	#-- Hacer accesible el punto de entrada
	#-- incrementar desde otro ficheros	
	.globl incrementar	
	
	#-- La funcion se encuentra en el segmento de texto
	.text
#--------------------------------------------
#-- Funcion de incremento:
#--   Entradas: a0: numero a incrementar
#-- Salidas:
#--   a0: Numero incrementado
#--------------------------------------------
incrementar:

	#-- Incrementar a0
	addi a0, a0, 1
	
	#-- Retornar
	ret
	
