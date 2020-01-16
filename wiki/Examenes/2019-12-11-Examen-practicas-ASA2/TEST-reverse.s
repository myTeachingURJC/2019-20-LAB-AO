
#-- PRUEBAS DE LA FUNCION REVERSE

	.include "servicios.asm"

	#-- Cadenas de prueba y sus valores correctos
	.eqv CAD1 "Hola\n"
	.eqv CAD2 "0123456789\n"
	.eqv CAD3 "rotor rotor rotor rotor\n"
	.eqv CAD4 "a"
	
	
	
	.data
	

msg1:   .string "Calculado:"
msg2:   .string " / Esperado:"
error:  .string " --->FALLADO\n"
ok:     .string " --->OK\n"


cad1:   .string CAD1
cad2:   .string CAD2
cad3:   .string CAD3
cad4:   .string CAD4	

	.text

	#-- TEST 1
	la a0, cad1
	jal reverse
	
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- TEST 2
	la a0, cad2
	jal reverse
	
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- TEST 3
	la a0, cad3
	jal reverse
	
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- TEST 4
	la a0, cad4
	jal reverse
	
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Termina
	li a7, EXIT
	ecall 
	



