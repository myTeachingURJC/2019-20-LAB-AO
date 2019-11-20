#----------------------------------------------
#-- Subrutina mult2(num)
#--   Multiplicar el numero por dos
#-- ENTRADA: 
#--    * a0: numero a multiplicar por dos
#-- SALIDA:
#--    * a0: Numero multiplicado por dos
#-------------------------------------------------


	#-- Punto de entrada
	.globl mult2
	
	.text
mult2:
	#-- Multiplicar por dos num es calcular num + num
	add a0, a0, a0
	
	ret