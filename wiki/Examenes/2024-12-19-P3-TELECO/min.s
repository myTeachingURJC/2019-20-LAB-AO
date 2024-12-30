#----------------------------------------------------------------
#-- Funcion min(n1, n2): Calcular el valor mínimo entre n1 y n2
#-------------------------------
#-- ENTRADAS:
#--    * n1 (a0): Primer numero
#--    * n2 (a1): Segundo numero
#-- SALIDAS:
#--    * Numero minimo (a0)
#----------------------------------------------------------------

	.globl min
	
	.text

min:

	#-- Si n1 < n2, min(n1,n2)=n1
	blt a0,a1, fin

	#-- n2 >= n1, min(n1,n2)=n2
	mv a0,a1

fin:
	ret
	
