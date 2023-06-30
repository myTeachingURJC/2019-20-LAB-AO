#-------------------------------------------
#-- Funcion skip_spaces(cad)
#--
#-- Saltar los espacios iniciales de la cadena nada
#-- Se debe implementar llamando a la funcion skip()
#--
#-- ENTRADAS:
#--  a0 (cad): Puntero a la cadena
#--
#-- DEVUELVE:
#--   a0: Direccion de la subcadena que no tiene espacios
#--       iniciales
#--
#----------------------------------------------------------------------
	
	.globl skip_spaces

	.text
	
skip_spaces:
	#-- Es una funcion intermedia
	#-- Hay que guardar la direccion de retorno en la pila
	addi sp,sp,-16
	sw ra, 12(sp)
	
	#-- llamar a la funcion skip pasando como argumento un espacio
	li a1, ' ' 
	jal skip
	
	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	
	#-- Recuperar la pila
	addi sp,sp,16
	ret