#-- Solución al ejercicio 4
#-- Programa principal

	.include "servicios.asm"
	
	#-- Longitud maxima de la cadena
	.eqv MAX 1024
	
	.data
	
msg1:	.string "Introduce una cadena: "
msg2:   .string "La longitud es: "

	#-- Cadena introducida por el usuario
cad:	.space MAX
		
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- a0 contiene el puntero a la cadena
	#-- Llamar a la función n = len(a0)
	jal len
	
	#-- a0 Contiene la longitud de la cadena. Guardarlo en t0
	mv t0, a0
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la longitud
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	