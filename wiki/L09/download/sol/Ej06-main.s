#-- Solución al ejercicio 6
#-- Programa principal
#-- Contar el número de caracteres 'a' y 'e' que hay en una frase pedida al usuario
#-- Contar la longitud total de la cadena

	.include "servicios.asm"
	
	#-- Longitud maxima de la cadena
	.eqv MAX 1024
	
	.data
	
msg1:	.string "\nIntroduce una cadena: "
msg2:   .string "\nNumero de caracteres 'a': "
msg3:   .string "\nNumero de caracteres 'e': "
msg4:   .string "\nLongitud total: "

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
	
	#-- Almacenar el puntero a la cadena en s0
	mv s0, a0
	
	#-- Llamar a la función n = len(a0)
	jal len
	
	#-- a0 contiene la longitud
	mv t0, a0
	
	#-- Imprimir mensaje 4
	la a0, msg4
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la longitud de la cadena
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Llamar a la funcion na = count(a0, 'a')
	mv a0, s0
	li a1, 'a'
	jal count
	
	#-- a0 Contiene el número de 'a'. Lo guardamos en t0
	mv t0, a0
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cantidad
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Llamar a la función na =  count(a0, 'e')
	mv a0, s0
	li a1, 'e'
	jal count
	
	#-- a0 Contiene el número de 'e'. Lo guardamos en t0
	mv t0, a0
	
	#-- Imprimir mensaje 3
	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cantidad
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	