#---- Programa principal

	.include "servicios.asm"
	.eqv MAX 1024
	
	.data
prefijo:  .space MAX
cadena:   .space MAX
sufijo:   .space MAX
msg_prefijo: .string "Prefijo: "
msg_cadena:  .string "Cadena: "
msg_sufijo:  .string "Sufijo: "		
	
	.text
	
	#----- Pedir Cadena
	la a0,msg_cadena
	li a7, PRINT_STRING
	ecall
	
	la a0, cadena
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#----- Pedir prefijo
	la a0,msg_prefijo
	li a7, PRINT_STRING
	ecall
	
	la a0, prefijo
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	
	#----- Pedir sufijo
	la a0,msg_sufijo
	li a7, PRINT_STRING
	ecall
	
	la a0, sufijo
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Concatear la cadena al prefijo
	la a0, prefijo
	la a1, cadena
	jal concat
	
	#-- Concatenar el sufijo
	la a0, prefijo
	la a1, sufijo
	jal concat
	
	#-- Imprimir salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Imprimir la cadena completa
	la a0, prefijo
	li a7, PRINT_STRING
	ecall 
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	