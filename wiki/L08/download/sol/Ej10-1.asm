#-- Solución al ejercicio 10
#-- Invertir una cadena

	.include "servicios.asm"

	#-- Tamaño máximo de la cadena
	.eqv MAX 32
	.eqv K   5
		
		
	.data 
cad:	.space MAX	
msg1:	.string "Introduce cadena: "
msg2:	.string "Cadena invertida: "
	
	
	.text 
	
	#-- Imprimir mensaje msg1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena al usuario
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- t1 es el puntero derecho
	#-- Para obtenerlo hay que recorrer la cadena hasta llegar al caracter '\n'
	mv t1, a0

recorrer:		
	#-- Leer car
	lb t2, 0(t1)
	
	#-- ¿Es \n?
	li t3, '\n'
	beq t2, t3, fin_recorrer
	
	#-- No hemos llegado al final
	addi t1, t1, 1
	
	#--- bucle
	b recorrer

fin_recorrer:	
	#-- Decrementar a1 en una unidad para que apunte al último
	#-- caracter
	addi t1,t1,-1

	#-- a0 es el puntero izquierod. t1 es el upntero derecho

bucle:
	#-- Condicion de salida: ¿puntero derecho <= puntero izquierdo?
	ble t1,a0 fin
	
	#-- Intercambiar los caracteres izquierdo y derecho
	#-- TODO

	#-- Leer caracter izquierdo
	lb t0, 0(a0)
	
	#-- Leer caracter derecho
	lb t2, 0(t1)
	
	#-- Intercambiarlos
	sb t2, 0(a0)
	sb t0, 0(t1)
	
	#-- Incrementar puntero izquierdo
	addi a0, a0, 1
	
	#-- Decrementar puntero derecho
	addi t1, t1, -1
	
	#-- Repetir
	b bucle

	
fin:    #-- Hemos terminado
	#-- Imprimir el mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cadena
	la a0, cad
	li a7, PRINT_STRING
	ecall			
			
	#-- Terminar
	li a7, EXIT
	ecall
	
