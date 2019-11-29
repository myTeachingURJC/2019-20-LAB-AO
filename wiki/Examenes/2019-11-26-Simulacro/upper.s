#--------------------------------------
#--- SUBRUTINA upper
#---
#--- ENTRADA:
#---   a0:  Puntero a la cadena
#---
#--- SALIDA:
#--    No devuelve nada
#--------------------------------------

	.globl upper
	
	.text
	
upper:
	#-- Es una funcion hoja: No llama a otras
	#-- no necesitamos crear pila

bucle:

	#-- a0 apunta a la cadena
	
	#-- Leer caracter actual
	lb t0, 0(a0)
	
	#-- Si es cero se termina
	beq t0, zero, fin
	
	#-- Si el caracter es mennor que 'a': no se toca
	li t1, 'a'
	blt t0, t1, next
	
	#-- Si el caracter es mayor que 'z': no se toca
	li t1, 'z'
	bgt t0, t1, next
	
	#-- Es un caracter entre 'a' y 'z': pasarlo a mayusculas
	addi t0, t0, -32
	
	#-- Almacenarlo
	sb t0, 0(a0)
	
next:
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	b bucle
	
fin:
	#-- PUnto de salida
	ret