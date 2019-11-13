#---- Programa principal

	.include "servicios.asm"
	
	.data
msg_car: .string "\nCaracter: "
msg_anch:  .string "\nAnchura: "
msg_alt:  .string "Altura: "	
	
	.text
	
	#----- Pedir caracter
	la a0,msg_car
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_CHAR
	ecall
	
	#-- Guardar caracter en s0
	mv s0, a0
	
	#----- Pedir la anchura
	la a0, msg_anch
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_INT
	ecall
	
	#-- Guardar anchura en s1
	mv s1, a0
	
	
	#----- Pedir la altura
	la a0, msg_alt
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_INT
	ecall
	
	#-- Guardar altura en a2
	mv a2, a0
	
	
	#--- Llamar a la subrutina box(car, anch, alt)
	mv a0, s0
	mv a1, s1
	jal box
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	