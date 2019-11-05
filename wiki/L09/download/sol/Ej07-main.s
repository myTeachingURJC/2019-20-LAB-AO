#-- Solucion ejercicio 7
#-- Determinar si una cadena es un palindromo o no
#-- El usuario debe introducir la palabra por la consola
#-- Ejemplos de palindromos:  rotor

	.include "servicios.asm"

	.eqv MAX 1024

	.data
	
	#-- Almacenamiento de la cadena introducida por el usuario
cadena:	.space MAX

	#-- Mensajes a imprimir en la consola
msg1:    .string "\n\nIntroduzca cadena: "
pal_si:  .string "ES UN PALINDROMO"
pal_no:  .string "NO es palindromo"

	.text

bucle:		
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Esperar a que el usuario introduzca la cadena
	la a0, cadena
	li a1, MAX
	li a7, READ_STRING
	ecall 
	
	#-- Si el primer caracter de la cadena es '\n' --> Hemos terminado
	lb t0, 0(a0)
	li t1, '\n'
	beq t0, t1, fin
	
	#-- Llamar a la funcion palindromo(a0)
	jal palindromo
	
	#-- a0 contiene la respuesta
	beq a0, zero, no_palindromo
	
	#-- ES un palindromo
	#-- Imprimir mensaje
	la a0, pal_si
	li a7, PRINT_STRING
	ecall
	
	#-- Repetir
	b bucle
	

	#------- La palabra NO es un palindromo
no_palindromo:	
	#-- Imprimir mensaje
	la a0, pal_no
	li a7, PRINT_STRING
	ecall

	#-- Repetir	
	b bucle

fin:	
	# -- Terminar
	li a7, EXIT
	ecall
