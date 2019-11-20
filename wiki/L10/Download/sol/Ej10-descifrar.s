#-----------------------------------------------------
#-- Funcion: descifrar(pcad, k)
#--
#-- desCifrar la cadena apuntada por pcad usando la clave k
#-- Para descifrar hay que llamar a la funcio de cifrar con -k
#--
#-- ENTRADAS:
#--  a0: Puntero a la cadena
#--  a1: clave k
#-- SALIDAS: Ninguna
#----------------------------------------------------

	#-- Punto de entrada
	.globl descifrar
	
	.text
descifrar:	

	#-- Crear la pila
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)
	
	#-- Multiplicar a1 por -1
	li t0, -1
	mul a1, a1,t0
	
	#-- Llamar a cifrar
	jal cifrar
	
	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	
	#-- Limpiar la pila
	addi sp, sp, 16
	
	#-- Terminar
	ret
	
	
