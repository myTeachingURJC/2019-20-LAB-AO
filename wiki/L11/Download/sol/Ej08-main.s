#------ Programa principal
#-- Evalucacion de una suma de números de un solo dígito
#------------------------------------------------------------

	.include "servicios.asm"
	
	.data
	
msg1: 	.string "Expresion: "

	#-- Cadena a evaluar (el resultado es 36)
expr:	.string "1+5+3+4+5+8+9+0+1+0+0+0+0+0+0+0\n"

msg2:	.string "Resultado: "
		
msg_error: .string "ERROR en la expresion"		
		
	.text

	#-- Llamar a la funcion de evaluacion
	la a0, expr
	jal evaluar
	
	#-- Comprobar si la expresion es correcta
	bne a1,zero, error
	
	#-- El resultado esta en a0
	#-- Guardarlo en s0
	mv s0, a0
	
	#-- Imprimir el mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la expresion
	la a0, expr
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el resultado
	mv a0, s0
	li a7, PRINT_INT
	ecall
	
	b fin
	
	#-- Error en la expresion
error:	#-- Imprimir mensaje error
	la a0, msg_error
	li a7, PRINT_STRING
	ecall

fin:	
	#-- Terminar
	li a7, EXIT
	ecall
	