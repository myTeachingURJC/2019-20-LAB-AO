#-----------------------------------------------------
#-- Funcion: cifrar(pcad, k)
#--
#-- Cifrar la cadena apuntada por pcad usando la clave k
#--
#-- ENTRADAS:
#--  a0: Puntero a la cadena
#--  a1: clave k
#-- SALIDAS: Ninguna
#----------------------------------------------------

	#-- Punto de entrada
	.globl cifrar
	
	.text
cifrar:	
bucle:
	#-- Leer caracter
	lb t0, 0(a0)
	
	#-- Si es '\n' hemos terminado
	li t1, '\n'
	beq t0, t1, fin
	
	#-- Sumar la clave
	add t0, t0, a1
	
	#-- Guardar el caracter cifrado
	sb t0, 0(a0)
	
	#-- Pasar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir
	b bucle
	
fin:
	
	#-- Terminar
	ret
	
	