#------------------------------------------------------------------
#- SUBRUTINA: len(cad)
#-- Calcular la longitud de una cadena
#-- Como final de cadena se usa \0 y \n
#-- ENTRADAS:
#--    a0: Puntero a la cadena
#-- SALIDAS:
#--    a0: Longitud de la cadena
#------------------------------------------------------------------

	.globl len
	
	.text
	
len:

	#-- Es una subrutina hoja: no hace falta guardar la direccion de retorno
	#-- en la pila (ya está en ra)
	
	#-- Usamos t0 como contador de caracteres
	li t0, 0
	
bucle:
	#-- Leer el caracter
	lb t1, 0(a0)
	
	#-- Si es 0 terminar
	beq t1, zero, fin
	
	#-- Si es '\n', terminar
	li t2, '\n'
	beq t1, t2, fin
	
	#-- Es un caracter diferente de 0 y '\n'
	#-- Incrementar el contador de caracteres
	addi t0, t0, 1
	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir
	b bucle

fin:
	#-- Devolver la longitud de la cadena por a0
	mv a0, t0

	ret
	
	
