#---------------------------------------------------------------
#-- Función void upper(*cad)
#-- ENTRADAS:
#--    * a0: Puntero a la cadena
#-- SALIDAS:
#--     Ninguna
#-----------------------------------------------------------------

	#-- Punto de entrada
	.globl upper
	
	.text 
	
upper:
bucle:		
	#----------- Pasar a mayúsculas
	#-- Leer caracter
	lb t0, 0(a0)
	
	#-- Condicion de terminacion
	beq t0, zero, fin
	
	#-- Si el caracter es menor que 'a' o mayor que 'z'
	#-- hay que pasar al siguiente
	li t1, 'a'
	blt t0,t1,next
	
	li t1, 'z'
	bgt t0, t1, next
	
	#-- Hay que pasarlo a mayusculas
	addi t0,t0,-32
	
	#-- Guardarlo
	sb t0, 0(a0)
	
next:
	#-- Pasar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir
	b bucle

	
	#-- Punto de salida
fin:    ret
	
