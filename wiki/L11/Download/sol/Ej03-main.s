#---- Programa principal
#---- Contar el numero de caracteres de una cadena
#---- Se pide una cadena al usuario
#---- se pide el caracter a contar
#---- se imprime la cantidad de ese caracter en la cadena

	.include "servicios.asm"

	.eqv MAX 1024

	.data
msg1:	.string "Introduce cadena: "
msg2:   .string "Introduce caracter a contar: "	
msg3:   .string "\nCaracteres encontrados: "
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
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir caracter
	li a7, READ_CHAR
	ecall
	
	#-- llamar a la funcion count_char (pcad, char)
	mv a1, a0
	la a0, cad
	jal count_char
	
	#-- a0 contiene el resultado
	#-- Guardar a0 en s0
	mv s0, a0
	
	#-- Imprimir mensaje 3
	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir cantidad de caracteres encontrados
	mv a0, s0
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall