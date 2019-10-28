##-- Diferencia entre el número 2 y el carácter '2'

	.include "servicios.asm"
	
	.data
msg1:   .string "Caracter '2': "
msg2:   .string "\nNumero 2: "
	
	.text
	
	#--- Cargamos en t0 el código ASCII de un carácter
	li t0, '2'
	li t1, 2
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir t0 como  numero, usando PRINT_INT
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	
	#-- Imprimir t1 como número, usando PRINT_INT
	mv a0, t1
	li a7, PRINT_INT
	ecall 
	
	
	#--- Terminar
	li a7, EXIT
	ecall