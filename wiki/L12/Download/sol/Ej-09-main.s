
	.include "servicios.asm"
	
	
	#-- Informacion del nodo
	.eqv NEXT 0
	.eqv STR  4
	
	 #-- Tamaño del nodo: 20 bytes para la cadena y 4 para el puntero
	.eqv TAM  24 
	.eqv MAX_STR 20  #-- Tamaño de la cadena
	
	.data
msg:	.string "\nIntroduce dos cadenas:\n"
msg2:   .string "\nContenido de la LISTA:\n"
	
	.text
	
	#-- Pedir dos cadenas al usuario
	#-- Imprimir mensaje 1
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Crear el primer nodo
	li a0, 0
	jal create_str
	
	
	#-- a0 contiene el puntero al nodo, inicializado
	#-- con NEXT = 0
	#-- STR = Cadena introducida por el usuario
	
	#-- Crear el segundo nodo
	jal create_str
	
	mv t0, a0
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	
	mv a0, t0
	
	#-- Imprimir la lista
	jal print
	
	
	li a7, EXIT
	ecall 
