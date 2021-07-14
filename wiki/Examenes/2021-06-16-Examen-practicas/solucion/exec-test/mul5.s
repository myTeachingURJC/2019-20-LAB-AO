#-----------------------------------------------------------------
#-- Funcion mul5(x): Multiplicar x por 5 y devolver su valor  
#-  Entradas: x: Número a multiplicar por 5
#-  Salidas: x*5
#-----------------------------------------------------------------

	.globl mul5
	
	# ---- ESTA FUNCION NO SE PUEDE MODIFICAR
	# ---- DEBES DEJARLA TAL CUAL
	
mul5:
	li t0, 5
	mul a0, a0, t0
	
	ret
	