#-------- PROGRAMA PRINCIPAL --------------------

	.include "servicios.asm"
	
	.eqv MAX 1024
	.eqv K 5
	
	
	.data
msg1:	.string "Introduce una cadena: "
msg2:   .string "Introduce la clave (0-255): "
msg3:   .string "Cadena cifrada: "
msg4:   .string "Cadena descifrada: "

cad1:	.space MAX
cad2:	.space MAX
cad3:   .space MAX
	
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena inicial
	la a0, cad1
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir la clave
	li a7, READ_INT
	ecall
	
	#-- Guardar la clave en s0
	mv s0, a0
	
	#--- Cifrar la cadena y depositarla en cad2
	la a0, cad1
	la a1, cad2
	mv a2, s0
	jal cifrar
	
	#-- Imprimir mensaje
	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cadena cifrada
	la a0, cad2
	li a7, PRINT_STRING
	ecall
	
	#-- Descifrar la cadena
	la a0, cad2
	la a1, cad3
	#-- a2 = -K
	li t0, -1
	mul a2, s0, t0
	jal cifrar
	
	#-- Imprimir mensaje 4
	la a0, msg4
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cadena descifrada
	la a0, cad3
	li a7, PRINT_STRING
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
