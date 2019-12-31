#-- Solución al ejericico 1
#-- Programa principal

	.include "servicios.asm"

	.data
msg:	.string "Introduce numeros enteros positivos:\n"	
msg2:   .string "\nLISTA:\n"
			
	.text
	
	#-- Usamos s0 como puntero de acceso a la lista
	#-- Inicialmente es NULL
	li s0, 0
	
	#-- Imprimir mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir números hasta que se introduzca uno negativo
next:	
	#-- Pedir Numero entero
	li a7, READ_INT
	ecall
	
	#-- Si el a0 < 0, finalizar la introduccion de numeros
	blt a0, zero, fin
	
	#-- Guardar el numero en la lista
	mv a1, a0
	mv a0, s0
	jal create
	
	#-- Guardamos en s0 la cabeza de la lista
	mv s0, a0
	
	#-- repetir
	b next
	
fin:
	
	#----- Mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall 
	
	#-- Imprimir la lista
	mv a0, s0
	jal print
	
	#-- Terminar
	li a7, EXIT
	ecall