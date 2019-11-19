#------- Programa principal --------------
#-- Pedir al usuario un cadena que contenga digitos numeros '0'-'9'
#-- Se llama a la funcion de conversion para convertirlo en entero
#-- Se imprime el numero entero calculado
#-----------------------------------------

	.include "servicios.asm"
	
	.eqv MAX 10
	
	.data
msg1:	.string "Introduce un numero: "
msg2:   .string "Numero entero: "
cad:	.space 	MAX
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir la cadena
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Calcular el numero entero
	jal conv
	
	#-- En a0 está el numero calculado
	#-- Guardarlo en s0
	mv s0, a0
	
	#-- Imprimir mensaje
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el numero
	mv a0, s0
	li a7, PRINT_INT
	ecall 
	
	#-- TErminar
	li a7, EXIT
	ecall