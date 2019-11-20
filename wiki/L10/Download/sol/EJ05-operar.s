#-----------------------------------
#--- Subrutina operar(num)
#--- ENTRADAS: 
#--    * a0: Numero entero
#--  SALIDAS:  Ninguna
#-----------------------------------

	#-- Punto de entrada
	.globl operar
	
	.text
operar:	

	#-- Crear la pila
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)

	#-- Hay que guardar el numero en la pila
	#-- tras el jal lo hemos perdido
	#-- (El reg. a0 NO preservar su valor)
	sw a0, 8(sp)

	#-- Imprimir el numero
	jal print_int
	
	#-- Recuperar el numero de la pila
	lw a0, 8(sp)
	
	#-- Multiplicar por dos
	#-- a0 = mult2(a0)
	jal mult2
	
	#-- Imprimir el numero multiplicado por dos
	#-- En a0 ya tenemos el numero multiplicado por dos
	#-- porque nos lo ha devuelto la funcion mult2
	jal print_int
	
	#-- Recuperar el numero otra vez de la pila
	lw a0, 8(sp)
	
	#-- Volver a imprimirlo
	jal print_int
	
	#-- Recuperar direccion de retorno
	lw ra, 12(sp)
	
	#-- Recuperar la pila
	addi sp, sp, 16
	
	ret