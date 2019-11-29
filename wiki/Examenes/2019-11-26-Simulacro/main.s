#--- Programa principal

	#-- Servicios del S.O
	.eqv PRINT_STRING 4
	.eqv READ_STRING  8
	.eqv EXIT         10
	.eqv MAX  100

	.data
	
msg1:	.string "\nIntroduce una cadena: "
msg2:   .string "\nCadena procesada: "
msg3:   .string "\nCadena original : "

	#-- Espacio para cadena original
src_cad:    .space MAX

	#-- Espacio para cadena destino
dst_cad:    .space MAX

	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena al usuario
	la a0, src_cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Llamar a procesar
	la a0, src_cad
	la a1, dst_cad
	jal procesar

	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
		
	#-- Imprimir cadena procesada
	la a0, dst_cad
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir mensaje 3
	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir cadena original
	la a0, src_cad
	li a7, PRINT_STRING
	ecall
	
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	