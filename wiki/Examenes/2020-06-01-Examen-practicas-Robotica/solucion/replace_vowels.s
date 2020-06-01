	.globl replace_vowels
	
	.text

#-------------------------------
#- replace_vowels(pcad, car)
#-  pcad: a0: Puntero a la cadena a sustituir las vocales
#-  car:  a1: Caracter a usar de reemplazo para TODAS las volcales	
#------------------------------
	
replace_vowels:	

	#-- Se trata de una funcion intermedia
	#-- Es necesario usar la pila para guardar la direccion de retorno
	addi sp, sp, -16
	
	#-- Guardar la direcion de retorno
	sw ra, 12(sp)
	

	#-- Guardamos en la pila el puntero a la cadena
	#-- y el caracter. Es necesario para NO violar el 
	#-- convenio, ya que al llamar a una función los  
	#-- perdemos
	sw a0, 0(sp)  #-- Posicion 0: Puntero a la cadena
	sw a1, 4(sp)  #-- Posicion 4: Caracter

	#-- Ahora solo tenemos que llamar consecutivamente a las funciones de
	#-- replace para sustituir cada vocal por el caractere de reemplazo:
	#--
	#-- replace(pcad, 'a', car)
	#-- replace(pcad, 'e', car)
	#-- replace(pcad, 'i', car)
	#-- repalce(pcad, 'o', car)
	#-- replace(pcad, 'u', car)
	
	#-- Para no violar el convenio, los valores de
	#-- a0 y a2 (pcad, y car) los leemos de la pila


	#------------ Reemplazar la vocal a
	lw a0, 0(sp)  # a0: puntero a la cadena
	li a1, 'a'    # 
	lw a2, 4(sp)  # a2: Caracter de reemplazo
	jal replace 
	
	#------------ Reemplazar la vocal e
	lw a0, 0(sp)  # a0: puntero a la cadena
	li a1, 'e'    # 
	lw a2, 4(sp)  # a2: Caracter de reemplazo
	jal replace 
	
	#------------ Reemplazar la vocal i
	lw a0, 0(sp)  # a0: puntero a la cadena
	li a1, 'i'    # 
	lw a2, 4(sp)  # a2: Caracter de reemplazo
	jal replace
	
	#------------ Reemplazar la vocal o
	lw a0, 0(sp)  # a0: puntero a la cadena
	li a1, 'o'    # 
	lw a2, 4(sp)  # a2: Caracter de reemplazo
	jal replace
	
	#------------ Reemplazar la vocal u
	lw a0, 0(sp)  # a0: puntero a la cadena
	li a1, 'u'    # 
	lw a2, 4(sp)  # a2: Caracter de reemplazo
	jal replace
	
	
	#-- Recuperar la direccion de retorno
	lw ra,12(sp)
	
	#-- Recuperar la pila
	addi sp, sp, 16
	
	ret
	
	



