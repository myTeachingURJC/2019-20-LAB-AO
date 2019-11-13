#-----------------------------------------------------
#-- Funcion: concat(pcad1, pcad2)
#--
#-- Concatenar la cadena 2 a la 1
#--
#-- ENTRADAS:
#--  a0: Puntero a la cadena 1
#--  a1: Puntero a la cadena 2
#-- SALIDAS: Ninguna
#----------------------------------------------------

	#-- Punto de entrada
	.globl concat
	
	.text
concat:	

	#--Ir al final de la cadena 1
	
bucle:	
	li t1, '\n'
	lb t0, 0(a0)
	
	#-- Si llegamos al caracter '\n' hemos terminado
	beq t0, t1, copiar
	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir
	b bucle
	
	#-- Copiar la cadena 2 a continuacion de la 1
copiar:	
	#-- Leer caracter de cadena 2
	lb t1, 0(a1)
	
	#-- Copiarlo en la cadena 1
	sb t1, 0(a0)
	
	#-- Si es el caracter \0 terminar
	beq t1, zero, fin
	
	#-- Incrementar los punteros
	addi a0, a0, 1
	addi a1, a1, 1
	
	#-- Repetir
	b copiar
	
fin:
	#-- Terminar
	ret