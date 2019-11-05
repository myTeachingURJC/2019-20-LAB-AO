#-- Subrutina de calculo de la longitud de una cadena
#-- int len(*cad)
#-- ENTRADAS:
#--    * a0: Puntero a la cadena
#-- SALIDAS:	
#--    * a0: Longitud de la cadena

	#-- Punto de entrada
	.globl len

#-- Punto de entrada
len:

	#-- Inicializar contador de caracteres: t0
	li t0, 0

bucle:
	#-- Leer caracter de la cadena (t1)
	lb t1, 0(a0)
	
	#-- Si es '\0' terminar
	li t2, '\n'
	beq t1, t2, fin

	#-- Incrementar contador de caracteres
	addi t0, t0, 1
	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir el bucle
	b bucle

fin:

	#-- Devolver el numero de caracteres
	mv a0, t0

	#--- Punto de salida
	ret