#------------------------------------------------------------------------
#-- Funcion int atoi(*cad)
#-- ENTRDADAS:
#--    a0: Puntero a la cadena a convertir
#-- SALIDAS:
#--    a0: Numero
#------------------------------------------------------------------------

	.globl atoi
			
	.text
atoi:	
	
	#--- t0: Resultado parcial
	li t0, 0
	
next_car:
	#--- Leer digito
	lb t1, 0(a0)
	
	#-- ¿Es \n? Hemos terminado
	#-- El resultado es el que esta en t0
	li t5, '\n'
	beq t1,t5, fin
	
	#-- El caracter no es cero
	#-- Multiplicar t0 por 10
	li t2, 10
	mul t0, t0, t2
	 
	#-- Obtener el numero del digito (t1 - '0')
	li t3, '0'
	sub t4, t1, t3  #-- t4 = t1 - '0
	
	#-- t0 = t0 + t4
	add t0, t0, t4
	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir
	b next_car
	
	#-- Punto de salida
fin:
	#-- Devolver el valor calculado
	mv a0, t0
	ret
 
	
	
	
