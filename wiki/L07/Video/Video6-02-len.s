#-- Contar los caracteres de una cadena

	.include "servicios.asm"
	
	.eqv MAX 100
	
	 .data
cad:	 .space MAX	 
msg1:	 .string "Introduce cadena: "	
msg2:    .string "Longitud cadena: "

	
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#--- Pedir al usuario la cadena
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall 
	
	#-- Contador de caracteres
	li t0, 0
	
bucle:

	#-- Leer el siguiente caracter de la cadena
	lb t1, 0(a0)
	
	#-- Si el caracter es '\n', terminar el bucle
	li t2, '\n'
	beq t1, t2, fin
	
	#-- Incrementar el contador de caracteres
	addi t0, t0, 1
	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir
	b bucle	

fin:

	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la longitud de la cadena
	mv a0, t0
	li a7, PRINT_INT
	ecall 
	
	#-- Terminar
	li a7, EXIT
	ecall
	