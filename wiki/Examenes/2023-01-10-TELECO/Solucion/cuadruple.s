#----------------------------------------------------------------
#-- Funcion cuadruple(n): Calcula el cuadruple del numero recibido
#-------------------------------
#-- ENTRADAS:
#--    * a0:  Numero a cuatriplicar
#-- SALIDAS:
#--    * a0: Numero cuatriplicado (4 * a0)
#----------------------------------------------------------------

	.globl cuadruple

	.text
	
	#-- Es una funcion intermecia, por lo que hay que crear la pila
	#-- para guardar la direccion de retorno
cuadruple:

	#-- Crear la pila
	addi sp,sp, -16
	
	#-- Almacenar direccion de retorno 
	sw ra, 12(sp)

	#-- Calcular el doble
	jal doble
	
	#-- En a0 obtenemos el doble
	
	#-- Calcular otra vez el doble
	jal doble
	
	#-- En a0 tenemos el cuadruple
	
	#-- Recuperar la direccion de retorno de la pila
	lw ra, 12(sp)

	#-- Eliminar pila
	addi sp,sp, 16
	ret