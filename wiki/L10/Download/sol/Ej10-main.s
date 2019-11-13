#---- Programa principal

	.include "servicios.asm"
	.eqv MAX 1024
	
	.data
cadena:   .space MAX
msg_cadena:  .string "Cadena: "
msg_clave:  .string "Clave (0-255): "	
msg_orig:   .string "\nCadena sin cifrar: "
msg_cifrada: .string "Cadena cifrada: "	
msg_descifr: .string "Cadena descifrada: "
	
	.text
	
	#----- Pedir Cadena
	la a0,msg_cadena
	li a7, PRINT_STRING
	ecall
	
	la a0, cadena
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#----- Pedir clave
	la a0, msg_clave
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_INT
	ecall
	
	#-- Guardar a0 en s0
	mv s0, a0
	
	#-- Imprimir cadena original
	la a0, msg_orig
	li a7, PRINT_STRING
	ecall
	
	la a0, cadena
	li a7, PRINT_STRING
	ecall
	
	#-- Cifrar la cadena
	la a0, cadena
	mv a1, s0
	jal cifrar
	
	#-- Imprimir cadena cifrada
	la a0, msg_cifrada
	li a7, PRINT_STRING
	ecall
	
	la a0, cadena
	li a7, PRINT_STRING
	ecall
	
	#-- Descifrar la cadena
	la a0, cadena
	mv a1, s0
	jal descifrar
	
	#-- Imprimir cadena descifrada
	la a0, msg_descifr
	li a7, PRINT_STRING
	ecall
	
	la a0, cadena
	li a7, PRINT_STRING
	ecall
	
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	