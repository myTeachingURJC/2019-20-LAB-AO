#------------------------------------------------------------------------------
#--- Prueba de la funcion atoi1
#------------------------------------------------------------------------------

	#-- Codigos de los servicios del Sistema operativo
	.include "servicios.asm"
	
	#-- Longitud maxima de la expresion
	.eqv MAX 100

	.data

msg1:	 .string "\nIntroduce caracter: "
msg_err: .string "\nError\n"
exp:	 .space MAX

	.text
	
	
repetir:
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir caracter
	li a7, READ_CHAR
	ecall
	
	li t0, '\n'
	beq a0, t0, fin
	
	#-- a0 contiene el caracter
	
	#-- Llamar a atoi1(a0)
	jal atoi1
	
	#-- Comprobar el resultado de atoi
	li t0, -1
	beq a0, t0, error
	
	mv t0, a0
	
	#-- Imprimir \n
	#-- Imprimir \n
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Numero ok: Imprimirlo
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	
	#-- Repetir
	b repetir
	
error:
	la a0, msg_err
	li a7, PRINT_STRING
	ecall
	
	b repetir
	
	
fin:
	#-- Terminar
	li a7, EXIT
	ecall

