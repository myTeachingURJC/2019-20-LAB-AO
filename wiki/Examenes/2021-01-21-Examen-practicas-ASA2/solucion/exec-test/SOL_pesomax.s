#--------------------------
#--  pesoMax(cad1, cad2):Funcion para calcular el peso maximo entre dos cadenas
#--- 
#--- Entradas:
#--    a0: Puntero a la primera cadena
#--    a1: Puntero a la segunda cadena
#--
#--  Salidas:
#--    a0: El peso de la cadena de maximo peso
#---------------------------------------------------

	.globl pesomax

	.text
pesomax:	
	
	#-- Es una funcion que llama a otra funcion, por lo que 
	#-- necesitamos crear la pila
	addi sp, sp, -16
	sw ra, 12(sp)
	
	#-- Guardar a1 en la pila (cad2) para no 
	#-- perderlo al llamar a la funcion peso
	sw a1, 8(sp)
	
	#-- Calcular el peso de cad1
	jal peso
	#-- Guardar el peso de cad1 en la pila, para no perderlo
	sw a0, 4(sp)
	
	#-- Calcular el peso de cad2
	lw a0, 8(sp) #-- Recuperar cad2 de la pila
	jal peso
	
	#-- a0: peso de cad2
	#-- Recuperar el peso de cad1 de la pila
	lw a1, 4(sp)
	
	#-- Calcular el maximo entre los dos
	jal max
	
	#-- Recuperar la direccion de retorno y liberar la pila
	lw ra, 12(sp)
	addi sp, sp, 16
	
	ret
	
