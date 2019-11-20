#-----------------------------------------
#-- FUNCION void cifrar(*cad, K)
#-- ENTRADAS:
#--    * a0: Puntero a la cadena a cifrar
#--    * a1: Numero a incrementar cada caracter de la cadena en el cifrado
#-- SALIDAS: Ninguna
#--------------------------------------------------   
	
	.globl cifrar
	
	.text 
	
	
cifrar:
bucle:
	#-- Leer caracter
	lb t0, 0(a0)
	
	#-- Condicion de finalizacion
	li t1, '\n'
	beq t0, t1, fin
	
	#-- Sumar K al caracter
	add t0,t0, a1
	
	#-- Almacenar el caracter cifrado
	sb t0, 0(a0)
	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir
	b bucle

	
fin:   
	ret
