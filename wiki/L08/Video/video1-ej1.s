	.include "servicios.asm"
	
	.data
msg1:   .string "Caracter: "
msg2:   .string "\nNumero: "
	
	.text
	
	
	li t0, '2'
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	mv a0, t0
	li a7, PRINT_CHAR
	ecall
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#--- Terminar
	li a7, EXIT
	ecall
