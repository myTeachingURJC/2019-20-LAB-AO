#--------------------------------------------
#-- SUBRUTINA
#
#-- ENTRADAS:
#--  a0: variable a
#--  a1: variable b
#--  a2: varibale c
#--
#-- SALIDA:
#--   a0: Resultado de evaluar la expresion a + b + c - 1
#--------------------------------------------

	.globl evaluar

	.text 
	
evaluar:
	
	#-- t0 = a0 + a1
	add t0, a0, a1
	
	#-- t1 = a2 - 1
	addi t1, a2, -1
test:	
	#-- t2 = a0 + a1 + a2 - 1
	add t2, t0, t1
	
	#-- El resultdo lo devolvemos por a0
	mv a0, t2
	
	ret
	
