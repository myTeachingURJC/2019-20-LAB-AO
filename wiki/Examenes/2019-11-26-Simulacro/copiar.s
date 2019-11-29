#--------------------------------------
#-- SUBRUTINA copiar()
#--
#-- ENTRADAS:
#--    a0: Puntero cadena origen
#--    a1: Puntero cadena destino
#--
#-- DEVUELVE: Nada
#--------------------------------------

	.globl copiar
	
	.text
	
copiar:	

	#--- Es una funcion Hoja: No realiza ninguna llamada a otra subrutina
	#-- No hace falta crear la pila

bucle:

	#--- Leer caracter actual
	lb t0, 0(a0)
	
	#-- Si es \0, terminar
	beq t0, zero, fin
	
	#-- Copiar el caracter a la cadena destino
	sb t0, 0(a1)
	
	#-- Incrementar los punteros
	addi a0, a0, 1
	addi a1, a1, 1
	
	#-- Repetir
	b bucle
	
	
fin:
	#-- Copiar el \0 al final de la cadena destino
	sb zero, 0(a1)
	
	ret