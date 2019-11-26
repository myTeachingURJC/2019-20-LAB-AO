
	.include "servicios.asm"
	
	.data

cad:	.string "Holaaaa"

	.text
	
	#-- Puntero a la cadena
	la t0, cad
	
	mv a0, t0
	li a7, PRINT_STRING
	ecall
	
bucle:

	#-- Leer el caracter actual 
	lb t1, 0(t0)	
	
	#-- Comprobacion de terminacion
	beq t1, zero, fin
	
	#-- Comprobar si el caracter es una 'a'
	li t2, 'a'
	beq t1, t2, encontrado
	
	#-- Apuntar al siguiente caracter
	addi t0, t0, 1
	
	b bucle
	
encontrado:

	li t2, 'i'
	sb t2, 0(t0)
	addi t0, t0, 1
	b bucle
		
fin:	

	#-- IMprimir la cadena modificada
	la a0, cad
	li a7, PRINT_STRING
	ecall 
	
	#-- Terminar
	li a7, EXIT
	ecall