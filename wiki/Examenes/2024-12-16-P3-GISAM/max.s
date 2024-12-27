#----------------------------------------------------------------
#-- Funcion max(n1, n2): Calcular el valor maximo entre n1 y n2
#-------------------------------
#-- ENTRADAS:
#--    * n1 (a0): Primer numero
#--    * n2 (a1): Segundo numero
#-- SALIDAS:
#--    * Numero maximo (a0)
#----------------------------------------------------------------

	.globl max
	
	.text

max:

	#-- Si n1 > n2, max(n1,n2)=n1
	bgt a0,a1, fin

	#-- n2 >= n1, max(n1,n2)=n2
	mv a0,a1

fin:
	ret
	
