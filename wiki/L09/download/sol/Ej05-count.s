#-- Subrutina para contar el numero de veces que aparece un carácter
#-- int count(*cad, car)
#-- ENTRADAS:
#--    * a0: Puntero a la cadena
#--    * a1: Carácter a contador
#-- SALIDAS:	
#--    * a0: Número de veces que aparece el caracter en la cadena

	#-- Punto de entrada
	.globl count

#-- Punto de entrada
count:

	#-- Inicializar contador de caracter: t0
	li t0, 0

bucle:
	#-- Leer caracter de la cadena (t1)
	lb t1, 0(a0)
	
	#-- Si es '\0' terminar
	li t2, '\n'
	beq t1, t2, fin

	#-- Comprobar si el caracter es a1
	#-- Si NO lo es pasar al siguiente
	bne t1, a1, next
	
	#-- Caracter detectado. Incrementar contador
	addi t0, t0, 1

next:	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir el bucle
	b bucle

fin:

	#-- Devolver el numero de caracteres
	mv a0, t0

	#--- Punto de salida
	ret