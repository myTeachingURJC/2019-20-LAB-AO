#-------------------------------------------
#-- Funcion skip(cad, car)
#--
#-- Saltar el caracter car inicial en la cadena cad. Devuelve
#-- el puntero al primer caracter diferente de car
#--
#-- ENTRADAS:
#--  a0 (cad): Puntero a la cadena
#--  a1 (car): Caracter a saltar
#--
#-- DEVUELVE:
#--   a0: Direccion de la subcadena que comienza con un caracter
#--       diferente a car
#--
#----------------------------------------------------------------------
	
	.globl skip
	.text
	
skip:
	#--- Recorrer cadena. Si puntero diferetnte de espacio se retorna
bucle:
	#-- Leer caracter
	lb t0, 0(a0)
	
	#-- Comprobar si es el caracter indicado en a1
	#-- Si es distinto se termina
	li a1, ' '
	bne t0, a1, fin   
			
	#-- Es el caracter a saltar: Incrementar puntero
	addi a0,a0, 1
	
	#-- Analizar el siguiente caracter de la cadena
	b bucle
	
fin:

	#-- Retornar
	#-- Devolver el puntero en a0
	ret
	