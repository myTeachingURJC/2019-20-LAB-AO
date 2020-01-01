#-- Solución al ejercicio 10
#-- Programa principal

	.include "servicios.asm"
	
	
	#-- Informacion del nodo
	.eqv NEXT 0
	.eqv STR  4
	
	.data
msg:	.string "\nIntroduce nombres de usuarios:\n"
msg2:   .string "\nLa Lista contiene los siguientes nombres:\n"
	
	.text
	
	#-- Pedir dos cadenas al usuario
	#-- Imprimir mensaje 1
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#--- Usamos s0 como puntero a la lista
	#-- Inicialmente s0 es NULL
	li s0, 0
	
	
bucle:
	#-- Crear nodo enlazado como primer elemento de la lista
	mv a0, s0
	jal create_str
	
	#-- a0 contiene el puntero al nodo
	#-- Lo guardamos en s0
	mv s0, a0
	
	
	#-- Leemos el primer byte del campo STR
	lw t0, STR(a0)
	
	#-- Si es '\n', es la cadena nula --> Terminar
	li t1, '\n'
	beq t0, t1, imprimir
	
	#-- Crear siguiente nodo de la lista
	b bucle
	
	
	#-- Henmos terminado de introducir las cadenas
	#--- Ahora imprimimos la lista
	
imprimir:	
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- El puntero a la lista lo tenemos en s0
	mv a0, s0
	
	#-- Imprimir la lista
	jal print
	
	
	li a7, EXIT
	ecall 
