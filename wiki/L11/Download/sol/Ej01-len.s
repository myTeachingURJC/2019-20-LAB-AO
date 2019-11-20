#------------------------------------------
#-- Subrutina len()
#-- Calcular la longitud de una cadena 
#-- El final de la cadena se determina por el caracter \n
#-- (usando un algoritmo recursivo)
#-- ENTRADAS:
#--   a0: Puntero a la cadena
#-- SALIDAS:
#-    a0: Longitud de la cadena
#-------------------------------------------

	.globl len
	
len:
	
	#-- Leer primer caracter de la cadena
	lb t0, 0(a0)
	
	#-- Comprobar si es el ultimo caracter
	li t1, '\n'
	bne t0, t1, len_rec
	
	#-- Es el último carácter
	#-- La longitud es 0
	li a0, 0
	
	#-- Ir al punto de salida
	b fin
	
	#-- No es el ultimo caracter
	#-- La longitud será 1 + longitud de la cadena 
	#-- menos el caracter inicial
len_rec:	

	#-- Crear la pila para almacenar la direccion de retorno
	addi sp, sp, -16

	#-- Guardar la direccion de retorno
	sw ra, 12(sp)	

	#-- Incrementar el puntero
	addi a0, a0, 1
	
	#-- Calcular la longitud de la nueva cadena
	jal len
	
	#-- La longitud será a0 + 1
	addi a0, a0, 1

	#-- REcuperar la direccion de retorno
	lw ra, 12(sp)

	#-- Recuperar la pila
	addi sp, sp, 16
	#-- Punto de salida
fin:
	ret